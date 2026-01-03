return {
  name = "basedpyright",
  filetypes = { "python" },
  cmd = { 'uv', 'run', 'basedpyright-langserver', '--stdio' },
  settings = {
    python = { },
  },
}
