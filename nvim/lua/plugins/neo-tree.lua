return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["O"] = "open",
            ["<C-c>"] = "cancel",
          },
        },
      },
      window = {
        mappings = {
          ["O"] = "open",
          ["<C-c>"] = "cancel",
          ["o<C-c>"] = "cancel",
        },
      },
      buffers = {
        mappings = {
          ["O"] = "open",
          ["<C-c>"] = "cancel",
          ["o<C-c>"] = "cancel",
        },
      },
    },
  },
}
