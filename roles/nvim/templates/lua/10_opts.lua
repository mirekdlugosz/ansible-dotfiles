-- vim: fdm=marker

vim.o.shada = "'20,\"500"
vim.o.history = 5000
vim.o.timeoutlen = 400
vim.o.viewoptions = "folds,cursor"
vim.o.splitright = true
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.completeopt = "menu,menuone,preview,noselect,noinsert"
vim.o.numberwidth = 3

vim.o.wildmenu = true
vim.o.wildignore = ".*.sw*,__pycache__,*.pyc"
-- this may get overwritten in 03_plugin_opts
vim.o.foldmethod = "indent"

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.shiftround = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.mouse = "nc"
vim.o.clipboard = "unnamedplus"
-- When doing tab completion, give the following files lower priority.
vim.o.suffixes = vim.o.suffixes .. ",.info,.aux,.log,.dvi,.bbl,.out,.o,.lo"
vim.o.diffopt = "filler,internal,algorithm:histogram,indent-heuristic"

vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    underline = false,
}
vim.o.signcolumn = "no"

vim.env.GIT_EDITOR = 'nvr -cc vsplit --remote-wait +"set bufhidden=delete"'
