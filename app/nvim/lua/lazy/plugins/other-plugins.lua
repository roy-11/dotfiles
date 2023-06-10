return {
  { "szw/vim-maximizer" },
  { "rafamadriz/friendly-snippets" },
  { "inkarkat/vim-ReplaceWithRegister" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "mg979/vim-visual-multi" },
  { "christoomey/vim-tmux-navigator" },
  { "folke/zen-mode.nvim" },
  {
    "andrewferrier/debugprint.nvim",
    config = function()
      require("debugprint").setup()
    end,
  },
  { "thinca/vim-quickrun" },
}
