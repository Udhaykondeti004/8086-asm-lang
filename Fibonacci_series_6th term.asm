include 'emu8086.inc'
org 100h
.data 
z db 10 dup(?)
b db 0
c db 1
fib db ?
msg1 DB "Fibonacci number: ", 0

.code 
mov ax,@data
mov ds,ax 
mov cx,6      ; 6th term in series
mov al,b
mov bl,c
mov z[si],al
mov z[si+1],bl 
l1: 
add al,bl
mov bh,al
mov al,bl
mov bl,bh 
mov z[si+2],bh
inc si
loop l1
mov fib,bl  
  
; Just to print  
GOTOXY 10,5
LEA SI, msg1       ; set up pointer (SI) to msg  ; to ask for the number              
CALL print_string   ; print message that SI points to

mov ah, 0h;
mov al, fib 

CALL print_num
;; print AX register ;;
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS ; required for print_num 
;DEFINE_GET_STRING
DEFINE_PRINT_STRING    
hlt
