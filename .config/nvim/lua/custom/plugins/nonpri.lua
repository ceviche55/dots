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
    'tadmccorkle/markdown.nvim',
    ft = 'markdown', -- or 'event = "VeryLazy"'
    opts = {},
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
