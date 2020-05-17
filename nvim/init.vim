set nu rnu

set termguicolors " Enable true color support.
set ignorecase
""let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
""let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set nocompatible              " be iMproved, required
filetype off                  " required

nnoremap <Space> <NOP>
let mapleader =" "
set shiftwidth=2

call plug#begin()

" ============= Language Support =======================
Plug 'OmniSharp/omnisharp-vim'
" {{{
	let g:OmniSharp_server_path = '/home/cyil/.lang-servers/omnisharp/run'
	let g:OmniSharp_server_stdio = 1
	let g:OmniSharp_highlight_types = 2

	set completeopt=longest,menuone,preview
	set previewheight=5
	nnoremap <Leader>. :OmniSharpGetCodeActions<CR>
	xnoremap <Leader>. :call OmniSharp#GetCodeActions('visual')<CR>
	nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
	nnoremap <Leader>sd :OmniSharpPreviewDefinition<CR>
	nnoremap <Leader>si :OmniSharpPreviewImplementation<CR>
	nnoremap <Leader>gd :OmniSharpGotoDefinition<CR>
	highlight! link csUserIdentifier ALEInfoLine
" }}}

Plug 'w0rp/ale'
" {{{
	let g:ale_fix_on_save = 1
	let g:ale_linters = { 'cs': ['OmniSharp'] }
	let g:ale_pattern_options = {
	\   '.*\.cc$': {'ale_enabled': 0},
	\   '.*\.hh$': {'ale_enabled': 0},
	\   '.*\.c$': {'ale_enabled': 0},
	\   '.*\.h$': {'ale_enabled': 0},
	\   '.*some/folder/.*\.js$': {'ale_enabled': 0},
	\}
" }}}

Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" ================ Motion ==============================
Plug 'psliwka/vim-smoothie'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'

" ================ File Management ======================
Plug 'preservim/nerdtree'
" {{{
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeHijackNetrw = 0
  let g:NERDTreeWinSize = 31
  let g:NERDTreeChDirMode = 2
  let g:NERDTreeAutoDeleteBuffer = 1
  let g:NERDTreeShowBookmarks = 1
  let g:NERDTreeCascadeOpenSingleChildDir = 1

  map <F2> :NERDTreeToggle<CR>
" }}}

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" { 
	nnoremap <silent> <leader><space> :FZF<CR>
  	nnoremap <silent> <leader>b :Buffers<CR>
	let g:fzf_nvim_statusline = 0 " disable statusline overwriting
" }

" ================ Visuals =============================
Plug 'chriskempson/base16-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'tpope/vim-vividchalk'
Plug 'junegunn/limelight.vim'
" {{{
  	let g:limelight_default_coefficient = 0.7
	let g:limelight_conceal_ctermfg = 238
	nmap <silent> gl :Limelight!!<CR>
	xmap gl <Plug>(Limelight)
" }}}

Plug 'chrisbra/Colorizer'
" {{{
	let g:colorizer_skip_comments = 1
	let g:colorizer_colornames = 1
	let g:colorizer_syntax = 1
" }}}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
" {{{
	let g:gitgutter_map_keys = 0
" }}}

" ================ Window Management ======================
	" Vertical split and focus right.
	nnoremap <silent> <leader>wv :vsplit<CR><C-w>l
	" Horizontal split and focus down.
	nnoremap <silent> <leader>ws :split<CR><C-w>j
	" Focus next window.
	nnoremap <silent> <leader>ww <C-w><C-w>
	" Increase vertical resize by 5.
	nnoremap <silent> <leader>[ :vertical resize -5<CR>
	" Decrease vertical resize by 5.
	nnoremap <silent> <leader>] :vertical resize +5<CR>
	" Increase horizontal resize by 5.
	nnoremap <silent> <leader>- :resize -5<CR>
	" Decrease horizontal resize by 5.
	nnoremap <silent> <leader>= :resize +5<CR>
	" Focus on the windows on the left.
	nnoremap <silent> <leader>h <C-w>h
	" Focus on the windows on below.
	nnoremap <silent> <leader>j <C-w>j
	" Focus on the windows on above.
	nnoremap <silent> <leader>k <C-w>k
	" Focus on the windows on the right.
	nnoremap <silent> <leader>l <C-w>l
	" Close window.
	nnoremap <silent> <leader>q :q<CR>

