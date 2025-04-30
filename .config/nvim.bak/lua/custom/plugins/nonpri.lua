-- Non primary plugin configs, as in doesn't need its own file and isnt in the main config

return {
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        names = false,
        css_fn = true,
      },
      -- filetypes = { '*' },
    },
    config = true,
  },
  {
    'Fymyte/rasi.vim',
    lazy = true,
    ft = 'rasi',
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true, -- or `opts = {}`
  },
}
