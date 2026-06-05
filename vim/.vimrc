" ~/.vimrc
" ==============================================================================
" SD's Simple Vim Config - README
" ==============================================================================
"
" Goal:
"   A small, plugin-free Vim config that feels comfortable for a LazyVim user.
"   It uses native Vim features only: mappings, options, netrw, buffers,
"   quickfix, :find, :vimgrep, filetype detection, syntax highlighting, and
"   built-in colorschemes.
"
" Plugin requirement:
"   No external plugins are required.
"   This config uses only Vim + Vim's bundled runtime files.
"
" Leader keys:
"   <leader>      = Space
"   <localleader> = \
"
" Key notation used below:
"   <C-x>   = Ctrl + x
"   <S-x>   = Shift + x
"   <M-x>   = Meta/Alt + x
"   <CR>    = Enter
"   <Esc>   = Escape
"
" Notes:
"   - <M-j>/<M-k> means Alt+j / Alt+k, but terminal support can be flaky.
"   - If Alt mappings do not work, use leader mappings instead or configure
"     your terminal to send Esc-prefixed Meta keys.
"   - For the full built-in Vim command index, open:
"       :help index
"   - For this config's mappings, use:
"       :map
"       :nmap
"       :imap
"       :xmap
"
" ==============================================================================
" CUSTOM KEYBINDS FROM THIS CONFIG
" ==============================================================================
"
" ------------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------------
" <Esc>        Clear highlighted search matches, then behave like Escape.
" n            Go to next search match and center the screen.
" N            Go to previous search match and center the screen.
"
" Native search keys still available:
" /pattern     Search forward.
" ?pattern     Search backward.
" *            Search word under cursor forward.
" #            Search word under cursor backward.
"
" ------------------------------------------------------------------------------
" Window / split navigation
" ------------------------------------------------------------------------------
" <C-h>        Move to the split on the left.
" <C-j>        Move to the split below.
" <C-k>        Move to the split above.
" <C-l>        Move to the split on the right.
"
" <C-Up>       Increase split height.
" <C-Down>     Decrease split height.
" <C-Left>     Decrease split width.
" <C-Right>    Increase split width.
"
" Native Vim equivalents still available:
" <C-w>h       Move to left window.
" <C-w>j       Move to lower window.
" <C-w>k       Move to upper window.
" <C-w>l       Move to right window.
" <C-w>s       Horizontal split.
" <C-w>v       Vertical split.
" <C-w>q       Close current split.
" <C-w>=       Equalize split sizes.
"
" ------------------------------------------------------------------------------
" Buffer navigation
" ------------------------------------------------------------------------------
" <S-h>        Previous buffer.
" <S-l>        Next buffer.
" [b           Previous buffer.
" ]b           Next buffer.
"
" <leader>bb   Switch to alternate / last-used buffer.
" <leader>bd   Delete current buffer.
" <leader>bn   Create a new empty buffer.
"
" Native buffer commands:
" :ls          List buffers.
" :b N         Go to buffer number N.
" :b name      Go to buffer matching name.
" :bn          Next buffer.
" :bp          Previous buffer.
" :bd          Delete buffer.
"
" ------------------------------------------------------------------------------
" Save / quit / reload
" ------------------------------------------------------------------------------
" <C-s>        Save file.
"              Works in Normal, Insert, and Visual mode.
"
" <leader>w    Save file.
" <leader>q    Quit current window.
" <leader>x    Save and quit.
" <leader>ur   Reload this vimrc.
"
" Native commands:
" :w           Save.
" :q           Quit.
" :q!          Force quit without saving.
" :wq          Save and quit.
" :x           Save and quit only if changed.
"
" ------------------------------------------------------------------------------
" File helpers
" ------------------------------------------------------------------------------
" <leader>e    Open netrw file explorer with :Explore.
" <leader>fv   Open this vimrc file.
" <leader>ff   Start Vim's built-in :find command.
"              Usage example:
"                Space ff main<Tab>
"
" <leader>fg   Start project-wide :vimgrep over **/* and open quickfix.
"              The cursor is placed inside the search pattern.
"
" Native file commands:
" :e file      Edit file.
" :Explore     Open netrw explorer.
" :find file   Find file using the 'path' option.
" :pwd         Print current directory.
" :cd path     Change current directory.
"
" ------------------------------------------------------------------------------
" Quickfix
" ------------------------------------------------------------------------------
" ]q           Go to next quickfix item.
" [q           Go to previous quickfix item.
" <leader>qo   Open quickfix window.
" <leader>qc   Close quickfix window.
"
" Native quickfix commands:
" :copen       Open quickfix window.
" :cclose      Close quickfix window.
" :cnext       Next quickfix item.
" :cprevious   Previous quickfix item.
" :cfirst      First quickfix item.
" :clast       Last quickfix item.
"
" ------------------------------------------------------------------------------
" Visual mode editing
" ------------------------------------------------------------------------------
" <            Indent selection left and keep it selected.
" >            Indent selection right and keep it selected.
"
" <M-j>        Move selected lines down.
" <M-k>        Move selected lines up.
"
" Native visual keys:
" v            Start character-wise visual mode.
" V            Start line-wise visual mode.
" <C-v>        Start block-wise visual mode.
" y            Yank selection.
" d            Delete selection.
" c            Change selection.
"
" ------------------------------------------------------------------------------
" Normal mode line movement / editing helpers
" ------------------------------------------------------------------------------
" <M-j>        Move current line down.
" <M-k>        Move current line up.
"
" J            Join current line with next line but preserve cursor position.
"
" <leader>o    Add a blank line below without staying in Insert mode.
" <leader>O    Add a blank line above without staying in Insert mode.
"
" Native editing keys:
" i            Insert before cursor.
" a            Insert after cursor.
" I            Insert at start of line.
" A            Insert at end of line.
" o            Open line below and enter Insert mode.
" O            Open line above and enter Insert mode.
" u            Undo.
" <C-r>        Redo.
" .            Repeat last change.
"
" ------------------------------------------------------------------------------
" UI toggles
" ------------------------------------------------------------------------------
" <leader>un   Toggle absolute + relative line numbers.
" <leader>uw   Toggle line wrapping.
" <leader>us   Toggle spellcheck.
" <leader>uz   Toggle fold under cursor.
"
" Native fold keys:
" za           Toggle fold under cursor.
" zo           Open fold.
" zc           Close fold.
" zR           Open all folds.
" zM           Close all folds.
"
" ==============================================================================
" IMPORTANT DEFAULT VIM KEYS TO REMEMBER
" ==============================================================================
"
" ------------------------------------------------------------------------------
" Mode switching
" ------------------------------------------------------------------------------
" i            Insert before cursor.
" a            Insert after cursor.
" I            Insert at start of line.
" A            Insert at end of line.
" o            New line below.
" O            New line above.
" <Esc>        Return to Normal mode.
" v            Visual mode.
" V            Visual line mode.
" <C-v>        Visual block mode.
" :            Command-line mode.
"
" ------------------------------------------------------------------------------
" Basic movement
" ------------------------------------------------------------------------------
" h            Left.
" j            Down.
" k            Up.
" l            Right.
"
" w            Next word.
" b            Previous word.
" e            End of word.
" ge           End of previous word.
"
" 0            Start of line.
" ^            First non-blank character of line.
" $            End of line.
"
" gg           Top of file.
" G            Bottom of file.
" {N}G         Go to line N.
" %            Jump to matching bracket/paren/brace.
"
" <C-d>        Half-page down.
" <C-u>        Half-page up.
" <C-f>        Page down.
" <C-b>        Page up.
"
" ------------------------------------------------------------------------------
" Operators and text edits
" ------------------------------------------------------------------------------
" x            Delete character under cursor.
" r{char}      Replace one character.
" dd           Delete current line.
" yy           Yank/copy current line.
" p            Paste after cursor.
" P            Paste before cursor.
"
" d{motion}    Delete over a motion.
" y{motion}    Yank/copy over a motion.
" c{motion}    Change over a motion.
"
" Examples:
" dw           Delete word.
" d$           Delete to end of line.
" cw           Change word.
" ciw          Change inner word.
" yiw          Yank inner word.
" di(          Delete inside parentheses.
" ci"          Change inside quotes.
"
" ------------------------------------------------------------------------------
" Search and replace
" ------------------------------------------------------------------------------
" /text        Search forward.
" ?text        Search backward.
" n            Next match.
" N            Previous match.
" *            Search word under cursor forward.
" #            Search word under cursor backward.
"
" :%s/a/b/g    Replace all 'a' with 'b' in the file.
" :s/a/b/g     Replace all 'a' with 'b' on current line.
"
" ------------------------------------------------------------------------------
" Marks and jumps
" ------------------------------------------------------------------------------
" m{letter}    Set mark.
" '{letter}    Jump to marked line.
" `{letter}    Jump to exact marked position.
" ''           Jump back to previous jump line.
" ``           Jump back to previous exact position.
" <C-o>        Older jump.
" <C-i>        Newer jump.
"
" ------------------------------------------------------------------------------
" Registers / clipboard basics
" ------------------------------------------------------------------------------
" yy           Yank line into default register.
" dd           Delete line into default register.
" p            Paste from default register.
"
" "+y          Yank to system clipboard, if Vim has clipboard support.
" "+p          Paste from system clipboard, if Vim has clipboard support.
"
" This config sets:
"   set clipboard=unnamedplus
" when Vim has clipboard support, so normal y/p should use system clipboard.
"
" ------------------------------------------------------------------------------
" Help system
" ------------------------------------------------------------------------------
" :help topic  Open help for a topic.
" :help index  Open complete command index.
" :help option-list
"              Open option list.
" K            Open help/manpage for word under cursor, depending on filetype.
"
" Useful help pages for this config:
"   :help map.txt
"   :help key-notation
"   :help mapleader
"   :help netrw
"   :help :Explore
"   :help quickfix
"   :help :vimgrep
"   :help :find
"   :help options
"
" ==============================================================================
" CONFIG BEHAVIOR SUMMARY
" ==============================================================================
"
" UI:
"   - Shows absolute + relative line numbers.
"   - Highlights current line.
"   - Keeps signcolumn visible.
"   - Uses dark background and tries built-in catppuccin.
"   - Falls back silently if catppuccin is not installed in your Vim runtime.
"
" Editing:
"   - Uses spaces instead of tabs.
"   - Default indent size is 2 spaces.
"   - Java, C, C++, and Python are overridden to 4 spaces.
"   - Markdown enables wrap, linebreak, and spellcheck.
"
" Search:
"   - Case-insensitive by default.
"   - Automatically becomes case-sensitive if search contains uppercase.
"   - Search matches are highlighted.
"
" Files:
"   - netrw is used as the file explorer.
"   - :find searches recursively because 'path' includes **.
"   - build artifacts and heavy folders are ignored by wildignore.
"
" Folding:
"   - Indent-based folding is enabled.
"   - Folds start open because foldlevel is high.
"
" Statusline:
"   - Shows file name, modified flag, filetype, line/column, and percent position.
"
" ==============================================================================
" END README
" ==============================================================================
"
" ------------------------------------------------------------
" Base defaults
" ------------------------------------------------------------
if filereadable($VIMRUNTIME . "/defaults.vim")
  source $VIMRUNTIME/defaults.vim
