.section .data
    max: .int 0
    min: .int 99999
    minTemp: .int 0
    numBase: .int 4
    minPos: .int 0
    vetorTxt: .asciz "\nvetor: "
    vetorElemTxt: .string "%d, "
    scanVec: .string "%d"
    conti: .int 0
    contj: .int 0
    v1: .int 0, 0, 0, 0, 0, 0, 0, 0

.section .text
.globl main

main:
    movl $v1, %edi
    call insert
    pushl $vetorTxt
    call printf
    addl $4, %esp
    call printVec
    call getMin
    ret

insert:
    pushl %edi
    pushl $scanVec
    call scanf
    addl $4, %edi
    addl $1, conti
    addl $8, %esp
    cmpl $8, conti
    jl insert
    movl $0, conti
    movl $0, %edi
    movl $v1, %edi
    ret

printVec:
    pushl (%edi)
    pushl $vetorElemTxt
    call printf
    addl $8, %esp
    addl $4, %edi
    addl $1, conti
    cmpl $8, conti
    jl printVec
    movl $0, conti
    movl $0, %edi
    movl $v1, %edi
    ret

# Guarda a pos do menor em 'minPos' e o valor do menor em 'min'
getMin:
    cmpl $8, conti
    je finishMin
    addl $1, conti
    movl min, %eax
    cmpl %eax, (%edi)
    jle getMinAux
    addl $4, %edi
    call getMin
    ret

getMinAux:
    movl (%edi), %eax
    movl %eax, min
    movl conti, %eax
    movl %eax, minPos
    addl $4, %edi
    call getMin
    ret

finishMin:
    subl $1, minPos
    call switchPos
    addl $1, contj

    # Printa vetor atual
    movl $v1, %edi
    movl $0, conti
    pushl $vetorTxt
    call printf
    call printVec
    addl $4, %esp

    # Atualiza index para o prox mínimo
    movl contj, %eax
    movl numBase, %ebx
    movl %eax, conti
    imul %ebx, %eax
    movl $v1, %edi
    addl %eax, %edi

    movl $9999, min
    movl $0, minPos
    cmpl $8, contj
    jl getMin
    
    # Printa vetor final
    movl $0, conti
    movl $v1, %edi
    pushl $vetorTxt
    call printf
    call printVec
    addl $4, %esp
    ret


# Inverte o valor que está guardado na posição minPos para 
# a posição correta no vetor 
switchPos:
    # Calcula o endereço do menor elemento e guarda em eax
    movl minPos, %eax
    movl numBase, %ebx
    imul %ebx, %eax

    # Calcula o endereço que o menor elemento deve ir e guarda em ecx
    # com base no contador contj (outer loop)
    movl contj, %ecx
    imul %ebx, %ecx

    # Inverte os valores de eax com ecx no vetor
    movl $v1, %edi
    addl %ecx, %edi
    movl (%edi), %edx
    movl %edx, minTemp
    movl min, %edx
    movl %edx, (%edi)

    movl $v1, %edi
    addl %eax, %edi
    movl minTemp, %edx
    movl %edx, (%edi)
    ret
