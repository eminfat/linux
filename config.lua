--public Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--


-- system clipboard - normal + visual
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>P', '"+P')

lvim.colorscheme = "tokyonight-night"
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.transparent_window = true

-- lvim.builtin.telescope.defaults.layout_config.prompt_position = "left"
--
-- lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
-- lvim.builtin.telescope.defaults.layout_config = {
--   width = 0.7,
--   height = 0.7,
--   prompt_position = "bottom"
-- }
-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = '<c-e>',
    node_incremental = '<c-e>',
    -- scope_incremental = '<c-s> ,
    node_decremental = '<c-s>'
  }
}


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettierd",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "vue", "css", "javascript", "typescript" },
  },
}

local lspconfig = require('lspconfig')
-- lspconfig.emmet_ls.setup({ })
lspconfig.volar.setup({
  filetypes = { 'vue' },
  init_options = {
    vue = {
      hybridMode = false,
    },
    typescript = {
      tsdk = "/home/emin/.local/share/lvim/mason/packages/vue-language-server/node_modules/typescript/lib/"
    },
  },
})



lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "psliwka/vim-smoothie" },
  { "mg979/vim-visual-multi" },
  { "tpope/vim-surround" },
  -- { 'ray-x/lsp_signature.nvim' },
  { 'Mofiqul/dracula.nvim' },
  { "rafamadriz/neon" },
  { 'themaxmarchuk/tailwindcss-colors.nvim' },
  {
    "NicholasMata/nvim-dap-cs",
    config = function()
      require("dap-cs").setup()
    end
  },
  {
    'luozhiya/fittencode.nvim',
    config = function()
      require('fittencode').setup()
    end,
  }
}

vim.opt.updatetime = 200
