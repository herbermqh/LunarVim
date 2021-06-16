-- In Vimscript
-- augroup lsp
--   au!
--   au FileType java lua require('jdtls').start_or_attach({cmd = {'java-linux-ls'}})
-- augroup end
-- find_root looks for parent directories relative to the current buffer containing one of the given arguments.
-- require'lspconfig'.jdtls.setup {cmd = {'java-linux-ls'}}

-- See: https://github.com/georgewfraser/java-language-server/
-- See: https://github.com/georgewfraser/java-language-server/issues/188
-- See: https://github.com/neovim/nvim-lspconfig/commit/61ec39359a8496f0b62d8ece299ed7f92b04c189
-- See: https://github.com/natebosch/vim-lsc

if vim.fn.has("mac") == 1 then
    JAVA_LS_EXECUTABLE = 'java-mac-ls'
elseif vim.fn.has("unix") == 1 then
    JAVA_LS_EXECUTABLE = '/home/jim/bin/dotfiles/bin/java-linux-ls'
else
    print("Unsupported system")
end

local bundles = {
    vim.fn.glob(
        CONFIG_PATH.."/.debuggers/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
};

local on_attach = function(client, bufr)
    require('jdtls').setup_dap()
    require'lsp'.common_on_attach(client, bufr)
end

require('jdtls').start_or_attach({
    cmd = {JAVA_LS_EXECUTABLE},
    filetypes = { "java" },
    on_attach = on_attach,
    root_dir = require('jdtls.setup').find_root({'build.gradle', 'pom.xml', '.git'}),
    init_options = {bundles = bundles}
})

-- require('jdtls').setup({
    -- cmd = {JAVA_LS_EXECUTABLE},
    -- filetypes = { "java" },
    -- on_attach = on_attach
-- })

