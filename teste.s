	.file	"teste.c"
	.text
	.globl	Juntar
	.type	Juntar, @function


#pushl $v1Aux           24
#pushl $8 # fim         20
#pushl $0 # meio        16
#pushl $0 # ini         12
#pushl $v1              8
Juntar:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp) # esq
	movl	16(%ebp), %eax
	movl	%eax, -8(%ebp) # dir
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp) # ini
	jmp	.L2
.L6:
	movl	-4(%ebp), %eax # esq
	cmpl	16(%ebp), %eax # meio
	jge	.L3
	movl	-8(%ebp), %eax # dir
	cmpl	20(%ebp), %eax # fim
	jge	.L4
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jge	.L3
.L4:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	24(%ebp), %edx
	addl	%ecx, %edx
	movl	(%eax), %eax
	movl	%eax, (%edx)
	addl	$1, -4(%ebp)
	jmp	.L5
.L3:
	movl	-8(%ebp), %eax # meio
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	24(%ebp), %edx
	addl	%ecx, %edx
	movl	(%eax), %eax
	movl	%eax, (%edx)
	addl	$1, -8(%ebp)
.L5:
	addl	$1, -12(%ebp)
.L2:
	movl	-12(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L6
	nop
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	Juntar, .-Juntar
	.globl	MergeSort
	.type	MergeSort, @function
MergeSort:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	16(%ebp), %eax
	subl	12(%ebp), %eax
	cmpl	$1, %eax
	jle	.L10
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -12(%ebp)
	pushl	20(%ebp)
	pushl	-12(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	MergeSort
	addl	$16, %esp
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	-12(%ebp)
	pushl	8(%ebp)
	call	MergeSort
	addl	$16, %esp
	subl	$12, %esp
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	-12(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	Juntar
	addl	$32, %esp
	jmp	.L7
.L10:
	nop
.L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	MergeSort, .-MergeSort
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$108, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	-68(%ebp), %edx
	movl	$0, %eax
	movl	$10, %ecx
	movl	%edx, %edi
	rep stosl
	movl	$9, -68(%ebp)
	movl	$8, -64(%ebp)
	movl	$2, -60(%ebp)
	movl	$6, -56(%ebp)
	movl	$5, -52(%ebp)
	movl	$4, -48(%ebp)
	movl	$3, -44(%ebp)
	movl	$7, -40(%ebp)
	movl	$1, -36(%ebp)
	leal	-108(%ebp), %eax
	pushl	%eax
	pushl	$10
	pushl	$0
	leal	-68(%ebp), %eax
	pushl	%eax
	call	MergeSort
	addl	$16, %esp
	movl	$0, -28(%ebp)
	jmp	.L12
.L13:
	movl	-28(%ebp), %eax
	movl	-68(%ebp,%eax,4), %eax
	subl	$8, %esp
	pushl	%eax
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	addl	$1, -28(%ebp)
.L12:
	cmpl	$9, -28(%ebp)
	jle	.L13
	movl	$0, %eax
	leal	-12(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB3:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE3:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB4:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE4:
	.ident	"GCC: (Debian 13.1.0-6) 13.1.0"
	.section	.note.GNU-stack,"",@progbits
