-- 插件的快捷键映射在这里
local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

local plug_map = {
    -- 可视化扩展选择
    -- ["v|v"] = map_cr("CommentToggle"):with_noremap():with_silent(),
    -- 禅模式
    ["n|<F4>"] = map_cr("ZenMode"):with_noremap():with_silent(),
    -- 注释快捷键<C-/>
    ["n|<C-_>"] = map_cr("CommentToggle"):with_noremap():with_silent(),
    ["v|<C-_>"] = map_cr("CommentToggle"):with_noremap():with_silent(),
    -- 代码格式化快捷键
    ["n|<leader>af"] = map_cr("lua vim.lsp.buf.formatting()"):with_noremap():with_silent(),
    -- 缓冲线选择/删除快捷键
    ["n|<leader>1"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
    ["n|<leader>2"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
    ["n|<leader>3"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
    ["n|<leader>4"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
    ["n|<leader>5"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
    ["n|<leader>6"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
    ["n|<leader>7"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
    ["n|<leader>8"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
    ["n|<leader>9"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
    ["n|gb"] = map_cu("BufferLinePick"):with_noremap():with_silent(),
    ["n|gB"] = map_cu("BufferLinePickClose"):with_noremap():with_silent(),
    -- 插件包管理快捷键(废弃，需要时直接跑命令即可)
    -- ["n|<leader>ps"] = map_cr("PackerSync"):with_silent():with_noremap()
    --     :with_nowait(),
    -- ["n|<leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap()
    --     :with_nowait(),
    -- ["n|<leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap()
    --     :with_nowait(),
    -- ["n|<leader>pc"] = map_cr("PackerClean"):with_silent():with_noremap()
    --     :with_nowait(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent()
        :with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent()
        :with_nowait(),

    ["n|K"] = map_cr("lua vim.lsp.buf.hover()"):with_noremap():with_silent(),
    ["n|gy"] = map_cr("lua vim.lsp.buf.type_definition()"):with_noremap():with_silent(),
    ["n|gi"] = map_cr("lua vim.lsp.buf.implementation()"):with_noremap():with_silent(),
    -- ["n|<leader>rn"] = map_cr("lua vim.lsp.buf.rename()"):with_noremap():with_silent(),
    ["n|<leader>rn"] = map_cr("lua require('renamer').rename()"):with_noremap():with_silent(),
    ["n|gd"] = map_cr("lua vim.lsp.buf.definition()"):with_noremap()
        :with_silent(),
    ["n|gr"] = map_cr("lua vim.lsp.buf.references()"):with_noremap()
        :with_silent(),
    ["n|<Leader>g"] = map_cu("lua require('FTerm').run('gitui')"):with_noremap()
        :with_silent(),
    ["n|<Leader>G"] = map_cu("Git"):with_noremap():with_silent(),
    ["n|gps"] = map_cr("G push"):with_noremap():with_silent(),
    ["n|gpl"] = map_cr("G pull"):with_noremap():with_silent(),
    -- Plugin nvim-tree
    ["n|<C-\\>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<Leader>fh"] = map_cu("DashboardFindHistory"):with_noremap()
        :with_silent(),
    ["n|<Leader>ff"] = map_cu("DashboardFindFile"):with_noremap():with_silent(),
    ["n|<Leader>cc"] = map_cu("DashboardChangeColorscheme"):with_noremap()
        :with_silent(),
    ["n|<Leader>fw"] = map_cu("DashboardFindWord"):with_noremap():with_silent(),
    ["n|<Leader>fn"] = map_cu("DashboardNewFile"):with_noremap():with_silent(),
    ["n|<Leader>fg"] = map_cu("Telescope git_files"):with_noremap()
        :with_silent(),
    -- Plugin accelerate-jk
    ["n|j"] = map_cmd("v:lua.enhance_jk_move('j')"):with_silent():with_expr(),
    ["n|k"] = map_cmd("v:lua.enhance_jk_move('k')"):with_silent():with_expr(),
    -- Plugin vim-eft
    ["n|f"] = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"] = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["n|t"] = map_cmd("v:lua.enhance_ft_move('t')"):with_expr(),
    ["n|T"] = map_cmd("v:lua.enhance_ft_move('T')"):with_expr(),
    -- Plugin Hop
    ["n|<leader>h"] = map_cu("HopWord"):with_noremap(),
    ["n|<leader>j"] = map_cu("HopLine"):with_noremap(),
    ["n|<leader>c1"] = map_cu("HopChar1"):with_noremap(),
    ["n|<leader>c2"] = map_cu("HopChar2"):with_noremap(),
    -- Plugin EasyAlign
    ["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
    ["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
    -- Plugin SymbolsOutline
    ["n|<leader>so"] = map_cr("SymbolsOutline"):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<F5>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent(),
    -- Plugin auto_session
    ["n|<leader>ss"] = map_cu("SaveSession"):with_noremap():with_silent(),
    ["n|<leader>sr"] = map_cu("RestoreSession"):with_noremap():with_silent(),
    ["n|<leader>sd"] = map_cu("DeleteSession"):with_noremap():with_silent(),
    -- Plugin dap (unknow how to use)
    ["n|<F6>"] = map_cr("lua require('dap').continue()"):with_noremap()
        :with_silent(),
    ["n|<leader>dr"] = map_cr("lua require('dap').continue()"):with_noremap()
        :with_silent(),
    ["n|<leader>dd"] = map_cr("lua require('dap').disconnect()"):with_noremap()
        :with_silent(),
    ["n|<leader>db"] = map_cr("lua require('dap').toggle_breakpoint()"):with_noremap()
        :with_silent(),
    ["n|<leader>dB"] = map_cr(
        "lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))"):with_noremap()
        :with_silent(),
    ["n|<leader>dbl"] = map_cr("lua require('dap').list_breakpoints()"):with_noremap()
        :with_silent(),
    ["n|<leader>drc"] = map_cr("lua require('dap').run_to_cursor()"):with_noremap()
        :with_silent(),
    ["n|<leader>drl"] = map_cr("lua require('dap').run_last()"):with_noremap()
        :with_silent(),
    ["n|<F9>"] = map_cr("lua require('dap').step_over()"):with_noremap()
        :with_silent(),
    ["n|<leader>dv"] = map_cr("lua require('dap').step_over()"):with_noremap()
        :with_silent(),
    ["n|<F10>"] = map_cr("lua require('dap').step_into()"):with_noremap()
        :with_silent(),
    ["n|<leader>di"] = map_cr("lua require('dap').step_into()"):with_noremap()
        :with_silent(),
    ["n|<F11>"] = map_cr("lua require('dap').step_out()"):with_noremap()
        :with_silent(),
    ["n|<leader>do"] = map_cr("lua require('dap').step_out()"):with_noremap()
        :with_silent(),
    ["n|<leader>dl"] = map_cr("lua require('dap').repl.open()"):with_noremap()
        :with_silent(),
    ["o|m"] = map_cu([[lua require('tsht').nodes()]]):with_silent(),
}

bind.nvim_load_mapping(plug_map)
