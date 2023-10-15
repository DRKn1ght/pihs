.section .data
    num1: .long 0
    num2: .long 0
    num3: .long 0
    scan_str: .string "%d %d %d"
    print_str: .string "digite 3 numeros: "
    print_gnum: .string "maior numero: %d\n"
    print_lnum: .string "menor numero: %d\n"
    print_all_str: .string "ordenados: %d %d %d\n"

.section .text
    .globl main

main:
    pushl $print_str
    call printf
    add $4, %esp

    pushl $num3
    pushl $num2
    pushl $num1
    pushl $scan_str
    call scanf
    addl $16, %esp

    movl num1, %eax
    movl num2, %ebx
    movl num3, %ecx
    cmp %eax, %ebx
    jle menor
    cmp %ecx, %ebx
    jge maior
    jmp print_all
    ret

menor:
    movl %ebx, %edx
    movl %eax, %ebx
    movl %edx, %eax
    cmp %ecx, %ebx
    jge maior
    jmp print_all
    ret

maior:
    movl %ebx, %edx
    movl %ecx, %ebx
    movl %edx, %ecx
    cmp %eax, %ebx
    jle menor
    jmp print_all
    ret

print_all:
    pushl %ecx
    pushl %ebx
    pushl %eax
    pushl $print_all_str
    call printf
    addl $16, %esp
    ret