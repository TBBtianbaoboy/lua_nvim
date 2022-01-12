local completion = {}
local conf = require("modules.completion.config")

-- Neovim native LSP configuration
completion["neovim/nvim-lspconfig"] = {
    opt = true,
    event = "BufReadPre",
    config = conf.nvim_lsp
}
-- Manage each LSP engine
completion["williamboman/nvim-lsp-installer"] = {
    opt = true,
    after = "nvim-lspconfig"
}
completion["creativenull/efmls-configs-nvim"] = {
    opt = false,
    requires = "neovim/nvim-lspconfig"
}
-- Better lsp function
completion["tami5/lspsaga.nvim"] = {opt = true, after = "nvim-lspconfig"}
-- Show signature when completing function parameters
completion["ray-x/lsp_signature.nvim"] = {opt = true, after = "nvim-lspconfig"}
-- Auto completion plugin for nvim
completion["hrsh7th/nvim-cmp"] = {
    config = conf.cmp,
    event = "InsertEnter",
    requires = {
        {"lukas-reineke/cmp-under-comparator"},
        {"saadparwaiz1/cmp_luasnip", after = "LuaSnip"},
        {"hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip"},
        {"hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp"},
        {"andersevenrud/cmp-tmux", after = "cmp-nvim-lua"},
        {"hrsh7th/cmp-path", after = "cmp-tmux"},
        {"f3fora/cmp-spell", after = "cmp-path"},
        {"hrsh7th/cmp-buffer", after = "cmp-spell"},
        {"kdheepak/cmp-latex-symbols", after = "cmp-buffer"}
        -- {
        --     'tzachar/cmp-tabnine',
        --     run = './install.sh',
        --     after = 'cmp-spell',
        --     config = conf.tabnine
        -- }
    }
}
-- snippets completion engine for nvim-cmp
completion["L3MON4D3/LuaSnip"] = {
    after = "nvim-cmp",
    config = conf.luasnip,
    requires = "rafamadriz/friendly-snippets"
}
-- Completion pairs
completion["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
    config = conf.autopairs
}
return completion
