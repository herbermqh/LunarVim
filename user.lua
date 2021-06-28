vim.lsp.set_log_level("debug")                 -- See: ~/.cache/nvim/log and ~/.cache/nvim/lsp.log

require('lv-sqls')                             -- For Sql LSP install.
require('lsp.sql-ls')                          -- To configure the Sql LSP.

-- require('lsp.java-ls')                         -- Java LSP.

-- return require("packer").startup(function(use)
     -- Jimc extras.
    -- use {"kshenoy/vim-signature", opt = true}        -- Markers in margin.
    -- require_plugin("vim-signature")
    -- use {"preservim/tagbar", opt = true}             -- Tags navigation.
    -- require_plugin("tagbar")
    -- use {"tpope/vim-surround", opt = true}           -- Surroundings.
    -- require_plugin("vim-surround")
    -- use {"tpope/vim-eunuch", opt = true}             -- Unix commands.
    -- require_plugin("vim-eunuch")
    -- use {"tpope/vim-repeat", opt = true}             -- . repeats properly for macros.
    -- require_plugin("vim-repeat")
    -- use {"tpope/vim-fugitive", opt = true}           -- Git plugin.
    -- require_plugin("vim-fugitive")
    -- use {"mfussenegger/nvim-jdtls", opt = true}      -- Java LSP.
    -- require_plugin("nvim-jdtls")
    -- use {"itchyny/vim-highlighturl", opt = true}     -- Highlight URL's.
    -- require_plugin("vim-highlighturl")
    -- use {"nanotee/sqls.nvim", opt = true}            -- SQL LSP.
    -- require_plugin("sqls.nvim")
    -- Jimc extras.
    -- vim.cmd('luafile ~/.config/nvim/user.lua')     -- My config, lua syntax.
    -- vim.cmd('source ~/.config/nvim/user.vim')      -- My config, vim syntax.
-- end
