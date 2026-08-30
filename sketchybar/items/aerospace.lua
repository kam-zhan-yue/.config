-- AeroSpace workspaces
--
-- Drop-in replacement for items/spaces.lua (which relied on yabai / macOS
-- mission control spaces). Keeps the exact same UI: a numbered pill per
-- workspace with the app icons of its windows as the label, highlighted when
-- the workspace is on screen.
--
-- Since AeroSpace lives inside a single mission control space, we cannot use
-- sketchybar's "space" item type at all. Everything here is plain items whose
-- visibility we drive ourselves from the aerospace CLI.

local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

-- sketchybar is usually launched by launchd with a bare PATH, so resolve the
-- aerospace binary up front instead of relying on the shell to find it.
local function find_aerospace()
  local candidates = {
    "/opt/homebrew/bin/aerospace",
    "/usr/local/bin/aerospace",
  }
  for _, path in ipairs(candidates) do
    local f = io.open(path, "r")
    if f then
      f:close()
      return path
    end
  end
  return "aerospace"
end

local aerospace = find_aerospace()

-- The workspace list is read synchronously once, at config load, so the items
-- are created in workspace order (1..9, A..Z as declared in .aerospace.toml).
local function query_workspace_names()
  local names = {}
  local handle = io.popen(aerospace .. " list-workspaces --all 2>/dev/null")
  if handle then
    for line in handle:lines() do
      local name = line:match("^%s*(.-)%s*$")
      if name ~= "" then names[#names + 1] = name end
    end
    handle:close()
  end
  if #names == 0 then
    -- aerospace not running yet: fall back to the numbered workspaces
    for i = 1, 9, 1 do names[i] = tostring(i) end
  end
  return names
end

local workspace_names = query_workspace_names()

-- One query per refresh: focused workspace, workspaces visible on any monitor,
-- then every window as "<workspace>|<app name>".
local query = table.concat({
  aerospace .. " list-workspaces --focused",
  "echo '@@'",
  aerospace .. " list-workspaces --monitor all --visible",
  "echo '@@'",
  aerospace .. " list-windows --all --format '%{workspace}|%{app-name}'",
}, "; ") .. " 2>/dev/null"

local workspaces = {}
local spaces_visible = true

for _, name in ipairs(workspace_names) do
  local item = sbar.add("item", "space." .. name, {
    drawing = false,
    icon = {
      font = { family = settings.font.numbers },
      string = name,
      padding_left = 15,
      padding_right = 8,
      color = colors.white,
      highlight_color = colors.red,
    },
    label = {
      padding_right = 20,
      color = colors.grey,
      highlight_color = colors.white,
      font = "sketchybar-app-font:Regular:16.0",
      y_offset = -1,
    },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.bg1,
      border_width = 1,
      height = 26,
      border_color = colors.black,
    },
  })

  -- Single item bracket for space items to achieve double border on highlight
  local bracket = sbar.add("bracket", { item.name }, {
    drawing = false,
    background = {
      color = colors.transparent,
      border_color = colors.bg2,
      height = 28,
      border_width = 2,
    },
  })

  -- Padding space
  local padding = sbar.add("item", "space.padding." .. name, {
    drawing = false,
    script = "",
    width = settings.group_paddings,
  })

  item:subscribe("mouse.clicked", function(_)
    sbar.exec(aerospace .. " workspace " .. name)
  end)

  workspaces[name] = {
    item = item,
    bracket = bracket,
    padding = padding,
    -- last rendered state, so a refresh only talks to sketchybar on a change
    state = {},
  }
end

