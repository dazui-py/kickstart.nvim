-- lua/custom/plugins/snacks.lua

local HEADERS = {
  neovim = [[
              
█████     ██     -- @dazuii
 █████ 
  ████████ ███   ███████████
   ████████ █████ ██████████████
    ███████ █████ █████ ████ █████
     ██████ █████ █████ ████ █████
      ████ █████ █████ ████ ██████
 ]],
}

local hidden_colorschemes = {
  blue = true,
  darkblue = true,
  delek = true,
  elflord = true,
  industry = true,
  morning = true,
  murphy = true,
  pablo = true,
  peachpuff = true,
  quiet = true,
  ron = true,
  shine = true,
  torte = true,
  unokai = true,
  zaibatsu = true,
  zellner = true,
}

vim.pack.add({
  { src = 'https://github.com/folke/snacks.nvim', version = 'main' }
})

local Snacks = require('snacks')

Snacks.setup({
  dashboard = {
    sections = {
      { section = "header" },
      { padding = 0, align = "center", text = { "[ https://github.com/dazui-py ]", hl = "OasisAccent" } },
      { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    },
  },
  words = { enabled = true },
})

local map = vim.keymap.set

map("n", "<leader>1", function()
  if vim.bo.filetype ~= "snacks_dashboard" then Snacks.dashboard.open() end
end, { desc = "Home" })

map("n", "<leader>e", function()
  Snacks.explorer.open({ hidden = false, cwd = vim.fn.getcwd() })
end, { desc = "Explorer Snacks (root)" })

map("n", "<leader>E", function()
  Snacks.explorer.open({ hidden = false, cwd = vim.fn.getcwd() })
end, { desc = "Explorer Snacks (cwd)" })

map("n", "<leader>fe", function()
  Snacks.explorer.open({ hidden = true, cwd = vim.fn.getcwd() })
end, { desc = "Explorer Snacks (root -hidden)" })

map("n", "<leader>fE", function()
  Snacks.explorer.open({ hidden = true, cwd = vim.fn.getcwd() })
end, { desc = "Explorer Snacks (cwd -hidden)" })

map("n", "<leader>uC", function()
  Snacks.picker.colorschemes({
    transform = function(item)
      local name = item.text or item.name
      if hidden_colorschemes[name] then return false end
      return item
    end,
  })
end, { desc = "Colorschemes" })
