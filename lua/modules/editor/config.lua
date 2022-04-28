local config = {}
local dap_dir = vim.fn.stdpath("data") .. "/dapinstall/"
local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"

function config.symbols_outline()
    require("symbols-outline").setup({
        highlight_hovered_item = true,
        width = 60,
        show_guides = true,
        auto_preview = true,
        position = "right",
        show_numbers = true,
        show_relative_numbers = true,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        keymaps = {
            close = "<Esc>",
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            rename_symbol = "r",
            code_actions = "a"
        },
        lsp_blacklist = {},
        symbols = {
            File = {icon = "", hl = "TSURI"},
            Module = {icon = "", hl = "TSNamespace"},
            Namespace = {icon = "", hl = "TSNamespace"},
            Package = {icon = "", hl = "TSNamespace"},
            Class = {icon = "𝓒", hl = "TSType"},
            Method = {icon = "ƒ", hl = "TSMethod"},
            Property = {icon = "", hl = "TSMethod"},
            Field = {icon = "", hl = "TSField"},
            Constructor = {icon = "", hl = "TSConstructor"},
            Enum = {icon = "ℰ", hl = "TSType"},
            Interface = {icon = "ﰮ", hl = "TSType"},
            Function = {icon = "", hl = "TSFunction"},
            Variable = {icon = "", hl = "TSConstant"},
            Constant = {icon = "", hl = "TSConstant"},
            String = {icon = "𝓐", hl = "TSString"},
            Number = {icon = "#", hl = "TSNumber"},
            Boolean = {icon = "⊨", hl = "TSBoolean"},
            Array = {icon = "", hl = "TSConstant"},
            Object = {icon = "⦿", hl = "TSType"},
            Key = {icon = "🔐", hl = "TSType"},
            Null = {icon = "NULL", hl = "TSType"},
            EnumMember = {icon = "", hl = "TSField"},
            Struct = {icon = "𝓢", hl = "TSType"},
            Event = {icon = "🗲", hl = "TSType"},
            Operator = {icon = "+", hl = "TSOperator"},
            TypeParameter = {icon = "𝙏", hl = "TSParameter"}
        }
    })
end

function config.vim_cursorwod()
    vim.api.nvim_command("augroup user_plugin_cursorword")
    vim.api.nvim_command("autocmd!")
    vim.api.nvim_command(
        "autocmd FileType NvimTree,dashboard let b:cursorword = 0")
    vim.api.nvim_command(
        "autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
    vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
    vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
    vim.api.nvim_command("augroup END")
end

function config.nvim_treesitter()
    vim.api.nvim_command("set foldmethod=expr")
    vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

    require"nvim-treesitter.configs".setup {
        -- ensure_installed = "maintained",
        ensure_installed = "all",
        highlight = {
            enable = true,
            disable = {"vim","org"},
            additional_vim_regex_highlighting = {'org'},
        },
        -- label 1
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner"
                }
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]["] = "@function.outer",
                    ["]m"] = "@class.outer"
                },
                goto_next_end = {
                    ["]]"] = "@function.outer",
                    ["]M"] = "@class.outer"
                },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                    ["[m"] = "@class.outer"
                },
                goto_previous_end = {
                    ["[]"] = "@function.outer",
                    ["[M"] = "@class.outer"
                }
            }
        },
        -- label 2
        rainbow = {
            -- colors={
            --     "#123456",
            -- },
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
        },
        -- label 3
        context_commentstring = {enable = true, enable_autocmd = false},
        -- label 4
        matchup = {enable = true},
    }
end

function config.matchup()
    vim.cmd [[let g:matchup_matchparen_offscreen = {'method': 'popup'}]]
end

function config.nvim_gps()
    require("nvim-gps").setup({
        icons = {
            ["class-name"] = " ", -- Classes and class-like objects
            ["function-name"] = " ", -- Functions
            ["method-name"] = " " -- Methods (functions inside class-like objects)
        },
        languages = {
            -- You can disable any language individually here
            ["c"] = true,
            ["cpp"] = true,
            ["go"] = true,
            ["java"] = true,
            ["javascript"] = true,
            ["lua"] = true,
            ["python"] = true,
            ["rust"] = true
        },
        separator = " > "
    })
