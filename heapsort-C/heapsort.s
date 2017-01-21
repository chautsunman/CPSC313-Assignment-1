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
	movl	%edi, %ebx		# move (copy) the value of register edi (low 32-bit of register rdi) to register ebx (low 32-bit of register rbx) as local variable (line 18 of C (i = last))
	call	heapify_array		# call function heapify_array, argument last is in register rdi/edi, and it is also saved in the last instruction according to cdecl calling convention (line 17 in C (heapify_array(last)))
	testl	%ebx, %ebx		# test register ebx (last) (last < 0?) by setting the sign flag and zero flag for branching (line 18 of C (i >= 0))
	js	.L1		# jump to L1 (return) if last < 0 (the last arithmetic operation/test set the sign flag) (line 18 of C (i >= 0))
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%ebx, %edi		# move (copy) the value of register ebx (low 32-bit of register rbx) to register edi (low 32-bit of register rdi) as argument
	call	extract_max		# call function extract_max, argument last is in register rdi/edi according to cdecl calling convention, and it is also saved according to cdecl calling convention (line 20 of C (extract_max(i)))
	movslq	%ebx, %rdx		# move (copy) the value of register ebx (low 32-bit of register rbx) to register rdx, sign-extending from 4 bytes to 8 bytes
	subl	$1, %ebx		# substitute 1 from register ebx and store the result back to ebx (line 18 of C (i--))
	cmpl	$-1, %ebx		# compare -1 and the value in register ebx (i) by computing value in ebx - -1 and setting the sign flag and zero flag (condition codes) for branching (line 18 of C (i >= 0))
	movl	%eax, heap(,%rdx,4)		# move (copy) the value in register eax which is the result from function call extract_max to the memory location heap as base + index in register rdx (i) * 4 (size of int) (heap[i]) (line 20 of C (heap[i] = extract_max(i)))
	jne	.L7		# jump to L7 (loop) if ebx - -1 != 0, that is ebx (i) != -1, that is (i >= 0) (the last compare in line 23 set the zero flag) (line 18 of C (i >= 0))
.L1:
	popq	%rbx		# pop the top element from the stack to register rbx
	.cfi_def_cfa_offset 8
	ret		# return the heapsort function to the caller
	.cfi_endproc
.LFE11:
	.size	heapsort, .-heapsort
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
