return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      highlights = {
        init = {
          GitBlame = { fg = "#455A64" },
        },
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    event = "User AstroGitFile",
    opts = {
      date_format = "%r",
      message_template = "     <author>, <date> • <summary>",
      message_when_not_committed = "     not committed yet",
      schedule_event = "CursorHold",
      clear_event = "CursorHoldI",
      highlight_group = "GitBlame",
    },
  },
}
