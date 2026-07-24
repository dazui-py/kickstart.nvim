-- lua/custom/plugins/tree-setter-reborn.lua

vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'tree-setter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('tree-setter-reborn') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({'https://github.com/dazui-py/tree-setter-reborn'});

require("tree-setter").setup({
    disabled_languages = { "lua" },
})
