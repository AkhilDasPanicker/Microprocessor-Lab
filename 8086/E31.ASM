 print macro msg        
   lea dx,msg        
   mov ah,09h        
   int 21h   
 endm    
 
   read macro n,j1,j2       
   mov cx,0ah     
 j1:mov ah,01h        
   int 21h                             
   cmp al,0dh        
   je j2        
   sub al,30h     
   mov bl,al     
   mov ax,n      
   mul cx     
   xor bh,bh    
   add ax,bx     
   mov n,ax     
   jmp j1   
 j2 :nop   
 endm    
.model small   
.stack 100h    
.data    
   msg1 db 10,13,'Enter the 1st number: $'    
   msg2 db 10,13,'Enter the 2nd number: $'     
   msg3 db 10,13,'The Sum= $'      
   num1 dw 0    
   num2 dw 0    
 .code     
  main proc     
   mov ax,@data    
   mov ds,ax    
   print msg1        
   ;reading 1st multidigit number   


    read num1,jump1,jump2          
    print msg2     
    ;reading 2nd multidigit number    
    read num2,jump3,jump4         
  ;finding sum    
   mov ax,num1    
   add ax,num2       
    ;printing number   
    mov bx,000ah    
   xor cx,cx        
   ;push into stack 
    p1:xor dx,dx    
   div bx    
   push dx     
   inc cx    
   cmp ax,0000h   
   jne p1     
   print msg3    
  ;pop from stack  
  display:pop dx    
   add dl,30h    
   mov ah,02h    
   int 21h    
   loop display    
   mov ah,4ch    
   int 21h   
 main endp   
end 