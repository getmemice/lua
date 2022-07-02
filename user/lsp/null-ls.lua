local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
    -- diagnostics.cspell,
    -- formatting.prettier.with({
    --   extra_args = {
    --     "--arrow-parens",
    --     "--bracket-same-line",
    --     "--no-bracket-spacing",
    --     "--no-semi",
    --     "--jsx-single-quote",
    --   },
    -- }),
    formatting.lua_format.with({
        extra_args = {
            "--indent-width=2", "--continuation-indent-width=2",
            "--no-keep-simple-function-one-line",
            "--no-keep-simple-control-block-one-line",
            "--single-quote-to-double-quote", "--chop-down-table",
            "--chop-down-parameter", "--extra-sep-at-table-end",
            "--spaces-inside-table-braces"
        }
    })
    -- formatting.stylelint.with({ extra_args = { "--fix" } }),
}

null_ls.setup({
    -- sources = sources
    -- you can reuse a shared lspconfig on_attach callback here

    -- on_attach = function(client, bufnr)
    -- if client.supports_method("textDocument/formatting") then
    --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = augroup,
    --     buffer = bufnr,
    --
    --     callback = function()
    --       -- vim.lsp.buf.format({ bufnr = bufnr })
    --       -- vim.lsp.buf.formatting_sync()
    --       vim.lsp.buf.formatting()
    --     end,
    --   })
    -- end
    -- end,
})

-- local callback = function()
--     vim.lsp.buf.format({
--         bufnr = bufnr,
--         filter = function(client)
--             return client.name == "null-ls"
--         end
--     })
-- end,
