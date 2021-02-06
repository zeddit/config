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
