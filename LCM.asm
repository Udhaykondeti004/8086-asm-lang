include 'emu8086.inc'

org 100h
.data
a db 25
b db 4
lcm  db ?
.code
mov ax,@data
mov ds,ax
mov ah,0
mov al,a
mov bl,b
mov bh,al
div bl
cmp ah,0
je exit
jne l1
l1:
mov ah,0
mov al,bh
add al,a
mov bh,al
div bl
cmp ah,0
je exit
jne l1
exit:
mov lcm,bh 

;; print AX register ;;
mov AH,0h
mov AL, lcm
CALL print_num 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS ; required for print_num  
hlt