local function parse(output)
  local focused, visible, apps = nil, {}, {}
  local section = 1
  for line in output:gmatch("[^\r\n]+") do
    local trimmed = line:match("^%s*(.-)%s*$")
    if trimmed == "@@" then
      section = section + 1
    elseif trimmed ~= "" then
      if section == 1 then
        focused = trimmed
      elseif section == 2 then
        visible[trimmed] = true
      else
        local workspace, app = trimmed:match("^([^|]*)|(.*)$")
        if workspace and workspace ~= "" then
          local entry = apps[workspace]
          if entry == nil then
            entry = { order = {}, seen = {} }
            apps[workspace] = entry
          end
          if not entry.seen[app] then
            entry.seen[app] = true
            entry.order[#entry.order + 1] = app
          end
        end
      end
    end
  end
  return focused, visible, apps
end

local function refresh()
  sbar.exec(query, function(output)
    local focused, visible, apps = parse(output)

    sbar.animate("tanh", 10, function()
      for _, name in ipairs(workspace_names) do
        local workspace = workspaces[name]
        local entry = apps[name]

        local icon_line = ""
        if entry then
          for _, app in ipairs(entry.order) do
            local lookup = app_icons[app]
            icon_line = icon_line .. ((lookup == nil) and app_icons["Default"] or lookup)
          end
        end
        if icon_line == "" then icon_line = " —" end

        local selected = (visible[name] == true) or (focused == name)
        local shown = spaces_visible and (entry ~= nil or selected)

        local state = workspace.state
        if state.shown ~= shown or state.selected ~= selected or state.label ~= icon_line then
          workspace.item:set({
            drawing = shown,
            icon = { highlight = selected },
            label = { string = icon_line, highlight = selected },
            background = { border_color = selected and colors.black or colors.bg2 },
          })
          workspace.bracket:set({
            drawing = shown,
            background = { border_color = selected and colors.grey or colors.bg2 },
          })
          workspace.padding:set({ drawing = shown })

          state.shown = shown
          state.selected = selected
          state.label = icon_line
        end
      end
    end)
  end)
end

-- Triggered by exec-on-workspace-change / the move-node-to-workspace bindings
-- in .aerospace.toml. The built-in events below cover window open/close, and
-- update_freq is a cheap safety net for anything the events miss.
sbar.add("event", "aerospace_workspace_change")

local workspace_observer = sbar.add("item", {
  drawing = false,
  updates = true,
  update_freq = 5,
})

for _, event in ipairs({
  "aerospace_workspace_change",
  "front_app_switched",
  "space_windows_change",
  "display_change",
  "system_woke",
  "routine",
  "forced",
}) do
  workspace_observer:subscribe(event, refresh)
end

local spaces_indicator = sbar.add("item", {
  padding_left = -3,
  padding_right = 0,
  icon = {
    padding_left = 8,
    padding_right = 9,
    color = colors.grey,
    string = icons.switch.on,
  },
  label = {
    width = 0,
    padding_left = 0,
    padding_right = 8,
    string = "Spaces",
    color = colors.bg1,
  },
  background = {
    color = colors.with_alpha(colors.grey, 0.0),
    border_color = colors.with_alpha(colors.bg1, 0.0),
  }
})

spaces_indicator:subscribe("swap_menus_and_spaces", function(_)
  local currently_on = spaces_indicator:query().icon.value == icons.switch.on
  spaces_indicator:set({
    icon = currently_on and icons.switch.off or icons.switch.on
  })

  -- Own the visibility of the workspace items in both directions, so hidden
  -- (empty) workspaces do not reappear when swapping back from the menus.
  spaces_visible = not currently_on
  if spaces_visible then
    refresh()
  else
    for _, workspace in pairs(workspaces) do
      workspace.item:set({ drawing = false })
      workspace.bracket:set({ drawing = false })
      workspace.padding:set({ drawing = false })
      workspace.state = {}
    end
  end
end)

spaces_indicator:subscribe("mouse.entered", function(_)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 1.0 },
        border_color = { alpha = 1.0 },
      },
      icon = { color = colors.bg1 },
      label = { width = "dynamic" }
    })
  end)
end)

spaces_indicator:subscribe("mouse.exited", function(_)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 0.0 },
        border_color = { alpha = 0.0 },
      },
      icon = { color = colors.grey },
      label = { width = 0, }
    })
  end)
end)

spaces_indicator:subscribe("mouse.clicked", function(_)
  sbar.trigger("swap_menus_and_spaces")
end)

refresh()
