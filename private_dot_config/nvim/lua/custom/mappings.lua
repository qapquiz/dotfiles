---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.lsp = {
  n = {
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "format with conform",
    }
  }
}

-- more keybinds!

return M