endif

set nocompatible
filetype plugin indent on
syntax enable

let mapleader = " "
let maplocalleader = "\\"

" ------------------------------------------------------------
" UI
" ------------------------------------------------------------
set number
set relativenumber
set cursorline
set signcolumn=yes
set showcmd
set showmode
set ruler
set laststatus=2
set scrolloff=8
set sidescrolloff=8
set termguicolors
set background=dark

" Use a built-in colorscheme that exists almost everywhere.
" silent! colorscheme desert
set termguicolors
set background=dark
silent! colorscheme catppuccin

" ------------------------------------------------------------
" Editing
" ------------------------------------------------------------
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set wrap
set linebreak
set breakindent
set hidden
set updatetime=300
set timeoutlen=500
set ttimeoutlen=10

" Better completion menu
set wildmenu
set wildmode=longest:full,full
set completeopt=menuone,noselect

" ------------------------------------------------------------
" Search
" ------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch

" Escape clears search highlight like LazyVim
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Center after search jumps
nnoremap n nzzzv
nnoremap N Nzzzv

" ------------------------------------------------------------
" Splits and buffers
" ------------------------------------------------------------
set splitbelow
set splitright

" LazyVim-like window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" LazyVim-like buffer navigation
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

" Leader buffer commands
nnoremap <leader>bb :buffer #<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bn :enew<CR>

