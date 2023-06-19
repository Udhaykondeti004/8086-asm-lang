
;AP21110011381

include 'emu8086.inc'
org 100h
.data
arr db 9,2,4,1,7
.code
mov ax,@data
mov ds,ax
mov cx,05
mov si,offset arr
GOTOXY 10,5
print "Array before sorting: "
l1:
mov dl,[si]
add dl,48
mov ah,02h
int 21h
mov dl,32
mov ah,02h
int 21h
inc si
loop l1
mov ch,05
l3:
mov cl,05
mov si,offset arr
l2:
mov al,[si]
mov bl,[si+1]
cmp al,bl
JC miss
mov dl,[si+1]
xchg [si],dl
mov [si+1],dl
miss:
inc si
dec cl
JNZ l2
dec ch
jnz l3
mov si,offset arr
GOTOXY 10,6
print "Array after sorting: "
mov cx,05
l4:
mov dl,[si]
add dl,48
mov ah,02h
int 21h
mov dl,32
mov ah,02h
int 21h
inc si
loop l4
hlt

