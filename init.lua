-- Packer install
-- ******************************************

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- Color schemes
    use 'navarasu/onedark.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'Mofiqul/adwaita.nvim'

    -- Neoformat: Plugin for formatting code
    use 'sbdchd/neoformat'

    -- Lualine: Statusline at the bottom
    use {
        'nvim-lualine/lualine.nvim'
    }

    -- Treesitter: Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            {'nvim-treesitter/nvim-treesitter-refactor'}
        }
    }

    -- nvim-ts-autotag: Autoclose html tags using treesitter
    use {
        'windwp/nvim-ts-autotag',
    }

    -- Telescope: Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }

    -- Mason: Manage LSP servers, DAP servers, linters, and formatters
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    }

    -- nvim-cmp: Completion engine plugin for neovim written in Lua
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
    }

    -- Automatically set up the configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Plugins configurations
-- *****************************************

-- Lualine config
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'adwaita',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1 }},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    },
}

-- Telecope config
require('telescope').setup{ 
    defaults = { 
        file_ignore_patterns = { 
            "node_modules",
        },
    },
}

-- Treesitter config
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'diff',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'markdown',
        'php',
        'python',
        'rust',
        'svelte',
        'typescript',
        'yaml',
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = '<leader>rn', -- Keymap: Smart Rename
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = '<leader>gd', -- Keymap: Go Definition
                goto_next_usage = '<leader>gn', -- Keymap: Go Next usage
                goto_previous_usage = '<leader>gN',
            },
        },
    },
    autotag = {
        enable = true,
    }
}

-- Mason config
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
    ensure_installed = {
        'angularls',
        'bashls',
        'cssls',
        'eslint',
        'html',
        'jdtls',
        'jsonls',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'svelte',
        'tsserver',
        'yamlls',
    },
    automatic_installation = true,
})

-- LSP config
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- LSP servers
local servers = {
    'lua_ls',
    'rust_analyzer',
    'angularls',
    'bashls',
    'cssls',
    'eslint',
    'html',
    'jdtls',
    'jsonls',
    'pyright',
    'svelte',
    'tsserver',
    'yamlls',
}

-- Common LSP server settings
local capabilities = require('cmp_nvim_lsp').default_capabilities();

local common_settings = {
    capabilities = capabilities,
}

-- Setup LSP servers
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(common_settings)
end

-- Setup nvim-cmp autocomplete
cmp.setup({
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
})

-- Custom vim configurations
-- ******************************************

-- Map leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Display line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable cursorline
vim.opt.cursorline = true

-- Insert spaces instead of tabs
vim.opt.expandtab = false -- False means tabs instead of spaces
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Show white spaces
vim.opt.list = true

-- Autoread changes in opened files
vim.opt.autoread = true

-- Set automatic wrapping and new line
vim.cmd([[setlocal textwidth=80]])
vim.cmd([[setlocal wrap]])

-- Set clipboard
vim.cmd([[setlocal clipboard+=unnamedplus]])

-- Set default color scheme
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd([[colorscheme adwaita]])

-- Custom keymaps
-- ******************************************

-- Handy scape with double semi-colon
vim.keymap.set('i', '::', '<ESC>')

-- Clear Highlights
vim.keymap.set('n', '<leader>ch', ':nohlsearch<CR>')

-- Telescope key bindings
vim.keymap.set('n', '<leader><leader>', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')

-- Mason key bidings
vim.keymap.set('n', '<leader>fd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>fi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, {})

-- Insert curly braces, brackets, and parenthesis
vim.keymap.set('n', '<leader>ic', '<ESC>a{}<Left>'); -- {C}urly braces
vim.keymap.set('n', '<leader>ib', '<ESC>a[]<Left>'); -- [B]rackets
vim.keymap.set('n', '<leader>ip', '<ESC>a()<Left>'); -- (P)arenthesis

vim.keymap.set('n', '<leader>h', '<Home>');
vim.keymap.set('n', '<leader>l', '<End>');

-- Enable spell checking
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- END
