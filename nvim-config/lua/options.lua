-- enable line numbers
--
vim.opt.number = true
-- enable relative line number
-- It makes it easier to jump to line by [line-number + k]
vim.opt.relativenumber = true
-- change behavior of split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Line wrap
vim.opt.wrap = false

--- to expand tabs to spaces
--- i.e. when file is saved it is saved as "x" amount of space instead of tab
vim.opt.expandtab = true

--- no. of spaces that tab counts for (by default it is 8; which makes it look bigger.)
vim.opt.tabstop = 4
--- Auto Indent only 4 spaces
vim.opt.shiftwidth = 4

--- sync vim and system clipboard (string input)
vim.opt.clipboard = "unnamedplus"

--- when scrolling off the cursor remains in the middle 
vim.opt.scrolloff = 999

--- Virtual Edit
--- This helps us in visual block mode when we are doing multiline selection 
--- use :h 'virtualedit' to lookup
--- onemore is to move cursor one more word to the end of line
--- block is to move through the screen in block mode
vim.opt.virtualedit = "onemore"
---vim.opt.virtualedit = "block" 

---when we do %s substitution it will split a screen below so that we can visualize all the changes that are being made
vim.opt.inccommand = "split"

--- in neovim the external plugins have to do the naming with upper case 
--- so autocomplete does not work if we type in lower case. 
--- to fix that we'll use ignorecase
vim.opt.ignorecase = true

--- terminal gui colors support enable for 24 bit colors
vim.opt.termguicolors = true

--- setup the leader key
vim.g.mapleader = " "
---vim.g.maplocalleader = "\\"

