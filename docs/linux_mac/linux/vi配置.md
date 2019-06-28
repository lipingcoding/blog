---
title: vi配置
date: 2019-03-28 21:10:08
categories: linux
tags: [vi, linux, 佳软, without_sudo]

---

最近来组里实习, 需要在服务器上写程序, 经过考察, 最好的方式就是直接在服务器上用 vi/vim 写, 为了方便以后去别的环境再配置, 所以记录下安装过程. 

<!--more-->

### 1.install vi/vim without sudo 

服务器上的 vi 版本太老, 有些插件安装不了, 所以第一步就要自己安装一个较高版本的 vi/vim. 

```shell
wget ftp://ftp.vim.org/pub/vim/unix/vim-8.1.tar.bz2
tar -xvf vim-8.1.tar.bz2
cd vim-8.1
./configure --enable-pythoninterp --with-features=huge --with-python-config-dir=/usr/bin/python --prefix=$HOME/.local
make 
make install 
```



也可以去 ftp://ftp.vim.org/pub/vim/unix/ 寻找别的版本.   

`--prefix=$HOME/.local ` 是因为没有 sudo 权限, 所以无法安装在 /usr/bin 目录下. 

vim 会被安装在 ~/.local/bin 中

在 ~/.bashrc 中加上一行  

`export PATH=/lustre/home/lpwang/.local/bin:$PATH` 

就可以在任意路径中调用 vi/vim 了. 

### 2.  配置 .vimrc

第一步中安装的 vi/vim与原先的 vi/vim 共用 ~/.vimrc. 为了方便配置, 需要更改下, 以便不同版本的 vi 启用不同的配置.  将原先的 .vimrc 复制成 .vimrc7, 然后将 .vimrc 改成如下

```shell 
if v:version >=800
    source ~/.vimrc8
elseif v:version >=700
    source ~/.vimrc7
endif
```

这样, 你就可以在 .vimrc8 中进行你自己的 vi/vim 配置了. 

### 3. 安装 Vundle 

先安装插件管理工具 Vundle, 然后利用Vundle 再安装别的插件. 

```shell 
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

 然后, 将如下 vundle 的配置信息写在 .vrimrc8 的最前面 

```
set nocompatible              " required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
" " add all your plugins here (note older versions of Vundle
" " used Bundle instead of Plugin)
"
" " ...
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
 filetype plugin indent on    " required
"
"

```



以后安装插件时, 只需仿照 Plugin 'Valloric/YouCompleteMe' 写就行, 写完之后, 打开 vi, 输入 `:PluginInstall` 等待安装就行, 有时会很慢, 比如 Valloric/YouCompleteMe, 因为需要下载很多东西. 

后面再结合自己的需求安装插件就行, 贴下自己的 .vimrc8 吧

```
set nocompatible              " required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe'
" " add all your plugins here (note older versions of Vundle
" " used Bundle instead of Plugin)
"
" " ...
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
 filetype plugin indent on    " required
"
"
syntax on
syntax enable
set nu
set expandtab
set tabstop=4
set autoindent
set encoding=utf-8
set backspace=2
set shiftwidth=4  


highlight Comment ctermfg=green guifg=green


" configure jedi-vim
let g:jedi#completions_command = "<C-N>"
autocmd FileType python setlocal completeopt-=preview "" not show pydoc documentatio
```

装过 YouCompleteMe, 特麻烦, 而且启动 vi 变的特别慢, 后来就不用了. 



### 4.安装插件

插件类型有好几种, 如果在 github 上维护, 可以通过 Vundle 安装. 有的只提供了一个 *.vim文件, 比如 python_fold.vim, 这时只需要将 *.vim文件放在 ~/.vim/ftplugin 目录下即可. 

### 5. 插件使用

1. python_fold 

   | **zo** | 將游標所在處的折疊打開。**o**pen。                           |
   | ------ | ------------------------------------------------------------ |
   | **zc** | 將游標所在處已打開的內容再度折疊起來。**c**lose。            |
   | **zr** | 將全文的所有折疊依層次通通打開。**r**educe。                 |
   | **zm** | 將全文已打開的折疊依層次通通再折疊起來。**m**ore。           |
   | **zR** | 作用和 zr 同，但會打開含巢狀折疊（折疊中又還有折疊）的所有折疊。 |
   | **zM** | 作用和 zm 同，但對於巢狀折疊亦有作用。                       |
   | **zi** | 這是個切換，是折疊與不折疊指令間的切換。                     |
   | **zn** | 打開全文的所有折疊。fold **n**one。                          |
   | **zN** | 這是 zn 的相對指令，回復所有的折疊。                         |



<hr>
 王礼萍  原创<br>

 更多内容请访问 https://wanglp.site <br>





