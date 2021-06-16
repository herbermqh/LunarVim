-- See: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sqls
-- See: https://github.com/lighttiger2505/sqls
-- See: https://github.com/nanotee/sqls.nvim

-- For db connection details see: $HOME/.config/sqls/config.yml

require'lspconfig'.sqls.setup {
    -- cmd = {DATA_PATH .. "/lspinstall/sqls/sqls"},
    cmd = {"/home/jim/go/bin/sqls"},
    filetypes = { "sql", "mysql" },
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require'sqls'.setup{
            picker = 'telescope'
        }

        print('LSP for SQL loaded!')
    end
}