end

function config.autotag()
    require("nvim-ts-autotag").setup({
        filetypes = {
            "html", "xml", "javascript", "typescriptreact", "javascriptreact",
            "vue",
        }
    })
end

function config.nvim_colorizer() require("colorizer").setup() end

function config.neoscroll()
    require("neoscroll").setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = {
            "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz",
            "zb"
        },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil -- Function to run after the scrolling animation ends
    })
end

function config.auto_session()
    local opts = {
        log_level = "info",
        auto_session_enable_last_session = true,
        auto_session_root_dir = sessions_dir,
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_suppress_dirs = nil
    }

    require("auto-session").setup(opts)
end

function config.zen_mode()
    require("zen-mode").setup {}
end

function config.vim_wordmotion()
    vim.cmd [[
    let g:wordmotion_mappings = {
        \ 'w' : '<M-w>',
        \ 'b' : '<M-b>',
        \ 'e' : '<M-e>',
        \ 'ge' : 'g<M-e>',
        \ 'aw' : 'a<M-w>',
        \ 'iw' : 'i<M-w>',
        \ '<C-R><C-W>' : '<C-R><M-w>'
        \ }
        ]]
end

function config.vim_expand_region()
    vim.cmd [[
    let g:expand_region_text_objects = {
        \ 'iw'  :0,
        \ 'i"'  :0, 'a"'  :0,
        \ 'i''' :0, 'a''' :0,
        \ 'i`'  :0, 'a`'  :0,
        \ 'i)'  :1, 'a)'  :1,
        \ 'i]'  :1, 'a]'  :1,
        \ 'i}'  :1, 'a}'  :1,
        \ 'it'  :1, 'at'  :1,
        \ }
        ]]
end

function config.numb()
    require('numb').setup{
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true, -- Peeked line will be centered relative to window
    }
end

function config.renamer()
    local mappings_utils = require('renamer.mappings.utils')
    require('renamer').setup {
        -- The popup title, shown if `border` is true
        title = 'Aico Rename',
        -- The padding around the popup content
        padding = {
            top = 0,
            left = 0,
            bottom = 0,
            right = 0,
        },
        -- The minimum width of the popup
        min_width = 15,
        -- The maximum width of the popup
        max_width = 45,
        -- Whether or not to shown a border around the popup
        border = true,
        -- The characters which make up the border
        border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        -- Whether or not to highlight the current word references through LSP
        show_refs = true,
        -- Whether or not to add resulting changes to the quickfix list
        with_qf_list = true,
        -- Whether or not to enter the new name through the UI or Neovim's `input`
        -- prompt
        with_popup = true,
        -- The keymaps available while in the `renamer` buffer. The example below
        -- overrides the default values, but you can add others as well.
        mappings = {
            ['<c-a>'] = mappings_utils.set_cursor_to_start,
            ['<c-e>'] = mappings_utils.set_cursor_to_end,
            ['<c-u>'] = mappings_utils.clear_line,
            ['<c-r>'] = mappings_utils.redo,
        },
        -- Custom handler to be run after successfully renaming the word. Receives
        -- the LSP 'textDocument/rename' raw response as its parameter.
        handler = nil,
    }
end

-- function config.nvim_regexplainer()
--     require'regexplainer'.setup {
--         -- 'narrative'
--         mode = 'narrative', -- TODO: 'ascii', 'graphical'
--
--         -- automatically show the explainer when the cursor enters a regexp
--         auto = false,
--
--         -- Whether to log debug messages
--         debug = false,
--
--         -- 'split', 'popup', 'pasteboard'
--         display = 'popup',
--
--         mappings = {
--             toggle = 'gR',
--             -- examples, not defaults:
--             -- show = 'gS',
--             -- hide = 'gH',
--             -- show_split = 'gP',
--             -- show_popup = 'gU',
--         },
--
--         narrative = {
--             separator = '\n',
--         },
--     }
-- end

