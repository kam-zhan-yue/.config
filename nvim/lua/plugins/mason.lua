-- :MasonInstall basedpyright bash-language-server clangd gopls lua-language-server typescript-language-server ruff roslyn rust-analyzer

return {
  "mason-org/mason.nvim",
  opts = {
    registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    },
  }
}
