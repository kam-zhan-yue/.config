local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

local projectfile = vim.fn.getcwd() .. '/project.godot'
if file_exists(projectfile) then
  vim.fn.serverstart './godothost'
end