function config.toggleterm()
    require("toggleterm").setup {
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.40
            end
        end,
        open_mapping = [[<F12>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = "float",
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell -- change the default shell
    }
end

function config.notes()
    vim.cmd [[ let g:notes_directories = ['~/Documents/Notes', '~/Dropbox/Shared Notes'] ]]
end

function config.marks()
    require'marks'.setup {
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { "😀" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions.
        -- higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
            sign = "🚩",
            virt_text = "▁▂▃▅▆█ Aico -> 🍩🆃 🅾 🅳 🅾 🍩 █▆▅▃▂▁"
        },
        mappings = {
        }
    }
end

function config.dapui()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    require("dapui").setup({
        icons = {expanded = "▾", collapsed = "▸"},
        mappings = {
            -- Use a table to apply multiple mappings
            expand = {"<CR>", "<2-LeftMouse>"},
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r"
        },
        sidebar = {
            elements = {
                -- Provide as ID strings or tables with "id" and "size" keys
                {
                    id = "scopes",
                    size = 0.25 -- Can be float or integer > 1
                }, {id = "breakpoints", size = 0.25},
                {id = "stacks", size = 0.25}, {id = "watches", size = 00.25}
            },
            size = 40,
            position = "left"
        },
        tray = {elements = {"repl"}, size = 10, position = "bottom"},
        floating = {
            max_height = nil,
            max_width = nil,
            mappings = {close = {"q", "<Esc>"}}
        },
        windows = {indent = 1}
    })
end

function config.dap()
    local dap = require("dap")

    dap.adapters.go = function(callback, config)
        local stdout = vim.loop.new_pipe(false)
        local handle
        local pid_or_err
        local port = 38697
        local opts = {
            stdio = {nil, stdout},
            args = {"dap", "-l", "127.0.0.1:" .. port},
            detached = true
        }
        handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
            stdout:close()
            handle:close()
            if code ~= 0 then print("dlv exited with code", code) end
        end)
        assert(handle, "Error running dlv: " .. tostring(pid_or_err))
        stdout:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                vim.schedule(function()
                    require("dap.repl").append(chunk)
                end)
            end
        end)
        -- Wait for delve to start
        vim.defer_fn(function()
            callback({type = "server", host = "127.0.0.1", port = port})
        end, 100)
    end
    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
        {type = "go", name = "Debug", request = "launch", program = "${file}"},
        {
            type = "go",
            name = "Debug test", -- configuration for debugging test files
            request = "launch",
            mode = "test",
            program = "${file}"
        }, -- works with go.mod packages and sub packages
        {
            type = "go",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}"
        }
    }

    dap.adapters.python = {
        type = "executable",
        command = os.getenv("HOME") ..
            "/.local/share/nvim/dapinstall/python_dbg/bin/python",
        args = {"-m", "debugpy.adapter"}
    }
    dap.configurations.python = {
        {
            -- The first three options are required by nvim-dap
            type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = "launch",
            name = "Launch file",
            -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return "/usr/bin/python"
                end
            end
        }
    }
end

-- function config.popmenu()
--     vim.cmd[[let g:apc_enable_ft = {'*':1}]]
--     vim.cmd[[set cpt=.,k,w,b]]
--     vim.cmd[[set completeopt=menu,menuone,noselect]]
--     vim.cmd[[set shortmess+=c]]
-- end

-- function config.specs()
--     require('specs').setup {
--         show_jumps = true,
--         min_jump = 10,
--         popup = {
--             delay_ms = 0, -- delay before popup displays
--             inc_ms = 10, -- time increments used for fade/resize effects
--             blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
--             width = 10,
--             winhl = "PMenu",
--             fader = require('specs').pulse_fader,
--             resizer = require('specs').shrink_resizer
--         },
--         ignore_filetypes = {},
--         ignore_buftypes = {nofile = true}
--     }
-- end

return config
