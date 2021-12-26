# .vim
vim设定

## 插件

### nerdtree

map映射：

```vim
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
```

常用命令：

o 进入目录或者打开文件  
t 在新的标签页中打开所选文件  
q 关闭NERDTree  
P 跳到根节点  
p 跳到父节点  
R 刷新当前根路径  
r 刷新光标所在目录  
I 显示或关闭隐藏文件  
i 在新的水平拆分窗口中打开所选文件  
s 在新的垂直拆分窗口中打开所选文件  
A 全屏显示NERDTree，活着关闭全凭  
C 将根目录设置为光标所在路径


### ctrlp

常用命令：

ctrl-d: 切换是查找文件还是查找整个路径


排除不进行查找的文件或者目录：

```vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
```


### smartim

解决Mac平台切换Normal模式自动切换英文输入法问题
