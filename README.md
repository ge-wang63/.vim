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
