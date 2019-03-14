assume cs:code,ds:data
data segment
msg1 db 'enter  number : $'
msg2 db '  enter another number : $'
result db ' sum is: $'
data ends
code segment
start:
mov ax,data
mov ds,ax
lea dx,msg1
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov bl,al
lea dx,msg2
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
lea dx,result
mov ah,09h
int 21h
add ax,bx
mov dx,ax
add dx,30h
mov ah,02h
int 21h
mov ah,4ch
int 21h
code ends
end start


