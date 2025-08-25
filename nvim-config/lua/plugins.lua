
--- lazy.nvim (single file setup)
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--- Setup lazy.nvim
require("lazy").setup({
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
             require('nvim-treesitter.configs').setup ({
                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                -- supported languages: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "cpp", "javascript", "java" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                  enable = true,
              },
              incremental_selection = {
                  enable = true,
                  keymaps = {
                      --selection commands <Leader> and followed by
                      -- 
                      init_selection = "<Leader>ss", -- initialize selection 
                      node_incremental = "<Leader>si", -- selection increment
                      scope_incremental = "<Leader>sc", --selection scope
                      node_decremental = "<Leader>sd", -- selection decrement
                  },
              },
          })
        end,
    },
})
