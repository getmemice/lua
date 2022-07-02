-- Format with prettier 
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "css",
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "scss",
    "sass",
    "json",
  },

  callback = function()
    vim.cmd [[
        augroup prettierForCss
            autocmd!
            autocmd bufwritepre * :Prettier
        augroup end
    ]]
  end,
})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd [[
      set formatoptions-=cro

      " au VimEnter, VimResume * set guicursor=a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor

      " au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
      " au InsertLeave * let &updatetime=updaterestore
      " au CursorHoldI * stopinsert
    ]]
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 2000 }
  end,
})
