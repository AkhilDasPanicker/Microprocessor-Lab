assume cs:code,ds:data
data segment
        str1 db "hello$"
        str2 db "h$"
        nfd db "not found$"
        fd db "found$"
data ends
code segment
start: mov ax,data
       mov ds,ax
       mov es,ax
       lea si,str1
       lea di,str2
       mov cx,06h
       cld
       repne scasb
       jz l1
       lea dx,nfd
       jmp l2
l1:    lea dx,fd
l2:    mov ah,09h
       int 21h
       mov ah,4ch
       int 21h
code ends
end start
