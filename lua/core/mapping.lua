local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map
    ["n|<C-x>k"] = map_cr("bdelete"):with_noremap():with_silent(),
    ["n|Y"] = map_cmd("y$"),
    ["n|D"] = map_cmd("d$"),
    ["n|H"] = map_cmd("^"),
    ["n|L"] = map_cmd("g_"),
    ["n|n"] = map_cmd("nzzzv"):with_noremap(),
    ["n|N"] = map_cmd("Nzzzv"):with_noremap(),
    ["n|J"] = map_cmd("mzJ`z"):with_noremap(),
    -- Windows Split
    ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap(),
    ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap(),
    ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap(),
    ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap(),
    ["n|<A-;>"] = map_cr("resize -2"):with_silent(),
    ["n|<A-'>"] = map_cr("resize +2"):with_silent(),
    ["n|<leader>e"] = map_cmd(":wq<CR>"),
    ["n|<leader>q"] = map_cmd(":q!<CR>"),
    ["n|<leader>w"] = map_cmd(":w<CR>"),
    ["n|<A-q>"] = map_cmd(":Bwipeout<CR>"),
    -- 开启英文单词正确性校验
    ["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"),
    -- Insert
    ["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(),
    ["i|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["i|<C-a>"] = map_cmd("<Esc>^i"):with_noremap(),
    ["i|<C-e>"] = map_cmd("<End>"):with_noremap(),
    ["i|<C-f>"] = map_cmd("<Right>"):with_noremap(),
    ["i|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["i|<C-d>"] = map_cmd("<Del>"):with_noremap(),
    -- command line
    ["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
    ["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
    ["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
    ["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
    ["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
    ["c|<C-p>"] = map_cmd("<Up>"):with_noremap(),
    ["c|<C-n>"] = map_cmd("<Down>"):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
    ["c|w!!"] = map_cmd(
        "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
    -- Visual
    ["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
    ["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
    ["v|H"] = map_cmd("^"),
    ["v|L"] = map_cmd("g_"),
    ["v|<"] = map_cmd("<gv"),
    ["v|>"] = map_cmd(">gv"),
    -- 摒弃上下左右键
    ["n|<Up>"] = map_cmd("<Nop>"):with_noremap(),
    ["n|<Down>"] = map_cmd("<Nop>"):with_noremap(),
    ["n|<Left>"] = map_cmd("<Nop>"):with_noremap(),
    ["n|<Right>"] = map_cmd("<Nop>"):with_noremap(),
    ["i|<Up>"] = map_cmd("<Nop>"):with_noremap(),
    ["i|<Down>"] = map_cmd("<Nop>"):with_noremap(),
    ["i|<Left>"] = map_cmd("<Nop>"):with_noremap(),
    ["i|<Right>"] = map_cmd("<Nop>"):with_noremap(),
    ["v|<Up>"] = map_cmd("<Nop>"):with_noremap(),
    ["v|<Down>"] = map_cmd("<Nop>"):with_noremap(),
    ["v|<Left>"] = map_cmd("<Nop>"):with_noremap(),
    ["v|<Right>"] = map_cmd("<Nop>"):with_noremap(),
    ["c|<Up>"] = map_cmd("<Nop>"),
    ["c|<Down>"] = map_cmd("<Nop>"),
    ["c|<Left>"] = map_cmd("<Nop>"),
    ["c|<Right>"] = map_cmd("<Nop>"),
    -- 将<space>映射成<leader>
    ["n|<Space>"] = map_cmd(";")
}

bind.nvim_load_mapping(def_map)
