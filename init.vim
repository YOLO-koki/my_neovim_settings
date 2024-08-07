set encoding=utf-8
scriptencoding utf-8
set statusline^=%{coc#status()}
set number
set guifont=DroidSansMono\ Nerd\ Font\ 13
set guifontwide=DroidSansMono\ Nerd\ Font\ 13
set hlsearch
set ignorecase
set smartcase
set wrapscan
set incsearch
set smartindent
set laststatus=2
set wildmenu
set ruler
set history=10000
set shiftwidth=4
set expandtab
set clipboard+=unnamed
syntax enable
filetype on

call plug#begin('~/.config/nvim/plugged')
" 曖昧検索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ステータスバーをモダンにする
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" HTML/CSSのコーディングを色々楽にする
Plug 'mattn/emmet-vim' 

" コメントアウト・インがgccで簡単にできるようする
Plug 'tpope/vim-commentary'

" 自動補完（？）
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'


Plug 'preservim/nerdtree'

" なんか色々便利にする（？）
Plug 'ryanoasis/vim-devicons'

" Reactの雛形を補完する
" Plug 'SirVer/ultisnips'
" Plug 'mlaursen/vim-react-snippets'
Plug 'vim-scripts/Emmet.vim'
Plug 'vim-scripts/WebAPI.vim'

" ソースコードの整形をする
Plug 'prettier/vim-prettier', {
\       'do': 'yarn install --frozen-lockfile --production',
\       'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'json', 'html']
\    }

" 自動で閉じタグを生成する
Plug 'alvan/vim-closetag'

" Python用補完
Plug 'davidhalter/jedi-vim'
" Python indent
Plug 'Vimjas/vim-python-pep8-indent'
" Django
Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}

" vim上ですぐに実行
Plug 'thinca/vim-quickrun'

" リアルタイムでプレビューができるようにする
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact']}
Plug 'othree/yajs.vim'

Plug 'cohama/lexima.vim'

call plug#end()

" vim-react-snippets settings
" python3のパスをneovimに通す
let g:python3_host_prog = '/usr/local/bin/python3.10'

" NERDTree settings
nmap <C-f> :NERDTreeToggle<CR>

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" emmet-vim-react-snippets & emmet-vim settings
autocmd FileType css,html,javascript,javascriptreact,typescriptreact EmmetInstall
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/.snippets.json')), "\n"))
let g:user_emmet_leader_key = '<c-x>'
let user_emmet_install_global = 0

" vim-closetag settings
let g:closetag_filenames = '*.html,*.js,*.jsx,*.tsx'
let g:closetag_shortcut = '<Tab>'

" vim-quickrun settings
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

" bracey.vim settings
let g:bracey_browser_command = 'open'
let g:bracey_auto_start_browser = 1
let g:bracey_server_port = 3000

" preiiter-vim settings
let g:prettier#config#print_width = 100

augroup fmt
autocmd!
autocmd BufWritePost *.js,*.jsx,*.cjs,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html :PrettierAsync
augroup END

augroup htmldjango_prettier
autocmd!
autocmd BufWritePost htmldjango call CocAction('format')
augroup END

" Lsp Settings
nmap <silent> gd :LspDefinition<CR>
nmap <silent> <f2> :LspRename<CR>
nmap <silent> <Leader>d :LspTypeDefinition<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0
let g:lsp_settings_filetype_typescript = ['typescript-language-server']
let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server']

" fzf Settings
nnoremap <silent> fz :Files<CR>
nnoremap <silent> bz :Buffers<CR>
