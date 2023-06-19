;AP21110011381

#start=Traffic_Lights.exe#

mov ax, red
out 4, ax ;sends the value to I/O port 4, which is used to control the traffic lights


mov si, offset situation


next:
mov ax, [si]
out 4, ax

; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch    ;    004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h ;specifies a delay func to be called
int     15h   ;interupts execution and calls BIOS


add si, 2 ; next situation
cmp si, s_end
jb  next
mov si, offset situation
jmp next


;                        FEDC_BA98_7654_3210  

situation        dw      0C0Ch
s1               dw      0D2Ah
s2               dw      0841h
s3               dw      0841h
s4               dw      0493h
s_end = $


red          equ     0099h

