local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local helpers = require("null-ls.helpers")
local utils = null_ls.utils

-- null_ls.utils.
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.rubocop,
        diagnostics.reek
        --        null_ls.builtins.completion.spell,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    lsp_formatting(bufnr)
                end,
            })
        end
    end,
})




-- diagnostics.eslint.with({
--           cwd = helpers.cache.by_bufnr(function(params)
--             return utils.root_pattern(
--               ".eslintrc",
--             ".eslintrc.js",
--           ".eslintrc.cjs",
--         ".eslintrc.yaml",
--       ".eslintrc.yml",
--     ".eslintrc.json"
--)(params.bufname)
-- end),
-- })
