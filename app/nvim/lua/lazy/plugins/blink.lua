return {
  "saghen/blink.cmp",
  lazy = true,
  dependencies = {
    {
      "Exafunction/codeium.nvim",
      "saghen/blink.compat",
    },
  },

  opts = {
    completion = {
      ghost_text = {
        enabled = true,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    keymap = {
      preset = "none",
      ["<C-i>"] = { "show", "show_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-n>"] = { "select_next", "fallback_to_mappings" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
    sources = {
      compat = { "codeium" },
      default = { "avante_commands", "avante_mentions", "avante_files", "lsp", "path", "snippets", "buffer", "codeium" },
      providers = {
        codeium = {
          kind = "Codeium",
          score_offset = 1001,
          name = "Codeium",
          module = "codeium.blink",
          async = true,
        },
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90, -- show at a higher priority than lsp
          opts = {},
        },
        avante_files = {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 100, -- show at a higher priority than lsp
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000, -- show at a higher priority than lsp
          opts = {},
        },
      },
    },
  },
}
