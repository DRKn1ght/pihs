.section .data
    max: .int 0
    min: .int 99999
    vetorTxt: .asciz "vetor: "
    maiorTxt: .string "\nmaior: %d"
    menorTxt: .string "\nmenor: %d"
    vetorElemTxt: .string "%d, "
    scanVec: .string "%d"
    cont: .int 0
    v1: .int 0, 0, 0, 0, 0, 0, 0, 0

.section .text
.globl main

main:
    movl $v1, %edi
    jmp insert

insert:
    pushl %edi
    pushl $scanVec
    call scanf
    addl $4, %edi
    addl $1, cont
    addl $8, %esp
    cmp $8, cont
    jl insert
    movl $0, cont
    movl $0, %edi
    movl $v1, %edi
    jmp printVec
    ret

printVec:
    pushl (%edi)
    pushl $vetorElemTxt
    call printf
    addl $8, %esp
    addl $4, %edi
    addl $1, cont
    cmp $8, cont
    jl printVec
    movl $0, cont
    movl $0, %edi
    movl $v1, %edi
    jmp getMax
    ret

getMax:
    cmp $8, cont
    je finishMax
    addl $1, cont
    movl max, %eax
    cmp %eax, (%edi)
    jge getMaxAux
    addl $4, %edi
    jmp getMax

getMaxAux:
    movl (%edi), %eax
    movl %eax, max
    addl $4, %edi
    jmp getMax

finishMax:
    pushl max
    pushl $maiorTxt
    call printf
    addl $8, %esp
    movl $0, cont
    movl $0, %edi
    movl $v1, %edi
    jmp getMin

getMin:
    cmp $8, cont
    je finishMin
    addl $1, cont
    movl min, %eax
    cmp %eax, (%edi)
    jle getMinAux
    addl $4, %edi
    jmp getMin

getMinAux:
    movl (%edi), %eax
    movl %eax, min
    addl $4, %edi
    jmp getMin

finishMin:
    pushl min
    pushl $menorTxt
    call printf
    addl $8, %esp
    movl $0, cont
    movl $0, %edi
    movl $v1, %edi
    ret