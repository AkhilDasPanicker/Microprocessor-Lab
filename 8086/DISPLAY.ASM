assume cs:code ds:data
data segment
        num ab,04h
data ends
code segment
start:  mov ax,data
        mov ds,ax
        mov al,num
        mov ad,al
        add all,30h
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
