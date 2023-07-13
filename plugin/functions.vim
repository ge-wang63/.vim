" JsonFormat
function! JsonFormat()
    " 将输出保存到寄存器 a 中
    let @a = system("python -m json.tool " . bufname("%")) 
    " 如果执行失败，则只打印错误信息
    if v:shell_error
        echom @a
    else
        " 执行成功，则写入缓冲区
        %delete
        normal! "ap
        1delete
        write
    endif
endfunction
