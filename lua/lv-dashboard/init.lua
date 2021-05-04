-- ChristianChiarulli/dashboard-nvim
vim.g.dashboard_custom_header = {
    '                 _..._',
    '               .\'   (_`.    _                         __     ___',
    '              :  .      :  | |   _   _ _ __   __ _ _ _\\ \\   / (_)_ __ ___',
    '              :)    ()  :  | |  | | | | \'_ \\ / _` | \'__\\ \\ / /| | \'_ ` _ \\',
    '              `.   .   .\'  | |__| |_| | | | | (_| | |   \\ V / | | | | | | |',
    '                `-...-\'    |_____\\__,_|_| |_|\\__,_|_|    \\_/  |_|_| |_| |_|',
}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  New File           '}, command = 'DashboardNewFile'},
    b = {description = {'  Find File          '}, command = 'Telescope find_files'},
    c = {description = {'  File Browser       '}, command = 'Telescope file_browser'},
    d = {description = {'  Ranger             '}, command = 'RnvimrToggle'},
    e = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    f = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    g = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    h = {description = {'  Git Status         '}, command = 'Telescope git_status'},
    i = {description = {'  Marks              '}, command = 'Telescope marks'},
    j = {description = {'  Settings           '}, command = ':e ~/.config/nvim/lv-settings.lua'},
    k = {description = {'  VIM Session        '}, command = ':source ~/.config/nvim.user/sessions/config_nvim.vim'},
    l = {description = {'  Zshrc              '}, command = ':e ~/.zshrc'}
}

vim.g.dashboard_session_directory = '~/.cache/nvim/session'
vim.g.dashboard_custom_footer = {'https://github.com/ChristianChiarulli/LunarVim/'}
