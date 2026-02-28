local cmp = require('cmp')
cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- 這是最關鍵的一行
  }, {
    { name = 'buffer' },
  }, {
    { name = 'path'}
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete()
  })
})
