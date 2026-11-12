-- Ignore `charset = utf-8-bom` from .editorconfig so new files aren't written
-- with a BOM. Files that already have a BOM keep it via Neovim's own detection.
local ec = require("editorconfig")
local orig_charset = ec.properties.charset

ec.properties.charset = function(bufnr, val, opts)
  if val == "utf-8-bom" then
    return
  end
  orig_charset(bufnr, val, opts)
end
