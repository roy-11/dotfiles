return {
  { "szw/vim-maximizer" },
  { "rafamadriz/friendly-snippets" },
  { "inkarkat/vim-ReplaceWithRegister" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "mg979/vim-visual-multi" },
  {
    "christoomey/vim-tmux-navigator",
    event = "BufReadPre", -- https://github.com/LazyVim/LazyVim/issues/1502 ファイルを一度開く必要あり
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
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    config = true,
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "jellydn/hurl.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "hurl",
    opts = {
      debug = false,
      show_notification = false,
      mode = "popup",
      formatters = {
        json = { "jq" },
        html = {
          "prettier",
          "--parser",
          "html",
        },
      },
    },
    keys = {
      { "<leader>rA", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
      { "<leader>ra", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
      { "<leader>rte", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
      { "<leader>rtm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
      { "<leader>rtv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
      { "<leader>rh", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      -- require("image").setup() kitty以外でエラーが出ないよう必要に応じて実行
    end,
  },
}
