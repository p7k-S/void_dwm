" PLUGINS --------------------------------------------------------------- {{{

"Предварительное устанавливаем git
" в одну строку устанавливаем vim plug:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bfrg/vim-cpp-modern'
"Plug 'doums/darcula'
Plug 'joshdick/onedark.vim'
Plug 'machakann/vim-highlightedyank' "выделям что выделяем
"Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'ryanoasis/vim-devicons'
"Plug 'cyrus-and/gdb-dashboard'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'morhetz/gruvbox'
"Plug 'ku1ik/vim-monokai'
call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"удаление слова в I-mode
"execute "set <M-h>=\eh"
"inoremap <M-h> <right><esc>dbi

" Чистит, а затем сохраняет изменения в файл nnoremap <silent> <C-l> :call CleanupBeforeWrite()<CR>:w<CR>

"хз
"nnoremap <silent> <C-f> :Files<CR>


"execute "set <M-j>=\ej nnoremap <M-j> j

"note: space at end

"nnoremap Q :q<CR>
"nnoremap W :w<CR>

imap jj <esc>

"nnoremap o o<esc>
"nnoremap O O<esc>
"nnoremap <c-o> o


"поведение nerd tree
nnoremap <leader>n :NERDTreeFocus<CR>
map <C-n> :NERDTreeToggle<CR>

"автодополнение на tab
inoremap <expr> <Tab> getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible()
      \ ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() \|\| getline('.')[col('.')-2] !~ '^\s\?$'
      \ ? '<C-P>' : '<Tab>'
autocmd CmdwinEnter * inoremap <expr> <buffer> <Tab>
      \ getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible()
      \ ? '<C-X><C-V>' : '<Tab>'


" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Press F2/F3 to toggle ALE.
map <F2> <esc>:ALEDisable <CR>
map <F3> <esc>:ALEEnable <CR>

" map <F6> <esc>:call CleanupBeforeWrite()<CR>:w<CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

"компилит и ранит файл .c
"вим нельзя запускать из той же папки где файл
map <F5> <ESC>:call CleanupBeforeWrite()<CR>:w<CR>:!gcc -g -O2 -Wall -Werror -Wformat-security -Wignored-qualifiers -Winit-self -Wswitch-default -Wfloat-equal -Wpointer-arith -Wtype-limits -Wempty-body -Wno-logical-op -Wstrict-prototypes -Wold-style-declaration -Wold-style-definition -Wmissing-parameter-type -Wmissing-field-initializers -Wnested-externs -Wno-pointer-sign -Wno-unused-result -std=gnu99 -lm % -o %< && %<<CR>
"костыль
map <F6> <ESC>:call CleanupBeforeWrite()<CR>:w<CR>:!gcc -g -O2 -Wall -Werror -Wformat-security -Wignored-qualifiers -Winit-self -Wswitch-default -Wfloat-equal -Wpointer-arith -Wtype-limits -Wempty-body -Wno-logical-op -Wstrict-prototypes -Wold-style-declaration -Wold-style-definition -Wmissing-parameter-type -Wmissing-field-initializers -Wnested-externs -Wno-pointer-sign -Wno-unused-result -std=gnu99 -lm % -o %< && ./%<<CR>

" Center the cursor vertically when moving to the next word during a search.
"nnoremap n nzz
"nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

"Buffers
map <Tab> <esc>:w<CR>:bn<CR>
map <S-Tab> <esc>:w<CR>:bp<CR>
map <c-c> <esc>:w<CR>:bd<CR>

"FZF
map <s-f> <esc>:FZF<CR>
"tabs
":tabnew %
"g+t (next tab)

" }}}


"VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Автозакрытие окна NERDTree,
" если сам Vim уже закрыли
autocmd BufEnter *
    \ if (winnr("$") == 1
    \ && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree())
    \ | q | endif


