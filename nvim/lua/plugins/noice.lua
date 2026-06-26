-- ~/.config/nvim/lua/plugins/noice.lua
return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = {
          enabled = true,
          auto_open = {
            enabled = false,
          },
        },
      },
    },
  },
}
