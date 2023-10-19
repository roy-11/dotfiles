return {
  { "szw/vim-maximizer" },
  { "rafamadriz/friendly-snippets" },
  { "inkarkat/vim-ReplaceWithRegister" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "mg979/vim-visual-multi" },
  {
    "christoomey/vim-tmux-navigator",
    event = "BufReadPre", -- https://github.com/LazyVim/LazyVim/issues/1502
  },
  { "folke/zen-mode.nvim" },
  {
    "andrewferrier/debugprint.nvim",
    config = function()
      require("debugprint").setup()
    end,
  },
  { "thinca/vim-quickrun" },
  {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf", "mp4" },
            find_cmd = "rg",
          },
        },
      })
    end,
  },
}
