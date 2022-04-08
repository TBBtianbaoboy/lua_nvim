local completion = {}
local conf = require("modules.completion.config")

-- Neovim native LSP configuration
completion["neovim/nvim-lspconfig"] = {
    opt = true,
    event = "BufReadPre",
    config = conf.nvim_lsp
}
-- @func: 语言服务器安装器
-- @keymap: :Lsp*
-- @status: true
completion["williamboman/nvim-lsp-installer"] = {
    opt = true,
    after = "nvim-lspconfig"
}

-- @func: lsp 跳转优化
-- @keymap: gr gd ... | <C-v>垂直分页显示
-- @status: true
completion["RishabhRD/nvim-lsputils"] = {
	opt = true,
	after = "nvim-lspconfig",
    requires = {
        {"RishabhRD/popfix"},
    },
	config = conf.nvim_lsputils,
}

-- @func: efm语言格式化配置
-- @keymap: : nil
-- @status: false
-- completion["creativenull/efmls-configs-nvim"] = {
--     opt = false,
--     requires = "neovim/nvim-lspconfig"
-- }

-- @func: 代码参数提示
-- @keymap: : nil
-- @status: true
completion["ray-x/lsp_signature.nvim"] = {opt = true, after = "nvim-lspconfig"}

-- @func: 代码自动补全
-- @keymap: : nil
-- @status: true
completion["hrsh7th/nvim-cmp"] = {
    config = conf.cmp,
    event = "InsertEnter",
    requires = {
        {"lukas-reineke/cmp-under-comparator"}, -- 使下划线支持自动补全 : label 1
        {"saadparwaiz1/cmp_luasnip", after = "LuaSnip"}, -- snip 自动补全
        {"hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip"},
        {"hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp"},
        {"andersevenrud/cmp-tmux", after = "cmp-nvim-lua"},
        {"hrsh7th/cmp-path", after = "cmp-tmux"},
        {"f3fora/cmp-spell", after = "cmp-path"}, -- 英文检查 <leader>o
        {"hrsh7th/cmp-buffer", after = "cmp-spell"},
        {"kdheepak/cmp-latex-symbols", after = "cmp-buffer"}, -- 插入模式\输入特殊字符
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
