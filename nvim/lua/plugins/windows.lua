if true then
  return {}
end

return {
  {
    "anuvyklack/windows.nvim",
    dependencies = { "anuvyklack/middleclass" },
    config = function()
      require("windows").setup()
    end,
  },
}
