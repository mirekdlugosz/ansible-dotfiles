-- vim: fdm=marker fmr=<<<,>>>

-- <<< custom keybindings
local key_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<F1>", "<cmd>wincmd w<CR>", key_opts)
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>NERDTreeToggle<CR>", key_opts)
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>TagbarToggle<CR>", key_opts)
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>UndotreeToggle<CR>", key_opts)


for i=1, 9 do
    vim.api.nvim_set_keymap("n", "<leader>t"..i, "<cmd>"..i.."ToggleTerm<CR>", key_opts)
end
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", key_opts)
vim.api.nvim_set_keymap("n", "<leader>tT", "<cmd>ToggleTermToggleAll<CR>", key_opts)


vim.api.nvim_set_keymap("n", ";", "<cmd>Telescope buffers sort_lastused=1 ignore_current_buffer=1<CR>", key_opts)
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope find_files<CR>", key_opts)
vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>Telescope grep_string<CR>", key_opts)


vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, opts)

-- emmet
vim.g.user_emmet_leader_key = '<C-x>'

-- Shortcuts from irssi
--nnoremap <C-p> :bp!<CR>
--nnoremap <C-n> :bn!<CR>
--imap <C-@> <C-Space>
-- >>>
