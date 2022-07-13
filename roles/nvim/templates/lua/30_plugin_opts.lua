-- vim: fdm=marker fmr=<<<,>>>

-- <<< set references to lsp functions
-- these may be overwritten by telescope, and are used by lspconfig

local lspfunctions = {
    declaration = vim.lsp.buf.declaration,
    definition = vim.lsp.buf.definition,
    implementation = vim.lsp.buf.implementation,
    type_definition = vim.lsp.buf.type_definition,
    references = vim.lsp.buf.references,
    hover = vim.lsp.buf.hover,
    signature_help = vim.lsp.buf.signature_help,
    rename = vim.lsp.buf.rename,
    code_action = vim.lsp.buf.code_action,
    formatting = vim.lsp.buf.formatting,
}
-- >>>

-- <<< colors - jellybeans
vim.g.background = 'dark'
vim.cmd(
[[
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'SpellCap': { '256ctermfg': '99', '256ctermbg': 'none', 'attr': 'underline' },
\    'SignColumn': { '256ctermfg': '81', '256ctermbg': 'none' },
\    'Todo': { 'attr': 'reverse' },
\    'Pmenu': { '256ctermfg': '250', '256ctermbg': '237' },
\    'PmenuSel': { '256ctermfg': '81', '256ctermbg': '237', 'attr': 'bold' },
\    'PmenuSbar': { '256ctermfg': '16', '256ctermbg': '237', 'guifg': 'none', 'guibg': 'none' },
\    'PmenuThumb': { '256ctermfg': '235', '256ctermbg': '243', 'guifg': 'none', 'guibg': 'none' },
\    'Folded': { '256ctermbg': 'none'},
\}
]],
false)

pcall(vim.cmd, [[colorscheme jellybeans]])

vim.cmd([[highlight link ALEError SpellCap]])
-- >>>

-- <<< nvim-lualine/lualine.nvim
local status_ok, lualine = pcall(require, "lualine")
if status_ok then
    -- Overrides
    local custom_jellybeans = require('lualine.themes.jellybeans')
    for _, mode in ipairs({ "normal", "insert", "visual", "replace", "inactive" }) do
        local reference_mode = mode
        if custom_jellybeans[mode].c == nil then
            reference_mode = "normal"
        end
        custom_jellybeans[mode].y = custom_jellybeans[reference_mode].c
        custom_jellybeans[mode].z = custom_jellybeans[reference_mode].c
    end

    -- encoding: Don't display if encoding is UTF-8.
    local function encoding()
        local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
        return ret
    end
    -- fileformat: Don't display if fileformat is unix.
    local function fileformat()
        local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
        return ret
    end

    lualine.setup {
        options = {
            icons_enabled = false,
            theme = custom_jellybeans,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                {
                    'filename',
                    path = 1,
                    symbols = {
                        modified = ' [+]',
                        readonly = ' [-]',
                    },
                },
            },
            lualine_c = { 'diagnostics', '' },
            lualine_x = { encoding, fileformat, 'filetype' },
            lualine_y = { },
            lualine_z = { 'location', 'progress' },
        },
        extensions = {
            'toggleterm',
        }
    }
end
-- >>>

-- <<< windwp/nvim-autopairs
local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if status_ok then
    nvim_autopairs.setup {}
end
-- >>>

-- <<< mbbill/undotree
vim.g.undotree_DiffAutoOpen = 0
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_HighlightChangedWithSign = 0
-- >>>

-- <<< preservim/tagbar
vim.g.tagbar_autoclose = 1
vim.g.tagbar_autofocus = 1
vim.g.tagbar_autoshowtag = 1
-- >>>

-- <<< nvim-telescope/telescope.nvim
local status_ok, telescope = pcall(require, "telescope")
if status_ok then
    telescope.setup {
        defaults = {
            sorting_strategy = "ascending",
            scroll_strategy = "limit",
            cache_picker = {
                num_pickers = 20,
            },
            layout_strategy = 'vertical',
            layout_config = {
                vertical = {
                    preview_cutoff = 0,
                }
            }
        },
        extensions = {
            fzf = { }
        }
    }
    telescope.load_extension('fzf')

    local telescope_builtin = require("telescope.builtin")

    lspfunctions["references"] = telescope_builtin.lsp_references
    lspfunctions["definition"] = telescope_builtin.lsp_definitions
    lspfunctions["implementation"] = telescope_builtin.lsp_implementations
    lspfunctions["type_definition"] = telescope_builtin.lsp_type_definitions
end
-- >>>

