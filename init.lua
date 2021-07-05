require "default-config"
require "keymappings"
vim.cmd("luafile " .. CONFIG_PATH .. "/lv-config.lua")
require "settings"
require "plugins"
require "lv-utils"
require "lv-galaxyline"
require "lv-treesitter"
require "lv-which-key"
require "lsp"
if O.lang.emmet.active then
  require "lsp.emmet-ls"
end

-- autoformat
if O.format_on_save then
  require("lv-utils").define_augroups {
    autoformat = {
      {
        "BufWritePre",
        "*",
        [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
      },
    },
  }
end

-- JIMC extras.
vim.cmd('luafile ~/.config/nvim/user.lua')     -- My config, lua syntax.
vim.cmd('source ~/.config/nvim/user.vim')      -- My config, vim syntax.
-- if O.lang.sql.active then require('lsp.sql-ls') end

