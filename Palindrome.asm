
;AP21110011381

org 100h

jmp start

m1:
s db 'madam'
s_size = $ - m1
  db 0Dh,0Ah,'$'

start:
mov ah, 9                               ; Set the AH register to 9, which is the DOS "print string" function code
mov dx, offset s                        ; Load the DX register with the offset address of the string s
int 21h                                 ; Call the DOS interrupt 21h, which executes the "print string" function

lea di, s                               ; Load the effective address of the string s into the DI register
mov si, di                              ; Copy the value of DI into the SI register
add si, s_size                          ; Add the size of the string s to the value of SI
dec si                                  ; Decrement the value of SI by 1 to point to the last character of the string

mov cx, s_size                          ; Copy the size of the string s into the CX register
cmp cx, 1                               ; Compare the size of the string to 1
je is_palindrome                        ; If the size of the string is 1, jump to the is_palindrome label
shr cx, 1                               ; Shift the value of CX right by 1 to get the number of character pairs to compare
next_char:
    mov al, [di]                        ; Move the byte at the memory location pointed to by DI into the AL register
    mov bl, [si]                        ; Move the byte at the memory location pointed to by SI into the BL register
    cmp al, bl                          ; Compare the contents of the AL and BL registers
    jne not_palindrome                  ; If they are not equal, jump to the not_palindrome label
    inc di                              ; Increment the value of DI to point to the next character in the string
    dec si                              ; Decrement the value of SI to point to the previous character in the string
loop next_char                          ; Decrement CX and loop back to next_char if CX is not zero
is_palindrome:  
   mov dx, offset msg1                  ; Move the offset of the "this is palindrome!" message into the DX register
   int 21h                              ; Print the message to the console using the DOS interrupt 21h
jmp stop                                ; Jump to the stop label

not_palindrome:
   mov ah, 9                            ; Set the AH register to 9 to indicate a print string function call
   mov dx, offset msg2                  ; Move the offset of the "this is not a palindrome!" message into the DX register
   int 21h                              ; Print the message to the console using the DOS interrupt 21h

stop:
   mov ah, 0                            ; Set the AH register to 0 to indicate a keyboard input function call
   int 16h                              ; Wait for a key press using the BIOS interrupt 16h

ret                                     ; Return control to the operating system
msg1 db "  this is palindrome!$"        ; Define a null-terminated ASCII message for printing when the string is a palindrome
msg2 db "  this is not a palindrome!$"  ; Define a null-terminated ASCII message for printing when the string is not a palindrome