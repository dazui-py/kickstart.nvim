-- lua/custom/plugins/vim-polyglot.lua

vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'vim-polyglot' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('vim-polyglot') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({
	'https://github.com/vim-polyglot/vim-polyglot',
})
