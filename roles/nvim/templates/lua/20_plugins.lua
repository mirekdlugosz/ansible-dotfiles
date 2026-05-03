-- vim: fdm=marker fmr=<<<,>>>

local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
    vim.system({ 'make' }, { cwd = ev.data.path }):wait()
  end
end
vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })

vim.pack.add({
    -- <<< General editing
    -- better status line
    'https://github.com/nvim-lualine/lualine.nvim',

    -- better color scheme
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },

    -- Automatically surround by tags, brackets, ...
    --use 'tpope/vim-surround'
    -- Useful keybindings
    'https://github.com/tpope/vim-unimpaired',

    -- Auto-insert matching parentheses
    'https://github.com/windwp/nvim-autopairs',

    -- Access to file system - must-have on larger projects
    'https://github.com/preservim/nerdtree',

    -- Comfortable code commenting
    'https://github.com/preservim/nerdcommenter',

    -- Visual aid for buffer changes tree
    'https://github.com/mbbill/undotree',

    -- Sidebar with tags (variables and whatnot)
    'https://github.com/preservim/tagbar',

    -- remember last cursor position
    'https://github.com/farmergreg/vim-lastplace',

    -- fuzzy-search for files, buffers, errors, ...
    -- first one is a dependency
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',

    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',

    -- which-key - available completions for started command
    'https://github.com/folke/which-key.nvim',

    -- leap - quickly jump to any place displayed on a screen
    { src = 'https://codeberg.org/andyg/leap.nvim.git', name = 'leap.nvim' },
    -- >>>

    -- <<< Programming
    -- easier access to terminals
    "https://github.com/akinsho/toggleterm.nvim",

    -- Snippets
    'https://github.com/dcampos/nvim-snippy',
    'https://github.com/honza/vim-snippets',

    -- LSP
    -- ready to use configs
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",

    -- Use lua scripts to provide LSP features
    -- contains wrappers for many command-line tools, like black
    'https://github.com/nvimtools/none-ls.nvim',

    -- nvim-cmp - expand completions with data from other sources, like LSP
    -- words in buffer, paths and snippets
    -- also, better keybinding for code completion in insert mode
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/dcampos/cmp-snippy',

    -- treesitter understands your file while you edit it
    -- it's used for improved syntax highlighting, folding etc.
    'https://github.com/romus204/tree-sitter-manager.nvim',

    -- show diagnostics in window
    "https://github.com/folke/trouble.nvim",

    -- Python PEP-8
    'https://github.com/Vimjas/vim-python-pep8-indent',

    -- set commentstring for current part of file
    'https://github.com/JoosepAlviste/nvim-ts-context-commentstring',
    -- >>>
})
