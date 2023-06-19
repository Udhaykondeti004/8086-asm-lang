org 100h
.data
a db 1,2,3,4,5
avg db ?
.code
mov cx,5
mov si,0
mov bl,5
mov al,0
loop1:
ADD al,a[si] 
INC si
loop loop1
mov ah,0
div bl
mov avg,al 

mov ah,0Eh
mov al,avg
Add al,48d
int 10h

Hlt 

ret