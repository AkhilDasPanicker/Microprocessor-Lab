assume cs:code,ds:data
readno macro num
local l,l1,l2,l3,l4
        mov dl,02h
        mov bl,00h
l:
        mov bh,bl
        mov ah,01h
        int 21h
        cmp al,39h
        jle l1
        sub al,37h
        jmp l2
l1:     sub al,30h
l2:     mov bl,al
        mov cl,04h
        shl bl,cl
        mov ah,01h
        int 21h
        cmp al,39h
        jle l3
        sub al,37h
        jmp l4
l3:     sub al,30h
l4:     add bl,al
        dec dl
        jnz l
        mov num,bx
endm

display macro n
local l1,l2,l3,l4,l5
        mov bx,n
        mov dh,02h
l1:
        mov dl,bh
        mov cl,04h
        shr dl,cl
        cmp dl,09h
        jc l2
        add dl,37h
        jmp l3
l2:
        add dl,30h
l3:     mov ah,02h
        int 21h
        mov dl,bh
        and dl,0fh
        cmp dl,09h
        jc l4
        add dl,37h
        jmp l5
l4:     add dl,30h
l5:
        mov ah,02h
        int 21h
        mov bh,bl
        dec dh
        jnz l1
endm
data segment
msg1 db 0Ah,"enter the first number: $"
msg2 db 0Ah,"enter the second number: $"
msg3 db 0Ah,"quotient is: $"
msg4 db 0Ah,"remainder is: $"
n1 dw ?
n2 dw ?
n3 dw ?
n4 dw ?
s1 dw ?
s2 dw ?
data ends
code segment
start:
	xor dx,dx
        mov ax,data
        mov ds,ax
        lea dx,msg1
        mov ah,09h
        int 21h
        readno n1
	readno n2
	
        lea dx,msg2
        mov ah,09h
        int 21h
        readno n3

        mov ax,n1
        mov bx,n2
	mov cx,n3

        div cx

        mov s1,ax
	mov ax,bx
	div cx
	mov s2,ax
	mov n4,dx

        lea dx,msg3
        mov ah,09h
        int 21h
        
	display s1
	display s2
	
	lea dx,msg4
        mov ah,09h
        int 21h
	
	display n4

        mov ah,4ch
        int 21h
code ends
end start
