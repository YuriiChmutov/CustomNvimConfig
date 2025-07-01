return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  ft = { "html", "javascript", "typescriptreact", "javascriptreact", "svelte", "vue" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}