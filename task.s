.data
printf_format: .string "%d\n"
array: .byte -1, 2, 3, -4, -5, 6, -7, 8, 9, -10
array_end:
array_size: .long (array_end - array)
A: .byte 0
B: .byte 9
overflow_err: .ascii "overflow!\n"
len = . - overflow_err

.text
.global main
main:
        movl $0, %eax
        movl $0, %ebx
        movl $0, %edx
        movb A, %dh
        movb B, %dl

loop_start:
        cmpb $0, array(%ebx)
        jle less
        cmpb %dh, array(%ebx)
        jle less
        cmpb %dl, array(%ebx)
        jge less
        addb array(%ebx), %al

less:
        incl %ebx
        cmpl array_size, %ebx
        jge print_sum
        jmp loop_start

print_sum:
        pushl %eax
        pushl $printf_format
        call printf
        addl $8, %esp
        jo err 
        jmp loop_end

err:
        pushl $len
        pushl $overflow_err
        pushl $1
        call write
        addl $12,%esp
        jmp loop_end

loop_end:
        movl $0, %eax
        movl $0, %ebx
        movl $0, %edx
        ret

