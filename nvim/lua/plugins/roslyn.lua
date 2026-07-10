return {
    "seblyng/roslyn.nvim",
    config = function()
        require("roslyn").setup()

        vim.lsp.config("roslyn", {
            settings = {
                ["csharp|background_analysis"] = {
                    dotnet_analyzer_diagnostics_scope = "none",
                },
            },
            handlers = {
                ["textDocument/diagnostic"] = function(err, result, ctx, config)
                    if result and result.items then
                        result.items = vim.tbl_filter(function(diagnostic)
                            return diagnostic.code ~= "IDE1006"
                        end, result.items)
                    end
                    return vim.lsp.handlers["textDocument/diagnostic"](err, result, ctx, config)
                end,
            },
        })
    end,
}
