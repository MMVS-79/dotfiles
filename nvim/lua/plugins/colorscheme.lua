return {
  -- Add bluloco (and required dependency)
  {
    "uloco/bluloco.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
  },

  -- Configure LazyVim to load bluloco-dark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bluloco-dark",
    },
  },
}
