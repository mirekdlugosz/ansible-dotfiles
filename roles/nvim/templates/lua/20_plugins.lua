-- vim: fdm=marker fmr=<<<,>>>

require "paq" {

    -- paq can manage itself
    'savq/paq-nvim',

    -- <<< General editing
    -- better status line
    'nvim-lualine/lualine.nvim',

    -- better color scheme
    { "catppuccin/nvim", as = "catppuccin" },

    -- Automatically surround by tags, brackets, ...
    --use 'tpope/vim-surround'
    -- Useful keybindings
    'tpope/vim-unimpaired',

    -- Auto-insert matching parentheses
    'windwp/nvim-autopairs',

    -- Access to file system - must-have on larger projects
    'preservim/nerdtree',

    -- Comfortable code commenting
    'preservim/nerdcommenter',

    -- Visual aid for buffer changes tree
    'mbbill/undotree',

    -- Sidebar with tags (variables and whatnot)
    'preservim/tagbar',

    -- remember last cursor position
    'farmergreg/vim-lastplace',

    -- fuzzy-search for files, buffers, errors, ...
    -- first one is a dependency
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- which-key - available completions for started command
    'folke/which-key.nvim',

    -- leap - quickly jump to any place displayed on a screen
    { url = 'https://codeberg.org/andyg/leap.nvim.git', as = 'leap.nvim' },
    -- >>>

    -- <<< Programming
    -- easier access to terminals
    "akinsho/toggleterm.nvim",

    -- Snippets
    'dcampos/nvim-snippy',
    'honza/vim-snippets',

    -- LSP
    -- ready to use configs
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Use lua scripts to provide LSP features
    -- contains wrappers for many command-line tools, like black
    'nvimtools/none-ls.nvim',

    -- nvim-cmp - expand completions with data from other sources, like LSP
    -- words in buffer, paths and snippets
    -- also, better keybinding for code completion in insert mode
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    'dcampos/cmp-snippy',

    -- treesitter understands your file while you edit it
    -- it's used for improved syntax highlighting, folding etc.
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        build = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    },

    -- show diagnostics in window
    "folke/trouble.nvim",

    -- Python PEP-8
    'Vimjas/vim-python-pep8-indent',

    -- set commentstring for current part of file
    'JoosepAlviste/nvim-ts-context-commentstring',
    -- >>>
}