-- <<< folke/which-key.nvim
local status_ok, which_key = pcall(require, "which-key")
if status_ok then
    which_key.setup {}
    which_key.register({
        ["<leader>c"] = {
            name = "NerdCommenter",
        },
        ["<leader>p"] = {
            name = "Telescope",
            f = { "<cmd>Telescope find_files<cr>", "find files" },
            a = { "<cmd>Telescope live_grep<cr>", "find file by content" },
            p = { "<cmd>Telescope pickers<cr>", "previous pickers" },
            [";"] = { "<cmd>Telescope buffers sort_lastused=1 ignore_current_buffer=1<cr>", "buffers" },
            c = { "<cmd>Telescope commands<cr>", "custom commands" },
            h = { "<cmd>Telescope command_history<cr>", "history of commands" },
            s = { "<cmd>Telescope search_history<cr>", "history of search" },
            m = { "<cmd>Telescope marks<cr>", "marks" },
            j = { "<cmd>Telescope jumplist<cr>", "jumplist" },
            r = { "<cmd>Telescope registers<cr>", "registers" },
            ["="] = { "<cmd>Telescope spell_suggest<cr>", "spell suggestions" },
            o = { "<cmd>Telescope vim_options<cr>", "vim options" },
            k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
            d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "diagnostics in current buffer" },
            D = { "<cmd>Telescope diagnostics<cr>", "diagnostics in workspace" },
            ["?"] = { "<cmd>Telescope builtin<cr>", "available pickers" },
        },
        ["<leader>l"] = {
            name = "LSP",
            e = { "vim.diagnostic.open_float" },
            D = { "vim.lsp.buf.declaration" },
            d = { "vim.lsp.buf.definition" },
            i = { "vim.lsp.buf.implementation" },
            T = { "vim.lsp.buf.type_definition" },
            r = { "vim.lsp.buf.references" },
            K = { "vim.lsp.buf.hover" },
            k = { "vim.lsp.buf.signature_help" },
            R = { "vim.lsp.buf.rename" },
            c = { "vim.lsp.buf.code_action" },
            f = { "vim.lsp.buf.formatting" },
        },
        ["<leader>t"] = {
            name = "Terminals",
            ["1"] = { "1" },
            ["2"] = { "2" },
            ["3"] = { "3" },
            ["4"] = { "4" },
            ["5"] = { "5" },
            ["6"] = { "6" },
            ["7"] = { "7" },
            ["8"] = { "8" },
            ["9"] = { "9" },
            t = { "toggle default term" },
            T = { "toggle all terms" },
        },
    })
end
-- >>>

-- <<< akinsho/toggleterm.nvim
local status_ok, toggleterm = pcall(require, "toggleterm")
if status_ok then
    toggleterm.setup()

    function _G.set_terminal_keymaps()
        local opts = {noremap = true}
        vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end
-- >>>

-- <<< dcampos/nvim-snippy

-- >>>

-- <<< ALE - asynchrounous linters
vim.g.ale_set_loclist = 1
vim.g.ale_keep_list_window_open = 0
vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_set_signs = 0
vim.g.ale_completion_enabled = 0
vim.g.ale_use_global_executables = 1
-- >>>

-- <<< williamboman/nvim-lsp-installer
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if status_ok then
    lsp_installer.setup {
        automatic_installation = false,
    }
    lsp_installer.settings({
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    })
end
-- >>>

-- <<< hrsh7th/nvim-cmp
local status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

local status_ok, cmp = pcall(require, "cmp")
if status_ok then
    cmp.setup({
        snippet = {
            expand = function(args)
                require('snippy').expand_snippet(args.body)
            end,
        },
        completion = {
            keyword_length = 1,
        },
        -- this magic removes duplicates when using multiple servers
        -- cf. https://github.com/hrsh7th/nvim-cmp/issues/32#issuecomment-900808532
        formatting = {
            format = function(entry, vim_item)
                if entry.source.name == 'nvim_lsp' then
                    vim_item.dup = 0
                end
                return vim_item
            end
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-8),
            ['<C-f>'] = cmp.mapping.scroll_docs(8),
            ['<C-Space>'] = cmp.mapping.complete(),
            -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp', max_item_count = 15 },
            { name = 'snippy', max_item_count = 10 },
        }, {
            { name = 'path' },
            {
                name = 'buffer',
                max_item_count = 10,
                option = {
                    get_bufnrs = function()
                        -- get text from all (visited) buffers, but skip these larger than 5 MB
                        buffers = {}
                        local max_size = 1024 * 1024 * 5
                        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                            local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                            if max_size > byte_size then
                                table.insert(buffers, buf)
                            end
                        end
                        return buffers
                    end
                }
            },
        })
    })
    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

-- >>>

