.section .data
    floatVal: .space 64
    scan: .asciz "\nInsira os numeros (inserir 0 finaliza): \n"
    result: .asciz "\nResultado: %.4f\n"
    format: .asciz "%f"
    insertStr: .asciz "> "
    baseTxt: .asciz "Valor da base:\n"
    alturaTxt: .asciz "Valor da altura:\n"
    menu: .asciz "\nSelecione uma opcao:\n[1] - Soma\n[2] - Subtracao\n[3] - Divisao\n[4] - Multiplicacao\n[5] - Area do triangulo\n[6] - Raiz quadrada\n[7] - Sair\n> "
    two: .float 2
    opcao: .int 0
    opcaoFormat: .asciz "%d"

.section .text
    .global main

main:
    jmp loopProgram

loopProgram:
    finit
    pushl $menu
    call printf
    addl $4, %esp

    pushl $opcao
    pushl $opcaoFormat
    call scanf
    addl $8, %esp

    cmpl $1, opcao
    je sumAll
    cmpl $2, opcao
    je subAll 
    cmpl $3, opcao
    je divAll
    cmpl $4, opcao
    je mulAll 
    cmpl $5, opcao
    je triArea
    cmpl $6, opcao
    je sqrtAll
    cmpl $7, opcao
    je exitProgram
    
    jmp loopProgram
    
sumAll:
    call askInput
    call askNum
    flds floatVal
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitSumAll
    jmp sumAllLoop

sumAllLoop:
    call askNum
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitSumAll
    flds floatVal
    faddp
    jmp sumAllLoop

exitSumAll:
    subl $8, %esp
    fstl (%esp)
    pushl $result
    call printf
    addl $12, %esp
    jmp loopProgram

subAll:
    call askInput
    call askNum
    flds floatVal 
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitSubAll
    jmp subAllLoop

subAllLoop:
    call askNum
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitSubAll
    flds floatVal
    fxch
    fsubp
    jmp subAllLoop

exitSubAll:
    subl $8, %esp
    fstl (%esp)
    pushl $result
    call printf
    addl $12, %esp
    jmp loopProgram

divAll:
    call askInput
    call askNum
    flds floatVal 
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitDivAll
    jmp divAllLoop

divAllLoop:
    divAllLoop:
    call askNum
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitDivAll
    flds floatVal
    fxch
    fdivp
    jmp divAllLoop

exitDivAll:
    subl $8, %esp
    fstl (%esp)
    pushl $result
    call printf
    addl $12, %esp
    jmp loopProgram

mulAll:
    call askInput
    call askNum
    flds floatVal 
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitDivAll
    jmp mulAllLoop

mulAllLoop:
    mulAllLoop:
    call askNum
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitMulAll
    flds floatVal
    fmulp
    jmp mulAllLoop

exitMulAll:
    subl $8, %esp
    fstl (%esp)
    pushl $result
    call printf
    addl $12, %esp
    jmp loopProgram

triArea:
    pushl $baseTxt
    call printf
    addl $4, %esp

    call askNum
    flds floatVal
    
    pushl $alturaTxt
    call printf
    addl $4, %esp
    
    call askNum
    flds floatVal

    fmulp

    flds two
    fxch
    fdivp

    subl $8, %esp
    fstl (%esp)
    pushl $result
    call printf
    addl $12, %esp
    jmp loopProgram

sqrtAll:
    call askInput
    call askNum
    flds floatVal 
    flds floatVal
    fmulp
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitDivAll
    jmp sqrtAllLoop

sqrtAllLoop:
    sqrtAllLoop:
    call askNum
    movl $floatVal, %eax
    cmpl $0, (%eax)
    je exitSqrtAll
    flds floatVal
    flds floatVal
    fmulp
    faddp
    jmp sqrtAllLoop

exitSqrtAll:
    subl $8, %esp
    fstl (%esp)
    pushl $result
    call printf
    addl $12, %esp
    jmp loopProgram


askInput:
    pushl $scan
    call printf
    addl $4, %esp
    ret

askNum:
    pushl $insertStr
    call printf
    addl $4, %esp

    pushl $floatVal
    pushl $format
    call scanf
    addl $8, %esp
    ret

exitProgram:
    ret