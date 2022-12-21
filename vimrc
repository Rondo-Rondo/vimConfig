"fresh added
set scrolloff=8
set mouse=a
set hidden
let mapleader=" "
set incsearch
set nobackup
set nowb
set noswapfile

" Restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" let g:airline_theme = "palenight"
let g:airline_theme = "purpura"



" " Цветовой шаблон
let g:material_style='purpura'
set background=dark 
" " colorscheme vim-material
" " Fix color scheme bug in Hyper.js
" set termguicolors 
" hi Normal guibg=NONE ctermbg=NONE
" " цветовая схема
" if (has("nvim"))
"  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
"
" if (has("termguicolors"))
"  set termguicolors
" endif


" Remove sound
set noerrorbells
" set novisualbell
set t_vb=
set tm=500








" Если нужно обновить vim до последней версии.
 " sudo add-apt-repository ppa:jonathonf/vim
 " sudo apt update
 " sudo apt install vim

" Менеджер пакетов установка  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" В этот блок вносим плагины. Что бы установить запускаем :PlugInstall в vim
call plug#begin('~/.vim/plugged')

 " Дополнительные плагины для удобства редактирования/просмотра кода
 Plug 'tomtom/tcomment_vim' " Fast comment current line or block
 Plug 'Yggdroot/indentLine' " Hightlighting for indents
 Plug 'tmhedberg/SimpylFold' " Simple folding blocks of code
 Plug 'SirVer/ultisnips' " Snippets
 Plug 'honza/vim-snippets' " snipets engine


 " Git
 Plug 'airblade/vim-gitgutter'
 "Plug 'APZelos/blamer.nvim' " Show last editor of current line для вывода последней информации о коммите в текущей строке
 Plug 'tpope/vim-fugitive' " Usefull utility for working with git плагин для управления гитом
 
 " HTML и автозакрытие тэгов
 Plug 'alvan/vim-closetag' " Automatic tag closing
 Plug 'mattn/emmet-vim' " Emmet, fast HTML inserting

 " Подсветка синтаксиса
 Plug 'pangloss/vim-javascript'    " JavaScript support
 Plug 'Quramy/tsuquyomi' " typescript
 Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
 Plug 'jparise/vim-graphql'        " GraphQL syntax

"  Plug 'posva/vim-vue'

 " Поддержка синтаксиса для множества языков
 Plug 'sheerun/vim-polyglot' "Syntax highlighting for different languages
 
 " Автоополнение. 
 Plug 'neoclide/coc.nvim' , { 'branch' : 'release' } " Amazing autocomplete/typing support for much languages


 " автоформатирование кода
" Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install',
"  \ 'branch': 'release/1.x',
"  \ 'for': [
"    \ 'css',
"    \ 'less',
 "   \ 'scss',
  "  \ 'json',
   " \ 'graphql',
"    \ 'markdown',
 "   \ 'lua',
  "  \ 'python',
   " \ 'swift']}


 " Боковая панель древо файлов
 Plug 'preservim/nerdtree' " File tree

 " Красивые глифы для бокового древа. Что бы заработали глифы нужно установить
 " шрифт https://du-blog.ru/media/Ligamonacop.ttf
 Plug 'ryanoasis/vim-devicons' " Nice icons for nerd tree commander

 " Инструмент для панелей верхних и нижних
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

 " Поиск по проекту. Так же нужно установить  sudo apt-get install ripgrep 
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " File search
 Plug 'junegunn/fzf.vim' " File search


 " Добавлять скобку закрывающюю автоматом 
 Plug 'jiangmiao/auto-pairs'
 " color shema
 Plug 'yassinebridi/vim-purpura'

call plug#end() 

" Git
let g:blamer_enabled = 1 " enable blamer
let g:blamer_show_in_insert_modes = 0 " disable blamer in insert mode

" HTML и автозакрытие тэгов
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }




let g:coc_global_extensions = [ 'coc-tsserver' ]

" Автоформатирование кода
"let g:prettier#autoformat = 1
"let g:prettier#exec_cmd_async = 1
"let g:prettier#config#parser = 'babylon'


" Поиск по проекту. Так же нужно установить  sudo apt-get install ripgrep 
let $FZF_DEFAULT_OPTS    = '--reverse'
"let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**'"


" Инструмент для панелей верхних и нижних
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1 " top pane



    
" Airline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'purpura'
let g:airline_section_z = airline#section#create('%3p%% %#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__# %3v')

" Theme
if (has("termguicolors"))
  set termguicolors
endif
colorscheme purpura
set background=dark
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE










"Fast file opening for search
nmap <silent> <C-p> :Files<CR> 
"Fast lines opening for search 
nmap <silent> <C-l> :Lines<CR> 

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" set syntax
set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set termencoding=utf-8
set fileencodings=utf8,cp1251
set encoding=utf8

set foldmethod=syntax
set foldnestmax=5
set foldlevelstart=1



if has("autocmd")
    autocmd BufRead *.sql set filetype=mysql
endif


" Автодополнение 

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>  

"fast save
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
