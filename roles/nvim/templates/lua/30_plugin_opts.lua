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
    which_key.setup {
        icons = {
            rules = false,
            mappings = false,
            keys = {
                Up = "↑",
                Down = "↓",
                Left = "←",
                Right = "→",
                C = "^",
                M = "<M->",
                S = "<Shift>",
                CR = "<CR>",
                Esc = "<Esc>",
                NL = "<NL>",
                BS = "<BS>",
                Space = "<Space>",
                Tab = "<Tab>",
                F1 = "F1",
                F2 = "F2",
                F3 = "F3",
                F4 = "F4",
                F5 = "F5",
                F6 = "F6",
                F7 = "F7",
                F8 = "F8",
                F9 = "F9",
                F10 = "F10",
                F11 = "F11",
                F12 = "F12",
            }
        }
    }
    which_key.add({
        { "<leader>c", group = "NerdCommenter" },

        { "<leader>p", group = "Telescope" },
        { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "find files" },
        { "<leader>pF", "<cmd>Telescope find_files hidden=true<cr>", desc = "find files (including hidden)" },
        { "<leader>pa", "<cmd>Telescope live_grep<cr>", desc = "find file by content" },
        { "<leader>pp", "<cmd>Telescope pickers<cr>", desc = "previous pickers" },
        { "<leader>p;", "<cmd>Telescope buffers sort_lastused=1 ignore_current_buffer=1<cr>", desc = "buffers" },
        { "<leader>pc", "<cmd>Telescope commands<cr>", desc = "custom commands" },
        { "<leader>ph", "<cmd>Telescope command_history<cr>", desc = "history of commands" },
        { "<leader>ps", "<cmd>Telescope search_history<cr>", desc = "history of search" },
        { "<leader>pm", "<cmd>Telescope marks<cr>", desc = "marks" },
        { "<leader>pj", "<cmd>Telescope jumplist<cr>", desc = "jumplist" },
        { "<leader>pr", "<cmd>Telescope registers<cr>", desc = "registers" },
        { "<leader>p=", "<cmd>Telescope spell_suggest<cr>", desc = "spell suggestions" },
        { "<leader>po", "<cmd>Telescope vim_options<cr>", desc = "vim options" },
        { "<leader>pk", "<cmd>Telescope keymaps<cr>", desc = "keymaps" },
        { "<leader>pd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "diagnostics in current buffer" },
        { "<leader>pD", "<cmd>Telescope diagnostics<cr>", desc = "diagnostics in workspace" },
        { "<leader>p?", "<cmd>Telescope builtin<cr>", desc = "available pickers" },

        { "<leader>l", group = "LSP" },
        { "<leader>le", desc = "vim.diagnostic.open_float" },
        { "<leader>lD", desc = "vim.lsp.buf.declaration" },
        { "<leader>ld", desc = "vim.lsp.buf.definition" },
        { "<leader>li", desc = "vim.lsp.buf.implementation" },
        { "<leader>lT", desc = "vim.lsp.buf.type_definition" },
        { "<leader>lr", desc = "vim.lsp.buf.references" },
        { "<leader>lK", desc = "vim.lsp.buf.hover" },
        { "<leader>lk", desc = "vim.lsp.buf.signature_help" },
        { "<leader>lR", desc = "vim.lsp.buf.rename" },
        { "<leader>lc", desc = "vim.lsp.buf.code_action" },
        { "<leader>lf", desc = "vim.lsp.buf.formatting" },

        { "<leader>t", group = "Terminals" },
        { "<leader>t1", desc = "1" },
        { "<leader>t2", desc = "2" },
        { "<leader>t3", desc = "3" },
        { "<leader>t4", desc = "4" },
        { "<leader>t5", desc = "5" },
        { "<leader>t6", desc = "6" },
        { "<leader>t7", desc = "7" },
        { "<leader>t8", desc = "8" },
        { "<leader>t9", desc = "9" },
        { "<leader>tT", desc = "toggle all terms" },
        { "<leader>tt", desc = "toggle default term" },
    })
end
-- >>>

-- <<< ggandor/leap.nvim
local status_ok, leap = pcall(require, "leap")
if status_ok then
    -- leap.create_default_mappings()
    vim.keymap.set('n',        's', '<Plug>(leap)')
    vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward)')
    vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward)')
    vim.api.nvim_set_hl(0, 'LeapLabel', { link = 'ErrorMsg' })
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

-- <<< williamboman/mason.nvim
local status_ok, mason = pcall(require, "mason")
if status_ok then
    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            }
        }
    })
end

local status_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if status_ok then
    mason_lsp_config.setup({
        automatic_installation = false,
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
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
end

-- >>>

-- <<< nvimtools/none-ls.nvim
local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
    null_ls.setup({
        sources = {
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
        local rc = client.server_capabilities

        if client.name == 'jedi_language_server' then
            rc.referencesProvider = false
            rc.definitionProvider = false
        end

        if client.name == 'pyright' then
            rc.hoverProvider = false
            rc.signatureHelpProvider = false
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
-- >>>
