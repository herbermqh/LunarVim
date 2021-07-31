--[[
 Useful Links and TODO
 https://github.com/Kethku/neovide
 http://cheat.sh
 Buffer bar info: https://github.com/romgrk/barbar.nvim

TODO: LSP Java
TODO: LSP Perl
TODO: LSP JavaScript
TODO: LSP React
TODO: LSP PHP
TODO: LSP Bash
TODO: LSP Python
Colorizer: #ff0000, Blue, #f0f
]]

-- Settings {{{1
lvim.format_on_save = false
lvim.auto_complete = true
lvim.colorscheme = "zenburn"
lvim.auto_close_tree = 0
lvim.wrap_lines = false
lvim.timeoutlen = 100
lvim.leader = "space"
lvim.ignore_case = true
lvim.smart_case = true
lvim.termguicolors = true
lvim.builtin.dashboard.active = true
lvim.builtin.galaxyline.active = true
lvim.vsnip_dir = os.getenv "HOME" .. "/.config/lvim/snippets/"
-- lvim.builtin.zen.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- python
-- O.python.linter = 'flake8'
-- lvim.lang.python.isort = true
-- lvim.lang.python.diagnostics.virtual_text = true
-- lvim.lang.python.analysis.use_library_code_types = true

-- javascript
-- lvim.lang.tsserver.linter = nil


--}}}

-- Additional Plugins {{{1
lvim.plugins = {
  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("lv-zen").config()
    end,
  },
  -- Colorizer: #ff0000, Blue, #f0f
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("lv-colorizer").config()
    end,
  },
  -- Better motions
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("lv-hop").config()
    end,
  },
  -- Enhanced increment/decrement : True, true
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require("lv-dial").config()
    end,
  },
  -- TODO: SQL LSP.
  {
    "nanotee/sqls.nvim",
    event = "BufRead",
    ft = "sql",
  },
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  -- Codi: Interactive scratchpad
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  -- Markers in margin. 'ma' adds marker
  {"kshenoy/vim-signature",
    event = "BufRead",
  },
  -- Surroundings.  Try cs"'  in a string "with double quotes" to convert to single.
  {
    "tpope/vim-surround",
    event = "BufRead",
  },
  -- Unix commands. Try ":SudoWrite"
  {
    "tpope/vim-eunuch",
    event = "BufRead",
  },
  -- Highlight URL's. http://www.vivaldi.com
  {
    "itchyny/vim-highlighturl",
    event = "BufRead",
  },
  -- Git plugin.  Try ":Git "
  {
    "tpope/vim-fugitive",
    event = "BufRead",
  },
  -- Kitty config syntax.  Edit kitty, with vk
  {
    "fladson/vim-kitty",
    event = "BufRead",
    ft = "conf",
  },
  -- Lazygit: Try F8
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  -- Todo comments.
    -- PERF:Something to describe.
    -- HACK:Something to describe.
    -- TODO:Something to describe.
    -- NOTE:Something to describe.
    -- WARNING:Something to describe.
    -- FIX:Something to describe.
    -- BUG:Something to describe.
    -- FIXME: Something to describe.
    -- :TodoQuickFix
    -- :TodoTelescope
    -- :TodoTrouble
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      }
    end
  },
  -- Ranger, Leader r
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
  }
}
-- }}}1

-- Autocommands (https://neovim.io/doc/user/autocmd.html) {{{1
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
-- }}}1

-- Additional Leader bindings for WhichKey and key mappings {{{1
lvim.builtin.which_key.mappings["r"] = {
    "<cmd>RnvimrToggle<CR>",                             "Ranger"
}

lvim.builtin.which_key.mappings["z"] = {
    "<cmd>ZenMode<CR>",                             "Zen Mode"
}

lvim.builtin.which_key.mappings["t"] = {
    name = "Toggle Display Options",
    a = { ":call ToggleAll()<CR>",                         "Toggle All"},
    b = { ":call ToggleColourGitBlame()<CR>",              "Toggle git Blame line visibility"},
    c = { ":call ToggleColourCursorColumn()<CR>",          "Toggle cursor Column visibility"},
    e = { ":call ToggleColourWhiteSpaceAtEndOfLine()<CR>", "Toggle whitespace at End of line visibility"},
    g = { ":call ToggleGutter()<CR>",                      "Toggle left Gutter"},
    h = { ":ColorizerToggle<CR>",                          "Toggle Hex colour and colour name matches"},
    i = { ":call ToggleColourIncSearch()<CR>",             "Toggle hIghlight matching words under cursor"},
    l = { ":call ToggleColourCursorLine()<CR>",            "Toggle cursor Line visibility"},
    m = { ":call ToggleMarkerLines()<CR>",                 "Toggle Marker lines"},
    r = { ":set wrap!<CR>",                                "Toggle line wRap"},
    s = { ":set spell!<CR>",                               "Toggle Spell checking"},
    t = { ":call ToggleColourLineTooLong()<CR>",           "Toggle line Too long highlighting"},
    w = { ":set list!<CR>",                                "Toggle Whitespace visibility"},
    y = { ":call ToggleColourSyntax()<CR>",                "Toggle sYntax highlighting"}
}
lvim.builtin.which_key.mappings["j"] = {
    name = "Show/Jump various dev info",
    a = {":silent exec '!jump Artifact %:p:h'<CR>",        "Jump Artifactory (project)"},
    c = {":silent exec '!jump Ci %:p:h'<CR>",              "Jump Ci (project)"},
    h = {":call OpenHelpPage()<CR>",                       "Jump vim Help page for word under cursor"},
    i = {":silent exec '!jump Live %:p:h'<CR>",            "Jump lIve (project)"},
    j = {":call JumpToSelection()<CR>",                    "Jump to url or hex color or git etc"},
    l = {":silent exec '!jump Lint %:p:h'<CR>",            "Jump Lint (project)"},
    m = {":<C-U>exe 'Man' v:count '<C-R><C-W>'<CR>",       "Jump linux Man page for word under cursor"},
    n = {":silent exec '!jump Notes %:p:h'<CR>",           "Jump Notes (project search in confluence)"},
    r = {":silent exec '!jump Repo %:p:h'<CR>",            "Jump Repo (git or bitbucket)"},
    s = {":call ShowJira()<CR>",                           "Show jira ticket in new buffer"},
    t = {":silent exec '!jump Ticket %:p:h'<CR>",          "Jump jira Ticket in browser"},
    u = {":silent exec '!jump TestReports %:p:h'<CR>",     "Jump Unit test reports"}
}
lvim.builtin.which_key.mappings["d"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<CR>", "trouble" },
    w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>", "workspace" },
    d = { "<cmd>TroubleToggle lsp_document_diagnostics<CR>", "document" },
    q = { "<cmd>TroubleToggle quickfix<CR>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<CR>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<CR>", "references" },
}

vim.api.nvim_set_keymap("n", "<TAB>",   ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-l>",   ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>",   ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-x>",   ":BufferClose<CR>", { noremap = true, silent = true })

-- }}}1

-- Personal vim format config and galaxyline {{{1
vim.cmd('source ~/.config/lvim/user.lua')
-- }}}
