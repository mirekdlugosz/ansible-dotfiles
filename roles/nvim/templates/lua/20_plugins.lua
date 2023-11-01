-- vim: fdm=marker fmr=<<<,>>>

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- <<< General editing
    -- better status line
    use 'nvim-lualine/lualine.nvim'

    -- better color scheme
    use 'Mofiqul/dracula.nvim'
    use 'nanotech/jellybeans.vim'

    -- Automatically surround by tags, brackets, ...
    --use 'tpope/vim-surround'
    -- Useful keybindings
    use 'tpope/vim-unimpaired'

    -- Auto-insert matching parentheses
    use 'windwp/nvim-autopairs'

    -- Access to file system - must-have on larger projects
    use 'preservim/nerdtree'

    -- Comfortable code commenting
    use 'preservim/nerdcommenter'

    -- Visual aid for buffer changes tree
    use 'mbbill/undotree'

    -- Sidebar with tags (variables and whatnot)
    use 'preservim/tagbar'

    -- remember last cursor position
    use  'farmergreg/vim-lastplace'

    -- fuzzy-search for files, buffers, errors, ...
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- which-key - available completions for started command
	use 'folke/which-key.nvim'
    -- >>>

    -- <<< Programming
    -- easier access to terminals
    use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

    -- Snippets
    use 'dcampos/nvim-snippy'
    use 'honza/vim-snippets'

    -- LSP
    -- ready to use configs
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"

    -- Use lua scripts to provide LSP features
    -- contains wrappers for many command-line tools, like black
    use 'jose-elias-alvarez/null-ls.nvim'

    -- nvim-cmp - expand LSP completions with data from other sources, like
    -- words in buffer, paths and snippets
    -- also, better keybinding for code completion in insert mode
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'dcampos/cmp-snippy'

    -- better function signature help
    use 'ray-x/lsp_signature.nvim'

    -- treesitter understands your file while you edit it
    -- it's used for improved syntax highlighting, folding etc.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- show diagnostics in window
    use "folke/trouble.nvim"

    -- Python PEP-8
    use 'Vimjas/vim-python-pep8-indent'

    -- set commentstring for current part of file
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        requires = { {'nvim-treesitter/nvim-treesitter'} },
    }
    -- >>>

end)