-- <<< jose-elias-alvarez/null-ls.nvim
local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
    null_ls.setup({
        sources = {
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.formatting.black,
        }
    })
end
-- >>>

-- <<< neovim/nvim-lspconfig
local status_ok, lspconfig = pcall(require, "lspconfig")
if status_ok then
    -- <<< Mappings.
    -- Some more mappings are defined in on_attach
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    -- >>>
    -- <<< on_attach
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        local rc = client.resolved_capabilities

        if client.name == 'jedi_language_server' then
            rc.find_references = false
        end

        if client.name == 'pyright' then
            rc.hover = false
            rc.signature_help = false
        end

        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', '<leader>lD', lspfunctions["declaration"], bufopts)
        vim.keymap.set('n', '<leader>ld', lspfunctions["definition"], bufopts)
        vim.keymap.set('n', '<C-g>',      lspfunctions["definition"], bufopts)
        vim.keymap.set('n', '<leader>li', lspfunctions["implementation"], bufopts)
        vim.keymap.set('n', '<leader>lT', lspfunctions["type_definition"], bufopts)
        vim.keymap.set('n', '<leader>lr', lspfunctions["references"], bufopts)
        vim.keymap.set('n', '<leader>lK', lspfunctions["hover"], bufopts)
        vim.keymap.set('n', '<leader>lk', lspfunctions["signature_help"], bufopts)
        vim.keymap.set('n', '<leader>lR', lspfunctions["rename"], bufopts)
        vim.keymap.set('n', '<leader>lc', lspfunctions["code_action"], bufopts)
        vim.keymap.set('n', '<leader>lf', lspfunctions["formatting"], bufopts)
    end
    -- >>>
    -- <<< lsp_flags
    local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }
    --->>>
    -- <<< servers
    local lsp_servers = {
        {% for nvim_lsp in nvim_lsps -%}
        {% if not nvim_lsp in nvim_lsps_exclude %}
        '{{ nvim_lsp }}',
        {% endif %}
        {%- endfor -%}
    }
    local lsp_servers_settings = {
        pyright = {
            python = {
                analysis = {
                    useLibraryCodeForTypes = true,
                    diagnosticSeverityOverrides = {
                        reportGeneralTypeIssues = "none",
                        reportOptionalMemberAccess = "none",
                        reportOptionalSubscript = "none",
                        reportPrivateImportUsage = "none",
                    },
                    autoImportCompletions = false,
                },
                linting = {
                    pylintEnabled = false
                },
            },
        },
    }
    for _, lspserver in ipairs(lsp_servers) do
        local setup_opts = {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags,
        }

        if lsp_servers_settings[lspserver] then
            opts['settings'] = lsp_servers_settings[lspserver]
        end

        lspconfig[lspserver].setup(setup_opts)
    end
    -- >>>
end
-- >>>

-- <<< ray-x/lsp_signature.nvim
local status_ok, lsp_signature = pcall(require, "lsp_signature")
if status_ok then
    lsp_signature.setup({
        bind = true,
        hint_enable = false,
    })
end
-- >>>

-- <<< nvim-treesitter/nvim-treesitter
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if status_ok then
    treesitter.setup {
        ensure_installed = {
        {% for nvim_treesitter_mod in nvim_treesitter_modules -%}
        {% if not nvim_treesitter_mod in nvim_treesitter_modules_exclude %}
        '{{ nvim_treesitter_mod }}',
        {% endif %}
        {%- endfor -%}
        },
        sync_install = true,
        auto_install = false,
        highlight = {
            enable = true,
        },
    }

    -- cf. https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim=
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
end
-- >>>

-- <<< folke/trouble.nvim
local status_ok, trouble = pcall(require, "trouble")
if status_ok then
    trouble.setup {
        -- settings without a patched font or icons
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
            -- icons / text used for a diagnostic
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info"
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    }
end
-- >>>

-- <<< vim-pandoc/vim-pandoc
vim.cmd([[
    let pandoc#modules#disabled = ['command', 'menu'] " list of unwanted modules
    let pandoc#syntax#conceal#use = 0 " 'conceal' means 'show results instead of formatting', which makes working with text harder
    let pandoc#folding#fdc = 0	" by default, first column is lost for fold information
    let pandoc#folding#fold_fenced_codeblocks = 1	" fold code blocks
    let pandoc#spell#enabled = 0 " spellchecking is distracting while writing
    let pandoc#spell#default_langs = ["pl"]	" spellcheck languages
    let pandoc#hypertext#open_editable_alternates = 0 " when opening file.html, vim-pandoc would try file.md instead, if it exists
    ]],
    false
)
-- >>>
