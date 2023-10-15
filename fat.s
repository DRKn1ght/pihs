.section .data
    format: .asciz "%d\n"
    scan: .asciz "%d"

.section .text
    .globl main
    main:
        pushl $6
        call factorial
        addl $4, %esp

        pushl %eax
        pushl $format
        call printf
        addl $8, %esp

        movl $1, %eax
        xorl %ebx, %ebx
        int $0x80

    printFat:
        pushl %ebp
        movl %esp, %ebp
        pushl %eax
        pushl 8(%ebp)
        pushl $format
        call printf
        addl $8, %esp
        popl %eax
        popl %ebp
        ret

    factorial:
        pushl %ebp
        movl %esp, %ebp

        movl 8(%ebp), %eax
        cmpl $1, %eax
        jle end_factorial

        decl %eax
        pushl %eax
        call factorial
        addl $4, %esp
        movl 8(%ebp), %ebx
        imull %ebx, %eax
        pushl %eax
        call printFat
        addl $4, %esp

    end_factorial:
        movl %ebp, %esp
        popl %ebp
        ret
