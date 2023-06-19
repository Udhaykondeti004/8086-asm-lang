org 100h        ;100H says that the machine code starts from 
                ;address 100h in this segment,;
                ; effective address is CS:100H 
                
.data
a db 0,1,2,3,4,5,6,7,8,9
.code
MoV cx,10
mov si,0 
loop1:  
mov al,a[si]
mov dl,al
add dl,48d    ; takes the dl (1,2,3,.), then adds 48 which gives 49,50 (decimal) ;That's the ASCII code for the character 2
mov ah,2h
int 21h          ;INT 21H will generate the software 
                 ;interrupt 0x21 (33 in decimal), causing the function pointed to by 
                 ;the 34th vector in the interrupt table to be executed, which is typically an MS-DOS API call.
INC si
loop loop1
hlt                    


;;INT 21H:   


;# 01H
;MOV, AH 01H; request keyboard input INT 21H
;- Returns character in AL. IF AL= nonzero value, operation echoes on the screen. If Al=
;zero means that user has pressed an extended function key such as F1 OR home.
;# 02H
;MOV AH, 02H; request display character
;MOV DL, CHAR; character to display
;INT 21H
;- Display character in D2 at current cursor position. The tab, carriage return and line feed
;characters act normally and the operation automatically advances the cursor.
;# 09H
;MOV Ah, 09H; request display
;LEA DX, CUST_MSG; local address of prompt
;INNT 21H
;CUST_MSG DB “Hello world”, 
;- Displays string in the data area, immediately followed by a dollar sign ($ or 24H), which
;uses to end the display. 

;It is called the DOS function call for keyboard operations follow the function number. The
;service functions are listed below:
;# 00H- It terminates the current program.
;- Generally not used, function 4CH is used instead.
;# 01H- Read a character with echo
;- Wait for a character if buffer is empty
;- Character read is returned in AL in ASCII value
;# 02H- Display single character
;- Sends the characters in DL to display
;- MOV AH, 02H
;- MOV DL, ‘A’ ; move Dl, 65
;- INT 21H
;# 03H and 04H – Auxiliary input/output
;- INT 14H is preferred.
;# 05H – Printer service
;- Sends the character in DL to printer
;# 06H- Direct keyboard and display
;- Displays the character in DL.
;# 07H- waits for a character from standard input 


