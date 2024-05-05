return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      question_header = "## ユーザー ", -- ユーザーの質問に使用するヘッダー
      answer_header = "## Copilot ", -- AIの回答に使用するヘッダー
      error_header = "## エラー ", -- エラーに使用するヘッダー
      separator = "---", -- チャットで使用する区切り文字
      -- デフォルトのウィンドウオプション
      window = {
        layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.5, -- 親の相対幅、または>1の場合は絶対幅（列）
        height = 0.5, -- 親の相対高さ、または>1の場合は絶対高さ（行）
        -- 以下のオプションは浮動ウィンドウにのみ適用されます
        relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
        border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil, -- ウィンドウの行位置、デフォルトは中央
        col = nil, -- ウィンドウの列位置、デフォルトは中央
        title = "Copilot Chat", -- チャットウィンドウのタイトル
        footer = nil, -- チャットウィンドウのフッター
        zindex = 1, -- ウィンドウが他の浮動ウィンドウの上または下にあるかを決定します
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")
      -- Use unnamed register for the selection
      opts.selection = select.unnamed

      -- デフォルトのプロンプト
      opts.prompts = {
        Explain = {
          prompt = "/COPILOT_EXPLAIN アクティブな選択の説明を段落をつけて書いてください。",
        },
        Review = {
          prompt = "/COPILOT_REVIEW 選択されたコードをレビューしてください。",
          callback = function(response, source)
            -- 実装はconfig.luaを参照
          end,
        },
        Fix = {
          prompt = "/COPILOT_GENERATE このコードに問題があります。バグを修正したコードを書いてください。",
        },
        Optimize = {
          prompt = "/COPILOT_GENERATE 選択されたコードを最適化してパフォーマンスと可読性を向上させてください。",
        },
        Docs = {
          prompt = "/COPILOT_GENERATE 選択したコードにドキュメントコメントを追加してください。",
        },
        Tests = {
          prompt = "/COPILOT_GENERATE コードのテストを生成してください。",
        },
        FixDiagnostic = {
          prompt = "ファイル内の次の診断的な問題の解決に協力してください:",
          selection = select.diagnostics,
        },
        Commit = {
          prompt = "コミットメッセージをcommitizenの規約に従って変更に対して書いてください。タイトルは最大50文字で、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語でのコードブロックで囲んでください。",
          selection = select.gitdiff,
        },
        CommitStaged = {
          prompt = "コミットメッセージをcommitizenの規約に従って変更に対して書いてください。タイトルは最大50文字で、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語でのコードブロックで囲んでください。",
          selection = function(source)
            return select.gitdiff(source, true)
          end,
        },
      }

      chat.setup(opts)

      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Inline chat with Copilot
      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      -- Restore CopilotChatBuffer
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })

      -- Custom buffer for CopilotChat
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true

          -- Get current filetype and set it to markdown if the current filetype is copilot-chat
          local ft = vim.bo.filetype
          if ft == "copilot-chat" then
            vim.bo.filetype = "markdown"
          end
        end,
      })
    end,
    keys = {
      {
        "<leader>ah",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      -- Show prompts actions with telescope
      {
        "<leader>ap",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>ap",
        ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
        mode = "x",
        desc = "CopilotChat - Prompt actions",
      },
      -- Code related commands
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
      -- Chat with Copilot in visual mode
      {
        "<leader>av",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ax",
        ":CopilotChatInline<cr>",
        mode = "x",
        desc = "CopilotChat - Inline chat",
      },
      -- Custom input for CopilotChat
      {
        "<leader>ai",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      -- Generate commit message based on the git diff
      {
        "<leader>am",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      {
        "<leader>aM",
        "<cmd>CopilotChatCommitStaged<cr>",
        desc = "CopilotChat - Generate commit message for staged changes",
      },
      -- Quick chat with Copilot
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      -- Debug
      { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
      -- Fix the issue with diagnostic
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
      -- Clear buffer and chat history
      { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
      -- Toggle Copilot Chat Vsplit
      { "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
    },
  },
}
