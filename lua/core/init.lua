local global = require "core.global"
local vim = vim

-- @Func: 创建一系列目录
local createdir = function()
    -- 声明存放数据的目录table
    local data_dir = {
        global.cache_dir .. "backup", global.cache_dir .. "session",
        global.cache_dir .. "swap", global.cache_dir .. "tags",
        global.cache_dir .. "undo"
    }
    -- 创建目录
    if vim.fn.isdirectory(global.cache_dir) == 0 then
        os.execute("mkdir -p " .. global.cache_dir)
        for _, v in pairs(data_dir) do
            if vim.fn.isdirectory(v) == 0 then
                os.execute("mkdir -p " .. v)
            end
        end
    end
end

local disable_distribution_plugins = function()
    vim.g.loaded_fzf = 1
    vim.g.loaded_gtags = 1
    vim.g.loaded_gzip = 1
    vim.g.loaded_tar = 1
    vim.g.loaded_tarPlugin = 1
    vim.g.loaded_zip = 1
    vim.g.loaded_zipPlugin = 1
    vim.g.loaded_getscript = 1
    vim.g.loaded_getscriptPlugin = 1
    vim.g.loaded_vimball = 1
    vim.g.loaded_vimballPlugin = 1
    vim.g.loaded_matchit = 1
    vim.g.loaded_matchparen = 1
    vim.g.loaded_2html_plugin = 1
    vim.g.loaded_logiPat = 1
    vim.g.loaded_rrhelper = 1
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrwSettings = 1
    vim.g.loaded_netrwFileHandlers = 1
end

local leader_map = function()
    vim.g.mapleader = ";"
    vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
    vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
end

--: https://github.com/neovide/neovide
--: after neovim can use,then do this
--: #download
--: https://github.com/neovide/neovide/releases/download/0.5.0/neovide
--: #resolve no *.so
--: https://userrepository.eu/shutter-encoder-15.7-1-x86_64.pkg.tar.zst
--: tar -I zstd -xvf xxxx.tar.zst
-- local neovide_config = function()
--     -- vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font:h18]]
--     vim.cmd [[set guifont=Fira\ Code\ Medium\ Nerd\ Font\ Complete\ Mono:h18]]
--     vim.g.neovide_refresh_rate = 60
--     vim.g.neovide_cursor_vfx_mode = "railgun"
--     vim.g.neovide_no_idle = true
--     vim.g.neovide_fullscreen = true
--     vim.g.neovide_cursor_animation_length = 0.03
--     vim.g.neovide_cursor_trail_length = 0.05
--     vim.g.neovide_cursor_antialiasing = true
--     vim.g.neovide_cursor_vfx_opacity = 200.0
--     vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
--     vim.g.neovide_cursor_vfx_particle_speed = 20.0
--     vim.g.neovide_cursor_vfx_particle_density = 5.0
--     vim.g.neovide_transparency = 0.8
-- end

local dashboard_config = function()
    vim.g.dashboard_footer_icon = "🐬 "
    vim.g.dashboard_default_executive = "telescope"

    vim.g.dashboard_custom_header = {
        [[                _      _                 ]],
        [[               / \    (_)   ___    ___   ]],
        [[              / _ \   | |  / __|  / _ \  ]],
        [[             / ___ \  | | | (__  | (_) | ]],
        [[            /_/   \_\ |_|  \___|  \___/  ]],
    }

    vim.g.dashboard_custom_section = {
        change_colorscheme = {
            description = {" Scheme change              <space> c c "},
            command = "DashboardChangeColorscheme"
        },
        find_frecency = {
            description = {" File frecency              <space> f r "},
            command = "Telescope frecency"
        },
        find_history = {
            description = {" File history               <space> f e "},
            command = "DashboardFindHistory"
        },
        find_project = {
            description = {" Project find               <space> f p "},
            command = "Telescope project"
        },
        find_file = {
            description = {" File find                  <space> f f "},
            command = "DashboardFindFile"
        },
        file_new = {
            description = {" File new                   <space> f n "},
            command = "DashboardNewFile"
        },
        find_word = {
            description = {" Word find                  <space> f w "},
            command = "DashboardFindWord"
        }
    }
end

local load_core = function()
    local pack = require("core.pack")
    createdir()
    disable_distribution_plugins()
    --: 重定义<leader>的映射
    leader_map()

    --: 确保module下的所有插件都存在
    pack.ensure_plugins()

    --: 非常魔幻的界面，性能很差，不建议开启
    -- neovide_config()

    --: 面板设置(纯属为了好看)
    dashboard_config()

    --: 配置vim环境属性(相当于运行vimscript中set命令)
    require("core.options")
    --: 配置与插件无关的快捷键
    require("core.mapping")
    --: 配置插件的快捷键，自动加载keymap目录下的init.lua文件
    require("keymap")
    --: 加载时间，即发生什么事件时做什么事情
    require("core.event")
    pack.load_compile()

end

-- 程序的入口
load_core()
