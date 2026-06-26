-- ~/.config/nvim/lua/plugins/flash.lua
return {
  "folke/flash.nvim",
  keys = {
    -- disable LazyVim's default <C-Space> mapping
    { "<c-space>", mode = { "n", "o", "x" }, false },

    -- use Ctrl+Alt+Space / Ctrl+Meta+Space instead
    {
      "<C-M-Space>",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter({
          actions = {
            ["<C-M-Space>"] = "next",
            ["<BS>"] = "prev",
          },
        })
      end,
      desc = "Treesitter Incremental Selection",
    },
  },
}