" ================ Debugging ==============================
Plug 'vim-vdebug/vdebug'

" ================ Completion =============================
Plug 'sirver/UltiSnips'
" {{{
	nnoremap <leader>se :UltiSnipsEdit<CR>

	let g:UltiSnipsSnippetsDir = '~/.nvim/UltiSnips'
	let g:UltiSnipsEditSplit = 'horizontal'
	let g:UltiSnipsListSnippets = '<nop>'
	let g:UltiSnipsExpandTrigger = '<c-l>'
	let g:UltiSnipsJumpForwardTrigger = '<c-l>'
	let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
	let g:ulti_expand_or_jump_res = 0
" }}}

Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
" {{{
	" coc config
	let g:coc_global_extensions = [
	  \ 'coc-snippets',
	  \ 'coc-pairs',
	  \ 'coc-tsserver',
	  \ 'coc-eslint', 
	  \ 'coc-prettier', 
	  \ 'coc-json', 
	  \ 'coc-python', 
	  \ 'coc-omnisharp', 
	  \ ]

	" from readme
	" if hidden is not set, TextEdit might fail.
	set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.

	set updatetime=300

	" don't give |ins-completion-menu| messages.
	set shortmess+=c

	" always show signcolumns
	set signcolumn=yes

	xmap <leader>f  <Plug>(coc-action-formatselected)
	nmap <leader>f  <Plug>(coc-action-formatselected)
	nmap <silent> <leader>rn :call CocAction('runCommand', 'document.renameCurrentWord')<CR>

	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	"Use tab for trigger completion with characters ahead and navigate.
	" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
	" Coc only does snippet and additional edit on confirm.
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
		function! s:show_documentation()
		  if (index(['vim','help'], &filetype) >= 0)
		    execute 'h '.expand('<cword>')
		  else
		    call CocAction('doHover')
		  endif
		endfunction

	autocmd CursorHold * silent call CocActionAsync('highlight')
	
	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
	    execute 'h '.expand('<cword>')
	  else
	    call CocAction('doHover')
	  endif
	endfunction
" }}}

Plug 'honza/vim-snippets'

" ================ Formatting =============================
Plug 'tpope/vim-surround'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
" {{{
	let g:clang_format#command = 'clang-format'
	let g:clang_format#style_options = {
		    \ "BreakBeforeBraces" : "Allman",
		    \ "UseTab" : "ForIndentation",
		    \ "IndentWidth" : 2,
		    \ "ColumnLimit" : 100,
		    \ "AccessModifierOffset" : -4,
		    \ "AllowShortIfStatementsOnASingleLine" : "false",
		    \ "AllowShortFunctionsOnASingleLine" : "false",
		    \}

	" shortcuts for autoformatting the entire file: Ctrl+j
	inoremap <C-j> <Esc>:ClangFormat<CR>a
	nnoremap <C-j> <Esc>:ClangFormat<CR>
" }}}

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'OrangeT/vim-csharp'

call plug#end()
filetype plugin indent on
set rtp+=/usr/bin/fzf

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

let g:airline_powerline_fonts = 1
highlight Pmenu ctermbg=18 guibg=18
noremap <Leader>y "+y
noremap <Leader>p "+p
au ColorScheme * hi Normal ctermbg=none guibg=none

highlight Normal guibg=none
highlight NonText guibg=none

highlight Normal ctermbg=none
highlight NonText ctermbg=none
colorscheme base16-dracula

" ================ Misc =============================
	nnoremap <silent> <leader>rrc :so $MYVIMRC<CR>
    

" highlight matching braces
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=0

" When the last window will have a status line (2 = always)
set laststatus=2

" disable wrapping of long lines into multiple lines
set nowrap

" history
set history=1000

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

" to avoid hitting:
" 'press ENTER or type command to continue'
" add 'silent' keyword before the command
" 

"disable preview window
set completeopt-=preview

" ################ CTAGS ############################
 
" TODO: learn more about this plugin and improve it
 
" change the stack pop to a more comfortable mapping
nnoremap <C-e> <C-]>

" CTAGS indexer
let g:indexer_disableCtagsWarning = 1
