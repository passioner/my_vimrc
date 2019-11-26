" ----------------------------- Vundle Start -----------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" plugin taglist
Plugin 'taglist.vim'

" plugin vim-printf
Plugin 'mptre/vim-printf'

" plugin DoxygenToolkit
Plugin 'vim-scripts/DoxygenToolkit.vim'

" plugin youcompleteme
"Plugin 'Valloric/YouCompleteMe'

" plugin tabnine
Plugin 'zxqfl/tabnine-vim'

" plugin auto-pairs
Plugin 'jiangmiao/auto-pairs'

" plugin vim-rainbow
Plugin 'frazrepo/vim-rainbow'

" plugin vim-airline
Plugin 'vim-airline/vim-airline'

" plugin nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" plugin vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" plugin vim-instant-markdown
Plugin 'suan/vim-instant-markdown'

call vundle#end()
filetype plugin indent on
" ----------------------------- Vundle End   -----------------------------

" Setting code-style
scriptencoding utf-8
set encoding=utf-8
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" 语法高亮
syntax on

" 显示行号
set nu

" 颜色模式，参考/usr/share/vim/vim74/colors下的.vim配置
colorscheme desert

" F5,F6快捷键设置
:inoremap <F5> <C-R>=printf("%s,%s,%s","//Added by wangwei@",strftime("%F"),"")<CR>
:inoremap <F6> <C-R>=printf("%s,%s,%s","#Added by wangwei@",strftime("%F"),"")<CR>

" 设置taglist
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1

" 设置F9开关taglist
nnoremap <silent> <F9> :TlistToggle<CR>

" 设置ctags
set tags=tags;

" 自动切换当前目录为当前文件所在目录
set autochdir

" 设置检索高亮
set hlsearch

" 输入搜索内容时就显示搜索结果
set incsearch

" 彻底关闭错误信息响铃
set vb t_vb=

" 设置256色
set t_Co=256

" 设置tab为4个空格
set tabstop=4

" 设置自动缩进
set autoindent
set smartindent

" 设置缩进为4个空格
set shiftwidth=4

" 设置光标所在行状态
set ruler

" 恢复上次打开的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 文件在vim之外被修改，自动重新读入
set autoread

" 设置自动补齐:( [ { ' " < (instead by auto-pair)
"inoremap ( ()<esc>i
"inoremap [ []<esc>i
"inoremap { {<esc>o}<esc>O
"inoremap ' ''<esc>i
"inoremap " ""<esc>i
"inoremap < <><esc>i
"inoremap ) <esc>la

" 保存退出时忽略大小写
command Wq wq
command WQ wq
command Qw wq
command W w
command Q q

" 配置cscope
if has("cscope")
	set csprg=/usr/local/bin/cscope
	set csto=1 " zero for cscope; one for ctags
	set nocst  " cst for cscope; nocst for ctags
	"set cspc=5 " the length of the file path
	set nocsverb
	" add any database in current directory
	if filereadable("/Users/passioner/workspace/gem5/src/cscope.out")
		cs add /Users/passioner/workspace/gem5/src/cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif
nmap <C-@>s :cs find s <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-@>g :cs find g <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-@>c :cs find c <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-@>t :cs find t <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-@>e :cs find e <C-R>=expand("<cword>" )<CR><CR>  
nmap <C-@>f :cs find f <C-R>=expand("<cfile>" )<CR><CR>  
nmap <C-@>i :cs find i <C-R>=expand("<cfile>" )<CR><CR>  
nmap <C-@>d :cs find d <C-R>=expand("<cword>" )<CR><CR>  

" 高亮tab和space
"set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:·
set listchars=tab:\|\ 
nmap <C-m> :set invlist <CR>

" 配置markdown
filetype plugin on

" 配置vim-vim/vim-apps拷贝
" vmap y :w !pbcopy<CR><CR>
" nmap p :r !pbpaste<CR>

" tab和shift-tab完成文本缩进
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" 设置空格键为热键, default leader is key \
let mapleader = "\<Space>"

" 配置各个文件类型下的printf格式
au FileType awk		let b:printf_pattern = 'printf "%s\n", %s'
au FileType c		let b:printf_pattern = 'printf("%%s: %d\n", __func__, %s);'
au FileType go		let b:printf_pattern = 'fmt.Printf("%+v\n", %s)'
au FileType java	let b:printf_pattern = 'System.out.format("%d%%n", %s);'
au FileType python	let b:printf_pattern = 'print("%s" %% (%s))'
au FileType ruby	let b:printf_pattern = 'printf("%p\n", %s)'
au FileType sh		let b:printf_pattern = 'printf ''%s\n'' %s'
au FileType vim		let b:printf_pattern = 'echom printf("%s", %s)'
" 更改:Printf为热键+p
nnoremap <Leader>p :Printf<CR>

" 设置Doxygen作者
let g:DoxygenToolkit_authorName="passio91@163.com"
" Space + h: insert header annotation
nnoremap <Leader>h :DoxAuthor<CR>
" Space + f: insert func annotation
nnoremap <Leader>f :Dox<CR>

" 使能彩虹括号
au FileType c,cpp,objc,objcpp call rainbow#load()

" <leader>+s 刷新.vimrc配置
nnoremap <leader>s :source ~/.vimrc<CR>

" 高亮某一列
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" 仅高亮第120个字符
match OverLength /\%121v./
" 高亮第120个及其之后第字符
" match OverLength /\%121v.\+/

" nerdcommenter添加注释的时候，注释符之后添加空格
let g:NERDSpaceDelims = 1

" 关闭markdown默认折叠功能
let g:vim_markdown_folding_disabled = 1

" 默认关闭instant markdown功能
" let g:instant_markdown_autostart = 0
