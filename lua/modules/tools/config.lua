local config = {}

function config.telescope()
    require("telescope").setup {
        defaults = {
            prompt_prefix = "🔭 ",
            selection_caret = " ",
            layout_config = {
                horizontal = {prompt_position = "bottom", results_width = 0.6},
                vertical = {mirror = false}
            },
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep
                .new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist
                .new,
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = {"absolute"},
            winblend = 0,
            border = {},
            borderchars = {
                "─", "│", "─", "│", "╭", "╮", "╯", "╰"
            },
            color_devicons = true,
            use_less = true,
            set_env = {["COLORTERM"] = "truecolor"},
            pickers = {
                oldfiles = {
                    include_current_session = true,
                    cwd_only = true,
                }
            }
        }
    }
end

function config.sniprun()
    require"sniprun".setup({
        selected_interpreters = {}, -- " use those instead of the default for the current filetype
        repl_enable = {}, -- " enable REPL-like behavior for the given interpreters
        repl_disable = {}, -- " disable REPL-like behavior for the given interpreters
        interpreter_options = {}, -- " intepreter-specific options, consult docs / :SnipInfo <name>
        -- " you can combo different display modes as desired
        display = {
            "Classic", -- "display results in the command-line  area
            "VirtualTextOk", -- "display ok results as virtual text (multiline is shortened)
            "VirtualTextErr", -- "display error results as virtual text
            -- "TempFloatingWindow",      -- "display results in a floating window
            "LongTempFloatingWindow" -- "same as above, but only long results. To use with VirtualText__
            -- "Terminal"                 -- "display results in a vertical split
        },
        -- " miscellaneous compatibility/adjustement settings
        inline_messages = 0, -- " inline_message (0/1) is a one-line way to display messages
        -- " to workaround sniprun not being able to display anything

        borders = "shadow" -- " display borders around floating windows
        -- " possible values are 'none', 'single', 'double', or 'shadow'
    })
end

-- function config.formatter()
--     require("formatter").setup{
--         filetype = {
--             -- lua格式化程序
--             lua = {
--                 -- luafmt
--                 function()
--                     return {
--                         exe = "luafmt",
--                         args = {"--indent-count", 2, "--stdin"},
--                         stdin = true
--                     }
--                 end
--             },
--         }
--     }
-- end

function config.wilder()
    local wilder = require('wilder')
    wilder.setup({modes = {':', '/', '?'}})
    -- local highlighters = {
    --     wilder.pcre2_highlighter(),
    --     wilder.lua_fzy_highlighter(),
    -- }
    -- 禁止远程插件
    wilder.set_option('use_python_remote_plugin', 0)
    -- 模糊搜索
    wilder.set_option('pipeline', {
        wilder.branch(
        wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.vim_search_pipeline({
        })
        )
    })
    -- 搜索框
    wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = wilder.popupmenu_renderer({
            highlighter = wilder.lua_fzy_highlighter(),
            left = {
                ' ',
                wilder.popupmenu_devicons()
            },
            right = {
                ' ',
                wilder.popupmenu_scrollbar()
            },
        }),
        ['/'] = wilder.wildmenu_renderer({
            highlighter = wilder.lua_fzy_highlighter(),
        }),
    }))
    -- 搜索框UI
    -- wilder.set_option('renderer', wilder.popupmenu_renderer(
    -- wilder.popupmenu_palette_theme({
    --     -- 'single', 'double', 'rounded' or 'solid'
    --     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    --     border = 'rounded',
    --     max_height = '75%',      -- max height of the palette
    --     min_height = 0,          -- set to the same as 'max_height' for a fixed height window
    --     prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
    --     reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
    --     highlighter = highlighters,
    --     left = {
    --         ' ',
    --         wilder.popupmenu_devicons(),
    --         wilder.popupmenu_buffer_flags({
    --             flags = ' a + ',
    --             icons = {['+'] = '', a = '', h = ''},
    --         }),
    --     },
    --     right = {
    --         ' ',
    --         wilder.popupmenu_scrollbar(),
    --     },
    -- })
    -- ))
end

return config
