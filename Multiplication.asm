include 'emu8086.inc'

data segment
a dw 11    ;number in decimel, you can also write in hexa;
            ; however, answer will be in decimal
b dw 2
c dd ?
data ends
 
code segment
assume ds:data, cs:code
start:
mov ax,data
mov ds,ax
mov ax,a
mov bx,b
mul bx
mov word ptr c,ax
mov word ptr c+2,dx
code ends       


GOTOXY 10, 5

;; print AX register ;;
CALL print_num
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS ; required for print_num

end start







