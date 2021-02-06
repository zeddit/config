" ==============================================================
" $File: .vimrc
" $Athr: zeddit
" $Mail: zhangdai[dot]zedd[at]gmail[dot]com
" ==============================================================
"
" Vi nocompatible mode
set nocompatible

" Using vim-plug as plugin manager.
" -- Brief help --
" :PlugInstall [name ...] [#threads]	- Install Plugins
" :PlugUpdate [name ...] [#threads]	- Install or update plugins
" :PlugClean[!]		-Remove unused directories (bang will clean without prompt)
" :PlugUpgrade		-Upgrade vim-plug itself
" :PlugStatus		-Check the status of plugins
" :PlugDiff		-Examine changes from the previous update and pending changes
" :PlugSnapshot[!] [output path]	- Generate script for restoring the current snapshot of the plugins
" ------------------
" -- Plug options --
"  ,{"do": ... }		- Post-update hook (string or funcref)
"  ,{"on": ['Command1', ...] }	- On-demand loading: Commands or <Plug>-mappings
"  ,{"for": ... }		- On-demand loading: File types
" ------------------
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
" Plug 'vim-scripts/a.vim'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" Plug 'skywind3000/vim-preview'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Basic custom settings.
set number
set clipboard=unnamed " Share clipboard with OSX system
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
" nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

set path+=**

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" lightline custom configuration.
" *NEED the patched font for powerline!
"set statusline+=%{gutentags#statusline()}
let g:lightline = {
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'fugitive' ],
			\	      [ 'bufferinfo' ] ],
			\   'right': [ [ 'lineinfo', 'syntastic' ],
			\              [ 'percent' ], [ 'gutentags' ],
			\              [ 'fileformat', 'fileencoding', 'filetype' ] ],
			\ },
			\ 'inactive': {
			\   'left': [ [ 'bufferinfo' ] ],
			\   'right': [ [ 'lineinfo' ],
			\              [ 'percent' ] ]
			\ },
			\ 'component': {
			\   'bufferinfo': '%f %m',
			\   'lineinfo': ' %3l:%-2v',
			\ },
			\ 'component_function': {
			\   'readonly': 'LightlineReadonly',
			\   'fugitive': 'LightlineFugitive',
			\   'syntastic': 'SyntasticStatuslineFlag',
            \   'gutentags': 'gutentags#statusline',
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': '' }
			\ }
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction

" auto-pop-complete(apc) custom configuration.
" set enabled file type, '*' for all types
let g:apc_enable_ft = {'text':1, 'markdown':1, 'python':1, 'c':1}
" set complete search dict, see :help cpt
set cpt=.,k,w,b
" no auto select the first item
set completeopt=menu,menuone,noselect
" no annoying messages below
set shortmess+=c

" gtags-cscope
"s：查找C代码符号
"g：查找本定义
"c：查找调用本函数的函数
"t：查找本字符串
"e：查找本egrep模式
"f：查找本文件
"i：查找包含本文件的文件
"d：查找本函数调用的函数
" enable gtags module
" let g:gutentags_modules = ['gtags_cscope']
"" let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
" let g:gutentags_project_root = ['.root']
" let g:gutentags_add_default_project_roots = 0

" disable autoload gtags database
"" let g:gutentags_auto_add_gtags_cscope = 0

" define the name of tag files
"" let g:gutentags_ctags_tagfile = '.tags'

" put ctags/gtags files into a folder
"" let g:gutentags_cache_dir = expand('.tags')
"" g:gutentags_generate_on_missing = 0
"
" change focus to quickfix window after search (optional).
" let g:gutentags_plus_switch = 1

" preview
" autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
" autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

" a.vim shortcuts
" :A switch to header/source file in current panel
" :AS, :AV, open header/source file in a split window
" :IH switches to file under cursor
" :IHS, IHV
