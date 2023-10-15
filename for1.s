.section .data
    cont: .long 0
    print_i: .string "cont: %d\n"

.section .text
    .globl main

main:
    movl $0, cont
    movl cont, %eax
    jmp loop
    ret

loop:
    movl %eax, %ebx
    pushl %eax
    pushl $print_i
    call printf
    addl $8, %esp
    movl %ebx, %eax
    addl $1, %eax
    cmp $10, %eax
    jl loop
    jmp end
    ret

end:
    pushl %eax
    pushl $print_i
    call printf
    addl $8, %esp
    ret