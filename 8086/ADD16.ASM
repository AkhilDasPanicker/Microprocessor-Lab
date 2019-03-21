assume cs:code,ds:data
data segment
a dw 0202h
b dw 0408h
c dw ?
data ends
code segment
start:
mov ax,data
mov ds,ax
mov ax,a
mov bx,b
add ax,bx

mov ah,4ch
int 21h
code ends
end start 
