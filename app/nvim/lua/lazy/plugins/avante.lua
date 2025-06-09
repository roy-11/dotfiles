return {
  {
    "yetone/avante.nvim",
    lazy = true,
    event = "VeryLazy",
    build = "make",

    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          extra_request_body = {
            temperature = 0,
            max_tokens = 8192,
          },
        },
      },

      -- ollama setting (work)
      -- provider = "ollama",
      -- vendors = {
      --   ollama = {
      --     __inherited_from = "openai",
      --     api_key_name = "",
      --     endpoint = "http://127.0.0.1:11434/v1",
      --     model = "gemma3:12b-it-qat",
      --     disable_tools = true,
      --   },
      -- },

      -- ollama setting (not work)
      -- provider = "ollama",
      -- ollama = {
      --   endpoint = "http://127.0.0.1:11434",
      --   model = "gemma3:12b-it-qat",
      -- },
      -- behaviour = {
      --   --- ... existing behaviours
      --   enable_cursor_planning_mode = true, -- enable cursor planning mode!
      -- },

      -- open ai setting
      -- openai = {
      --   endpoint = "https://api.openai.com/v1",
      --   model = "gpt-4o",
      --   timeout = 30000,
      --   temperature = 0,
      --   max_tokens = 8192,
      -- },
      hints = { enabled = false },
      file_selector = {
        provider = "snacks",
        provider_opts = {},
      },
    },

    dependencies = {
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = function(_, ft)
          vim.list_extend(ft, { "Avante" })
        end,
      },
      {
        "folke/which-key.nvim",
        opts = {
          spec = {
            { "<leader>a", group = "ai" },
          },
        },
      },
    },
  },

  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {
      input = { enabled = false },
      select = { enabled = false },
    },
  },

  {
    "saghen/blink.compat",
    lazy = true,
    opts = {},
    config = function()
      -- monkeypatch cmp.ConfirmBehavior for Avante
      require("cmp").ConfirmBehavior = {
        Insert = "insert",
        Replace = "replace",
      }
    end,
  },
}
