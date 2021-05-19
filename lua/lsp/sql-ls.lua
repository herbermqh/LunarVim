require'lspconfig'.sqlls.setup {
    cmd = { "/usr/local/bin/sql-language-server", "up", "--method", "stdio" },
    on_attach = require'lsp'.common_on_attach
}
