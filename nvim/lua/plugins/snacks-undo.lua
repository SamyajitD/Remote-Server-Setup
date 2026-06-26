-- ~/.config/nvim/lua/plugins/snacks-undo.lua
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        enabled = true,
      },
    },
    keys = {
      {
        "<leader>su",
        function()
          Snacks.picker.undo()
        end,
        desc = "Undotree",
      },
    },
  },
}