" ------------------------------------------------------------
" Save / quit
" ------------------------------------------------------------
nnoremap <C-s> :write<CR>
inoremap <C-s> <Esc>:write<CR>a
vnoremap <C-s> <Esc>:write<CR>

nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>x :x<CR>

" Reload vimrc
nnoremap <leader>ur :source $MYVIMRC<CR>:echo "vimrc reloaded"<CR>

" ------------------------------------------------------------
" File helpers
" ------------------------------------------------------------
" Open current file's directory
nnoremap <leader>e :Explore<CR>

" Edit vimrc quickly
nnoremap <leader>fv :edit $MYVIMRC<CR>

" Find files using built-in :find
set path+=**
set wildignore+=*/node_modules/*,*/.git/*,*/target/*,*/build/*,*.class,*.o

nnoremap <leader>ff :find 
nnoremap <leader>fg :vimgrep //gj **/* \| copen<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Quickfix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

" ------------------------------------------------------------
" Clipboard
" ------------------------------------------------------------
" Use system clipboard automatically when Vim supports it.
if has("clipboard")
  set clipboard=unnamedplus
endif

" ------------------------------------------------------------
" Better movement / editing quality of life
" ------------------------------------------------------------
" Keep visual selection while indenting
vnoremap < <gv
vnoremap > >gv

" Make terminal Alt+j / Alt+k visible to Vim as Meta mappings
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"

" Move lines up/down
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
xnoremap <M-j> :m '>+1<CR>gv=gv
xnoremap <M-k> :m '<-2<CR>gv=gv

" Better J: keep cursor position
nnoremap J mzJ`z

" Open new lines without entering insert mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Toggle useful UI
nnoremap <leader>un :set number! relativenumber!<CR>
nnoremap <leader>uw :set wrap!<CR>
nnoremap <leader>us :set spell!<CR>

" ------------------------------------------------------------
" Folding
" ------------------------------------------------------------
set foldmethod=indent
set foldlevel=99
nnoremap <leader>uz za

" ------------------------------------------------------------
" Statusline: simple and useful
" ------------------------------------------------------------
set statusline=
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=%y
set statusline+=\ [%l:%c]
set statusline+=\ %p%%

" ------------------------------------------------------------
" Language-specific basics
" ------------------------------------------------------------
augroup sd_filetypes
  autocmd!
  autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType c,cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType markdown setlocal wrap linebreak spell
augroup END
