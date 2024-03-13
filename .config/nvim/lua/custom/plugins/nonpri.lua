-- Non primary plugin configs, as in doesn't need its own file and isnt in the main config

return {
  -- {
  --   'Biscuit-Colorscheme/nvim',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight'
  --     vim.cmd.colorscheme 'biscuit'
  --
  --     -- You can configure highlights by doing something like
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
  {
    'norcalli/nvim-colorizer.lua',
    opts = {},
  },
  {
    'mbbill/undotree',
    keys = {
      { '<leader>ut', '<cmd>UndotreeToggle<cr>', desc = 'Toggle Undotree UI' },
    },
    config = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_ShortIndicators = 1
    end,
  },
  { 'Fymyte/rasi.vim' },
}