" Функция, убирающая лишние пробелы на концах строк,
" лишние строки в файле, а также лишние строки под конец файла
function! CleanupBeforeWrite()

    " Запоминаем позицию курсора
    let l:line = line('.')
    let l:col = col('.')

    " Убрать лишние пробелы на концах строк
    " % перед s означает, что нужно сразу во всём файле заменять
    :%s/\s\+$//e

    " Добавить пустые строки под конец файла
    " (нужно, чтобы правильно их усечь до одной впоследствии)
    :$s/$/\=repeat("\r", 5)/e

    " Убрать лишние пустые строки в избыточном количестве
    :%s/\n\{5,}/\r\r/e

    " Странно, но при замене \r - это newline,
    " а \n - это null.
    " https://stackoverflow.com/questions/3965883/vim-replace-character-to-n
    " https://unix.stackexchange.com/questions/247329/vim-how-to-replace-one-new-line-n-with-two-ns

    " Оставляем только одну пустую строку под конец файла
    :$-1,$s/\n//e

    " Возвращаем курсор в исходное положение
    call cursor(l:line, l:col)

endfunction

" }}}


" STATUS LINE ------------------------------------------------------------ {{{
let g:airline_theme='onedark'
"google_dark
"base16_gruvbox_dark_hard
"minimalist

let g:airline_section_z = "%p%% %l:%c"
let g:airline_section_c = "%F"
"let g:airline_section_x = '%{strftime("%c")}'
"let g:airline_stl_path_style = 'short'

let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#searchcount#show_search_term = 1
let g:airline#extensions#searchcount#search_term_limit = 8

let g:airline_powerline_fonts = 1
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"tab line
let g:airline#extensions#tabline#enabled = 1

"}}}

" 0 -> blinking block.  " 1  -> blinking block (default).
" 2  -> steady block.
" 3  -> blinking underline.
" 4  -> steady underline.
" 5  -> blinking bar (xterm).
" 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"ALE
let g:ale_virtualtext_cursor = 'current' "shows comment only when mouse is on cur str
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

"доп подсветка синтаксиса C/C++
let g:cpp_simple_highlight = 1


"скрывает блок кода
set foldmethod=syntax
"set foldcolumn=<n>     " the number of columns to use for folding display at the left

" Ускорить вывод символов на экран при скроле
set ttyfast

"оставить 3 строк при скроле
set scrolloff=3

"нет надписи реплейс визуал
"хз не работает
set noshowmode

" Использовать расширенный синтаксис регулярных выражений по умолчанию
set magic

set laststatus=2

set ttimeoutlen=0

set noerrorbells
set novisualbell

"security
set modelines=0

syntax enable

"цветовая схема/тема
set background=dark
"еще имба darcula
colorscheme onedark
"colorscheme pablo
"set t_co=256
"set termguicolors

"выделяем текст
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 100

set number
set relativenumber

"tab -> 4*' '
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"mouse on (думаю надо отключить)
set mouse=a
set mousehide

"полоса на 80м символе
set colorcolumn=80
"highlight colorcolumn ctermbg=black

"подсветка текущей строчки
"set cursorline
"highlight cursorline cterm=bold

" Чиним отображение цветов в alacritty
"if &term == 'alacritty'
"    let &term='xterm-256color'
"endif

"подсветка искомых слов в моменте
set incsearch
" show matching words during a search.
set showmatch
" use highlighting when doing a search.
set nohlsearch
" Игнорировать регистр при поиске
"set ignorecase

"set clipboard=unnamedplus

" Сделать размер истории последних изменений
" для undo/redo равным 1000
set undolevels=1000
set history=1000

" enable auto completion menu after pressing tab.
set wildmenu

"set wildmode=longest:full,full
" make wildmenu behave like similar to bash completion.
"set wildmode=list:longest

" there are certain files that we would never want to edit with vim.
" wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"автоотступ для новой строки
set ai

"отстуа в стиле С
set cin
set nowrap

" use system clipboard
set clipboard=unnamedplus

set noswapfile
"no comp with C
set nocompatible

" show file stats
set ruler

set encoding=utf-8

