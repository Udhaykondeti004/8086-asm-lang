
;AP21110011381

org 100h
.data
    string db "Welcome to SRMAP$"
    vowel_count db 0

.code
    mov ax, @data
    mov ds, ax

    mov cx, 15  ; length of the string
    lea si, string
    mov bl, 0   ; for vowel_count

count_vowels:
    mov al, [si]
    cmp al, '$'
    je done

    cmp al, 'a'
    je increment
    cmp al, 'e'
    je increment
    cmp al, 'i'
    je increment
    cmp al, 'o'
    je increment
    cmp al, 'u'
    je increment
    cmp al, 'A'
    je increment
    cmp al, 'E'
    je increment
    cmp al, 'I'
    je increment
    cmp al, 'O'
    je increment
    cmp al, 'U'
    je increment

    jmp next

increment:
    inc bl

next:
    inc si
    loop count_vowels

done:
    mov vowel_count, bl 

    mov ah, 09h 
    lea dx, msg
    int 21h

    mov ah, 02h 
    mov dl, vowel_count
    add dl, '0'
    int 21h

    mov ah, 4ch
    int 21h

    msg db 'Number of vowels in the string: $'

end
