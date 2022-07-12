set nocompatible
set ignorecase
set hlsearch
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set cursorline
set cursorcolumn
set autoindent
set splitbelow
set splitright
set number
set wildmode=longest,list   " get bash-like tab completions
set cmdheight=2 



set textwidth=80

let mapleader = ","

filetype on
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete

" Colors
hi Pmenu ctermfg=0 ctermbg=5 guifg=white guibg=Magenta
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
hi TabLine cterm=NONE ctermfg=darkgrey ctermbg=NONE
hi TabLineSel ctermbg=NONE
hi TabLineFill cterm=NONE
nnoremap <leader>md :silent exec "!dark-mode"<cr>
nnoremap <leader>mD :silent exec "!dark-mode os"<cr>
nnoremap <leader>ml :silent exec "!light-mode"<cr>
nnoremap <leader>mL :silent exec "!light-mode os"<cr>

" Statusline
set statusline=%f
set statusline+=%= 
set statusline+=[%4l
set statusline+=/
set statusline+=%-4L]

call plug#begin('~/.config/nvim/plugged')

" Git 
Plug 'https://github.com/tpope/vim-fugitive'
nmap gmc /\v^[<=>\|]{7}.*$<CR>

" Search 
Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'rizzatti/dash.vim'
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'
map <silent> <Leader>p :CtrlP()<CR>
nmap ff :FZF<CR>
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Sneak 
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

" Syntax
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
nnoremap <leader>wf :w<cr>
inoremap <leader>wf <C-c>:w<cr>
nnoremap <leader>q :q<cr>
nnoremap <silent> gd :Lspsaga preview_definition<cr>
nnoremap <silent><leader>K :Lspsaga hover_doc<cr>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>
nnoremap <silent> gr <cmd>Lspsaga lsp_finder<cr>
inoremap <silent> <C-k> <cmd>Lspsaga signature_help<cr>
nnoremap <silent> <leader>ca :Lspsaga code_action<cr>
vnoremap <silent> <leader>ca :<C-U>Lspsaga range_code_action<cr>
nnoremap <silent>rn :Lspsaga rename<cr>
nnoremap <leader>cc mF:%!eslint_d --stdin --fix-to-stdout<CR>`F
vnoremap <leader>cc :!eslint_d --stdin --fix-to-stdout<CR>gv

" Snippets 
autocmd FileType typescriptreact :iabbrev iff if ()<left>
iabbrev imp import {}<left>

" Haskell
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
Plug 'Twinside/vim-hoogle'
let g:hoogle_search_bin = 'stack hoogle --'
nmap <Leader>hh :Hoogle 
nmap <Leader>HH :Hoogle <CR>
let g:haskell_enable_quantification = 1
let g:haskell_enable_pattern_synonyms = 1
map <Leader>hs :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" " Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" let g:coc_global_extensions = [ 
"   \ 'coc-tsserver'
"   \ ]
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> do <Plug>(coc-codeaction)
" nmap <leader>rn <Plug>(coc-rename)
" nmap <leader>D :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
" xmap <leader>c  <Plug>(coc-codeaction-selected)
" nmap <leader>c  <Plug>(coc-codeaction-selected)
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>cc  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>cf  <Plug>(coc-fix-current)

" Org 
Plug 'jceb/vim-orgmode'

" Purescript 
Plug 'https://github.com/raichoo/purescript-vim.git'
Plug 'frigoeu/psc-ide-vim'

" Language Client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next', 
    \ 'do': 'bash install.sh', 
    \ }

" Fsharp 
Plug 'ionide/Ionide-vim', {
    \ 'do': 'make fsautocomplete', 
    \ }

" Idris 
Plug 'https://github.com/idris-hackers/idris-vim.git'

" Html
Plug 'othree/html5.vim'

" Nerdtree
Plug 'https://github.com/preservim/nerdtree.git'
map <Leader>n :NERDTreeToggle %<CR>

call plug#end()

silent! helptags ALL
let g:used_javascript_libs = 'angularjs,react,ramda,jquery'
noremap ;; :%s///g<Left><Left><Left>
noremap <Leader>;; :%s/\<<C-r><C-w>\>//g<Left><Left>
set completeopt=longest,menuone 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Navigation
map $ <Nop>
map ^ <Nop>
map { <Nop>
map } <Nop>
noremap K     {
noremap J     }
noremap H     ^
noremap L     $
noremap <C-x> :bp<Bar>bd #<Cr>
noremap <C-h> gT
noremap <C-l> gt
map <Leader>ep :echo @%<cr>

" Macros
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Brackets
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
set showmatch " show matching brackets.

" Search
nnoremap <leader>aa  :Ack!<space>
nnoremap <leader>aww :Ack! <cword><cr>
nnoremap <leader>aw  :Ack! --ignore-dir "dist" <C-r>=expand('<cword>')<cr>
nnoremap <leader>aWW :Ack! --ignore-dir "dist" <cWORD><cr>
nnoremap <leader>aW  :Ack! --ignore-dir "dist" <C-r>=expand('<cWORD>')<cr>
nnoremap <silent> <leader><space> :nohl<cr>

" Buffers and Files
nnoremap <leader>b :b<space>
nnoremap <leader>f :e<space>**/*/
set wildmenu 
set wildignore+=*.gif,*.ico,*.png
set wildignore+=*.pdf
set wildignore+=node_modules/*,bower_components/*

" Windows 
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>wh <C-w>s<C-w>l
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" Tabs
nnoremap <leader>t :tab drop<space>

" File Shortcuts
nnoremap <leader><C-I> :tab drop ~/.config/nvim/init.vim <cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ea :vsplit $HOME/.config/alacritty/alacritty.yml<cr>

" Copy Paste
vnoremap <C-c> "*y

" Allow local project vim config
set exrc
set secure

" LSP
lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- Call 'setup' on multiple servers and map buffer local keybindings 
-- when the language server attaches
local servers = { "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}

local saga = require('lspsaga')

-- saga.init_lsp_saga {
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',
--   border_style = "round",
-- }

EOF

