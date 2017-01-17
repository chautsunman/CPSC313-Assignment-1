	.file	"heapsort.c"
	.text
	.p2align 4,,15
	.globl	heapsort
	.type	heapsort, @function
heapsort:
.LFB11:
	.cfi_startproc
	pushq	%rbx		# push register rbx onto the stack
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx		# move (copy) the value of register edi (low 32-bit of register rdi) to register ebx (low 32-bit of register rbx) as local variable
	call	heapify_array		# call function heapify_array, argument last is in register rdi/edi, and it is also saved in the last instruction according to cdecl calling convention
	testl	%ebx, %ebx		# test register ebx (last) (last < 0?) by setting the sign flag and zero flag for branching
	js	.L1		# jump to L1 (return) if last < 0 (the last arithmetic operation/test set the sign flag)
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%ebx, %edi		# move (copy) the value of register ebx (low 32-bit of register rbx) to register edi (low 32-bit of register rdi) as argument
	call	extract_max		# call function extract_max, argument last is in register rdi/edi according to cdecl calling convention, and it is also saved according to cdecl calling convention
	movslq	%ebx, %rdx
	subl	$1, %ebx
	cmpl	$-1, %ebx
	movl	%eax, heap(,%rdx,4)
	jne	.L7
.L1:
	popq	%rbx		# pop the top element from the stack to register rbx
	.cfi_def_cfa_offset 8
	ret		# return the heapsort function to the caller
	.cfi_endproc
.LFE11:
	.size	heapsort, .-heapsort
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
