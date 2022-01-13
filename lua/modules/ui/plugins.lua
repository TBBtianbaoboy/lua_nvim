local ui = {}
local conf = require("modules.ui.config")

-- Provide icons
ui["kyazdani42/nvim-web-devicons"] = {opt = false}
-- My light/dark theme
ui["sainnhe/edge"] = {opt = false, config = conf.edge}
-- A low contrast dark theme
ui["catppuccin/nvim"] = {
    opt = false,
    as = "catppuccin",
    config = conf.catppuccin
}
-- gruvbox theme
ui["morhetz/gruvbox"] = {
    opt = false,
    as = "morhetz",
    config = conf.gruvbox
}
-- Minimal, fast but customizable line
ui["hoob3rt/lualine.nvim"] = {
    opt = true,
    after = "lualine-lsp-progress",
    config = conf.lualine
}
-- Show lsp progress in lualine
ui["arkav/lualine-lsp-progress"] = {opt = true, after = "nvim-gps"}
-- Dashboard for Neovim
ui["glepnir/dashboard-nvim"] = {opt = true, event = "BufWinEnter"}
-- Replacement of Nerdtree
ui["kyazdani42/nvim-tree.lua"] = {
    opt = true,
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},
    config = conf.nvim_tree
}
-- Show git status in nvim
ui["lewis6991/gitsigns.nvim"] = {
    opt = true,
    event = {"BufRead", "BufNewFile"},
    config = conf.gitsigns,
    requires = {"nvim-lua/plenary.nvim", opt = true}
}
-- Show indent with different level
ui["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    event = "BufRead",
    config = conf.indent_blankline
}
-- Tab and buffer management
ui["akinsho/nvim-bufferline.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_bufferline
}
ui["dstein64/nvim-scrollview"] = {opt = true, event = "BufRead"}

return ui
