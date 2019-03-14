.model small
.data

        num db 9
.code
        mov a1,num
        mov ah,#00h
        mov cx,
        int 21h
.exit
end



