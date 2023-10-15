.section .data
    max: .int 0
    min: .int 99999
    vetorTxt: .asciz "vetor: "
    qntTxt: .string "\n numero de triang: %d"
    vetorElemTxt: .string "%d, "
    scanVec: .string "%d"
    cont: .int 0
    result: .int 0
    num1: .int 1
    num2: .int 2
    num3: .int 3
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
    jmp isRet
    ret

isRet:
    cmp $8, cont
    je finishIsRet
    addl $1, cont

    movl num1, %eax
    movl num2, %ebx
    imul %ebx, %eax
    movl num3, %ebx
    imul %ebx, %eax
    cmp %eax, (%edi)
    je isRetAux
    cmp %eax, (%edi)
    jl isNotRet
    addl $1, num1
    addl $1, num2
    addl $1, num3
    addl $4, %edi
    jmp isRet

isRetAux:
    addl $1, result
    addl $4, %edi
    movl $1, num1
    movl $2, num2
    movl $3, num3
    movl $0, %eax
    jmp isRet

isNotRet:
    addl $4, %edi
    movl $1, num1
    movl $2, num2
    movl $3, num3
    jmp isRet

finishIsRet:
    pushl result
    pushl $qntTxt
    call printf
    addl $8, %esp
    ret