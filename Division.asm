include 'emu8086.inc'

data SEGMENT
a dw 014
b dw 05
c dd ?
msg1 DB "Quotient is : ",0 ;0 defines end of string
msg2 DB "Remainder is : ",0
data ends

code segment
; assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ax,a
mov bx,b 
div bx
mov word ptr c,ax
mov word ptr c+2,dx
code ends
 
; quotient printing

GOTOXY 5,2
LEA SI,msg1
CALL print_string
CALL print_num

GOTOXY 5,4
mov ax,dx
LEA SI,msg2
CALL print_string
CALL print_num

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

DEFINE_PRINT_STRING
end start



