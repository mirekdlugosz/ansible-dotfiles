-- vim: fdm=marker fmr=<<<,>>>

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    spec = {
        -- <<< General editing
        -- better status line
        { "nvim-lualine/lualine.nvim" },

        -- better color scheme
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

        -- Automatically surround by tags, brackets, ...
        --{ "tpope/vim-surround" },
        -- Useful keybindings
        { "tpope/vim-unimpaired" },

        -- Auto-insert matching parentheses
        -- FIXME: docs says to use event here
        { "windwp/nvim-autopairs" },

        -- Access to file system - must-have on larger projects
        { "preservim/nerdtree" },

        -- Comfortable code commenting
        { "preservim/nerdcommenter" },

        -- Visual aid for buffer changes tree
        { "mbbill/undotree" },

        -- Sidebar with tags (variables and whatnot)
        { "preservim/tagbar" },

        -- remember last cursor position
        { "farmergreg/vim-lastplace" },

        -- fuzzy-search for files, buffers, errors, ...
        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' 
        },

        -- which-key - available completions for started command
        { "folke/which-key.nvim" },

        -- leap - quickly jump to any place displayed on a screen
        { "ggandor/leap.nvim" },
        -- >>>

        -- <<< Programming
        -- easier access to terminals
        {
            'akinsho/toggleterm.nvim',
            version = "v2.*",
            config = true,
        },

        -- Snippets
        { "dcampos/nvim-snippy" },
        { "honza/vim-snippets" },

        -- LSP
        -- ready to use configs
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "neovim/nvim-lspconfig" },

        -- Use lua scripts to provide LSP features
        -- contains wrappers for many command-line tools, like black
        { "nvimtools/none-ls.nvim" },

        -- nvim-cmp - expand LSP completions with data from other sources, like
        -- words in buffer, paths and snippets
        -- also, better keybinding for code completion in insert mode
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/nvim-cmp" },
        { "dcampos/cmp-snippy" },

        -- better function signature help
        { "ray-x/lsp_signature.nvim" },

        -- treesitter understands your file while you edit it
        -- it's used for improved syntax highlighting, folding etc.
        {
            "nvim-treesitter/nvim-treesitter",
            build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        },

        -- show diagnostics in window
        { "folke/trouble.nvim" },

        -- Python PEP-8
        { "Vimjas/vim-python-pep8-indent" },

        -- set commentstring for current part of file
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            dependencies = { "nvim-treesitter/nvim-treesitter" },
        },
        -- >>>
    },
    checker = { enabled = false },
}
