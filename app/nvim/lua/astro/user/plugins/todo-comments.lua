local status_ok, comments = pcall(require, "todo-comments")
if not status_ok or not astronvim.status then
  return
end

comments.setup({
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "warning" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
})

-- require("todo-comments").setup({
--   keywords = {
--     FIX = {
--       icon = " ", -- icon used for the sign, and in search results
--       color = "error", -- can be a hex color, or a named color (see below)
--       alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
--       -- signs = false, -- configure signs for some keywords individually
--     },
--     TODO = { icon = " ", color = "warning" },
--     HACK = { icon = " ", color = "warning" },
--     WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
--     PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
--     NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
--     TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
--   },
-- })

-- return function(config)
--   config.keywords = {
--     FIX = {
--       icon = " ", -- icon used for the sign, and in search results
--       color = "error", -- can be a hex color, or a named color (see below)
--       alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
--       -- signs = false, -- configure signs for some keywords individually
--     },
--     TODO = { icon = " ", color = "warning" },
--     HACK = { icon = " ", color = "warning" },
--     WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
--     PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
--     NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
--     TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
--   }
--   return config
-- end

-- return {
--   keywords = {
--     FIX = {
--       icon = " ", -- icon used for the sign, and in search results
--       color = "error", -- can be a hex color, or a named color (see below)
--       alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
--       -- signs = false, -- configure signs for some keywords individually
--     },
--     TODO = { icon = " ", color = "warning" },
--     HACK = { icon = " ", color = "warning" },
--     WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
--     PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
--     NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
--     TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
--   },
-- }
