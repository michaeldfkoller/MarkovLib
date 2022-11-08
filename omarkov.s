	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 1
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z4ran2Pl
LCPI0_0:
	.quad	4467570830529789959     ## double 4.6566130573917691E-10
LCPI0_1:
	.quad	4607182417719153497     ## double 0.99999987999999995
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI0_2:
	.long	1065353214              ## float 0.99999988
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z4ran2Pl
	.p2align	4, 0x90
__Z4ran2Pl:                             ## @_Z4ran2Pl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %rsi
	movabsq	$-7183739866224372601, %r10 ## imm = 0x9C4E3AA71AE25487
	testq	%rsi, %rsi
	jle	LBB0_2
## %bb.1:
	movq	__ZZ4ran2PlE5idum2(%rip), %r9
	movq	__ZZ4ran2PlE2iy(%rip), %r8
	jmp	LBB0_7
LBB0_2:
	movq	%rsi, %rax
	negq	%rax
	testq	%rsi, %rsi
	movl	$1, %r9d
	cmovneq	%rax, %r9
	movq	%r9, (%rdi)
	movq	%r9, __ZZ4ran2PlE5idum2(%rip)
	movl	$39, %ecx
	leaq	__ZZ4ran2PlE2iv(%rip), %r8
	movq	%r9, %rsi
	jmp	LBB0_3
	.p2align	4, 0x90
LBB0_5:                                 ##   in Loop: Header=BB0_3 Depth=1
	addq	$-1, %rcx
	jae	LBB0_6
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	movq	%rsi, %rax
	imulq	%r10
	addq	%rsi, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$15, %rdx
	addq	%rax, %rdx
	imulq	$-53668, %rdx, %rax     ## imm = 0xFFFF2E5C
	addq	%rsi, %rax
	imulq	$40014, %rax, %rax      ## imm = 0x9C4E
	imulq	$-12211, %rdx, %rdx     ## imm = 0xD04D
	leaq	2147483563(%rax,%rdx), %rsi
	addq	%rdx, %rax
	cmovnsq	%rax, %rsi
	cmpq	$31, %rcx
	ja	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=1
	movq	%rsi, (%r8,%rcx,8)
	jmp	LBB0_5
LBB0_6:
	movq	%rsi, (%rdi)
	movq	__ZZ4ran2PlE2iv(%rip), %r8
	movq	%r8, __ZZ4ran2PlE2iy(%rip)
LBB0_7:
	movq	%rsi, %rax
	imulq	%r10
	addq	%rsi, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$15, %rdx
	addq	%rax, %rdx
	imulq	$-53668, %rdx, %rax     ## imm = 0xFFFF2E5C
	addq	%rsi, %rax
	imulq	$40014, %rax, %rax      ## imm = 0x9C4E
	imulq	$-12211, %rdx, %rdx     ## imm = 0xD04D
	leaq	2147483563(%rax,%rdx), %rcx
	addq	%rdx, %rax
	cmovnsq	%rax, %rcx
	movq	%rcx, (%rdi)
	movabsq	$5726900650010560005, %rdx ## imm = 0x4F7A09CC7BD54605
	movq	%r9, %rax
	imulq	%rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$14, %rdx
	addq	%rax, %rdx
	imulq	$-52774, %rdx, %rax     ## imm = 0xFFFF31DA
	addq	%r9, %rax
	imulq	$40692, %rax, %rax      ## imm = 0x9EF4
	imulq	$-3791, %rdx, %rdx      ## imm = 0xF131
	leaq	2147483399(%rax,%rdx), %rsi
	addq	%rdx, %rax
	cmovnsq	%rax, %rsi
	movq	%rsi, __ZZ4ran2PlE5idum2(%rip)
	movabsq	$-9223371761976860671, %rdx ## imm = 0x8000004000002001
	movq	%r8, %rax
	imulq	%rdx
	addq	%r8, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	shrq	$25, %rdx
	addl	%eax, %edx
	movslq	%edx, %rdx
	leaq	__ZZ4ran2PlE2iv(%rip), %rdi
	movq	(%rdi,%rdx,8), %rax
	movq	%rcx, (%rdi,%rdx,8)
	subq	%rsi, %rax
	movq	%rax, __ZZ4ran2PlE2iy(%rip)
	jg	LBB0_9
## %bb.8:
	addq	$2147483562, %rax       ## imm = 0x7FFFFFAA
	movq	%rax, __ZZ4ran2PlE2iy(%rip)
LBB0_9:
	cvtsi2sd	%rax, %xmm0
	mulsd	LCPI0_0(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm1
	ucomisd	LCPI0_1(%rip), %xmm1
	jbe	LBB0_11
## %bb.10:
	movss	LCPI0_2(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
LBB0_11:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z15vPrintTexNumberP7__sFILEd
LCPI1_0:
	.quad	-4586634745500139520    ## double -100
LCPI1_1:
	.quad	4636737291354636288     ## double 100
LCPI1_2:
	.quad	-4556648864387432448    ## double -1.0E+4
LCPI1_3:
	.quad	4666723172467343360     ## double 1.0E+4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z15vPrintTexNumberP7__sFILEd
	.p2align	4, 0x90
__Z15vPrintTexNumberP7__sFILEd:         ## @_Z15vPrintTexNumberP7__sFILEd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movsd	LCPI1_0(%rip), %xmm1    ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rax
	leaq	L_.str.1(%rip), %rsi
	cmovaq	%rax, %rsi
	ucomisd	LCPI1_1(%rip), %xmm0
	cmovaq	%rax, %rsi
	movsd	LCPI1_2(%rip), %xmm1    ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.3(%rip), %rax
	cmovaq	%rax, %rsi
	ucomisd	LCPI1_3(%rip), %xmm0
	cmovaq	%rax, %rsi
	movb	$1, %al
	popq	%rbp
	jmp	_fprintf                ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_VECTORC2Elll    ## -- Begin function _ZN9LV_VECTORC2Elll
	.p2align	4, 0x90
__ZN9LV_VECTORC2Elll:                   ## @_ZN9LV_VECTORC2Elll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	$8, %ecx
	movq	%rsi, %rax
	mulq	%rcx
	movq	%rsi, 24(%rdi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
	callq	__Znam
	movq	%rax, 32(%rbx)
	movq	%r15, 8(%rbx)
	movq	%r14, 16(%rbx)
	movq	$0, (%rbx)
	shlq	$3, %r12
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	___bzero
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_VECTORC1Elll    ## -- Begin function _ZN9LV_VECTORC1Elll
	.p2align	4, 0x90
__ZN9LV_VECTORC1Elll:                   ## @_ZN9LV_VECTORC1Elll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	$8, %ecx
	movq	%rsi, %rax
	mulq	%rcx
	movq	%rsi, 24(%rdi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
	callq	__Znam
	movq	%rax, 32(%rbx)
	movq	%r15, 8(%rbx)
	movq	%r14, 16(%rbx)
	movq	$0, (%rbx)
	shlq	$3, %r12
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	___bzero
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_VECTORD2Ev      ## -- Begin function _ZN9LV_VECTORD2Ev
	.p2align	4, 0x90
__ZN9LV_VECTORD2Ev:                     ## @_ZN9LV_VECTORD2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	32(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB4_1
## %bb.2:
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB4_1:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_VECTORD1Ev      ## -- Begin function _ZN9LV_VECTORD1Ev
	.p2align	4, 0x90
__ZN9LV_VECTORD1Ev:                     ## @_ZN9LV_VECTORD1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	32(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB5_1
## %bb.2:
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB5_1:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_VECTOR6vResetEv ## -- Begin function _ZN9LV_VECTOR6vResetEv
	.p2align	4, 0x90
__ZN9LV_VECTOR6vResetEv:                ## @_ZN9LV_VECTOR6vResetEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	24(%rdi), %rsi
	movq	32(%rdi), %rdi
	shlq	$3, %rsi
	callq	___bzero
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN9LV_VECTOR9dSetValueEld
LCPI7_0:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN9LV_VECTOR9dSetValueEld
	.p2align	4, 0x90
__ZN9LV_VECTOR9dSetValueEld:            ## @_ZN9LV_VECTOR9dSetValueEld
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testq	%rsi, %rsi
	js	LBB7_3
## %bb.1:
	cmpq	%rsi, 24(%rdi)
	jle	LBB7_3
## %bb.2:
	movq	32(%rdi), %rax
	movsd	%xmm0, (%rax,%rsi,8)
	popq	%rbp
	retq
LBB7_3:
	addsd	LCPI7_0(%rip), %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_VECTOR9dAddValueEld ## -- Begin function _ZN9LV_VECTOR9dAddValueEld
	.p2align	4, 0x90
__ZN9LV_VECTOR9dAddValueEld:            ## @_ZN9LV_VECTOR9dAddValueEld
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorpd	%xmm1, %xmm1
	testq	%rsi, %rsi
	js	LBB8_3
## %bb.1:
	cmpq	%rsi, 24(%rdi)
	jle	LBB8_3
## %bb.2:
	movq	32(%rdi), %rax
	addsd	(%rax,%rsi,8), %xmm0
	movsd	%xmm0, (%rax,%rsi,8)
	movapd	%xmm0, %xmm1
LBB8_3:
	movapd	%xmm1, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_VECTOR9dGetValueEl ## -- Begin function _ZN9LV_VECTOR9dGetValueEl
	.p2align	4, 0x90
__ZN9LV_VECTOR9dGetValueEl:             ## @_ZN9LV_VECTOR9dGetValueEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorps	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB9_3
## %bb.1:
	cmpq	%rsi, 24(%rdi)
	jle	LBB9_3
## %bb.2:
	movq	32(%rdi), %rax
	movsd	(%rax,%rsi,8), %xmm0    ## xmm0 = mem[0],zero
LBB9_3:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN10ILV_VECTORC2Elll  ## -- Begin function _ZN10ILV_VECTORC2Elll
	.p2align	4, 0x90
__ZN10ILV_VECTORC2Elll:                 ## @_ZN10ILV_VECTORC2Elll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	$8, %ecx
	movq	%rsi, %rax
	mulq	%rcx
	movq	%rsi, 24(%rdi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
	callq	__Znam
	movq	%rax, 32(%rbx)
	movq	%r15, 8(%rbx)
	movq	%r14, 16(%rbx)
	movq	$0, (%rbx)
	shlq	$3, %r12
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	___bzero
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN10ILV_VECTORC1Elll  ## -- Begin function _ZN10ILV_VECTORC1Elll
	.p2align	4, 0x90
__ZN10ILV_VECTORC1Elll:                 ## @_ZN10ILV_VECTORC1Elll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	$8, %ecx
	movq	%rsi, %rax
	mulq	%rcx
	movq	%rsi, 24(%rdi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
	callq	__Znam
	movq	%rax, 32(%rbx)
	movq	%r15, 8(%rbx)
	movq	%r14, 16(%rbx)
	movq	$0, (%rbx)
	shlq	$3, %r12
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	___bzero
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN10ILV_VECTORD2Ev    ## -- Begin function _ZN10ILV_VECTORD2Ev
	.p2align	4, 0x90
__ZN10ILV_VECTORD2Ev:                   ## @_ZN10ILV_VECTORD2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	32(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB12_1
## %bb.2:
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB12_1:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN10ILV_VECTORD1Ev    ## -- Begin function _ZN10ILV_VECTORD1Ev
	.p2align	4, 0x90
__ZN10ILV_VECTORD1Ev:                   ## @_ZN10ILV_VECTORD1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	32(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB13_1
## %bb.2:
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB13_1:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN10ILV_VECTOR6vResetEv ## -- Begin function _ZN10ILV_VECTOR6vResetEv
	.p2align	4, 0x90
__ZN10ILV_VECTOR6vResetEv:              ## @_ZN10ILV_VECTOR6vResetEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	24(%rdi), %rsi
	movq	32(%rdi), %rdi
	shlq	$3, %rsi
	callq	___bzero
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN10ILV_VECTOR9lSetValueEll ## -- Begin function _ZN10ILV_VECTOR9lSetValueEll
	.p2align	4, 0x90
__ZN10ILV_VECTOR9lSetValueEll:          ## @_ZN10ILV_VECTOR9lSetValueEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdx, %rax
	testq	%rsi, %rsi
	js	LBB15_3
## %bb.1:
	cmpq	%rsi, 24(%rdi)
	jle	LBB15_3
## %bb.2:
	movq	32(%rdi), %rcx
	movq	%rax, (%rcx,%rsi,8)
	popq	%rbp
	retq
LBB15_3:
	decq	%rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN10ILV_VECTOR9lAddValueEll ## -- Begin function _ZN10ILV_VECTOR9lAddValueEll
	.p2align	4, 0x90
__ZN10ILV_VECTOR9lAddValueEll:          ## @_ZN10ILV_VECTOR9lAddValueEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testq	%rsi, %rsi
	js	LBB16_4
## %bb.1:
	cmpq	%rsi, 24(%rdi)
	jle	LBB16_4
## %bb.2:
	movq	%rdx, %rax
	movq	32(%rdi), %rcx
	addq	(%rcx,%rsi,8), %rax
	movq	%rax, (%rcx,%rsi,8)
	popq	%rbp
	retq
LBB16_4:
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN10ILV_VECTOR9lGetValueEl ## -- Begin function _ZN10ILV_VECTOR9lGetValueEl
	.p2align	4, 0x90
__ZN10ILV_VECTOR9lGetValueEl:           ## @_ZN10ILV_VECTOR9lGetValueEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testq	%rsi, %rsi
	js	LBB17_4
## %bb.1:
	cmpq	%rsi, 24(%rdi)
	jle	LBB17_4
## %bb.2:
	movq	32(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	popq	%rbp
	retq
LBB17_4:
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_MATRIXC2Elll    ## -- Begin function _ZN9LV_MATRIXC2Elll
	.p2align	4, 0x90
__ZN9LV_MATRIXC2Elll:                   ## @_ZN9LV_MATRIXC2Elll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdx, -56(%rbp)         ## 8-byte Spill
	imulq	%rsi, %r12
	movl	$8, %edx
	movq	%r12, %rax
	mulq	%rdx
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	movq	%rdi, %rbx
	movq	$-1, %r14
	cmovoq	%r14, %rax
	movq	%rax, %rdi
	callq	__Znam
	movq	%rax, %r13
	movq	%rax, 32(%rbx)
	movq	%r15, %rax
	movl	$8, %ecx
	mulq	%rcx
	cmovnoq	%rax, %r14
	movq	%r14, %rdi
	callq	__Znam
	movq	%rax, 40(%rbx)
	testq	%r15, %r15
	jle	LBB18_1
## %bb.2:
	movq	%r13, (%rax)
	cmpq	$1, %r15
	movq	-56(%rbp), %r14         ## 8-byte Reload
	je	LBB18_11
## %bb.3:
	leaq	-1(%r15), %r8
	leaq	-2(%r15), %rcx
	movl	%r8d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB18_5
## %bb.4:
	movl	$1, %ecx
	testq	%rax, %rax
	jne	LBB18_9
	jmp	LBB18_11
LBB18_1:
	movq	-56(%rbp), %r14         ## 8-byte Reload
	jmp	LBB18_12
LBB18_5:
	subq	%rax, %r8
	movq	%r14, %r11
	shlq	$5, %r11
	leaq	(,%r14,8), %r10
	leaq	(%r10,%r10,2), %r9
	movq	%r14, %rdx
	shlq	$4, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB18_6:                                ## =>This Inner Loop Header: Depth=1
	leaq	(%r13,%r10), %rdi
	movq	40(%rbx), %rsi
	movq	%rdi, 8(%rsi,%rcx,8)
	leaq	(%r13,%rdx), %rsi
	movq	40(%rbx), %rdi
	movq	%rsi, 16(%rdi,%rcx,8)
	leaq	(%r13,%r9), %rsi
	movq	40(%rbx), %rdi
	movq	%rsi, 24(%rdi,%rcx,8)
	addq	%r11, %r13
	movq	40(%rbx), %rsi
	movq	%r13, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r8
	jne	LBB18_6
## %bb.7:
	incq	%rcx
	testq	%rax, %rax
	je	LBB18_11
LBB18_9:
	leaq	(%r13,%r14,8), %rdx
	leaq	(,%r14,8), %rsi
	.p2align	4, 0x90
LBB18_10:                               ## =>This Inner Loop Header: Depth=1
	movq	40(%rbx), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB18_10
LBB18_11:
	movq	32(%rbx), %r13
LBB18_12:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%r15, 8(%rbx)
	movq	%r14, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	$0, (%rbx)
	shlq	$3, %r12
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	___bzero
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_MATRIXC1Elll    ## -- Begin function _ZN9LV_MATRIXC1Elll
	.p2align	4, 0x90
__ZN9LV_MATRIXC1Elll:                   ## @_ZN9LV_MATRIXC1Elll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdx, -48(%rbp)         ## 8-byte Spill
	imulq	%rsi, %r12
	movl	$8, %edx
	movq	%r12, %rax
	mulq	%rdx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	movq	%rdi, %rbx
	movq	$-1, %r14
	cmovoq	%r14, %rax
	movq	%rax, %rdi
	callq	__Znam
	movq	%rax, %r13
	movq	%rax, 32(%rbx)
	movq	%r15, %rax
	movl	$8, %ecx
	mulq	%rcx
	cmovnoq	%rax, %r14
	movq	%r14, %rdi
	callq	__Znam
	movq	%rax, 40(%rbx)
	testq	%r15, %r15
	jle	LBB19_1
## %bb.2:
	movq	%r13, (%rax)
	cmpq	$1, %r15
	jne	LBB19_3
LBB19_1:
	movq	-48(%rbp), %r11         ## 8-byte Reload
	jmp	LBB19_12
LBB19_3:
	movq	-48(%rbp), %r11         ## 8-byte Reload
	leaq	(%r13,%r11,8), %rdx
	movq	%rdx, 8(%rax)
	cmpq	$2, %r15
	je	LBB19_11
## %bb.4:
	leal	-2(%r15), %eax
	leaq	-3(%r15), %rsi
	andl	$3, %eax
	movl	$2, %ecx
	cmpq	$3, %rsi
	jb	LBB19_8
## %bb.5:
	movq	%r11, %r9
	shlq	$5, %r9
	leaq	(,%r11,8), %rcx
	leaq	(%rcx,%rcx,4), %r8
	leaq	(%rcx,%rcx,2), %r10
	shlq	$4, %r11
	movq	%r15, %r14
	subq	%rax, %r14
	movl	$2, %ecx
	.p2align	4, 0x90
LBB19_6:                                ## =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	movq	40(%rbx), %rsi
	leaq	(%r13,%r11), %rdx
	movq	%rdx, (%rsi,%rcx,8)
	movq	40(%rbx), %rdx
	leaq	(%r13,%r10), %rsi
	movq	%rsi, 8(%rdx,%rcx,8)
	movq	40(%rbx), %rdx
	addq	%r9, %r13
	movq	%r13, 16(%rdx,%rcx,8)
	movq	40(%rbx), %rdx
	addq	%r8, %rdi
	movq	%rdi, 24(%rdx,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r14
	jne	LBB19_6
## %bb.7:
	movq	-48(%rbp), %r11         ## 8-byte Reload
	leaq	(%r13,%r11,8), %rdx
LBB19_8:
	testq	%rax, %rax
	je	LBB19_11
## %bb.9:
	leaq	(%rdx,%r11,8), %rdx
	leaq	(,%r11,8), %rsi
	.p2align	4, 0x90
LBB19_10:                               ## =>This Inner Loop Header: Depth=1
	movq	40(%rbx), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB19_10
LBB19_11:
	movq	32(%rbx), %r13
LBB19_12:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	%r15, 8(%rbx)
	movq	%r11, 16(%rbx)
	movq	%rax, 24(%rbx)
	movq	$0, (%rbx)
	shlq	$3, %r12
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	___bzero
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_MATRIXD2Ev      ## -- Begin function _ZN9LV_MATRIXD2Ev
	.p2align	4, 0x90
__ZN9LV_MATRIXD2Ev:                     ## @_ZN9LV_MATRIXD2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	32(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB20_2
## %bb.1:
	callq	__ZdlPv
LBB20_2:
	movq	40(%rbx), %rdi
	addq	$8, %rsp
	testq	%rdi, %rdi
	je	LBB20_3
## %bb.4:
	popq	%rbx
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB20_3:
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_MATRIXD1Ev      ## -- Begin function _ZN9LV_MATRIXD1Ev
	.p2align	4, 0x90
__ZN9LV_MATRIXD1Ev:                     ## @_ZN9LV_MATRIXD1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	32(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB21_2
## %bb.1:
	callq	__ZdlPv
LBB21_2:
	movq	40(%rbx), %rdi
	addq	$8, %rsp
	testq	%rdi, %rdi
	je	LBB21_3
## %bb.4:
	popq	%rbx
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
LBB21_3:
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_MATRIX6vResetEv ## -- Begin function _ZN9LV_MATRIX6vResetEv
	.p2align	4, 0x90
__ZN9LV_MATRIX6vResetEv:                ## @_ZN9LV_MATRIX6vResetEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	8(%rdi), %rsi
	movq	32(%rdi), %rax
	imulq	16(%rdi), %rsi
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN9LV_MATRIX9dSetValueElld
LCPI23_0:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN9LV_MATRIX9dSetValueElld
	.p2align	4, 0x90
__ZN9LV_MATRIX9dSetValueElld:           ## @_ZN9LV_MATRIX9dSetValueElld
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	testq	%rsi, %rsi
	js	LBB23_5
## %bb.1:
	testq	%rdx, %rdx
	js	LBB23_5
## %bb.2:
	cmpq	%rsi, 8(%rdi)
	jle	LBB23_5
## %bb.3:
	cmpq	%rdx, 16(%rdi)
	jle	LBB23_5
## %bb.4:
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	%xmm0, (%rax,%rdx,8)
	popq	%rbp
	retq
LBB23_5:
	addsd	LCPI23_0(%rip), %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_MATRIX9dAddValueElld ## -- Begin function _ZN9LV_MATRIX9dAddValueElld
	.p2align	4, 0x90
__ZN9LV_MATRIX9dAddValueElld:           ## @_ZN9LV_MATRIX9dAddValueElld
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movapd	%xmm0, %xmm1
	xorpd	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB24_5
## %bb.1:
	testq	%rdx, %rdx
	js	LBB24_5
## %bb.2:
	cmpq	%rsi, 8(%rdi)
	jle	LBB24_5
## %bb.3:
	cmpq	%rdx, 16(%rdi)
	jle	LBB24_5
## %bb.4:
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	addsd	(%rax,%rdx,8), %xmm1
	movsd	%xmm1, (%rax,%rdx,8)
	movapd	%xmm1, %xmm0
LBB24_5:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_MATRIX14dMultiplyValueElld ## -- Begin function _ZN9LV_MATRIX14dMultiplyValueElld
	.p2align	4, 0x90
__ZN9LV_MATRIX14dMultiplyValueElld:     ## @_ZN9LV_MATRIX14dMultiplyValueElld
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movapd	%xmm0, %xmm1
	xorpd	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB25_5
## %bb.1:
	testq	%rdx, %rdx
	js	LBB25_5
## %bb.2:
	cmpq	%rsi, 8(%rdi)
	jle	LBB25_5
## %bb.3:
	cmpq	%rdx, 16(%rdi)
	jle	LBB25_5
## %bb.4:
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	mulsd	(%rax,%rdx,8), %xmm1
	movsd	%xmm1, (%rax,%rdx,8)
	movapd	%xmm1, %xmm0
LBB25_5:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN9LV_MATRIX9dGetValueEll ## -- Begin function _ZN9LV_MATRIX9dGetValueEll
	.p2align	4, 0x90
__ZN9LV_MATRIX9dGetValueEll:            ## @_ZN9LV_MATRIX9dGetValueEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorps	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB26_5
## %bb.1:
	testq	%rdx, %rdx
	js	LBB26_5
## %bb.2:
	cmpq	%rsi, 8(%rdi)
	jle	LBB26_5
## %bb.3:
	cmpq	%rdx, 16(%rdi)
	jle	LBB26_5
## %bb.4:
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%rdx,8), %xmm0    ## xmm0 = mem[0],zero
LBB26_5:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _ZN8MARKOVLVC2Elll
LCPI27_0:
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	1                       ## 0x1
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
LCPI27_1:
	.quad	2                       ## 0x2
	.quad	2                       ## 0x2
LCPI27_2:
	.quad	4                       ## 0x4
	.quad	4                       ## 0x4
LCPI27_3:
	.quad	6                       ## 0x6
	.quad	6                       ## 0x6
LCPI27_4:
	.quad	8                       ## 0x8
	.quad	8                       ## 0x8
LCPI27_5:
	.quad	10                      ## 0xa
	.quad	10                      ## 0xa
LCPI27_6:
	.quad	12                      ## 0xc
	.quad	12                      ## 0xc
LCPI27_7:
	.quad	14                      ## 0xe
	.quad	14                      ## 0xe
LCPI27_8:
	.quad	16                      ## 0x10
	.quad	16                      ## 0x10
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLVC2Elll
	.p2align	4, 0x90
__ZN8MARKOVLVC2Elll:                    ## @_ZN8MARKOVLVC2Elll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rdi, %r15
	movq	%rsi, 32(%rdi)
	movq	%rdx, 40(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 56(%rdi)
	movq	$0, 64(%rdi)
	movq	%rcx, 72(%rdi)
	movl	$8, %ecx
	movq	%rdx, %rax
	mulq	%rcx
	movb	$0, (%rdi)
	movq	$-1, %rbx
	cmovoq	%rbx, %rax
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movq	$0, 80(%rdi)
	movq	$0, 88(%rdi)
	movq	$0, 96(%rdi)
	movq	$0, 104(%rdi)
	movq	$0, 112(%rdi)
	movq	$0, 120(%rdi)
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__Znam
	movq	%rax, 128(%r15)
	testq	%r14, %r14
	jle	LBB27_8
## %bb.1:
	movq	$0, (%rax)
	cmpq	$1, %r14
	je	LBB27_8
## %bb.2:
	leaq	-1(%r14), %rdx
	leaq	-2(%r14), %rsi
	movl	%edx, %eax
	andl	$3, %eax
	movl	$1, %ecx
	cmpq	$3, %rsi
	jb	LBB27_6
## %bb.3:
	subq	%rax, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB27_4:                                ## =>This Inner Loop Header: Depth=1
	movq	128(%r15), %rsi
	movq	$0, 8(%rsi,%rcx,8)
	movq	128(%r15), %rsi
	movq	$0, 16(%rsi,%rcx,8)
	movq	128(%r15), %rsi
	movq	$0, 24(%rsi,%rcx,8)
	movq	128(%r15), %rsi
	movq	$0, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	LBB27_4
## %bb.5:
	incq	%rcx
LBB27_6:
	testq	%rax, %rax
	je	LBB27_8
	.p2align	4, 0x90
LBB27_7:                                ## =>This Inner Loop Header: Depth=1
	movq	128(%r15), %rdx
	movq	$0, (%rdx,%rcx,8)
	incq	%rcx
	decq	%rax
	jne	LBB27_7
LBB27_8:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %r13
	movq	%rax, 136(%r15)
	movq	%r14, %r12
	imulq	%r14, %r12
	movq	%r12, %rax
	movl	$8, %ecx
	mulq	%rcx
	cmovoq	%rbx, %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__Znam
	movq	%rax, %rbx
	testq	%r12, %r12
	je	LBB27_10
## %bb.9:
	leaq	(,%r12,8), %rsi
	movq	%rbx, %rdi
	callq	___bzero
LBB27_10:
	testq	%r14, %r14
	jle	LBB27_20
## %bb.11:
	movq	%rbx, (%r13)
	cmpq	$1, %r14
	je	LBB27_20
## %bb.12:
	leaq	-1(%r14), %r8
	leaq	-2(%r14), %rcx
	movl	%r8d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB27_14
## %bb.13:
	movl	$1, %ecx
	testq	%rax, %rax
	jne	LBB27_18
	jmp	LBB27_20
LBB27_14:
	subq	%rax, %r8
	movq	%r14, %r11
	shlq	$5, %r11
	leaq	(,%r14,8), %r10
	leaq	(%r10,%r10,2), %r9
	movq	%r14, %rdx
	shlq	$4, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB27_15:                               ## =>This Inner Loop Header: Depth=1
	leaq	(%rbx,%r10), %rdi
	movq	136(%r15), %rsi
	movq	%rdi, 8(%rsi,%rcx,8)
	leaq	(%rbx,%rdx), %rsi
	movq	136(%r15), %rdi
	movq	%rsi, 16(%rdi,%rcx,8)
	leaq	(%rbx,%r9), %rsi
	movq	136(%r15), %rdi
	movq	%rsi, 24(%rdi,%rcx,8)
	addq	%r11, %rbx
	movq	136(%r15), %rsi
	movq	%rbx, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r8
	jne	LBB27_15
## %bb.16:
	incq	%rcx
	testq	%rax, %rax
	je	LBB27_20
LBB27_18:
	leaq	(%rbx,%r14,8), %rdx
	leaq	(,%r14,8), %rsi
	.p2align	4, 0x90
LBB27_19:                               ## =>This Inner Loop Header: Depth=1
	movq	136(%r15), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB27_19
LBB27_20:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %r13
	movq	%rax, 144(%r15)
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %rbx
	testq	%r12, %r12
	je	LBB27_22
## %bb.21:
	leaq	(,%r12,8), %rsi
	movq	%rbx, %rdi
	callq	___bzero
LBB27_22:
	testq	%r14, %r14
	jle	LBB27_32
## %bb.23:
	movq	%rbx, (%r13)
	cmpq	$1, %r14
	je	LBB27_32
## %bb.24:
	leaq	-1(%r14), %r8
	leaq	-2(%r14), %rcx
	movl	%r8d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB27_26
## %bb.25:
	movl	$1, %ecx
	testq	%rax, %rax
	jne	LBB27_30
	jmp	LBB27_32
LBB27_26:
	subq	%rax, %r8
	movq	%r14, %r11
	shlq	$5, %r11
	leaq	(,%r14,8), %r10
	leaq	(%r10,%r10,2), %r9
	movq	%r14, %rdx
	shlq	$4, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB27_27:                               ## =>This Inner Loop Header: Depth=1
	leaq	(%rbx,%r10), %rdi
	movq	144(%r15), %rsi
	movq	%rdi, 8(%rsi,%rcx,8)
	leaq	(%rbx,%rdx), %rsi
	movq	144(%r15), %rdi
	movq	%rsi, 16(%rdi,%rcx,8)
	leaq	(%rbx,%r9), %rsi
	movq	144(%r15), %rdi
	movq	%rsi, 24(%rdi,%rcx,8)
	addq	%r11, %rbx
	movq	144(%r15), %rsi
	movq	%rbx, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r8
	jne	LBB27_27
## %bb.28:
	incq	%rcx
	testq	%rax, %rax
	je	LBB27_32
LBB27_30:
	leaq	(%rbx,%r14,8), %rdx
	leaq	(,%r14,8), %rsi
	.p2align	4, 0x90
LBB27_31:                               ## =>This Inner Loop Header: Depth=1
	movq	144(%r15), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB27_31
LBB27_32:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %r13
	movq	%rax, 152(%r15)
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %rbx
	testq	%r12, %r12
	je	LBB27_34
## %bb.33:
	shlq	$3, %r12
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	___bzero
LBB27_34:
	testq	%r14, %r14
	jle	LBB27_38
## %bb.35:
	movq	%rbx, (%r13)
	cmpq	$1, %r14
	je	LBB27_45
## %bb.36:
	leaq	-1(%r14), %r8
	leaq	-2(%r14), %rcx
	movl	%r8d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB27_39
## %bb.37:
	movl	$1, %ecx
	testq	%rax, %rax
	jne	LBB27_43
	jmp	LBB27_45
LBB27_38:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, 240(%r15)
	jmp	LBB27_53
LBB27_39:
	subq	%rax, %r8
	movq	%r14, %r11
	shlq	$5, %r11
	leaq	(,%r14,8), %r10
	leaq	(%r10,%r10,2), %r9
	movq	%r14, %rdx
	shlq	$4, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB27_40:                               ## =>This Inner Loop Header: Depth=1
	leaq	(%rbx,%r10), %rdi
	movq	152(%r15), %rsi
	movq	%rdi, 8(%rsi,%rcx,8)
	leaq	(%rbx,%rdx), %rsi
	movq	152(%r15), %rdi
	movq	%rsi, 16(%rdi,%rcx,8)
	leaq	(%rbx,%r9), %rsi
	movq	152(%r15), %rdi
	movq	%rsi, 24(%rdi,%rcx,8)
	addq	%r11, %rbx
	movq	152(%r15), %rsi
	movq	%rbx, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r8
	jne	LBB27_40
## %bb.41:
	incq	%rcx
	testq	%rax, %rax
	je	LBB27_45
LBB27_43:
	leaq	(%rbx,%r14,8), %rdx
	leaq	(,%r14,8), %rsi
	.p2align	4, 0x90
LBB27_44:                               ## =>This Inner Loop Header: Depth=1
	movq	152(%r15), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB27_44
LBB27_45:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, 240(%r15)
	testq	%r14, %r14
	jle	LBB27_53
## %bb.46:
	movq	$0, (%rax)
	cmpq	$1, %r14
	je	LBB27_53
## %bb.47:
	leaq	-1(%r14), %rdx
	leaq	-2(%r14), %rsi
	movl	%edx, %eax
	andl	$3, %eax
	movl	$1, %ecx
	cmpq	$3, %rsi
	jb	LBB27_51
## %bb.48:
	subq	%rax, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB27_49:                               ## =>This Inner Loop Header: Depth=1
	movq	240(%r15), %rsi
	movq	$0, 8(%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 16(%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 24(%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	LBB27_49
## %bb.50:
	incq	%rcx
LBB27_51:
	testq	%rax, %rax
	je	LBB27_53
	.p2align	4, 0x90
LBB27_52:                               ## =>This Inner Loop Header: Depth=1
	movq	240(%r15), %rdx
	movq	$0, (%rdx,%rcx,8)
	incq	%rcx
	decq	%rax
	jne	LBB27_52
LBB27_53:
	movq	$0, 232(%r15)
	movq	$0, 224(%r15)
	movq	$0, 216(%r15)
	movq	$0, 208(%r15)
	movq	$0, 200(%r15)
	movq	$0, 192(%r15)
	movq	$0, 184(%r15)
	movq	$0, 176(%r15)
	movq	$0, 168(%r15)
	movq	$0, 160(%r15)
	movq	$0, 256(%r15)
	movq	$0, 264(%r15)
	movq	$0, 272(%r15)
	movw	$0, 280(%r15)
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, 248(%r15)
	testq	%r14, %r14
	jle	LBB27_65
## %bb.54:
	cmpq	$4, %r14
	jae	LBB27_56
## %bb.55:
	xorl	%ecx, %ecx
	jmp	LBB27_64
LBB27_56:
	movq	%r14, %rcx
	andq	$-4, %rcx
	leaq	-4(%rcx), %rdi
	movq	%rdi, %rsi
	shrq	$2, %rsi
	incq	%rsi
	movl	%esi, %edx
	andl	$3, %edx
	cmpq	$12, %rdi
	jae	LBB27_58
## %bb.57:
	movdqa	LCPI27_0(%rip), %xmm0   ## xmm0 = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	xorl	%edi, %edi
	jmp	LBB27_60
LBB27_58:
	subq	%rdx, %rsi
	movdqa	LCPI27_0(%rip), %xmm0   ## xmm0 = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	xorl	%edi, %edi
	movdqa	LCPI27_1(%rip), %xmm8   ## xmm8 = [2,2]
	movdqa	LCPI27_2(%rip), %xmm9   ## xmm9 = [4,4]
	movdqa	LCPI27_3(%rip), %xmm10  ## xmm10 = [6,6]
	movdqa	LCPI27_4(%rip), %xmm4   ## xmm4 = [8,8]
	movdqa	LCPI27_5(%rip), %xmm5   ## xmm5 = [10,10]
	movdqa	LCPI27_6(%rip), %xmm6   ## xmm6 = [12,12]
	movdqa	LCPI27_7(%rip), %xmm7   ## xmm7 = [14,14]
	movdqa	LCPI27_8(%rip), %xmm1   ## xmm1 = [16,16]
	.p2align	4, 0x90
LBB27_59:                               ## =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm2
	paddq	%xmm8, %xmm2
	movdqu	%xmm0, (%rax,%rdi,8)
	movdqu	%xmm2, 16(%rax,%rdi,8)
	movdqa	%xmm0, %xmm2
	paddq	%xmm9, %xmm2
	movdqa	%xmm0, %xmm3
	paddq	%xmm10, %xmm3
	movdqu	%xmm2, 32(%rax,%rdi,8)
	movdqu	%xmm3, 48(%rax,%rdi,8)
	movdqa	%xmm0, %xmm2
	paddq	%xmm4, %xmm2
	movdqa	%xmm0, %xmm3
	paddq	%xmm5, %xmm3
	movdqu	%xmm2, 64(%rax,%rdi,8)
	movdqu	%xmm3, 80(%rax,%rdi,8)
	movdqa	%xmm0, %xmm2
	paddq	%xmm6, %xmm2
	movdqa	%xmm0, %xmm3
	paddq	%xmm7, %xmm3
	movdqu	%xmm2, 96(%rax,%rdi,8)
	movdqu	%xmm3, 112(%rax,%rdi,8)
	addq	$16, %rdi
	paddq	%xmm1, %xmm0
	addq	$-4, %rsi
	jne	LBB27_59
LBB27_60:
	testq	%rdx, %rdx
	je	LBB27_63
## %bb.61:
	leaq	16(%rax,%rdi,8), %rsi
	negq	%rdx
	movdqa	LCPI27_1(%rip), %xmm1   ## xmm1 = [2,2]
	movdqa	LCPI27_2(%rip), %xmm2   ## xmm2 = [4,4]
	.p2align	4, 0x90
LBB27_62:                               ## =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm3
	paddq	%xmm1, %xmm3
	movdqu	%xmm0, -16(%rsi)
	movdqu	%xmm3, (%rsi)
	paddq	%xmm2, %xmm0
	addq	$32, %rsi
	incq	%rdx
	jne	LBB27_62
LBB27_63:
	cmpq	%r14, %rcx
	je	LBB27_65
	.p2align	4, 0x90
LBB27_64:                               ## =>This Inner Loop Header: Depth=1
	movq	%rcx, (%rax,%rcx,8)
	incq	%rcx
	cmpq	%r14, %rcx
	jl	LBB27_64
LBB27_65:
	movq	$0, 312(%r15)
	movq	$0, 304(%r15)
	movq	$0, 296(%r15)
	movq	$0, 288(%r15)
	movq	$1234567, 8(%r15)       ## imm = 0x12D687
	movq	$0, 320(%r15)
	movq	$0, 328(%r15)
	movq	$0, 336(%r15)
	movq	$0, 344(%r15)
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLVC1Elll     ## -- Begin function _ZN8MARKOVLVC1Elll
	.p2align	4, 0x90
__ZN8MARKOVLVC1Elll:                    ## @_ZN8MARKOVLVC1Elll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	__ZN8MARKOVLVC2Elll     ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLVD2Ev       ## -- Begin function _ZN8MARKOVLVD2Ev
	.p2align	4, 0x90
__ZN8MARKOVLVD2Ev:                      ## @_ZN8MARKOVLVD2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	80(%rdi), %rbx
	testq	%rbx, %rbx
	jne	LBB29_1
LBB29_4:
	movq	88(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB29_5
LBB29_8:
	movq	96(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB29_9
LBB29_12:
	movq	104(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB29_13
LBB29_16:
	movq	112(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB29_17
LBB29_22:
	movq	120(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB29_23
LBB29_28:
	movq	136(%r14), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	LBB29_30
## %bb.29:
	callq	__ZdlPv
LBB29_30:
	movq	144(%r14), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	LBB29_32
## %bb.31:
	callq	__ZdlPv
LBB29_32:
	movq	152(%r14), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	LBB29_34
## %bb.33:
	callq	__ZdlPv
LBB29_34:
	movq	136(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB29_36
## %bb.35:
	callq	__ZdlPv
LBB29_36:
	movq	144(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB29_38
## %bb.37:
	callq	__ZdlPv
LBB29_38:
	movq	152(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB29_40
## %bb.39:
	callq	__ZdlPv
LBB29_40:
	movq	128(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB29_42
## %bb.41:
	callq	__ZdlPv
LBB29_42:
	movq	240(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB29_44
## %bb.43:
	callq	__ZdlPv
LBB29_44:
	movq	248(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB29_46
## %bb.45:
	callq	__ZdlPv
LBB29_46:
	movq	288(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB29_50
## %bb.47:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_49
## %bb.48:
	callq	__ZdlPv
LBB29_49:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB29_50:
	movq	296(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB29_54
## %bb.51:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_53
## %bb.52:
	callq	__ZdlPv
LBB29_53:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB29_54:
	movq	304(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB29_58
## %bb.55:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_57
## %bb.56:
	callq	__ZdlPv
LBB29_57:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB29_58:
	movq	336(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB29_64
## %bb.59:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_61
## %bb.60:
	callq	__ZdlPv
LBB29_61:
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_63
## %bb.62:
	callq	__ZdlPv
LBB29_63:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB29_64:
	movq	344(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB29_70
## %bb.65:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_67
## %bb.66:
	callq	__ZdlPv
LBB29_67:
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_69
## %bb.68:
	callq	__ZdlPv
LBB29_69:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB29_70:
	movq	312(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB29_74
## %bb.71:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_73
## %bb.72:
	callq	__ZdlPv
LBB29_73:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB29_74:
	movq	16(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB29_76
## %bb.75:
	callq	__ZdlPv
LBB29_76:
	movq	24(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB29_78
## %bb.77:
	callq	__ZdlPv
LBB29_78:
	movq	$0, 320(%r14)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.p2align	4, 0x90
LBB29_3:                                ##   in Loop: Header=BB29_1 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB29_4
LBB29_1:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_3
## %bb.2:                               ##   in Loop: Header=BB29_1 Depth=1
	callq	__ZdlPv
	jmp	LBB29_3
	.p2align	4, 0x90
LBB29_7:                                ##   in Loop: Header=BB29_5 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB29_8
LBB29_5:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_7
## %bb.6:                               ##   in Loop: Header=BB29_5 Depth=1
	callq	__ZdlPv
	jmp	LBB29_7
	.p2align	4, 0x90
LBB29_11:                               ##   in Loop: Header=BB29_9 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB29_12
LBB29_9:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_11
## %bb.10:                              ##   in Loop: Header=BB29_9 Depth=1
	callq	__ZdlPv
	jmp	LBB29_11
	.p2align	4, 0x90
LBB29_15:                               ##   in Loop: Header=BB29_13 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB29_16
LBB29_13:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_15
## %bb.14:                              ##   in Loop: Header=BB29_13 Depth=1
	callq	__ZdlPv
	jmp	LBB29_15
	.p2align	4, 0x90
LBB29_21:                               ##   in Loop: Header=BB29_17 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB29_22
LBB29_17:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_19
## %bb.18:                              ##   in Loop: Header=BB29_17 Depth=1
	callq	__ZdlPv
LBB29_19:                               ##   in Loop: Header=BB29_17 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_21
## %bb.20:                              ##   in Loop: Header=BB29_17 Depth=1
	callq	__ZdlPv
	jmp	LBB29_21
	.p2align	4, 0x90
LBB29_27:                               ##   in Loop: Header=BB29_23 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB29_28
LBB29_23:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_25
## %bb.24:                              ##   in Loop: Header=BB29_23 Depth=1
	callq	__ZdlPv
LBB29_25:                               ##   in Loop: Header=BB29_23 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB29_27
## %bb.26:                              ##   in Loop: Header=BB29_23 Depth=1
	callq	__ZdlPv
	jmp	LBB29_27
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLVD1Ev       ## -- Begin function _ZN8MARKOVLVD1Ev
	.p2align	4, 0x90
__ZN8MARKOVLVD1Ev:                      ## @_ZN8MARKOVLVD1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	__ZN8MARKOVLVD2Ev       ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV6vResetEv  ## -- Begin function _ZN8MARKOVLV6vResetEv
	.p2align	4, 0x90
__ZN8MARKOVLV6vResetEv:                 ## @_ZN8MARKOVLV6vResetEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movb	$0, (%rdi)
	movq	$0, 256(%rdi)
	movq	$0, 264(%rdi)
	movq	80(%rdi), %rbx
	testq	%rbx, %rbx
	jne	LBB31_1
LBB31_4:
	movq	88(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB31_5
LBB31_8:
	movq	96(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB31_9
LBB31_12:
	movq	104(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB31_13
LBB31_16:
	movq	112(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB31_17
LBB31_22:
	movq	120(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB31_31
LBB31_23:
	movq	40(%r14), %rbx
	movq	%rbx, %rsi
	imulq	%rbx, %rsi
	testq	%rsi, %rsi
	je	LBB31_28
## %bb.24:
	movl	%esi, %edx
	andl	$1, %edx
	cmpq	$1, %rsi
	jne	LBB31_38
## %bb.25:
	xorl	%ecx, %ecx
	jmp	LBB31_26
	.p2align	4, 0x90
LBB31_3:                                ##   in Loop: Header=BB31_1 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB31_4
LBB31_1:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB31_3
## %bb.2:                               ##   in Loop: Header=BB31_1 Depth=1
	callq	__ZdlPv
	jmp	LBB31_3
	.p2align	4, 0x90
LBB31_7:                                ##   in Loop: Header=BB31_5 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB31_8
LBB31_5:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB31_7
## %bb.6:                               ##   in Loop: Header=BB31_5 Depth=1
	callq	__ZdlPv
	jmp	LBB31_7
	.p2align	4, 0x90
LBB31_11:                               ##   in Loop: Header=BB31_9 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB31_12
LBB31_9:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB31_11
## %bb.10:                              ##   in Loop: Header=BB31_9 Depth=1
	callq	__ZdlPv
	jmp	LBB31_11
	.p2align	4, 0x90
LBB31_15:                               ##   in Loop: Header=BB31_13 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB31_16
LBB31_13:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB31_15
## %bb.14:                              ##   in Loop: Header=BB31_13 Depth=1
	callq	__ZdlPv
	jmp	LBB31_15
	.p2align	4, 0x90
LBB31_21:                               ##   in Loop: Header=BB31_17 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB31_22
LBB31_17:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB31_19
## %bb.18:                              ##   in Loop: Header=BB31_17 Depth=1
	callq	__ZdlPv
LBB31_19:                               ##   in Loop: Header=BB31_17 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB31_21
## %bb.20:                              ##   in Loop: Header=BB31_17 Depth=1
	callq	__ZdlPv
	jmp	LBB31_21
	.p2align	4, 0x90
LBB31_35:                               ##   in Loop: Header=BB31_31 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB31_23
LBB31_31:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB31_33
## %bb.32:                              ##   in Loop: Header=BB31_31 Depth=1
	callq	__ZdlPv
LBB31_33:                               ##   in Loop: Header=BB31_31 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB31_35
## %bb.34:                              ##   in Loop: Header=BB31_31 Depth=1
	callq	__ZdlPv
	jmp	LBB31_35
LBB31_38:
	subq	%rdx, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB31_39:                               ## =>This Inner Loop Header: Depth=1
	movq	136(%r14), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rcx,8)
	movq	144(%r14), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rcx,8)
	movq	152(%r14), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rcx,8)
	movq	136(%r14), %rax
	movq	(%rax), %rax
	movq	$0, 8(%rax,%rcx,8)
	movq	144(%r14), %rax
	movq	(%rax), %rax
	movq	$0, 8(%rax,%rcx,8)
	movq	152(%r14), %rax
	movq	(%rax), %rax
	movq	$0, 8(%rax,%rcx,8)
	addq	$2, %rcx
	cmpq	%rcx, %rsi
	jne	LBB31_39
LBB31_26:
	testq	%rdx, %rdx
	je	LBB31_28
## %bb.27:
	movq	136(%r14), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rcx,8)
	movq	144(%r14), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rcx,8)
	movq	152(%r14), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rcx,8)
LBB31_28:
	leaq	80(%r14), %rcx
	testq	%rbx, %rbx
	jle	LBB31_29
## %bb.36:
	leaq	-1(%rbx), %r8
	movl	%ebx, %esi
	andl	$3, %esi
	cmpq	$3, %r8
	jae	LBB31_40
## %bb.37:
	xorl	%edi, %edi
	jmp	LBB31_42
LBB31_29:
	movq	$0, 232(%r14)
	movq	$0, 224(%r14)
	movq	$0, 216(%r14)
	movq	$0, 208(%r14)
	movq	$0, 200(%r14)
	movq	$0, 192(%r14)
	movq	$0, 184(%r14)
	movq	$0, 176(%r14)
	movq	$0, 168(%r14)
	movq	$0, 160(%r14)
	movq	$0, 40(%rcx)
	movq	$0, 32(%rcx)
	movq	$0, 24(%rcx)
	movq	$0, 16(%rcx)
	movq	$0, 8(%rcx)
	movq	$0, (%rcx)
	jmp	LBB31_30
LBB31_40:
	movq	%rbx, %rax
	subq	%rsi, %rax
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB31_41:                               ## =>This Inner Loop Header: Depth=1
	movq	128(%r14), %rdx
	movq	$0, (%rdx,%rdi,8)
	movq	128(%r14), %rdx
	movq	$0, 8(%rdx,%rdi,8)
	movq	128(%r14), %rdx
	movq	$0, 16(%rdx,%rdi,8)
	movq	128(%r14), %rdx
	movq	$0, 24(%rdx,%rdi,8)
	addq	$4, %rdi
	cmpq	%rdi, %rax
	jne	LBB31_41
LBB31_42:
	testq	%rsi, %rsi
	je	LBB31_44
	.p2align	4, 0x90
LBB31_43:                               ## =>This Inner Loop Header: Depth=1
	movq	128(%r14), %rax
	movq	$0, (%rax,%rdi,8)
	incq	%rdi
	decq	%rsi
	jne	LBB31_43
LBB31_44:
	movq	$0, 232(%r14)
	movq	$0, 224(%r14)
	movq	$0, 216(%r14)
	movq	$0, 208(%r14)
	movq	$0, 200(%r14)
	movq	$0, 192(%r14)
	movq	$0, 184(%r14)
	movq	$0, 176(%r14)
	movq	$0, 168(%r14)
	movq	$0, 160(%r14)
	movq	$0, 40(%rcx)
	movq	$0, 32(%rcx)
	movq	$0, 24(%rcx)
	movq	$0, 16(%rcx)
	movq	$0, 8(%rcx)
	movq	$0, (%rcx)
	movl	%ebx, %ecx
	andl	$3, %ecx
	cmpq	$3, %r8
	jae	LBB31_50
## %bb.45:
	xorl	%edx, %edx
	jmp	LBB31_46
LBB31_50:
	subq	%rcx, %rbx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB31_51:                               ## =>This Inner Loop Header: Depth=1
	movq	240(%r14), %rax
	movq	$0, (%rax,%rdx,8)
	movq	240(%r14), %rax
	movq	$0, 8(%rax,%rdx,8)
	movq	240(%r14), %rax
	movq	$0, 16(%rax,%rdx,8)
	movq	240(%r14), %rax
	movq	$0, 24(%rax,%rdx,8)
	addq	$4, %rdx
	cmpq	%rdx, %rbx
	jne	LBB31_51
LBB31_46:
	testq	%rcx, %rcx
	je	LBB31_48
	.p2align	4, 0x90
LBB31_47:                               ## =>This Inner Loop Header: Depth=1
	movq	240(%r14), %rax
	movq	$0, (%rax,%rdx,8)
	incq	%rdx
	decq	%rcx
	jne	LBB31_47
LBB31_48:
	movq	248(%r14), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB31_49:                               ## =>This Inner Loop Header: Depth=1
	movq	%rcx, (%rax,%rcx,8)
	incq	%rcx
	cmpq	40(%r14), %rcx
	jl	LBB31_49
LBB31_30:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _ZN8MARKOVLV13vSetInternalsEll
LCPI32_0:
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	1                       ## 0x1
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
	.byte	0                       ## 0x0
LCPI32_1:
	.quad	2                       ## 0x2
	.quad	2                       ## 0x2
LCPI32_2:
	.quad	4                       ## 0x4
	.quad	4                       ## 0x4
LCPI32_3:
	.quad	6                       ## 0x6
	.quad	6                       ## 0x6
LCPI32_4:
	.quad	8                       ## 0x8
	.quad	8                       ## 0x8
LCPI32_5:
	.quad	10                      ## 0xa
	.quad	10                      ## 0xa
LCPI32_6:
	.quad	12                      ## 0xc
	.quad	12                      ## 0xc
LCPI32_7:
	.quad	14                      ## 0xe
	.quad	14                      ## 0xe
LCPI32_8:
	.quad	16                      ## 0x10
	.quad	16                      ## 0x10
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV13vSetInternalsEll
	.p2align	4, 0x90
__ZN8MARKOVLV13vSetInternalsEll:        ## @_ZN8MARKOVLV13vSetInternalsEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r12
	movq	%rdi, %r15
	movq	72(%rdi), %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	__ZN8MARKOVLV6vResetEv
	movq	80(%r15), %rbx
	testq	%rbx, %rbx
	jne	LBB32_1
LBB32_4:
	movq	88(%r15), %rbx
	testq	%rbx, %rbx
	jne	LBB32_5
LBB32_8:
	movq	96(%r15), %rbx
	testq	%rbx, %rbx
	jne	LBB32_9
LBB32_12:
	movq	104(%r15), %rbx
	testq	%rbx, %rbx
	jne	LBB32_13
LBB32_16:
	movq	112(%r15), %rbx
	testq	%rbx, %rbx
	jne	LBB32_17
LBB32_22:
	movq	120(%r15), %rbx
	testq	%rbx, %rbx
	jne	LBB32_23
LBB32_28:
	movq	136(%r15), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	LBB32_30
## %bb.29:
	callq	__ZdlPv
LBB32_30:
	movq	144(%r15), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	LBB32_32
## %bb.31:
	callq	__ZdlPv
LBB32_32:
	movq	152(%r15), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	LBB32_34
## %bb.33:
	callq	__ZdlPv
LBB32_34:
	movq	136(%r15), %rdi
	testq	%rdi, %rdi
	je	LBB32_36
## %bb.35:
	callq	__ZdlPv
LBB32_36:
	movq	144(%r15), %rdi
	testq	%rdi, %rdi
	je	LBB32_38
## %bb.37:
	callq	__ZdlPv
LBB32_38:
	movq	152(%r15), %rdi
	testq	%rdi, %rdi
	je	LBB32_40
## %bb.39:
	callq	__ZdlPv
LBB32_40:
	movq	128(%r15), %rdi
	testq	%rdi, %rdi
	je	LBB32_42
## %bb.41:
	callq	__ZdlPv
LBB32_42:
	movq	240(%r15), %rdi
	testq	%rdi, %rdi
	je	LBB32_44
## %bb.43:
	callq	__ZdlPv
LBB32_44:
	leaq	80(%r15), %r13
	movq	248(%r15), %rdi
	testq	%rdi, %rdi
	je	LBB32_46
## %bb.45:
	callq	__ZdlPv
LBB32_46:
	movq	%r12, 32(%r15)
	movq	%r14, 40(%r15)
	movq	$0, 48(%r15)
	movq	$0, 56(%r15)
	movq	$0, 64(%r15)
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rax, 72(%r15)
	movb	$0, (%r15)
	movl	$8, %ecx
	movq	%r14, %rax
	mulq	%rcx
	movq	$-1, %rbx
	cmovoq	%rbx, %rax
	movq	$0, 40(%r13)
	movq	$0, 32(%r13)
	movq	$0, 24(%r13)
	movq	$0, 16(%r13)
	movq	$0, 8(%r13)
	movq	$0, (%r13)
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__Znam
	movq	%rax, 128(%r15)
	testq	%r14, %r14
	jle	LBB32_54
## %bb.47:
	movq	$0, (%rax)
	cmpq	$1, %r14
	je	LBB32_54
## %bb.48:
	leaq	-1(%r14), %rdx
	leaq	-2(%r14), %rsi
	movl	%edx, %eax
	andl	$3, %eax
	movl	$1, %ecx
	cmpq	$3, %rsi
	jb	LBB32_52
## %bb.49:
	subq	%rax, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB32_50:                               ## =>This Inner Loop Header: Depth=1
	movq	128(%r15), %rsi
	movq	$0, 8(%rsi,%rcx,8)
	movq	128(%r15), %rsi
	movq	$0, 16(%rsi,%rcx,8)
	movq	128(%r15), %rsi
	movq	$0, 24(%rsi,%rcx,8)
	movq	128(%r15), %rsi
	movq	$0, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	LBB32_50
## %bb.51:
	incq	%rcx
LBB32_52:
	testq	%rax, %rax
	je	LBB32_54
	.p2align	4, 0x90
LBB32_53:                               ## =>This Inner Loop Header: Depth=1
	movq	128(%r15), %rdx
	movq	$0, (%rdx,%rcx,8)
	incq	%rcx
	decq	%rax
	jne	LBB32_53
LBB32_54:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %r13
	movq	%rax, 136(%r15)
	movq	%r14, %r12
	imulq	%r14, %r12
	movq	%r12, %rax
	movl	$8, %ecx
	mulq	%rcx
	cmovoq	%rbx, %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__Znam
	movq	%rax, %rbx
	testq	%r12, %r12
	je	LBB32_56
## %bb.55:
	leaq	(,%r12,8), %rsi
	movq	%rbx, %rdi
	callq	___bzero
LBB32_56:
	testq	%r14, %r14
	jle	LBB32_66
## %bb.57:
	movq	%rbx, (%r13)
	cmpq	$1, %r14
	je	LBB32_66
## %bb.58:
	leaq	-1(%r14), %r8
	leaq	-2(%r14), %rcx
	movl	%r8d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB32_60
## %bb.59:
	movl	$1, %ecx
	testq	%rax, %rax
	jne	LBB32_64
	jmp	LBB32_66
	.p2align	4, 0x90
LBB32_3:                                ##   in Loop: Header=BB32_1 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r13, %rbx
	testq	%r13, %r13
	je	LBB32_4
LBB32_1:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_3
## %bb.2:                               ##   in Loop: Header=BB32_1 Depth=1
	callq	__ZdlPv
	jmp	LBB32_3
	.p2align	4, 0x90
LBB32_7:                                ##   in Loop: Header=BB32_5 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r13, %rbx
	testq	%r13, %r13
	je	LBB32_8
LBB32_5:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_7
## %bb.6:                               ##   in Loop: Header=BB32_5 Depth=1
	callq	__ZdlPv
	jmp	LBB32_7
	.p2align	4, 0x90
LBB32_11:                               ##   in Loop: Header=BB32_9 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r13, %rbx
	testq	%r13, %r13
	je	LBB32_12
LBB32_9:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_11
## %bb.10:                              ##   in Loop: Header=BB32_9 Depth=1
	callq	__ZdlPv
	jmp	LBB32_11
	.p2align	4, 0x90
LBB32_15:                               ##   in Loop: Header=BB32_13 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r13, %rbx
	testq	%r13, %r13
	je	LBB32_16
LBB32_13:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_15
## %bb.14:                              ##   in Loop: Header=BB32_13 Depth=1
	callq	__ZdlPv
	jmp	LBB32_15
	.p2align	4, 0x90
LBB32_21:                               ##   in Loop: Header=BB32_17 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r13, %rbx
	testq	%r13, %r13
	je	LBB32_22
LBB32_17:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_19
## %bb.18:                              ##   in Loop: Header=BB32_17 Depth=1
	callq	__ZdlPv
LBB32_19:                               ##   in Loop: Header=BB32_17 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_21
## %bb.20:                              ##   in Loop: Header=BB32_17 Depth=1
	callq	__ZdlPv
	jmp	LBB32_21
	.p2align	4, 0x90
LBB32_27:                               ##   in Loop: Header=BB32_23 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r13, %rbx
	testq	%r13, %r13
	je	LBB32_28
LBB32_23:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_25
## %bb.24:                              ##   in Loop: Header=BB32_23 Depth=1
	callq	__ZdlPv
LBB32_25:                               ##   in Loop: Header=BB32_23 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_27
## %bb.26:                              ##   in Loop: Header=BB32_23 Depth=1
	callq	__ZdlPv
	jmp	LBB32_27
LBB32_60:
	subq	%rax, %r8
	movq	%r14, %r11
	shlq	$5, %r11
	leaq	(,%r14,8), %r10
	leaq	(%r10,%r10,2), %r9
	movq	%r14, %rdx
	shlq	$4, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB32_61:                               ## =>This Inner Loop Header: Depth=1
	leaq	(%rbx,%r10), %rdi
	movq	136(%r15), %rsi
	movq	%rdi, 8(%rsi,%rcx,8)
	leaq	(%rbx,%rdx), %rsi
	movq	136(%r15), %rdi
	movq	%rsi, 16(%rdi,%rcx,8)
	leaq	(%rbx,%r9), %rsi
	movq	136(%r15), %rdi
	movq	%rsi, 24(%rdi,%rcx,8)
	addq	%r11, %rbx
	movq	136(%r15), %rsi
	movq	%rbx, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r8
	jne	LBB32_61
## %bb.62:
	incq	%rcx
	testq	%rax, %rax
	je	LBB32_66
LBB32_64:
	leaq	(%rbx,%r14,8), %rdx
	leaq	(,%r14,8), %rsi
	.p2align	4, 0x90
LBB32_65:                               ## =>This Inner Loop Header: Depth=1
	movq	136(%r15), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB32_65
LBB32_66:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %r13
	movq	%rax, 144(%r15)
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %rbx
	testq	%r12, %r12
	je	LBB32_68
## %bb.67:
	leaq	(,%r12,8), %rsi
	movq	%rbx, %rdi
	callq	___bzero
LBB32_68:
	testq	%r14, %r14
	jle	LBB32_78
## %bb.69:
	movq	%rbx, (%r13)
	cmpq	$1, %r14
	je	LBB32_78
## %bb.70:
	leaq	-1(%r14), %r8
	leaq	-2(%r14), %rcx
	movl	%r8d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB32_72
## %bb.71:
	movl	$1, %ecx
	testq	%rax, %rax
	jne	LBB32_76
	jmp	LBB32_78
LBB32_72:
	subq	%rax, %r8
	movq	%r14, %r11
	shlq	$5, %r11
	leaq	(,%r14,8), %r10
	leaq	(%r10,%r10,2), %r9
	movq	%r14, %rdx
	shlq	$4, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB32_73:                               ## =>This Inner Loop Header: Depth=1
	leaq	(%rbx,%r10), %rdi
	movq	144(%r15), %rsi
	movq	%rdi, 8(%rsi,%rcx,8)
	leaq	(%rbx,%rdx), %rsi
	movq	144(%r15), %rdi
	movq	%rsi, 16(%rdi,%rcx,8)
	leaq	(%rbx,%r9), %rsi
	movq	144(%r15), %rdi
	movq	%rsi, 24(%rdi,%rcx,8)
	addq	%r11, %rbx
	movq	144(%r15), %rsi
	movq	%rbx, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r8
	jne	LBB32_73
## %bb.74:
	incq	%rcx
	testq	%rax, %rax
	je	LBB32_78
LBB32_76:
	leaq	(%rbx,%r14,8), %rdx
	leaq	(,%r14,8), %rsi
	.p2align	4, 0x90
LBB32_77:                               ## =>This Inner Loop Header: Depth=1
	movq	144(%r15), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB32_77
LBB32_78:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %r13
	movq	%rax, 152(%r15)
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, %rbx
	testq	%r12, %r12
	je	LBB32_80
## %bb.79:
	shlq	$3, %r12
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	___bzero
LBB32_80:
	testq	%r14, %r14
	jle	LBB32_84
## %bb.81:
	movq	%rbx, (%r13)
	cmpq	$1, %r14
	je	LBB32_91
## %bb.82:
	leaq	-1(%r14), %r8
	leaq	-2(%r14), %rcx
	movl	%r8d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB32_85
## %bb.83:
	movl	$1, %ecx
	testq	%rax, %rax
	jne	LBB32_89
	jmp	LBB32_91
LBB32_84:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, 240(%r15)
	jmp	LBB32_99
LBB32_85:
	subq	%rax, %r8
	movq	%r14, %r11
	shlq	$5, %r11
	leaq	(,%r14,8), %r10
	leaq	(%r10,%r10,2), %r9
	movq	%r14, %rdx
	shlq	$4, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB32_86:                               ## =>This Inner Loop Header: Depth=1
	leaq	(%rbx,%r10), %rdi
	movq	152(%r15), %rsi
	movq	%rdi, 8(%rsi,%rcx,8)
	leaq	(%rbx,%rdx), %rsi
	movq	152(%r15), %rdi
	movq	%rsi, 16(%rdi,%rcx,8)
	leaq	(%rbx,%r9), %rsi
	movq	152(%r15), %rdi
	movq	%rsi, 24(%rdi,%rcx,8)
	addq	%r11, %rbx
	movq	152(%r15), %rsi
	movq	%rbx, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r8
	jne	LBB32_86
## %bb.87:
	incq	%rcx
	testq	%rax, %rax
	je	LBB32_91
LBB32_89:
	leaq	(%rbx,%r14,8), %rdx
	leaq	(,%r14,8), %rsi
	.p2align	4, 0x90
LBB32_90:                               ## =>This Inner Loop Header: Depth=1
	movq	152(%r15), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB32_90
LBB32_91:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, 240(%r15)
	testq	%r14, %r14
	jle	LBB32_99
## %bb.92:
	movq	$0, (%rax)
	cmpq	$1, %r14
	je	LBB32_99
## %bb.93:
	leaq	-1(%r14), %rdx
	leaq	-2(%r14), %rsi
	movl	%edx, %eax
	andl	$3, %eax
	movl	$1, %ecx
	cmpq	$3, %rsi
	jb	LBB32_97
## %bb.94:
	subq	%rax, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB32_95:                               ## =>This Inner Loop Header: Depth=1
	movq	240(%r15), %rsi
	movq	$0, 8(%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 16(%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 24(%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 32(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	LBB32_95
## %bb.96:
	incq	%rcx
LBB32_97:
	testq	%rax, %rax
	je	LBB32_99
	.p2align	4, 0x90
LBB32_98:                               ## =>This Inner Loop Header: Depth=1
	movq	240(%r15), %rdx
	movq	$0, (%rdx,%rcx,8)
	incq	%rcx
	decq	%rax
	jne	LBB32_98
LBB32_99:
	movq	$0, 232(%r15)
	movq	$0, 224(%r15)
	movq	$0, 216(%r15)
	movq	$0, 208(%r15)
	movq	$0, 200(%r15)
	movq	$0, 192(%r15)
	movq	$0, 184(%r15)
	movq	$0, 176(%r15)
	movq	$0, 168(%r15)
	movq	$0, 160(%r15)
	movq	$0, 256(%r15)
	movq	$0, 264(%r15)
	movq	$0, 272(%r15)
	movw	$0, 280(%r15)
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__Znam
	movq	%rax, 248(%r15)
	testq	%r14, %r14
	jle	LBB32_111
## %bb.100:
	cmpq	$4, %r14
	jae	LBB32_102
## %bb.101:
	xorl	%ecx, %ecx
	jmp	LBB32_110
LBB32_102:
	movq	%r14, %rcx
	andq	$-4, %rcx
	leaq	-4(%rcx), %rdi
	movq	%rdi, %rsi
	shrq	$2, %rsi
	incq	%rsi
	movl	%esi, %edx
	andl	$3, %edx
	cmpq	$12, %rdi
	jae	LBB32_104
## %bb.103:
	movdqa	LCPI32_0(%rip), %xmm0   ## xmm0 = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	xorl	%edi, %edi
	jmp	LBB32_106
LBB32_104:
	subq	%rdx, %rsi
	movdqa	LCPI32_0(%rip), %xmm0   ## xmm0 = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	xorl	%edi, %edi
	movdqa	LCPI32_1(%rip), %xmm8   ## xmm8 = [2,2]
	movdqa	LCPI32_2(%rip), %xmm9   ## xmm9 = [4,4]
	movdqa	LCPI32_3(%rip), %xmm10  ## xmm10 = [6,6]
	movdqa	LCPI32_4(%rip), %xmm4   ## xmm4 = [8,8]
	movdqa	LCPI32_5(%rip), %xmm5   ## xmm5 = [10,10]
	movdqa	LCPI32_6(%rip), %xmm6   ## xmm6 = [12,12]
	movdqa	LCPI32_7(%rip), %xmm7   ## xmm7 = [14,14]
	movdqa	LCPI32_8(%rip), %xmm1   ## xmm1 = [16,16]
	.p2align	4, 0x90
LBB32_105:                              ## =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm2
	paddq	%xmm8, %xmm2
	movdqu	%xmm0, (%rax,%rdi,8)
	movdqu	%xmm2, 16(%rax,%rdi,8)
	movdqa	%xmm0, %xmm2
	paddq	%xmm9, %xmm2
	movdqa	%xmm0, %xmm3
	paddq	%xmm10, %xmm3
	movdqu	%xmm2, 32(%rax,%rdi,8)
	movdqu	%xmm3, 48(%rax,%rdi,8)
	movdqa	%xmm0, %xmm2
	paddq	%xmm4, %xmm2
	movdqa	%xmm0, %xmm3
	paddq	%xmm5, %xmm3
	movdqu	%xmm2, 64(%rax,%rdi,8)
	movdqu	%xmm3, 80(%rax,%rdi,8)
	movdqa	%xmm0, %xmm2
	paddq	%xmm6, %xmm2
	movdqa	%xmm0, %xmm3
	paddq	%xmm7, %xmm3
	movdqu	%xmm2, 96(%rax,%rdi,8)
	movdqu	%xmm3, 112(%rax,%rdi,8)
	addq	$16, %rdi
	paddq	%xmm1, %xmm0
	addq	$-4, %rsi
	jne	LBB32_105
LBB32_106:
	testq	%rdx, %rdx
	je	LBB32_109
## %bb.107:
	leaq	16(%rax,%rdi,8), %rsi
	negq	%rdx
	movdqa	LCPI32_1(%rip), %xmm1   ## xmm1 = [2,2]
	movdqa	LCPI32_2(%rip), %xmm2   ## xmm2 = [4,4]
	.p2align	4, 0x90
LBB32_108:                              ## =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm3
	paddq	%xmm1, %xmm3
	movdqu	%xmm0, -16(%rsi)
	movdqu	%xmm3, (%rsi)
	paddq	%xmm2, %xmm0
	addq	$32, %rsi
	incq	%rdx
	jne	LBB32_108
LBB32_109:
	cmpq	%r14, %rcx
	je	LBB32_111
	.p2align	4, 0x90
LBB32_110:                              ## =>This Inner Loop Header: Depth=1
	movq	%rcx, (%rax,%rcx,8)
	incq	%rcx
	cmpq	%r14, %rcx
	jl	LBB32_110
LBB32_111:
	movq	288(%r15), %rbx
	testq	%rbx, %rbx
	je	LBB32_115
## %bb.112:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_114
## %bb.113:
	callq	__ZdlPv
LBB32_114:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB32_115:
	movq	296(%r15), %rbx
	testq	%rbx, %rbx
	je	LBB32_119
## %bb.116:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_118
## %bb.117:
	callq	__ZdlPv
LBB32_118:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB32_119:
	movq	304(%r15), %rbx
	testq	%rbx, %rbx
	je	LBB32_123
## %bb.120:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_122
## %bb.121:
	callq	__ZdlPv
LBB32_122:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB32_123:
	movq	336(%r15), %rbx
	testq	%rbx, %rbx
	je	LBB32_129
## %bb.124:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_126
## %bb.125:
	callq	__ZdlPv
LBB32_126:
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_128
## %bb.127:
	callq	__ZdlPv
LBB32_128:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB32_129:
	movq	344(%r15), %rbx
	testq	%rbx, %rbx
	je	LBB32_135
## %bb.130:
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_132
## %bb.131:
	callq	__ZdlPv
LBB32_132:
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB32_134
## %bb.133:
	callq	__ZdlPv
LBB32_134:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB32_135:
	leaq	288(%r15), %rbx
	movq	312(%r15), %r14
	testq	%r14, %r14
	je	LBB32_139
## %bb.136:
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB32_138
## %bb.137:
	callq	__ZdlPv
LBB32_138:
	movq	%r14, %rdi
	callq	__ZdlPv
LBB32_139:
	movq	$0, 24(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, 8(%rbx)
	movq	$0, (%rbx)
	movq	$1234567, 8(%r15)       ## imm = 0x12D687
	movq	$0, 320(%r15)
	movq	$0, 328(%r15)
	movq	$0, 336(%r15)
	movq	$0, 344(%r15)
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV13vSetStartTimeEl ## -- Begin function _ZN8MARKOVLV13vSetStartTimeEl
	.p2align	4, 0x90
__ZN8MARKOVLV13vSetStartTimeEl:         ## @_ZN8MARKOVLV13vSetStartTimeEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	xorl	%eax, %eax
	testq	%rsi, %rsi
	cmovnsq	%rsi, %rax
	movq	%rdi, %r14
	movq	%rax, 48(%rdi)
	movq	32(%rdi), %rax
	cmpq	%rsi, %rax
	jg	LBB33_2
## %bb.1:
	decq	%rax
	movq	%rax, 48(%r14)
LBB33_2:
	movq	256(%r14), %rax
	testq	%rax, %rax
	jle	LBB33_4
## %bb.3:
	negq	%rax
	movq	%rax, 256(%r14)
LBB33_4:
	movq	112(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB33_7
	.p2align	4, 0x90
LBB33_5:                                ## =>This Inner Loop Header: Depth=1
	movq	8(%rbx), %rsi
	movq	32(%rbx), %rdi
	imulq	16(%rbx), %rsi
	shlq	$3, %rsi
	callq	___bzero
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	LBB33_5
LBB33_7:
	movq	264(%r14), %rax
	testq	%rax, %rax
	jle	LBB33_9
## %bb.8:
	negq	%rax
	movq	%rax, 264(%r14)
LBB33_9:
	movq	120(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB33_12
	.p2align	4, 0x90
LBB33_10:                               ## =>This Inner Loop Header: Depth=1
	movq	8(%rbx), %rsi
	movq	32(%rbx), %rdi
	imulq	16(%rbx), %rsi
	shlq	$3, %rsi
	callq	___bzero
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	LBB33_10
LBB33_12:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV12vSetStopTimeEl ## -- Begin function _ZN8MARKOVLV12vSetStopTimeEl
	.p2align	4, 0x90
__ZN8MARKOVLV12vSetStopTimeEl:          ## @_ZN8MARKOVLV12vSetStopTimeEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	xorl	%eax, %eax
	testq	%rsi, %rsi
	cmovnsq	%rsi, %rax
	movq	%rdi, %r14
	movq	%rax, 56(%rdi)
	movq	32(%rdi), %rax
	cmpq	%rsi, %rax
	jg	LBB34_2
## %bb.1:
	decq	%rax
	movq	%rax, 56(%r14)
LBB34_2:
	movq	256(%r14), %rax
	testq	%rax, %rax
	jle	LBB34_4
## %bb.3:
	negq	%rax
	movq	%rax, 256(%r14)
LBB34_4:
	movq	112(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB34_7
	.p2align	4, 0x90
LBB34_5:                                ## =>This Inner Loop Header: Depth=1
	movq	8(%rbx), %rsi
	movq	32(%rbx), %rdi
	imulq	16(%rbx), %rsi
	shlq	$3, %rsi
	callq	___bzero
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	LBB34_5
LBB34_7:
	movq	264(%r14), %rax
	testq	%rax, %rax
	jle	LBB34_9
## %bb.8:
	negq	%rax
	movq	%rax, 264(%r14)
LBB34_9:
	movq	120(%r14), %rbx
	testq	%rbx, %rbx
	je	LBB34_12
	.p2align	4, 0x90
LBB34_10:                               ## =>This Inner Loop Header: Depth=1
	movq	8(%rbx), %rsi
	movq	32(%rbx), %rdi
	imulq	16(%rbx), %rsi
	shlq	$3, %rsi
	callq	___bzero
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	LBB34_10
LBB34_12:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV12vSetNrStatesEl ## -- Begin function _ZN8MARKOVLV12vSetNrStatesEl
	.p2align	4, 0x90
__ZN8MARKOVLV12vSetNrStatesEl:          ## @_ZN8MARKOVLV12vSetNrStatesEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	testq	%rsi, %rsi
	movl	$1, %eax
	cmovnsq	%rsi, %rax
	movq	40(%rdi), %rcx
	movq	112(%rdi), %rbx
	cmpq	%rsi, %rcx
	cmovleq	%rcx, %rax
	movq	%rax, 64(%rdi)
	movq	$0, 256(%rdi)
	movq	$0, 264(%rdi)
	testq	%rbx, %rbx
	jne	LBB35_1
LBB35_6:
	movq	120(%r14), %rbx
	testq	%rbx, %rbx
	jne	LBB35_7
LBB35_12:
	movq	$0, 232(%r14)
	movq	$0, 224(%r14)
	movq	$0, 216(%r14)
	movq	$0, 208(%r14)
	movq	$0, 200(%r14)
	movq	$0, 192(%r14)
	movq	$0, 184(%r14)
	movq	$0, 176(%r14)
	movq	$0, 168(%r14)
	movq	$0, 160(%r14)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.p2align	4, 0x90
LBB35_5:                                ##   in Loop: Header=BB35_1 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB35_6
LBB35_1:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB35_3
## %bb.2:                               ##   in Loop: Header=BB35_1 Depth=1
	callq	__ZdlPv
LBB35_3:                                ##   in Loop: Header=BB35_1 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB35_5
## %bb.4:                               ##   in Loop: Header=BB35_1 Depth=1
	callq	__ZdlPv
	jmp	LBB35_5
	.p2align	4, 0x90
LBB35_11:                               ##   in Loop: Header=BB35_7 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r15, %rbx
	testq	%r15, %r15
	je	LBB35_12
LBB35_7:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r15
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB35_9
## %bb.8:                               ##   in Loop: Header=BB35_7 Depth=1
	callq	__ZdlPv
LBB35_9:                                ##   in Loop: Header=BB35_7 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB35_11
## %bb.10:                              ##   in Loop: Header=BB35_7 Depth=1
	callq	__ZdlPv
	jmp	LBB35_11
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV11vSetGetDataEb ## -- Begin function _ZN8MARKOVLV11vSetGetDataEb
	.p2align	4, 0x90
__ZN8MARKOVLV11vSetGetDataEb:           ## @_ZN8MARKOVLV11vSetGetDataEb
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%sil, 280(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV7dSetPreEllld
LCPI37_0:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV7dSetPreEllld
	.p2align	4, 0x90
__ZN8MARKOVLV7dSetPreEllld:             ## @_ZN8MARKOVLV7dSetPreEllld
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	cmpb	$0, 280(%rdi)
	movq	128(%rdi), %r12
	movq	(%r12,%rdx,8), %rax
	je	LBB37_5
## %bb.1:
	xorpd	%xmm0, %xmm0
	testq	%r14, %r14
	js	LBB37_24
## %bb.2:
	testq	%rax, %rax
	je	LBB37_24
## %bb.3:
	cmpq	%r14, 24(%rax)
	jle	LBB37_24
## %bb.4:
	movq	32(%rax), %rax
	movsd	(%rax,%r14,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB37_24
LBB37_5:
	movapd	%xmm0, %xmm1
	movq	%rdx, %r15
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	LBB37_6
## %bb.14:
	cmpb	$0, (%rbx)
	movq	128(%rbx), %rax
	movq	(%rax,%r15,8), %rax
	je	LBB37_18
LBB37_15:
	xorpd	%xmm0, %xmm0
	testq	%r14, %r14
	js	LBB37_24
## %bb.16:
	cmpq	%r14, 24(%rax)
	jle	LBB37_24
## %bb.17:
	movq	32(%rax), %rax
	addsd	(%rax,%r14,8), %xmm1
	movsd	%xmm1, (%rax,%r14,8)
	jmp	LBB37_23
LBB37_6:
	movq	80(%rbx), %rax
	testq	%rax, %rax
	movsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	je	LBB37_11
## %bb.7:
	movq	%r12, -48(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB37_8:                                ## =>This Inner Loop Header: Depth=1
	movq	%rax, %r13
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	LBB37_8
## %bb.9:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$8, %ecx
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rsi, %r12
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	movq	%rdi, 24(%rsi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp0:
	callq	__Znam
Ltmp1:
## %bb.10:
	movq	%rax, 32(%r12)
	movq	%r15, 8(%r12)
	movq	%r15, 16(%r12)
	movq	$0, (%r12)
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	movq	%r12, (%r13)
	movq	%r12, %r13
	movq	-48(%rbp), %r12         ## 8-byte Reload
	jmp	LBB37_13
LBB37_11:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %r13
	movq	32(%rbx), %rsi
	movl	$8, %ecx
	movq	%rsi, %rax
	mulq	%rcx
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	movq	%rsi, 24(%r13)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp3:
	callq	__Znam
Ltmp4:
## %bb.12:
	movq	%rax, 32(%r13)
	movq	%r15, 8(%r13)
	movq	%r15, 16(%r13)
	movq	$0, (%r13)
	movq	-48(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	movq	%r13, 80(%rbx)
LBB37_13:
	movq	%r13, (%r12,%r15,8)
	movsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	cmpb	$0, (%rbx)
	movq	128(%rbx), %rax
	movq	(%rax,%r15,8), %rax
	jne	LBB37_15
LBB37_18:
	testq	%r14, %r14
	js	LBB37_22
## %bb.19:
	cmpq	%r14, 24(%rax)
	jle	LBB37_22
## %bb.20:
	movq	32(%rax), %rax
	movsd	%xmm1, (%rax,%r14,8)
	jmp	LBB37_23
LBB37_22:
	addsd	LCPI37_0(%rip), %xmm1
LBB37_23:
	movapd	%xmm1, %xmm0
LBB37_24:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB37_25:
Ltmp5:
	movq	%r13, %rdi
	jmp	LBB37_26
LBB37_27:
Ltmp2:
	movq	%r12, %rdi
LBB37_26:
	movq	%rax, %rbx
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table37:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0 ## >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0     ##   Call between Lfunc_begin0 and Ltmp0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0     ##     jumps to Ltmp2
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0     ## >> Call Site 3 <<
	.uleb128 Ltmp3-Ltmp1            ##   Call between Ltmp1 and Ltmp3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0     ## >> Call Site 4 <<
	.uleb128 Ltmp4-Ltmp3            ##   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0     ##     jumps to Ltmp5
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp4-Lfunc_begin0     ## >> Call Site 5 <<
	.uleb128 Lfunc_end0-Ltmp4       ##   Call between Ltmp4 and Lfunc_end0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV8dSetPostEllld
LCPI38_0:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV8dSetPostEllld
	.p2align	4, 0x90
__ZN8MARKOVLV8dSetPostEllld:            ## @_ZN8MARKOVLV8dSetPostEllld
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpb	$0, 280(%rdi)
	movq	%rsi, %r14
	movq	136(%rdi), %r13
	movq	(%r13,%rdx,8), %rax
	movq	(%rax,%rcx,8), %rax
	je	LBB38_5
## %bb.1:
	xorpd	%xmm0, %xmm0
	testq	%r14, %r14
	js	LBB38_27
## %bb.2:
	testq	%rax, %rax
	je	LBB38_27
## %bb.3:
	cmpq	%r14, 24(%rax)
	jle	LBB38_27
## %bb.4:
	movq	32(%rax), %rax
	movsd	(%rax,%r14,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB38_27
LBB38_5:
	movq	%rdi, %rbx
	movapd	%xmm0, %xmm1
	movq	%rcx, %r15
	movq	%rdx, %r12
	testq	%rax, %rax
	jne	LBB38_12
## %bb.6:
	movq	88(%rbx), %rax
	testq	%rax, %rax
	movsd	%xmm1, -72(%rbp)        ## 8-byte Spill
	je	LBB38_16
## %bb.7:
	movq	%r13, -56(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB38_8:                                ## =>This Inner Loop Header: Depth=1
	movq	%rax, %r13
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	LBB38_8
## %bb.9:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$8, %ecx
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	movq	%rdi, 24(%rsi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp6:
	callq	__Znam
Ltmp7:
## %bb.10:
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 32(%rcx)
	movq	%r12, 8(%rcx)
	movq	%r15, 16(%rcx)
	movq	$0, (%rcx)
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%r13)
	movq	-56(%rbp), %r13         ## 8-byte Reload
	jmp	LBB38_11
LBB38_16:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$8, %ecx
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	movq	%rdi, 24(%rsi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp9:
	callq	__Znam
Ltmp10:
## %bb.17:
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 32(%rcx)
	movq	%r12, 8(%rcx)
	movq	%r15, 16(%rcx)
	movq	$0, (%rcx)
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, 88(%rbx)
LBB38_11:
	movq	(%r13,%r12,8), %rax
	movq	%rcx, (%rax,%r15,8)
	movsd	-72(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
LBB38_12:
	cmpb	$0, (%rbx)
	movq	136(%rbx), %rax
	movq	(%rax,%r12,8), %rax
	movq	(%rax,%r15,8), %rax
	je	LBB38_21
## %bb.13:
	xorpd	%xmm0, %xmm0
	testq	%r14, %r14
	js	LBB38_27
## %bb.14:
	cmpq	%r14, 24(%rax)
	jle	LBB38_27
## %bb.15:
	movq	32(%rax), %rax
	addsd	(%rax,%r14,8), %xmm1
	movsd	%xmm1, (%rax,%r14,8)
	jmp	LBB38_26
LBB38_21:
	testq	%r14, %r14
	js	LBB38_25
## %bb.22:
	cmpq	%r14, 24(%rax)
	jle	LBB38_25
## %bb.23:
	movq	32(%rax), %rax
	movsd	%xmm1, (%rax,%r14,8)
	jmp	LBB38_26
LBB38_25:
	addsd	LCPI38_0(%rip), %xmm1
LBB38_26:
	movapd	%xmm1, %xmm0
LBB38_27:
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB38_18:
Ltmp11:
	jmp	LBB38_19
LBB38_20:
Ltmp8:
LBB38_19:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rbx
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table38:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1 ## >> Call Site 1 <<
	.uleb128 Ltmp6-Lfunc_begin1     ##   Call between Lfunc_begin1 and Ltmp6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin1     ## >> Call Site 2 <<
	.uleb128 Ltmp7-Ltmp6            ##   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin1     ##     jumps to Ltmp8
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp7-Lfunc_begin1     ## >> Call Site 3 <<
	.uleb128 Ltmp9-Ltmp7            ##   Call between Ltmp7 and Ltmp9
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp9-Lfunc_begin1     ## >> Call Site 4 <<
	.uleb128 Ltmp10-Ltmp9           ##   Call between Ltmp9 and Ltmp10
	.uleb128 Ltmp11-Lfunc_begin1    ##     jumps to Ltmp11
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp10-Lfunc_begin1    ## >> Call Site 5 <<
	.uleb128 Lfunc_end1-Ltmp10      ##   Call between Ltmp10 and Lfunc_end1
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end1:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV7dSetPijEllld
LCPI39_0:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV7dSetPijEllld
	.p2align	4, 0x90
__ZN8MARKOVLV7dSetPijEllld:             ## @_ZN8MARKOVLV7dSetPijEllld
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpb	$0, 280(%rdi)
	movq	%rsi, %r13
	movq	144(%rdi), %rbx
	movq	(%rbx,%rdx,8), %rax
	movq	(%rax,%rcx,8), %rax
	je	LBB39_5
## %bb.1:
	xorpd	%xmm0, %xmm0
	testq	%r13, %r13
	js	LBB39_18
## %bb.2:
	testq	%rax, %rax
	je	LBB39_18
## %bb.3:
	cmpq	%r13, 24(%rax)
	jle	LBB39_18
## %bb.4:
	movq	32(%rax), %rax
	movsd	(%rax,%r13,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB39_18
LBB39_5:
	movq	%rdi, %r14
	movq	%rcx, %r15
	movq	%rdx, %r12
	testq	%rax, %rax
	je	LBB39_6
## %bb.14:
	testq	%r13, %r13
	jns	LBB39_15
	jmp	LBB39_17
LBB39_6:
	movq	96(%r14), %rax
	testq	%rax, %rax
	movsd	%xmm0, -72(%rbp)        ## 8-byte Spill
	je	LBB39_11
## %bb.7:
	movq	%r13, -48(%rbp)         ## 8-byte Spill
	movq	%rbx, -56(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB39_8:                                ## =>This Inner Loop Header: Depth=1
	movq	%rax, %r13
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	LBB39_8
## %bb.9:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %rsi
	movq	32(%r14), %rdi
	movl	$8, %ecx
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rsi, %rbx
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	movq	%rdi, 24(%rsi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp12:
	callq	__Znam
Ltmp13:
## %bb.10:
	movq	%rax, 32(%rbx)
	movq	%r12, 8(%rbx)
	movq	%r15, 16(%rbx)
	movq	$0, (%rbx)
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	movq	%rbx, %rcx
	movq	%rbx, (%r13)
	movq	-56(%rbp), %rbx         ## 8-byte Reload
	movq	-48(%rbp), %r13         ## 8-byte Reload
	jmp	LBB39_13
LBB39_11:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %rsi
	movq	32(%r14), %rdi
	movl	$8, %ecx
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	movq	%rdi, 24(%rsi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp15:
	callq	__Znam
Ltmp16:
## %bb.12:
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 32(%rcx)
	movq	%r12, 8(%rcx)
	movq	%r15, 16(%rcx)
	movq	$0, (%rcx)
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, 96(%r14)
LBB39_13:
	movq	(%rbx,%r12,8), %rax
	movq	%rcx, (%rax,%r15,8)
	movsd	-72(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	testq	%r13, %r13
	js	LBB39_17
LBB39_15:
	movq	144(%r14), %rax
	movq	(%rax,%r12,8), %rax
	movq	(%rax,%r15,8), %rax
	cmpq	%r13, 24(%rax)
	jle	LBB39_17
## %bb.16:
	movq	32(%rax), %rax
	movsd	%xmm0, (%rax,%r13,8)
	jmp	LBB39_18
LBB39_17:
	addsd	LCPI39_0(%rip), %xmm0
LBB39_18:
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB39_19:
Ltmp17:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	jmp	LBB39_20
LBB39_21:
Ltmp14:
	movq	%rbx, %rdi
LBB39_20:
	movq	%rax, %rbx
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table39:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2 ## >> Call Site 1 <<
	.uleb128 Ltmp12-Lfunc_begin2    ##   Call between Lfunc_begin2 and Ltmp12
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin2    ## >> Call Site 2 <<
	.uleb128 Ltmp13-Ltmp12          ##   Call between Ltmp12 and Ltmp13
	.uleb128 Ltmp14-Lfunc_begin2    ##     jumps to Ltmp14
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp13-Lfunc_begin2    ## >> Call Site 3 <<
	.uleb128 Ltmp15-Ltmp13          ##   Call between Ltmp13 and Ltmp15
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin2    ## >> Call Site 4 <<
	.uleb128 Ltmp16-Ltmp15          ##   Call between Ltmp15 and Ltmp16
	.uleb128 Ltmp17-Lfunc_begin2    ##     jumps to Ltmp17
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp16-Lfunc_begin2    ## >> Call Site 5 <<
	.uleb128 Lfunc_end2-Ltmp16      ##   Call between Ltmp16 and Lfunc_end2
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end2:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV8dSetDiscEllld
LCPI40_0:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV8dSetDiscEllld
	.p2align	4, 0x90
__ZN8MARKOVLV8dSetDiscEllld:            ## @_ZN8MARKOVLV8dSetDiscEllld
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r12
	cmpb	$0, 281(%rdi)
	cmoveq	%rdx, %r12
	cmpb	$0, 280(%rdi)
	movq	%rsi, %r14
	movq	152(%rdi), %r13
	movq	(%r13,%rdx,8), %rax
	movq	(%rax,%r12,8), %rax
	je	LBB40_5
## %bb.1:
	xorpd	%xmm0, %xmm0
	testq	%r14, %r14
	js	LBB40_21
## %bb.2:
	testq	%rax, %rax
	je	LBB40_21
## %bb.3:
	cmpq	%r14, 24(%rax)
	jle	LBB40_21
## %bb.4:
	movq	32(%rax), %rax
	movsd	(%rax,%r14,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB40_21
LBB40_5:
	movq	%rdx, %r15
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	LBB40_6
## %bb.12:
	testq	%r14, %r14
	jns	LBB40_13
	jmp	LBB40_20
LBB40_6:
	movq	104(%rbx), %rax
	testq	%rax, %rax
	movsd	%xmm0, -72(%rbp)        ## 8-byte Spill
	je	LBB40_15
## %bb.7:
	movq	%r13, -56(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB40_8:                                ## =>This Inner Loop Header: Depth=1
	movq	%rax, %r13
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	LBB40_8
## %bb.9:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$8, %ecx
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	movq	%rdi, 24(%rsi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp18:
	callq	__Znam
Ltmp19:
## %bb.10:
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 32(%rcx)
	movq	%r15, 8(%rcx)
	movq	%r12, 16(%rcx)
	movq	$0, (%rcx)
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%r13)
	movq	-56(%rbp), %r13         ## 8-byte Reload
	jmp	LBB40_11
LBB40_15:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %rsi
	movq	32(%rbx), %rdi
	movl	$8, %ecx
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	movq	%rdi, 24(%rsi)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp21:
	callq	__Znam
Ltmp22:
## %bb.16:
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 32(%rcx)
	movq	%r15, 8(%rcx)
	movq	%r12, 16(%rcx)
	movq	$0, (%rcx)
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	movq	%rax, %rdi
	callq	___bzero
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, 104(%rbx)
LBB40_11:
	movq	(%r13,%r15,8), %rax
	movq	%rcx, (%rax,%r12,8)
	movsd	-72(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	testq	%r14, %r14
	js	LBB40_20
LBB40_13:
	movq	152(%rbx), %rax
	movq	(%rax,%r15,8), %rax
	movq	(%rax,%r12,8), %rax
	cmpq	%r14, 24(%rax)
	jle	LBB40_20
## %bb.14:
	movq	32(%rax), %rax
	movsd	%xmm0, (%rax,%r14,8)
	jmp	LBB40_21
LBB40_20:
	addsd	LCPI40_0(%rip), %xmm0
LBB40_21:
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB40_17:
Ltmp23:
	jmp	LBB40_18
LBB40_19:
Ltmp20:
LBB40_18:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rbx
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table40:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3 ## >> Call Site 1 <<
	.uleb128 Ltmp18-Lfunc_begin3    ##   Call between Lfunc_begin3 and Ltmp18
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp18-Lfunc_begin3    ## >> Call Site 2 <<
	.uleb128 Ltmp19-Ltmp18          ##   Call between Ltmp18 and Ltmp19
	.uleb128 Ltmp20-Lfunc_begin3    ##     jumps to Ltmp20
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp19-Lfunc_begin3    ## >> Call Site 3 <<
	.uleb128 Ltmp21-Ltmp19          ##   Call between Ltmp19 and Ltmp21
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp21-Lfunc_begin3    ## >> Call Site 4 <<
	.uleb128 Ltmp22-Ltmp21          ##   Call between Ltmp21 and Ltmp22
	.uleb128 Ltmp23-Lfunc_begin3    ##     jumps to Ltmp23
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp22-Lfunc_begin3    ## >> Call Site 5 <<
	.uleb128 Lfunc_end3-Ltmp22      ##   Call between Ltmp22 and Lfunc_end3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end3:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV17vSetInterestModelEb ## -- Begin function _ZN8MARKOVLV17vSetInterestModelEb
	.p2align	4, 0x90
__ZN8MARKOVLV17vSetInterestModelEb:     ## @_ZN8MARKOVLV17vSetInterestModelEb
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movq	%rdi, %rbx
	cmpb	%r14b, 281(%rdi)
	je	LBB41_2
## %bb.1:
	movq	%rbx, %rdi
	callq	__ZN8MARKOVLV6vResetEv
LBB41_2:
	movb	%r14b, 281(%rbx)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV20vSetDefaultNrMomentsEl ## -- Begin function _ZN8MARKOVLV20vSetDefaultNrMomentsEl
	.p2align	4, 0x90
__ZN8MARKOVLV20vSetDefaultNrMomentsEl:  ## @_ZN8MARKOVLV20vSetDefaultNrMomentsEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %r15
	movq	112(%rdi), %rbx
	testq	%rbx, %rbx
	jne	LBB42_1
LBB42_6:
	movq	120(%r15), %rbx
	testq	%rbx, %rbx
	jne	LBB42_10
LBB42_7:
	movq	$0, 232(%r15)
	movq	$0, 224(%r15)
	movq	$0, 216(%r15)
	movq	$0, 208(%r15)
	movq	$0, 200(%r15)
	movq	$0, 192(%r15)
	movq	$0, 184(%r15)
	movq	$0, 176(%r15)
	movq	$0, 168(%r15)
	movq	$0, 160(%r15)
	movq	40(%r15), %rdx
	testq	%rdx, %rdx
	jle	LBB42_19
## %bb.8:
	leaq	-1(%rdx), %rcx
	movl	%edx, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	LBB42_15
## %bb.9:
	xorl	%ecx, %ecx
	jmp	LBB42_17
	.p2align	4, 0x90
LBB42_5:                                ##   in Loop: Header=BB42_1 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r12, %rbx
	testq	%r12, %r12
	je	LBB42_6
LBB42_1:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB42_3
## %bb.2:                               ##   in Loop: Header=BB42_1 Depth=1
	callq	__ZdlPv
LBB42_3:                                ##   in Loop: Header=BB42_1 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB42_5
## %bb.4:                               ##   in Loop: Header=BB42_1 Depth=1
	callq	__ZdlPv
	jmp	LBB42_5
	.p2align	4, 0x90
LBB42_14:                               ##   in Loop: Header=BB42_10 Depth=1
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r12, %rbx
	testq	%r12, %r12
	je	LBB42_7
LBB42_10:                               ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB42_12
## %bb.11:                              ##   in Loop: Header=BB42_10 Depth=1
	callq	__ZdlPv
LBB42_12:                               ##   in Loop: Header=BB42_10 Depth=1
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	LBB42_14
## %bb.13:                              ##   in Loop: Header=BB42_10 Depth=1
	callq	__ZdlPv
	jmp	LBB42_14
LBB42_15:
	subq	%rax, %rdx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB42_16:                               ## =>This Inner Loop Header: Depth=1
	movq	240(%r15), %rsi
	movq	$0, (%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 8(%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 16(%rsi,%rcx,8)
	movq	240(%r15), %rsi
	movq	$0, 24(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	LBB42_16
LBB42_17:
	testq	%rax, %rax
	je	LBB42_19
	.p2align	4, 0x90
LBB42_18:                               ## =>This Inner Loop Header: Depth=1
	movq	240(%r15), %rdx
	movq	$0, (%rdx,%rcx,8)
	incq	%rcx
	decq	%rax
	jne	LBB42_18
LBB42_19:
	movq	$0, 264(%r15)
	movq	$0, 256(%r15)
	movq	%r14, 72(%r15)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV6dGetDKElll
LCPI43_0:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV6dGetDKElll
	.p2align	4, 0x90
__ZN8MARKOVLV6dGetDKElll:               ## @_ZN8MARKOVLV6dGetDKElll
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1080, %rsp             ## imm = 0x438
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	testq	%rcx, %rcx
	movl	$1, %edi
	cmovgq	%rcx, %rdi
	movq	256(%r15), %rax
	cmpq	%rdi, %rax
	jge	LBB43_1
## %bb.6:
	movq	%rdi, -1064(%rbp)       ## 8-byte Spill
	movq	%rsi, -1056(%rbp)       ## 8-byte Spill
	movq	%rdx, -1048(%rbp)       ## 8-byte Spill
	testq	%rax, %rax
	movq	%r15, -944(%rbp)        ## 8-byte Spill
	je	LBB43_8
## %bb.7:
	movq	72(%r15), %r14
	jmp	LBB43_40
LBB43_1:
	xorpd	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB43_125
## %bb.2:
	testq	%rdx, %rdx
	js	LBB43_125
## %bb.3:
	movq	160(%r15,%rdi,8), %rax
	cmpq	%rsi, 8(%rax)
	jle	LBB43_125
## %bb.4:
	cmpq	%rdx, 16(%rax)
	jle	LBB43_125
## %bb.5:
	movq	40(%rax), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%rdx,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB43_125
LBB43_8:
	movl	$48, %edi
	callq	__Znwm
	movq	%rax, %r12
	movq	32(%r15), %r14
	movq	64(%r15), %r13
	movq	%r13, -952(%rbp)        ## 8-byte Spill
	imulq	%r14, %r13
	movl	$8, %ecx
	movq	%r13, %rax
	mulq	%rcx
	movq	$-1, %rbx
	cmovoq	%rbx, %rax
Ltmp24:
	movq	%rax, %rdi
	callq	__Znam
Ltmp25:
## %bb.9:
	movq	%rax, %r15
	movq	%rax, 32(%r12)
	movq	%r14, %rax
	movl	$8, %ecx
	mulq	%rcx
	cmovnoq	%rax, %rbx
Ltmp26:
	movq	%rbx, %rdi
	callq	__Znam
Ltmp27:
## %bb.10:
	movq	%rax, 40(%r12)
	testq	%r14, %r14
	jle	LBB43_11
## %bb.12:
	movq	%r15, (%rax)
	cmpq	$1, %r14
	movq	-952(%rbp), %rbx        ## 8-byte Reload
	je	LBB43_23
## %bb.13:
	leaq	(%r15,%rbx,8), %rcx
	movq	%rcx, 8(%rax)
	cmpq	$2, %r14
	je	LBB43_23
## %bb.14:
	leaq	(%rcx,%rbx,8), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$3, %r14
	je	LBB43_22
## %bb.15:
	leal	-3(%r14), %eax
	leaq	-4(%r14), %rsi
	andl	$3, %eax
	movl	$3, %ecx
	cmpq	$3, %rsi
	jb	LBB43_19
## %bb.16:
	movq	%rbx, %r10
	shlq	$5, %r10
	movq	%r14, %rdi
	movq	%rbx, %r8
	shlq	$4, %r8
	leaq	(%r8,%r8,2), %r9
	leaq	(,%rbx,8), %rcx
	leaq	(%rcx,%rcx,4), %r11
	leaq	(%rcx,%rcx,2), %r14
	movq	%rdi, -976(%rbp)        ## 8-byte Spill
	subq	%rax, %rdi
	movl	$3, %ecx
	.p2align	4, 0x90
LBB43_17:                               ## =>This Inner Loop Header: Depth=1
	movq	%r15, %rsi
	movq	40(%r12), %rbx
	leaq	(%r15,%r14), %rdx
	movq	%rdx, (%rbx,%rcx,8)
	movq	40(%r12), %rdx
	leaq	(%r15,%r10), %r15
	movq	%r15, 8(%rdx,%rcx,8)
	movq	40(%r12), %rdx
	leaq	(%rsi,%r11), %rbx
	movq	%rbx, 16(%rdx,%rcx,8)
	movq	40(%r12), %rdx
	addq	%r9, %rsi
	movq	%rsi, 24(%rdx,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdi
	jne	LBB43_17
## %bb.18:
	addq	%r8, %r15
	movq	%r15, %rdx
	movq	-952(%rbp), %rbx        ## 8-byte Reload
	movq	-976(%rbp), %r14        ## 8-byte Reload
LBB43_19:
	testq	%rax, %rax
	je	LBB43_22
## %bb.20:
	leaq	(%rdx,%rbx,8), %rdx
	leaq	(,%rbx,8), %rsi
	.p2align	4, 0x90
LBB43_21:                               ## =>This Inner Loop Header: Depth=1
	movq	40(%r12), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB43_21
LBB43_22:
	movq	32(%r12), %r15
	jmp	LBB43_23
LBB43_11:
	movq	-952(%rbp), %rbx        ## 8-byte Reload
LBB43_23:
	movq	%r14, 8(%r12)
	movq	%rbx, 16(%r12)
	movq	$1, 24(%r12)
	movq	$0, (%r12)
	shlq	$3, %r13
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	___bzero
	movq	-944(%rbp), %r15        ## 8-byte Reload
	movq	%r12, 112(%r15)
	movq	%r12, 168(%r15)
	movq	72(%r15), %r14
	cmpq	$2, %r14
	jge	LBB43_24
LBB43_40:
	leaq	-848(%rbp), %rdi
	movl	$800, %esi              ## imm = 0x320
	callq	___bzero
	movq	%r14, -968(%rbp)        ## 8-byte Spill
	testq	%r14, %r14
	js	LBB43_48
## %bb.41:
	leaq	-936(%rbp), %rax
	movl	$1, %ecx
	xorl	%edx, %edx
	movsd	LCPI43_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	jmp	LBB43_42
	.p2align	4, 0x90
LBB43_47:                               ##   in Loop: Header=BB43_42 Depth=1
	incq	%rcx
	addq	$80, %rax
	cmpq	-968(%rbp), %rdx        ## 8-byte Folded Reload
	leaq	1(%rdx), %rdx
	jge	LBB43_48
LBB43_42:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB43_43 Depth 2
	xorl	%esi, %esi
	jmp	LBB43_43
	.p2align	4, 0x90
LBB43_46:                               ##   in Loop: Header=BB43_43 Depth=2
	movsd	%xmm1, 88(%rax,%rsi,8)
	incq	%rsi
	cmpq	%rsi, %rcx
	je	LBB43_47
LBB43_43:                               ##   Parent Loop BB43_42 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movapd	%xmm0, %xmm1
	testq	%rsi, %rsi
	je	LBB43_46
## %bb.44:                              ##   in Loop: Header=BB43_43 Depth=2
	movapd	%xmm0, %xmm1
	cmpq	%rsi, %rdx
	je	LBB43_46
## %bb.45:                              ##   in Loop: Header=BB43_43 Depth=2
	movsd	(%rax,%rsi,8), %xmm1    ## xmm1 = mem[0],zero
	addsd	8(%rax,%rsi,8), %xmm1
	jmp	LBB43_46
LBB43_48:
	movq	48(%r15), %r14
	movq	56(%r15), %rax
	movq	%rax, -1072(%rbp)       ## 8-byte Spill
	cmpq	%rax, %r14
	movq	-968(%rbp), %rbx        ## 8-byte Reload
	jle	LBB43_119
## %bb.49:
	movq	-944(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rcx
	movq	%rcx, -1016(%rbp)       ## 8-byte Spill
	leaq	(,%rbx,8), %rcx
	movq	%rcx, -1080(%rbp)       ## 8-byte Spill
	addq	$168, %rax
	movq	%rax, -1008(%rbp)       ## 8-byte Spill
	xorpd	%xmm5, %xmm5
	jmp	LBB43_51
	.p2align	4, 0x90
LBB43_50:                               ##   in Loop: Header=BB43_51 Depth=1
	cmpq	-1072(%rbp), %r14       ## 8-byte Folded Reload
	jle	LBB43_119
LBB43_51:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB43_53 Depth 2
                                        ##       Child Loop BB43_55 Depth 3
                                        ##         Child Loop BB43_98 Depth 4
                                        ##         Child Loop BB43_96 Depth 4
                                        ##         Child Loop BB43_90 Depth 4
                                        ##     Child Loop BB43_63 Depth 2
                                        ##       Child Loop BB43_70 Depth 3
                                        ##       Child Loop BB43_76 Depth 3
                                        ##         Child Loop BB43_116 Depth 4
	movq	%r14, %r12
	testq	%rbx, %rbx
	jle	LBB43_61
## %bb.52:                              ##   in Loop: Header=BB43_51 Depth=1
	movq	-944(%rbp), %rax        ## 8-byte Reload
	movq	96(%rax), %rax
	movq	%rax, -1024(%rbp)       ## 8-byte Spill
	movl	$1, %r13d
	movq	-1008(%rbp), %rax       ## 8-byte Reload
	movq	%rax, -1032(%rbp)       ## 8-byte Spill
	leaq	-768(%rbp), %r14
	leaq	-760(%rbp), %rbx
	xorl	%eax, %eax
	jmp	LBB43_53
	.p2align	4, 0x90
LBB43_107:                              ##   in Loop: Header=BB43_53 Depth=2
	addq	$80, %rbx
	addq	$80, %r14
	addq	$8, -1032(%rbp)         ## 8-byte Folded Spill
	movq	-984(%rbp), %rax        ## 8-byte Reload
	cmpq	-968(%rbp), %r13        ## 8-byte Folded Reload
	leaq	1(%r13), %r13
	je	LBB43_61
LBB43_53:                               ##   Parent Loop BB43_51 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB43_55 Depth 3
                                        ##         Child Loop BB43_98 Depth 4
                                        ##         Child Loop BB43_96 Depth 4
                                        ##         Child Loop BB43_90 Depth 4
	movq	%rax, -1040(%rbp)       ## 8-byte Spill
	incq	%rax
	movq	%rax, -984(%rbp)        ## 8-byte Spill
	cmpq	$0, -1024(%rbp)         ## 8-byte Folded Reload
	je	LBB43_107
## %bb.54:                              ##   in Loop: Header=BB43_53 Depth=2
	movq	%r13, %r15
	andq	$-2, %r15
	movq	-944(%rbp), %rax        ## 8-byte Reload
	movb	281(%rax), %cl
	movb	%cl, -929(%rbp)         ## 1-byte Spill
	movq	136(%rax), %rcx
	movq	%rcx, -1104(%rbp)       ## 8-byte Spill
	movq	152(%rax), %rcx
	movq	%rcx, -1096(%rbp)       ## 8-byte Spill
	movq	160(%rax,%r13,8), %rax
	movq	%rax, -992(%rbp)        ## 8-byte Spill
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r13, %xmm0
	movsd	%xmm0, -1088(%rbp)      ## 8-byte Spill
	movq	-1024(%rbp), %rsi       ## 8-byte Reload
	jmp	LBB43_55
	.p2align	4, 0x90
LBB43_106:                              ##   in Loop: Header=BB43_55 Depth=3
	movq	-952(%rbp), %rsi        ## 8-byte Reload
	movq	(%rsi), %rsi
	testq	%rsi, %rsi
	xorpd	%xmm5, %xmm5
	je	LBB43_107
LBB43_55:                               ##   Parent Loop BB43_51 Depth=1
                                        ##     Parent Loop BB43_53 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB43_98 Depth 4
                                        ##         Child Loop BB43_96 Depth 4
                                        ##         Child Loop BB43_90 Depth 4
	cmpb	$0, -929(%rbp)          ## 1-byte Folded Reload
	movq	8(%rsi), %rdi
	movq	16(%rsi), %rax
	movq	%rax, %rcx
	cmoveq	%rdi, %rcx
	movq	-1096(%rbp), %rdx       ## 8-byte Reload
	movq	(%rdx,%rdi,8), %rdx
	movq	(%rdx,%rcx,8), %rcx
	xorpd	%xmm0, %xmm0
	testq	%rcx, %rcx
	je	LBB43_78
## %bb.56:                              ##   in Loop: Header=BB43_55 Depth=3
	testq	%r12, %r12
	jle	LBB43_79
## %bb.57:                              ##   in Loop: Header=BB43_55 Depth=3
	cmpq	%r12, 24(%rcx)
	jl	LBB43_59
## %bb.58:                              ##   in Loop: Header=BB43_55 Depth=3
	movq	32(%rcx), %rcx
	movsd	-8(%rcx,%r12,8), %xmm0  ## xmm0 = mem[0],zero
	jmp	LBB43_59
	.p2align	4, 0x90
LBB43_78:                               ##   in Loop: Header=BB43_55 Depth=3
	testq	%r12, %r12
	jle	LBB43_79
LBB43_59:                               ##   in Loop: Header=BB43_55 Depth=3
	movb	$1, %dl
	cmpq	%r12, 24(%rsi)
	jl	LBB43_80
## %bb.60:                              ##   in Loop: Header=BB43_55 Depth=3
	movq	32(%rsi), %rcx
	movsd	-8(%rcx,%r12,8), %xmm1  ## xmm1 = mem[0],zero
	jmp	LBB43_81
	.p2align	4, 0x90
LBB43_79:                               ##   in Loop: Header=BB43_55 Depth=3
	xorl	%edx, %edx
LBB43_80:                               ##   in Loop: Header=BB43_55 Depth=3
	xorpd	%xmm1, %xmm1
LBB43_81:                               ##   in Loop: Header=BB43_55 Depth=3
	movsd	%xmm1, -960(%rbp)       ## 8-byte Spill
	movq	-1104(%rbp), %rcx       ## 8-byte Reload
	movq	(%rcx,%rdi,8), %rcx
	movq	(%rcx,%rax,8), %rcx
	xorpd	%xmm1, %xmm1
	testq	%rcx, %rcx
	je	LBB43_85
## %bb.82:                              ##   in Loop: Header=BB43_55 Depth=3
	testb	%dl, %dl
	je	LBB43_85
## %bb.83:                              ##   in Loop: Header=BB43_55 Depth=3
	cmpq	%r12, 24(%rcx)
	jl	LBB43_85
## %bb.84:                              ##   in Loop: Header=BB43_55 Depth=3
	movq	32(%rcx), %rcx
	movsd	-8(%rcx,%r12,8), %xmm1  ## xmm1 = mem[0],zero
LBB43_85:                               ##   in Loop: Header=BB43_55 Depth=3
	testq	%r12, %r12
	movq	%rsi, -952(%rbp)        ## 8-byte Spill
	movq	%rdi, -976(%rbp)        ## 8-byte Spill
	movl	%edx, -1000(%rbp)       ## 4-byte Spill
	js	LBB43_86
## %bb.88:                              ##   in Loop: Header=BB43_55 Depth=3
	testq	%rax, %rax
	js	LBB43_94
## %bb.89:                              ##   in Loop: Header=BB43_55 Depth=3
	xorpd	%xmm4, %xmm4
	movq	-1032(%rbp), %rcx       ## 8-byte Reload
	xorl	%edx, %edx
	movsd	LCPI43_0(%rip), %xmm6   ## xmm6 = mem[0],zero
	jmp	LBB43_90
	.p2align	4, 0x90
LBB43_93:                               ##   in Loop: Header=BB43_90 Depth=4
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm4
	mulsd	%xmm1, %xmm6
	incq	%rdx
	addq	$-8, %rcx
	cmpq	%rdx, %r13
	je	LBB43_101
LBB43_90:                               ##   Parent Loop BB43_51 Depth=1
                                        ##     Parent Loop BB43_53 Depth=2
                                        ##       Parent Loop BB43_55 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movsd	(%r14,%rdx,8), %xmm2    ## xmm2 = mem[0],zero
	mulsd	%xmm6, %xmm2
	movq	(%rcx), %rsi
	xorpd	%xmm3, %xmm3
	cmpq	%r12, 8(%rsi)
	jle	LBB43_93
## %bb.91:                              ##   in Loop: Header=BB43_90 Depth=4
	xorpd	%xmm3, %xmm3
	cmpq	%rax, 16(%rsi)
	jle	LBB43_93
## %bb.92:                              ##   in Loop: Header=BB43_90 Depth=4
	movq	40(%rsi), %rsi
	movq	(%rsi,%r12,8), %rsi
	movsd	(%rsi,%rax,8), %xmm3    ## xmm3 = mem[0],zero
	jmp	LBB43_93
	.p2align	4, 0x90
LBB43_86:                               ##   in Loop: Header=BB43_55 Depth=3
	cmpq	$0, -1040(%rbp)         ## 8-byte Folded Reload
	je	LBB43_87
## %bb.97:                              ##   in Loop: Header=BB43_55 Depth=3
	xorpd	%xmm3, %xmm3
	xorl	%eax, %eax
	movsd	LCPI43_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	.p2align	4, 0x90
LBB43_98:                               ##   Parent Loop BB43_51 Depth=1
                                        ##     Parent Loop BB43_53 Depth=2
                                        ##       Parent Loop BB43_55 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movapd	%xmm1, %xmm4
	mulsd	%xmm2, %xmm4
	mulsd	-8(%rbx,%rax,8), %xmm2
	mulsd	%xmm5, %xmm2
	addsd	%xmm3, %xmm2
	movapd	%xmm1, %xmm6
	mulsd	%xmm4, %xmm6
	mulsd	(%rbx,%rax,8), %xmm4
	mulsd	%xmm5, %xmm4
	addsd	%xmm2, %xmm4
	addq	$2, %rax
	movapd	%xmm6, %xmm2
	movapd	%xmm4, %xmm3
	cmpq	%rax, %r15
	jne	LBB43_98
	jmp	LBB43_99
	.p2align	4, 0x90
LBB43_94:                               ##   in Loop: Header=BB43_55 Depth=3
	cmpq	$0, -1040(%rbp)         ## 8-byte Folded Reload
	je	LBB43_87
## %bb.95:                              ##   in Loop: Header=BB43_55 Depth=3
	xorpd	%xmm3, %xmm3
	xorl	%eax, %eax
	movsd	LCPI43_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	.p2align	4, 0x90
LBB43_96:                               ##   Parent Loop BB43_51 Depth=1
                                        ##     Parent Loop BB43_53 Depth=2
                                        ##       Parent Loop BB43_55 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movapd	%xmm1, %xmm4
	mulsd	%xmm2, %xmm4
	mulsd	-8(%rbx,%rax,8), %xmm2
	mulsd	%xmm5, %xmm2
	addsd	%xmm3, %xmm2
	movapd	%xmm1, %xmm6
	mulsd	%xmm4, %xmm6
	mulsd	(%rbx,%rax,8), %xmm4
	mulsd	%xmm5, %xmm4
	addsd	%xmm2, %xmm4
	addq	$2, %rax
	movapd	%xmm6, %xmm2
	movapd	%xmm4, %xmm3
	cmpq	%rax, %r15
	jne	LBB43_96
LBB43_99:                               ##   in Loop: Header=BB43_55 Depth=3
	testb	$1, -984(%rbp)          ## 1-byte Folded Reload
	je	LBB43_101
LBB43_100:                              ##   in Loop: Header=BB43_55 Depth=3
	mulsd	%xmm6, %xmm1
	leaq	(%r13,%r13,4), %rcx
	shlq	$4, %rcx
	leaq	-848(%rbp,%rcx), %rcx
	mulsd	(%rcx,%rax,8), %xmm6
	mulsd	%xmm5, %xmm6
	addsd	%xmm6, %xmm4
	movapd	%xmm1, %xmm6
LBB43_101:                              ##   in Loop: Header=BB43_55 Depth=3
	movsd	%xmm6, -1112(%rbp)      ## 8-byte Spill
	movsd	%xmm4, -1120(%rbp)      ## 8-byte Spill
	movsd	-1088(%rbp), %xmm1      ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	callq	_pow
	cmpb	$0, -1000(%rbp)         ## 1-byte Folded Reload
	movq	-976(%rbp), %rcx        ## 8-byte Reload
	je	LBB43_106
## %bb.102:                             ##   in Loop: Header=BB43_55 Depth=3
	testq	%rcx, %rcx
	js	LBB43_106
## %bb.103:                             ##   in Loop: Header=BB43_55 Depth=3
	movq	-992(%rbp), %rax        ## 8-byte Reload
	cmpq	%r12, 8(%rax)
	jl	LBB43_106
## %bb.104:                             ##   in Loop: Header=BB43_55 Depth=3
	movq	-992(%rbp), %rax        ## 8-byte Reload
	cmpq	%rcx, 16(%rax)
	jle	LBB43_106
## %bb.105:                             ##   in Loop: Header=BB43_55 Depth=3
	movsd	-1120(%rbp), %xmm2      ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	addsd	-1112(%rbp), %xmm2      ## 8-byte Folded Reload
	movsd	-960(%rbp), %xmm1       ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	movq	-992(%rbp), %rax        ## 8-byte Reload
	movq	40(%rax), %rax
	movq	-8(%rax,%r12,8), %rax
	addsd	(%rax,%rcx,8), %xmm1
	movsd	%xmm1, (%rax,%rcx,8)
	jmp	LBB43_106
	.p2align	4, 0x90
LBB43_87:                               ##   in Loop: Header=BB43_55 Depth=3
	xorpd	%xmm4, %xmm4
	xorl	%eax, %eax
	movsd	LCPI43_0(%rip), %xmm6   ## xmm6 = mem[0],zero
	testb	$1, -984(%rbp)          ## 1-byte Folded Reload
	jne	LBB43_100
	jmp	LBB43_101
	.p2align	4, 0x90
LBB43_61:                               ##   in Loop: Header=BB43_51 Depth=1
	leaq	-1(%r12), %r14
	cmpq	$0, -1016(%rbp)         ## 8-byte Folded Reload
	movq	-968(%rbp), %rbx        ## 8-byte Reload
	jle	LBB43_50
## %bb.62:                              ##   in Loop: Header=BB43_51 Depth=1
	movq	-944(%rbp), %rax        ## 8-byte Reload
	movq	128(%rax), %r15
	xorl	%r13d, %r13d
	jmp	LBB43_63
	.p2align	4, 0x90
LBB43_117:                              ##   in Loop: Header=BB43_63 Depth=2
	leaq	-920(%rbp), %rdi
	movq	-1080(%rbp), %rsi       ## 8-byte Reload
	callq	___bzero
	xorpd	%xmm5, %xmm5
LBB43_118:                              ##   in Loop: Header=BB43_63 Depth=2
	incq	%r13
	cmpq	-1016(%rbp), %r13       ## 8-byte Folded Reload
	jge	LBB43_50
LBB43_63:                               ##   Parent Loop BB43_51 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB43_70 Depth 3
                                        ##       Child Loop BB43_76 Depth 3
                                        ##         Child Loop BB43_116 Depth 4
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, -864(%rbp)
	movapd	%xmm0, -880(%rbp)
	movapd	%xmm0, -896(%rbp)
	movapd	%xmm0, -912(%rbp)
	movapd	%xmm0, -928(%rbp)
	xorpd	%xmm0, %xmm0
	testq	%r12, %r12
	jle	LBB43_67
## %bb.64:                              ##   in Loop: Header=BB43_63 Depth=2
	movq	(%r15,%r13,8), %rax
	testq	%rax, %rax
	je	LBB43_67
## %bb.65:                              ##   in Loop: Header=BB43_63 Depth=2
	cmpq	%r12, 24(%rax)
	jl	LBB43_67
## %bb.66:                              ##   in Loop: Header=BB43_63 Depth=2
	movq	32(%rax), %rax
	movsd	-8(%rax,%r12,8), %xmm0  ## xmm0 = mem[0],zero
LBB43_67:                               ##   in Loop: Header=BB43_63 Depth=2
	testq	%rbx, %rbx
	jle	LBB43_118
## %bb.68:                              ##   in Loop: Header=BB43_63 Depth=2
	testq	%r12, %r12
	jle	LBB43_117
## %bb.69:                              ##   in Loop: Header=BB43_63 Depth=2
	xorl	%eax, %eax
	movq	-1008(%rbp), %rdx       ## 8-byte Reload
	jmp	LBB43_70
	.p2align	4, 0x90
LBB43_73:                               ##   in Loop: Header=BB43_70 Depth=3
	movsd	%xmm1, -920(%rbp,%rax,8)
	incq	%rax
	cmpq	%rax, %rbx
	je	LBB43_74
LBB43_70:                               ##   Parent Loop BB43_51 Depth=1
                                        ##     Parent Loop BB43_63 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	(%rdx,%rax,8), %rcx
	xorpd	%xmm1, %xmm1
	cmpq	%r12, 8(%rcx)
	jl	LBB43_73
## %bb.71:                              ##   in Loop: Header=BB43_70 Depth=3
	cmpq	%r13, 16(%rcx)
	jle	LBB43_73
## %bb.72:                              ##   in Loop: Header=BB43_70 Depth=3
	movq	40(%rcx), %rcx
	movq	-8(%rcx,%r12,8), %rcx
	movsd	(%rcx,%r13,8), %xmm1    ## xmm1 = mem[0],zero
	jmp	LBB43_73
	.p2align	4, 0x90
LBB43_74:                               ##   in Loop: Header=BB43_63 Depth=2
	testq	%r12, %r12
	jle	LBB43_118
## %bb.75:                              ##   in Loop: Header=BB43_63 Depth=2
	movl	$1, %edi
	movq	$-1, %r9
	leaq	-920(%rbp), %rdx
	leaq	-760(%rbp), %rcx
	xorl	%r8d, %r8d
	jmp	LBB43_76
	.p2align	4, 0x90
LBB43_114:                              ##   in Loop: Header=BB43_76 Depth=3
	addq	$80, %rcx
	addq	$8, %rdx
	decq	%r9
	movq	-968(%rbp), %rbx        ## 8-byte Reload
	cmpq	%rbx, %rdi
	leaq	1(%rdi), %rdi
	je	LBB43_118
LBB43_76:                               ##   Parent Loop BB43_51 Depth=1
                                        ##     Parent Loop BB43_63 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB43_116 Depth 4
	testq	%r8, %r8
	leaq	1(%r8), %r8
	je	LBB43_77
## %bb.115:                             ##   in Loop: Header=BB43_76 Depth=3
	movl	%edi, %eax
	andl	$1, %eax
	addq	%r9, %rax
	xorpd	%xmm1, %xmm1
	xorl	%ebx, %ebx
	movq	%rcx, %rsi
	movsd	LCPI43_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	.p2align	4, 0x90
LBB43_116:                              ##   Parent Loop BB43_51 Depth=1
                                        ##     Parent Loop BB43_63 Depth=2
                                        ##       Parent Loop BB43_76 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movapd	%xmm0, %xmm3
	mulsd	%xmm2, %xmm3
	mulsd	-8(%rsi), %xmm2
	mulsd	(%rdx,%rbx,8), %xmm2
	movapd	%xmm2, %xmm4
	addsd	%xmm1, %xmm4
	movapd	%xmm0, %xmm2
	mulsd	%xmm3, %xmm2
	mulsd	(%rsi), %xmm3
	mulsd	-8(%rdx,%rbx,8), %xmm3
	movapd	%xmm3, %xmm1
	addsd	%xmm4, %xmm1
	addq	$16, %rsi
	addq	$-2, %rbx
	cmpq	%rbx, %rax
	jne	LBB43_116
## %bb.108:                             ##   in Loop: Header=BB43_76 Depth=3
	negq	%rbx
	testb	$1, %r8b
	je	LBB43_111
LBB43_110:                              ##   in Loop: Header=BB43_76 Depth=3
	movapd	%xmm0, %xmm3
	mulsd	%xmm2, %xmm3
	leaq	(%rdi,%rdi,4), %rax
	shlq	$4, %rax
	leaq	-848(%rbp,%rax), %rax
	mulsd	(%rax,%rbx,8), %xmm2
	movq	%rdi, %rax
	subq	%rbx, %rax
	mulsd	-928(%rbp,%rax,8), %xmm2
	addsd	%xmm2, %xmm1
	movapd	%xmm3, %xmm2
LBB43_111:                              ##   in Loop: Header=BB43_76 Depth=3
	movq	-944(%rbp), %rax        ## 8-byte Reload
	movq	160(%rax,%rdi,8), %rax
	cmpq	%r12, 8(%rax)
	jl	LBB43_114
## %bb.112:                             ##   in Loop: Header=BB43_76 Depth=3
	cmpq	%r13, 16(%rax)
	jle	LBB43_114
## %bb.113:                             ##   in Loop: Header=BB43_76 Depth=3
	addsd	%xmm2, %xmm1
	movq	40(%rax), %rax
	movq	-8(%rax,%r12,8), %rax
	movsd	%xmm1, (%rax,%r13,8)
	jmp	LBB43_114
	.p2align	4, 0x90
LBB43_77:                               ##   in Loop: Header=BB43_76 Depth=3
	xorpd	%xmm1, %xmm1
	xorl	%ebx, %ebx
	movsd	LCPI43_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	testb	$1, %r8b
	jne	LBB43_110
	jmp	LBB43_111
LBB43_119:
	movq	-944(%rbp), %rax        ## 8-byte Reload
	movq	%rbx, 256(%rax)
	xorpd	%xmm0, %xmm0
	movq	-1064(%rbp), %rsi       ## 8-byte Reload
	cmpq	%rbx, %rsi
	jg	LBB43_125
## %bb.120:
	movq	-1056(%rbp), %rdx       ## 8-byte Reload
	testq	%rdx, %rdx
	js	LBB43_125
## %bb.121:
	movq	-1048(%rbp), %rcx       ## 8-byte Reload
	testq	%rcx, %rcx
	js	LBB43_125
## %bb.122:
	movq	160(%rax,%rsi,8), %rax
	cmpq	%rdx, 8(%rax)
	jle	LBB43_125
## %bb.123:
	cmpq	%rcx, 16(%rax)
	jle	LBB43_125
## %bb.124:
	movq	40(%rax), %rax
	movq	(%rax,%rdx,8), %rax
	movsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
LBB43_125:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB43_130
## %bb.126:
	addq	$1080, %rsp             ## imm = 0x438
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB43_24:
	movl	$2, %ebx
	jmp	LBB43_25
LBB43_38:                               ##   in Loop: Header=BB43_25 Depth=1
	movq	32(%r14), %r15
	.p2align	4, 0x90
LBB43_39:                               ##   in Loop: Header=BB43_25 Depth=1
	movq	%r12, 8(%r14)
	movq	%rbx, 16(%r14)
	movq	-952(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, 24(%r14)
	movq	$0, (%r14)
	shlq	$3, %r13
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	___bzero
	movq	-976(%rbp), %r12        ## 8-byte Reload
	movq	%r14, (%r12)
	movq	-944(%rbp), %r15        ## 8-byte Reload
	movq	%r14, 160(%r15,%rbx,8)
	movq	(%r12), %r12
	incq	%rbx
	movq	72(%r15), %r14
	cmpq	%rbx, %r14
	jl	LBB43_40
LBB43_25:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB43_33 Depth 2
                                        ##     Child Loop BB43_37 Depth 2
	movq	%r12, -976(%rbp)        ## 8-byte Spill
	movq	%rbx, -952(%rbp)        ## 8-byte Spill
	movl	$48, %edi
	callq	__Znwm
	movq	%rax, %r14
	movq	32(%r15), %r12
	movq	64(%r15), %r13
	movq	%r13, %rbx
	imulq	%r12, %r13
	movq	%r13, %rax
	movl	$8, %ecx
	mulq	%rcx
	movq	$-1, %rcx
	cmovoq	%rcx, %rax
Ltmp29:
	movq	%rax, %rdi
	callq	__Znam
Ltmp30:
## %bb.26:                              ##   in Loop: Header=BB43_25 Depth=1
	movq	%rax, %r15
	movq	%rax, 32(%r14)
	movq	%r12, %rax
	movl	$8, %ecx
	mulq	%rcx
	movq	$-1, %rcx
	cmovoq	%rcx, %rax
Ltmp31:
	movq	%rax, %rdi
	callq	__Znam
Ltmp32:
## %bb.27:                              ##   in Loop: Header=BB43_25 Depth=1
	movq	%rax, 40(%r14)
	testq	%r12, %r12
	jle	LBB43_39
## %bb.28:                              ##   in Loop: Header=BB43_25 Depth=1
	movq	%r15, (%rax)
	cmpq	$1, %r12
	je	LBB43_39
## %bb.29:                              ##   in Loop: Header=BB43_25 Depth=1
	leaq	(%r15,%rbx,8), %rcx
	movq	%rcx, 8(%rax)
	cmpq	$2, %r12
	je	LBB43_39
## %bb.30:                              ##   in Loop: Header=BB43_25 Depth=1
	leaq	(%rcx,%rbx,8), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$3, %r12
	je	LBB43_38
## %bb.31:                              ##   in Loop: Header=BB43_25 Depth=1
	leal	-3(%r12), %eax
	leaq	-4(%r12), %rsi
	andl	$3, %eax
	movl	$3, %ecx
	cmpq	$3, %rsi
	jb	LBB43_35
## %bb.32:                              ##   in Loop: Header=BB43_25 Depth=1
	movq	%rbx, %r10
	shlq	$5, %r10
	movq	%rbx, %rcx
	shlq	$4, %rcx
	movq	%rcx, -960(%rbp)        ## 8-byte Spill
	leaq	(%rcx,%rcx,2), %rcx
	movq	%rcx, -1000(%rbp)       ## 8-byte Spill
	leaq	(,%rbx,8), %rcx
	leaq	(%rcx,%rcx,4), %r11
	leaq	(%rcx,%rcx,2), %r8
	movq	%r12, %r9
	subq	%rax, %r9
	movl	$3, %ecx
	.p2align	4, 0x90
LBB43_33:                               ##   Parent Loop BB43_25 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	%r15, %rdx
	movq	40(%r14), %rdi
	leaq	(%r15,%r8), %rsi
	movq	%rsi, (%rdi,%rcx,8)
	movq	40(%r14), %rsi
	leaq	(%r15,%r10), %r15
	movq	%r15, 8(%rsi,%rcx,8)
	movq	40(%r14), %rsi
	leaq	(%rdx,%r11), %rdi
	movq	%rdi, 16(%rsi,%rcx,8)
	movq	40(%r14), %rsi
	addq	-1000(%rbp), %rdx       ## 8-byte Folded Reload
	movq	%rdx, 24(%rsi,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %r9
	jne	LBB43_33
## %bb.34:                              ##   in Loop: Header=BB43_25 Depth=1
	addq	-960(%rbp), %r15        ## 8-byte Folded Reload
	movq	%r15, %rdx
LBB43_35:                               ##   in Loop: Header=BB43_25 Depth=1
	testq	%rax, %rax
	je	LBB43_38
## %bb.36:                              ##   in Loop: Header=BB43_25 Depth=1
	leaq	(%rdx,%rbx,8), %rdx
	leaq	(,%rbx,8), %rsi
	.p2align	4, 0x90
LBB43_37:                               ##   Parent Loop BB43_25 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	40(%r14), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB43_37
	jmp	LBB43_38
LBB43_130:
	callq	___stack_chk_fail
LBB43_127:
Ltmp28:
	movq	%r12, %rdi
	jmp	LBB43_128
LBB43_129:
Ltmp33:
	movq	%r14, %rdi
LBB43_128:
	movq	%rax, %rbx
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table43:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4 ## >> Call Site 1 <<
	.uleb128 Ltmp24-Lfunc_begin4    ##   Call between Lfunc_begin4 and Ltmp24
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp24-Lfunc_begin4    ## >> Call Site 2 <<
	.uleb128 Ltmp27-Ltmp24          ##   Call between Ltmp24 and Ltmp27
	.uleb128 Ltmp28-Lfunc_begin4    ##     jumps to Ltmp28
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp27-Lfunc_begin4    ## >> Call Site 3 <<
	.uleb128 Ltmp29-Ltmp27          ##   Call between Ltmp27 and Ltmp29
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp29-Lfunc_begin4    ## >> Call Site 4 <<
	.uleb128 Ltmp32-Ltmp29          ##   Call between Ltmp29 and Ltmp32
	.uleb128 Ltmp33-Lfunc_begin4    ##     jumps to Ltmp33
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp32-Lfunc_begin4    ## >> Call Site 5 <<
	.uleb128 Lfunc_end4-Ltmp32      ##   Call between Ltmp32 and Lfunc_end4
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end4:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV6dGetCFElll ## -- Begin function _ZN8MARKOVLV6dGetCFElll
	.p2align	4, 0x90
__ZN8MARKOVLV6dGetCFElll:               ## @_ZN8MARKOVLV6dGetCFElll
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	xorpd	%xmm0, %xmm0
	testq	%rdx, %rdx
	js	LBB44_118
## %bb.1:
	movq	64(%rdi), %rax
	cmpq	%rdx, %rax
	jle	LBB44_118
## %bb.2:
	movq	%rcx, %r13
	testq	%rcx, %rcx
	js	LBB44_118
## %bb.3:
	cmpq	%r13, %rax
	jle	LBB44_118
## %bb.4:
	cmpq	$0, 264(%rdi)
	jle	LBB44_9
## %bb.5:
	testq	%rsi, %rsi
	js	LBB44_118
## %bb.6:
	movq	240(%rdi), %rax
	movq	(%rax,%rdx,8), %rax
	cmpq	%rsi, 8(%rax)
	jle	LBB44_118
## %bb.7:
	cmpq	%r13, 16(%rax)
	jle	LBB44_118
## %bb.8:
	movq	40(%rax), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%r13,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB44_118
LBB44_9:
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	movq	%rdx, -104(%rbp)        ## 8-byte Spill
	movq	%rsi, -120(%rbp)        ## 8-byte Spill
	movq	%r13, -112(%rbp)        ## 8-byte Spill
	jne	LBB44_45
## %bb.10:
	movl	$48, %edi
	movq	%rax, %rbx
	callq	__Znwm
	movq	%rax, %r14
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	32(%rax), %r12
	movq	%r12, %rax
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	imulq	%rbx, %rax
	movl	$8, %ebx
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	mulq	%rbx
	movq	$-1, %r15
	cmovoq	%r15, %rax
Ltmp34:
	movq	%rax, %rdi
	callq	__Znam
Ltmp35:
## %bb.11:
	movq	%rax, %rcx
	movq	%rax, 32(%r14)
	movq	%r12, %rax
	mulq	%rbx
	cmovnoq	%rax, %r15
Ltmp36:
	movq	%rcx, %rbx
	movq	%r15, %rdi
	callq	__Znam
Ltmp37:
## %bb.12:
	movq	%rbx, %rdi
	movq	%rax, 40(%r14)
	testq	%r12, %r12
	jle	LBB44_24
## %bb.13:
	movq	%rdi, (%rax)
	cmpq	$1, %r12
	movq	-48(%rbp), %rbx         ## 8-byte Reload
	je	LBB44_25
## %bb.14:
	leaq	(%rdi,%rbx,8), %rcx
	movq	%rcx, 8(%rax)
	cmpq	$2, %r12
	je	LBB44_25
## %bb.15:
	leaq	(%rcx,%rbx,8), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$3, %r12
	je	LBB44_23
## %bb.16:
	leal	-3(%r12), %eax
	leaq	-4(%r12), %rsi
	andl	$3, %eax
	movl	$3, %ecx
	cmpq	$3, %rsi
	jb	LBB44_20
## %bb.17:
	movq	%rbx, %r10
	shlq	$5, %r10
	movq	%rdi, %rdx
	movq	%r12, %rdi
	movq	%rbx, %r12
	shlq	$4, %r12
	leaq	(%r12,%r12,2), %r9
	leaq	(,%rbx,8), %rcx
	leaq	(%rcx,%rcx,4), %r11
	leaq	(%rcx,%rcx,2), %r15
	movq	%rdi, -72(%rbp)         ## 8-byte Spill
	subq	%rax, %rdi
	movl	$3, %ecx
LBB44_18:                               ## =>This Inner Loop Header: Depth=1
	movq	%rdx, %rsi
	movq	40(%r14), %rbx
	addq	%r15, %rdx
	movq	%rdx, (%rbx,%rcx,8)
	movq	40(%r14), %rbx
	leaq	(%rsi,%r10), %rdx
	movq	%rdx, 8(%rbx,%rcx,8)
	movq	40(%r14), %r8
	leaq	(%rsi,%r11), %rbx
	movq	%rbx, 16(%r8,%rcx,8)
	movq	40(%r14), %rbx
	addq	%r9, %rsi
	movq	%rsi, 24(%rbx,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdi
	jne	LBB44_18
## %bb.19:
	addq	%r12, %rdx
	movq	-48(%rbp), %rbx         ## 8-byte Reload
	movq	-72(%rbp), %r12         ## 8-byte Reload
LBB44_20:
	testq	%rax, %rax
	je	LBB44_23
## %bb.21:
	leaq	(%rdx,%rbx,8), %rdx
	leaq	(,%rbx,8), %rsi
LBB44_22:                               ## =>This Inner Loop Header: Depth=1
	movq	40(%r14), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB44_22
LBB44_23:
	movq	32(%r14), %rdi
	jmp	LBB44_25
LBB44_24:
	movq	-48(%rbp), %rbx         ## 8-byte Reload
LBB44_25:
	movq	%r12, 8(%r14)
	movq	%rbx, 16(%r14)
	movq	$1, 24(%r14)
	movq	$0, (%r14)
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	shlq	$3, %rsi
	callq	___bzero
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	%r14, 120(%rcx)
	movq	240(%rcx), %rax
	movq	%r14, (%rax)
	movq	64(%rcx), %rax
	cmpq	$2, %rax
	jl	LBB44_45
## %bb.26:
	movl	$1, %r15d
	movq	%r14, %rcx
	movq	-56(%rbp), %rbx         ## 8-byte Reload
	jmp	LBB44_30
	.p2align	4, 0x90
LBB44_27:                               ##   in Loop: Header=BB44_30 Depth=1
	movq	-48(%rbp), %r8          ## 8-byte Reload
	movq	-64(%rbp), %r15         ## 8-byte Reload
LBB44_28:                               ##   in Loop: Header=BB44_30 Depth=1
	movq	%rdx, %r14
LBB44_29:                               ##   in Loop: Header=BB44_30 Depth=1
	movq	%rbx, 8(%r14)
	movq	%r8, 16(%r14)
	movq	%r15, 24(%r14)
	movq	$0, (%r14)
	shlq	$3, %r13
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	___bzero
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	%r14, (%rcx)
	movq	-56(%rbp), %rbx         ## 8-byte Reload
	movq	240(%rbx), %rax
	movq	%r14, (%rax,%r15,8)
	movq	(%rcx), %rcx
	incq	%r15
	movq	64(%rbx), %rax
	cmpq	%r15, %rax
	jle	LBB44_45
LBB44_30:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB44_39 Depth 2
                                        ##     Child Loop BB44_43 Depth 2
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	movq	%r15, -64(%rbp)         ## 8-byte Spill
	movl	$48, %edi
	movq	%rax, %r12
	callq	__Znwm
	movq	%rax, %r14
	movq	32(%rbx), %r15
	movq	%r15, %r13
	movq	%r12, -48(%rbp)         ## 8-byte Spill
	imulq	%r12, %r13
	movq	%r13, %rax
	movl	$8, %ebx
	mulq	%rbx
	movq	$-1, %rcx
	cmovoq	%rcx, %rax
Ltmp39:
	movq	%rax, %rdi
	callq	__Znam
Ltmp40:
## %bb.31:                              ##   in Loop: Header=BB44_30 Depth=1
	movq	%rax, %r12
	movq	%rax, 32(%r14)
	movq	%r15, %rax
	mulq	%rbx
	movq	$-1, %rcx
	cmovoq	%rcx, %rax
Ltmp41:
	movq	%rax, %rdi
	callq	__Znam
Ltmp42:
## %bb.32:                              ##   in Loop: Header=BB44_30 Depth=1
	movq	%r14, %rdx
	movq	%rax, 40(%r14)
	testq	%r15, %r15
	movq	%r15, %rbx
	jle	LBB44_27
## %bb.33:                              ##   in Loop: Header=BB44_30 Depth=1
	movq	%r12, (%rax)
	cmpq	$1, %rbx
	movq	-48(%rbp), %r8          ## 8-byte Reload
	movq	-64(%rbp), %r15         ## 8-byte Reload
	je	LBB44_28
## %bb.35:                              ##   in Loop: Header=BB44_30 Depth=1
	leaq	(%r12,%r8,8), %rcx
	movq	%rcx, 8(%rax)
	cmpq	$2, %rbx
	movq	%rdx, %r14
	je	LBB44_29
## %bb.36:                              ##   in Loop: Header=BB44_30 Depth=1
	leaq	(%rcx,%r8,8), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$3, %rbx
	je	LBB44_44
## %bb.37:                              ##   in Loop: Header=BB44_30 Depth=1
	leal	-3(%rbx), %eax
	leaq	-4(%rbx), %rsi
	andl	$3, %eax
	movl	$3, %ecx
	cmpq	$3, %rsi
	jb	LBB44_41
## %bb.38:                              ##   in Loop: Header=BB44_30 Depth=1
	movq	%r8, %r10
	shlq	$5, %r10
	movq	%r8, %rcx
	shlq	$4, %rcx
	movq	%rcx, -88(%rbp)         ## 8-byte Spill
	leaq	(%rcx,%rcx,2), %r9
	leaq	(,%r8,8), %rcx
	leaq	(%rcx,%rcx,4), %r11
	movq	%rbx, %rdi
	leaq	(%rcx,%rcx,2), %r8
	movq	%rbx, -80(%rbp)         ## 8-byte Spill
	subq	%rax, %rdi
	movl	$3, %ecx
	.p2align	4, 0x90
LBB44_39:                               ##   Parent Loop BB44_30 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	%r12, %rsi
	movq	40(%r14), %rbx
	leaq	(%r12,%r8), %rdx
	movq	%rdx, (%rbx,%rcx,8)
	movq	40(%r14), %rdx
	leaq	(%r12,%r10), %r12
	movq	%r12, 8(%rdx,%rcx,8)
	movq	40(%r14), %rdx
	leaq	(%rsi,%r11), %rbx
	movq	%rbx, 16(%rdx,%rcx,8)
	movq	40(%r14), %rdx
	addq	%r9, %rsi
	movq	%rsi, 24(%rdx,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rdi
	jne	LBB44_39
## %bb.40:                              ##   in Loop: Header=BB44_30 Depth=1
	addq	-88(%rbp), %r12         ## 8-byte Folded Reload
	movq	%r12, %rdx
	movq	-48(%rbp), %r8          ## 8-byte Reload
	movq	-80(%rbp), %rbx         ## 8-byte Reload
LBB44_41:                               ##   in Loop: Header=BB44_30 Depth=1
	testq	%rax, %rax
	je	LBB44_44
## %bb.42:                              ##   in Loop: Header=BB44_30 Depth=1
	leaq	(%rdx,%r8,8), %rdx
	leaq	(,%r8,8), %rsi
	.p2align	4, 0x90
LBB44_43:                               ##   Parent Loop BB44_30 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	40(%r14), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rsi, %rdx
	decq	%rax
	jne	LBB44_43
LBB44_44:                               ##   in Loop: Header=BB44_30 Depth=1
	movq	32(%r14), %r12
	jmp	LBB44_29
LBB44_45:
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movl	$8, %ecx
	mulq	%rcx
	movq	$-1, %r15
	cmovnoq	%rax, %r15
	movq	%r15, %rdi
	callq	__Znam
	movq	%rax, %r14
	movq	%r15, %rdi
	callq	__Znam
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, %r15
	testq	%rcx, %rcx
	jle	LBB44_112
## %bb.46:
	leaq	(,%rcx,8), %rbx
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	48(%rax), %rdx
	movq	%rdx, -80(%rbp)         ## 8-byte Spill
	movq	56(%rax), %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	movl	%ecx, %eax
	andl	$1, %eax
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	andq	$-2, %rcx
	movq	%rcx, -128(%rbp)        ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rbx, -88(%rbp)         ## 8-byte Spill
	jmp	LBB44_48
	.p2align	4, 0x90
LBB44_47:                               ##   in Loop: Header=BB44_48 Depth=1
	movq	-72(%rbp), %rax         ## 8-byte Reload
	incq	%rax
	cmpq	-48(%rbp), %rax         ## 8-byte Folded Reload
	je	LBB44_112
LBB44_48:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB44_51 Depth 2
                                        ##       Child Loop BB44_55 Depth 3
                                        ##       Child Loop BB44_73 Depth 3
                                        ##       Child Loop BB44_93 Depth 3
                                        ##       Child Loop BB44_106 Depth 3
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %r12
	callq	___bzero
	movq	%r12, -72(%rbp)         ## 8-byte Spill
	movabsq	$4607182418800017408, %rax ## imm = 0x3FF0000000000000
	movq	%rax, (%r14,%r12,8)
	movq	-96(%rbp), %rax         ## 8-byte Reload
	cmpq	-80(%rbp), %rax         ## 8-byte Folded Reload
	jge	LBB44_47
## %bb.49:                              ##   in Loop: Header=BB44_48 Depth=1
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	96(%rax), %rcx
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	movq	128(%rax), %r13
	movq	-96(%rbp), %r12         ## 8-byte Reload
	jmp	LBB44_51
	.p2align	4, 0x90
LBB44_50:                               ##   in Loop: Header=BB44_51 Depth=2
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	_memcpy
	incq	%r12
	cmpq	-80(%rbp), %r12         ## 8-byte Folded Reload
	jge	LBB44_47
LBB44_51:                               ##   Parent Loop BB44_48 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB44_55 Depth 3
                                        ##       Child Loop BB44_73 Depth 3
                                        ##       Child Loop BB44_93 Depth 3
                                        ##       Child Loop BB44_106 Depth 3
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	___bzero
	cmpq	$0, -64(%rbp)           ## 8-byte Folded Reload
	movq	-56(%rbp), %r9          ## 8-byte Reload
	movq	-72(%rbp), %r10         ## 8-byte Reload
	je	LBB44_90
## %bb.52:                              ##   in Loop: Header=BB44_51 Depth=2
	cmpb	$0, 281(%r9)
	movq	136(%r9), %r8
	movq	152(%r9), %rcx
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	jne	LBB44_55
## %bb.53:                              ##   in Loop: Header=BB44_51 Depth=2
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	jmp	LBB44_73
	.p2align	4, 0x90
LBB44_54:                               ##   in Loop: Header=BB44_55 Depth=3
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	je	LBB44_90
LBB44_55:                               ##   Parent Loop BB44_48 Depth=1
                                        ##     Parent Loop BB44_51 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	8(%rdx), %rsi
	movq	16(%rdx), %rdi
	movq	(%rcx,%rsi,8), %rax
	movq	(%rax,%rdi,8), %rbx
	xorpd	%xmm0, %xmm0
	testq	%rbx, %rbx
	je	LBB44_59
## %bb.56:                              ##   in Loop: Header=BB44_55 Depth=3
	testq	%r12, %r12
	js	LBB44_62
## %bb.57:                              ##   in Loop: Header=BB44_55 Depth=3
	cmpq	%r12, 24(%rbx)
	jle	LBB44_60
## %bb.58:                              ##   in Loop: Header=BB44_55 Depth=3
	movq	32(%rbx), %rax
	movsd	(%rax,%r12,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB44_60
	.p2align	4, 0x90
LBB44_59:                               ##   in Loop: Header=BB44_55 Depth=3
	testq	%r12, %r12
	js	LBB44_62
LBB44_60:                               ##   in Loop: Header=BB44_55 Depth=3
	xorpd	%xmm1, %xmm1
	movb	$1, %bl
	cmpq	%r12, 24(%rdx)
	jle	LBB44_63
## %bb.61:                              ##   in Loop: Header=BB44_55 Depth=3
	movq	32(%rdx), %rax
	movsd	(%rax,%r12,8), %xmm1    ## xmm1 = mem[0],zero
	jmp	LBB44_63
	.p2align	4, 0x90
LBB44_62:                               ##   in Loop: Header=BB44_55 Depth=3
	xorl	%ebx, %ebx
	xorpd	%xmm1, %xmm1
LBB44_63:                               ##   in Loop: Header=BB44_55 Depth=3
	movsd	(%r14,%rsi,8), %xmm2    ## xmm2 = mem[0],zero
	mulsd	%xmm1, %xmm2
	addsd	(%r15,%rdi,8), %xmm2
	movsd	%xmm2, (%r15,%rdi,8)
	movq	(%r8,%rsi,8), %rax
	movq	(%rax,%rdi,8), %rdi
	testq	%rdi, %rdi
	je	LBB44_67
## %bb.64:                              ##   in Loop: Header=BB44_55 Depth=3
	testb	%bl, %bl
	je	LBB44_54
## %bb.65:                              ##   in Loop: Header=BB44_55 Depth=3
	xorpd	%xmm2, %xmm2
	cmpq	%r12, 24(%rdi)
	jle	LBB44_68
## %bb.66:                              ##   in Loop: Header=BB44_55 Depth=3
	movq	32(%rdi), %rax
	movsd	(%rax,%r12,8), %xmm2    ## xmm2 = mem[0],zero
	jmp	LBB44_68
	.p2align	4, 0x90
LBB44_67:                               ##   in Loop: Header=BB44_55 Depth=3
	xorpd	%xmm2, %xmm2
	testb	%bl, %bl
	je	LBB44_54
LBB44_68:                               ##   in Loop: Header=BB44_55 Depth=3
	testq	%rsi, %rsi
	js	LBB44_54
## %bb.69:                              ##   in Loop: Header=BB44_55 Depth=3
	movq	240(%r9), %rax
	movq	(%rax,%r10,8), %rdi
	cmpq	%r12, 8(%rdi)
	jle	LBB44_54
## %bb.70:                              ##   in Loop: Header=BB44_55 Depth=3
	cmpq	%rsi, 16(%rdi)
	jle	LBB44_54
## %bb.71:                              ##   in Loop: Header=BB44_55 Depth=3
	mulsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	40(%rdi), %rax
	movq	(%rax,%r12,8), %rax
	addsd	(%rax,%rsi,8), %xmm1
	movsd	%xmm1, (%rax,%rsi,8)
	jmp	LBB44_54
	.p2align	4, 0x90
LBB44_72:                               ##   in Loop: Header=BB44_73 Depth=3
	movq	(%rdx), %rdx
	testq	%rdx, %rdx
	je	LBB44_90
LBB44_73:                               ##   Parent Loop BB44_48 Depth=1
                                        ##     Parent Loop BB44_51 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	8(%rdx), %rsi
	movq	16(%rdx), %rdi
	movq	(%rcx,%rsi,8), %rbx
	movq	(%rbx,%rsi,8), %rbx
	xorpd	%xmm0, %xmm0
	testq	%rbx, %rbx
	je	LBB44_77
## %bb.74:                              ##   in Loop: Header=BB44_73 Depth=3
	testq	%r12, %r12
	js	LBB44_80
## %bb.75:                              ##   in Loop: Header=BB44_73 Depth=3
	cmpq	%r12, 24(%rbx)
	jle	LBB44_78
## %bb.76:                              ##   in Loop: Header=BB44_73 Depth=3
	movq	32(%rbx), %rbx
	movsd	(%rbx,%r12,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB44_78
	.p2align	4, 0x90
LBB44_77:                               ##   in Loop: Header=BB44_73 Depth=3
	testq	%r12, %r12
	js	LBB44_80
LBB44_78:                               ##   in Loop: Header=BB44_73 Depth=3
	xorpd	%xmm1, %xmm1
	movb	$1, %bl
	cmpq	%r12, 24(%rdx)
	jle	LBB44_81
## %bb.79:                              ##   in Loop: Header=BB44_73 Depth=3
	movq	32(%rdx), %rax
	movsd	(%rax,%r12,8), %xmm1    ## xmm1 = mem[0],zero
	jmp	LBB44_81
	.p2align	4, 0x90
LBB44_80:                               ##   in Loop: Header=BB44_73 Depth=3
	xorl	%ebx, %ebx
	xorpd	%xmm1, %xmm1
LBB44_81:                               ##   in Loop: Header=BB44_73 Depth=3
	movsd	(%r14,%rsi,8), %xmm2    ## xmm2 = mem[0],zero
	mulsd	%xmm1, %xmm2
	addsd	(%r15,%rdi,8), %xmm2
	movsd	%xmm2, (%r15,%rdi,8)
	movq	(%r8,%rsi,8), %rax
	movq	(%rax,%rdi,8), %rdi
	testq	%rdi, %rdi
	je	LBB44_85
## %bb.82:                              ##   in Loop: Header=BB44_73 Depth=3
	testb	%bl, %bl
	je	LBB44_72
## %bb.83:                              ##   in Loop: Header=BB44_73 Depth=3
	xorpd	%xmm2, %xmm2
	cmpq	%r12, 24(%rdi)
	jle	LBB44_86
## %bb.84:                              ##   in Loop: Header=BB44_73 Depth=3
	movq	32(%rdi), %rax
	movsd	(%rax,%r12,8), %xmm2    ## xmm2 = mem[0],zero
	jmp	LBB44_86
	.p2align	4, 0x90
LBB44_85:                               ##   in Loop: Header=BB44_73 Depth=3
	xorpd	%xmm2, %xmm2
	testb	%bl, %bl
	je	LBB44_72
LBB44_86:                               ##   in Loop: Header=BB44_73 Depth=3
	testq	%rsi, %rsi
	js	LBB44_72
## %bb.87:                              ##   in Loop: Header=BB44_73 Depth=3
	movq	240(%r9), %rax
	movq	(%rax,%r10,8), %rdi
	cmpq	%r12, 8(%rdi)
	jle	LBB44_72
## %bb.88:                              ##   in Loop: Header=BB44_73 Depth=3
	cmpq	%rsi, 16(%rdi)
	jle	LBB44_72
## %bb.89:                              ##   in Loop: Header=BB44_73 Depth=3
	mulsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	40(%rdi), %rax
	movq	(%rax,%r12,8), %rax
	addsd	(%rax,%rsi,8), %xmm1
	movsd	%xmm1, (%rax,%rsi,8)
	jmp	LBB44_72
	.p2align	4, 0x90
LBB44_90:                               ##   in Loop: Header=BB44_51 Depth=2
	testq	%r12, %r12
	movq	-88(%rbp), %rbx         ## 8-byte Reload
	js	LBB44_50
## %bb.91:                              ##   in Loop: Header=BB44_51 Depth=2
	movq	240(%r9), %rax
	movq	(%rax,%r10,8), %rax
	movq	8(%rax), %rcx
	xorl	%edx, %edx
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	jmp	LBB44_93
	.p2align	4, 0x90
LBB44_92:                               ##   in Loop: Header=BB44_93 Depth=3
	incq	%rdx
	cmpq	%rdx, %rdi
	je	LBB44_99
LBB44_93:                               ##   Parent Loop BB44_48 Depth=1
                                        ##     Parent Loop BB44_51 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	(%r13,%rdx,8), %rsi
	xorpd	%xmm0, %xmm0
	testq	%rsi, %rsi
	je	LBB44_96
## %bb.94:                              ##   in Loop: Header=BB44_93 Depth=3
	cmpq	%r12, 24(%rsi)
	jle	LBB44_96
## %bb.95:                              ##   in Loop: Header=BB44_93 Depth=3
	movq	32(%rsi), %rsi
	movsd	(%rsi,%r12,8), %xmm0    ## xmm0 = mem[0],zero
LBB44_96:                               ##   in Loop: Header=BB44_93 Depth=3
	cmpq	%r12, %rcx
	jle	LBB44_92
## %bb.97:                              ##   in Loop: Header=BB44_93 Depth=3
	cmpq	%rdx, 16(%rax)
	jle	LBB44_92
## %bb.98:                              ##   in Loop: Header=BB44_93 Depth=3
	movq	40(%rax), %rsi
	movq	(%rsi,%r12,8), %rsi
	addsd	(%rsi,%rdx,8), %xmm0
	movsd	%xmm0, (%rsi,%rdx,8)
	jmp	LBB44_92
	.p2align	4, 0x90
LBB44_99:                               ##   in Loop: Header=BB44_51 Depth=2
	movq	240(%r9), %rax
	movq	(%rax,%r10,8), %rax
	movq	8(%rax), %rdx
	xorl	%ecx, %ecx
	cmpq	$1, %rdi
	jne	LBB44_104
LBB44_100:                              ##   in Loop: Header=BB44_51 Depth=2
	cmpq	$0, -136(%rbp)          ## 8-byte Folded Reload
	je	LBB44_50
## %bb.101:                             ##   in Loop: Header=BB44_51 Depth=2
	cmpq	%r12, %rdx
	jle	LBB44_50
## %bb.102:                             ##   in Loop: Header=BB44_51 Depth=2
	cmpq	%rcx, 16(%rax)
	jle	LBB44_50
## %bb.103:                             ##   in Loop: Header=BB44_51 Depth=2
	movsd	(%r14,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movq	40(%rax), %rax
	movq	(%rax,%r12,8), %rax
	mulsd	(%rax,%rcx,8), %xmm0
	movsd	%xmm0, (%rax,%rcx,8)
	jmp	LBB44_50
	.p2align	4, 0x90
LBB44_104:                              ##   in Loop: Header=BB44_51 Depth=2
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	jmp	LBB44_106
	.p2align	4, 0x90
LBB44_105:                              ##   in Loop: Header=BB44_106 Depth=3
	addq	$2, %rcx
	cmpq	%rcx, %rdi
	je	LBB44_100
LBB44_106:                              ##   Parent Loop BB44_48 Depth=1
                                        ##     Parent Loop BB44_51 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpq	%r12, %rdx
	jle	LBB44_109
## %bb.107:                             ##   in Loop: Header=BB44_106 Depth=3
	cmpq	%rcx, 16(%rax)
	jle	LBB44_109
## %bb.108:                             ##   in Loop: Header=BB44_106 Depth=3
	movsd	(%r14,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movq	40(%rax), %rsi
	movq	(%rsi,%r12,8), %rsi
	mulsd	(%rsi,%rcx,8), %xmm0
	movsd	%xmm0, (%rsi,%rcx,8)
LBB44_109:                              ##   in Loop: Header=BB44_106 Depth=3
	cmpq	%r12, %rdx
	jle	LBB44_105
## %bb.110:                             ##   in Loop: Header=BB44_106 Depth=3
	leaq	1(%rcx), %rsi
	cmpq	%rsi, 16(%rax)
	jle	LBB44_105
## %bb.111:                             ##   in Loop: Header=BB44_106 Depth=3
	movsd	8(%r14,%rcx,8), %xmm0   ## xmm0 = mem[0],zero
	movq	40(%rax), %rsi
	movq	(%rsi,%r12,8), %rsi
	mulsd	8(%rsi,%rcx,8), %xmm0
	movsd	%xmm0, 8(%rsi,%rcx,8)
	jmp	LBB44_105
LBB44_112:
	movq	%r14, %rdi
	callq	__ZdlPv
	movq	%r15, %rdi
	callq	__ZdlPv
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movq	64(%rdx), %rcx
	movq	240(%rdx), %rax
	movq	%rcx, 264(%rdx)
	movq	-120(%rbp), %rdx        ## 8-byte Reload
	testq	%rdx, %rdx
	js	LBB44_117
## %bb.113:
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	testq	%rcx, %rcx
	xorpd	%xmm0, %xmm0
	js	LBB44_118
## %bb.114:
	movq	-104(%rbp), %rsi        ## 8-byte Reload
	movq	(%rax,%rsi,8), %rax
	cmpq	%rdx, 8(%rax)
	jle	LBB44_118
## %bb.115:
	cmpq	%rcx, 16(%rax)
	jle	LBB44_118
## %bb.116:
	movq	40(%rax), %rax
	movq	(%rax,%rdx,8), %rax
	movsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB44_118
LBB44_117:
	xorpd	%xmm0, %xmm0
LBB44_118:
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB44_119:
Ltmp38:
	jmp	LBB44_121
LBB44_120:
Ltmp43:
LBB44_121:
	movq	%rax, %rbx
	movq	%r14, %rdi
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table44:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Lfunc_begin5-Lfunc_begin5 ## >> Call Site 1 <<
	.uleb128 Ltmp34-Lfunc_begin5    ##   Call between Lfunc_begin5 and Ltmp34
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp34-Lfunc_begin5    ## >> Call Site 2 <<
	.uleb128 Ltmp37-Ltmp34          ##   Call between Ltmp34 and Ltmp37
	.uleb128 Ltmp38-Lfunc_begin5    ##     jumps to Ltmp38
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp37-Lfunc_begin5    ## >> Call Site 3 <<
	.uleb128 Ltmp39-Ltmp37          ##   Call between Ltmp37 and Ltmp39
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp39-Lfunc_begin5    ## >> Call Site 4 <<
	.uleb128 Ltmp42-Ltmp39          ##   Call between Ltmp39 and Ltmp42
	.uleb128 Ltmp43-Lfunc_begin5    ##     jumps to Ltmp43
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp42-Lfunc_begin5    ## >> Call Site 5 <<
	.uleb128 Lfunc_end5-Ltmp42      ##   Call between Ltmp42 and Lfunc_end5
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end5:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV11lGetMaxTimeEv ## -- Begin function _ZN8MARKOVLV11lGetMaxTimeEv
	.p2align	4, 0x90
__ZN8MARKOVLV11lGetMaxTimeEv:           ## @_ZN8MARKOVLV11lGetMaxTimeEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	32(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV12lGetNrStatesEv ## -- Begin function _ZN8MARKOVLV12lGetNrStatesEv
	.p2align	4, 0x90
__ZN8MARKOVLV12lGetNrStatesEv:          ## @_ZN8MARKOVLV12lGetNrStatesEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	64(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV13lGetStartTimeEv ## -- Begin function _ZN8MARKOVLV13lGetStartTimeEv
	.p2align	4, 0x90
__ZN8MARKOVLV13lGetStartTimeEv:         ## @_ZN8MARKOVLV13lGetStartTimeEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	48(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV12lGetStopTimeEv ## -- Begin function _ZN8MARKOVLV12lGetStopTimeEv
	.p2align	4, 0x90
__ZN8MARKOVLV12lGetStopTimeEv:          ## @_ZN8MARKOVLV12lGetStopTimeEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	56(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV6dGetRPEll
LCPI49_0:
	.quad	0                       ## double 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV6dGetRPEll
	.p2align	4, 0x90
__ZN8MARKOVLV6dGetRPEll:                ## @_ZN8MARKOVLV6dGetRPEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r15
	movq	%rsi, %rbx
	movq	%rdi, %r12
	movq	248(%rdi), %rax
	movq	(%rax,%rdx,8), %r14
	leaq	1(%rsi), %rsi
	movl	$1, %ecx
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movq	%r14, %rdx
	callq	__ZN8MARKOVLV6dGetDKElll
	movsd	%xmm0, -72(%rbp)        ## 8-byte Spill
	movq	136(%r12), %rax
	movq	(%rax,%r15,8), %rax
	movq	(%rax,%r14,8), %rax
	testq	%rax, %rax
	je	LBB49_5
## %bb.1:
	xorpd	%xmm0, %xmm0
	cmpq	$-1, %rbx
	jl	LBB49_4
## %bb.2:
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, 24(%rax)
	jle	LBB49_4
## %bb.3:
	movq	32(%rax), %rax
	movsd	8(%rax,%rbx,8), %xmm0   ## xmm0 = mem[0],zero
LBB49_4:
	movsd	-72(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	addsd	%xmm0, %xmm1
	movsd	%xmm1, -72(%rbp)        ## 8-byte Spill
LBB49_5:
	testq	%r14, %r14
	movq	%rbx, -80(%rbp)         ## 8-byte Spill
	jle	LBB49_6
## %bb.7:
	testq	%rbx, %rbx
	js	LBB49_8
## %bb.12:
	movq	144(%r12), %rax
	xorpd	%xmm2, %xmm2
	xorl	%r13d, %r13d
	movq	-80(%rbp), %rbx         ## 8-byte Reload
	jmp	LBB49_13
	.p2align	4, 0x90
LBB49_25:                               ##   in Loop: Header=BB49_13 Depth=1
	mulsd	%xmm1, %xmm3
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
LBB49_26:                               ##   in Loop: Header=BB49_13 Depth=1
	incq	%r13
	cmpq	%r13, %r14
	je	LBB49_27
LBB49_13:                               ## =>This Inner Loop Header: Depth=1
	cmpb	$0, 281(%r12)
	movq	%r13, %rcx
	cmoveq	%r15, %rcx
	movq	(%rax,%r15,8), %rdx
	cmpq	$0, (%rdx,%r13,8)
	je	LBB49_26
## %bb.14:                              ##   in Loop: Header=BB49_13 Depth=1
	movsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	movq	152(%r12), %rax
	movq	(%rax,%r15,8), %rax
	movq	(%rax,%rcx,8), %rax
	xorpd	%xmm0, %xmm0
	cmpq	%rbx, 24(%rax)
	jle	LBB49_16
## %bb.15:                              ##   in Loop: Header=BB49_13 Depth=1
	movq	32(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
LBB49_16:                               ##   in Loop: Header=BB49_13 Depth=1
	movsd	%xmm0, -64(%rbp)        ## 8-byte Spill
	movl	$1, %ecx
	movq	%r12, %rdi
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	%r13, %rdx
	callq	__ZN8MARKOVLV6dGetDKElll
	subsd	-72(%rbp), %xmm0        ## 8-byte Folded Reload
	movq	136(%r12), %rax
	movq	(%rax,%r15,8), %rax
	movq	(%rax,%r13,8), %rax
	testq	%rax, %rax
	je	LBB49_17
## %bb.18:                              ##   in Loop: Header=BB49_13 Depth=1
	xorpd	%xmm1, %xmm1
	cmpq	$-1, %rbx
	jl	LBB49_19
## %bb.20:                              ##   in Loop: Header=BB49_13 Depth=1
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, 24(%rax)
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	movsd	-64(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	jle	LBB49_22
## %bb.21:                              ##   in Loop: Header=BB49_13 Depth=1
	movq	32(%rax), %rax
	movsd	8(%rax,%rbx,8), %xmm1   ## xmm1 = mem[0],zero
	jmp	LBB49_22
	.p2align	4, 0x90
LBB49_17:                               ##   in Loop: Header=BB49_13 Depth=1
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	movsd	-64(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	jmp	LBB49_23
LBB49_19:                               ##   in Loop: Header=BB49_13 Depth=1
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	movsd	-64(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
LBB49_22:                               ##   in Loop: Header=BB49_13 Depth=1
	addsd	%xmm1, %xmm0
LBB49_23:                               ##   in Loop: Header=BB49_13 Depth=1
	movq	144(%r12), %rax
	movq	(%rax,%r15,8), %rcx
	movq	(%rcx,%r13,8), %rcx
	xorpd	%xmm1, %xmm1
	cmpq	%rbx, 24(%rcx)
	jle	LBB49_25
## %bb.24:                              ##   in Loop: Header=BB49_13 Depth=1
	movq	32(%rcx), %rcx
	movsd	(%rcx,%rbx,8), %xmm1    ## xmm1 = mem[0],zero
	jmp	LBB49_25
LBB49_6:
	xorpd	%xmm2, %xmm2
LBB49_27:
	incq	%r14
	movq	64(%r12), %rax
	cmpq	%rax, %r14
	jge	LBB49_61
## %bb.28:
	movq	-80(%rbp), %rbx         ## 8-byte Reload
	testq	%rbx, %rbx
	js	LBB49_51
## %bb.29:
	movq	144(%r12), %rcx
	jmp	LBB49_30
	.p2align	4, 0x90
LBB49_42:                               ##   in Loop: Header=BB49_30 Depth=1
	mulsd	%xmm1, %xmm3
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
	movq	64(%r12), %rax
LBB49_43:                               ##   in Loop: Header=BB49_30 Depth=1
	incq	%r14
	cmpq	%rax, %r14
	jge	LBB49_61
LBB49_30:                               ## =>This Inner Loop Header: Depth=1
	cmpb	$0, 281(%r12)
	movq	%r14, %rdx
	cmoveq	%r15, %rdx
	movq	(%rcx,%r15,8), %rsi
	cmpq	$0, (%rsi,%r14,8)
	je	LBB49_43
## %bb.31:                              ##   in Loop: Header=BB49_30 Depth=1
	movsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	movq	152(%r12), %rax
	movq	(%rax,%r15,8), %rax
	movq	(%rax,%rdx,8), %rax
	xorpd	%xmm0, %xmm0
	cmpq	%rbx, 24(%rax)
	jle	LBB49_33
## %bb.32:                              ##   in Loop: Header=BB49_30 Depth=1
	movq	32(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
LBB49_33:                               ##   in Loop: Header=BB49_30 Depth=1
	movsd	%xmm0, -64(%rbp)        ## 8-byte Spill
	movl	$1, %ecx
	movq	%r12, %rdi
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	%r14, %rdx
	callq	__ZN8MARKOVLV6dGetDKElll
	subsd	-72(%rbp), %xmm0        ## 8-byte Folded Reload
	movq	136(%r12), %rax
	movq	(%rax,%r15,8), %rax
	movq	(%rax,%r14,8), %rax
	testq	%rax, %rax
	je	LBB49_34
## %bb.35:                              ##   in Loop: Header=BB49_30 Depth=1
	xorpd	%xmm1, %xmm1
	cmpq	$-1, %rbx
	jl	LBB49_36
## %bb.37:                              ##   in Loop: Header=BB49_30 Depth=1
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, 24(%rax)
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	movsd	-64(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	jle	LBB49_39
## %bb.38:                              ##   in Loop: Header=BB49_30 Depth=1
	movq	32(%rax), %rax
	movsd	8(%rax,%rbx,8), %xmm1   ## xmm1 = mem[0],zero
	jmp	LBB49_39
	.p2align	4, 0x90
LBB49_34:                               ##   in Loop: Header=BB49_30 Depth=1
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	movsd	-64(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	jmp	LBB49_40
LBB49_36:                               ##   in Loop: Header=BB49_30 Depth=1
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	movsd	-64(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
LBB49_39:                               ##   in Loop: Header=BB49_30 Depth=1
	addsd	%xmm1, %xmm0
LBB49_40:                               ##   in Loop: Header=BB49_30 Depth=1
	movq	144(%r12), %rcx
	movq	(%rcx,%r15,8), %rax
	movq	(%rax,%r14,8), %rax
	xorpd	%xmm1, %xmm1
	cmpq	%rbx, 24(%rax)
	jle	LBB49_42
## %bb.41:                              ##   in Loop: Header=BB49_30 Depth=1
	movq	32(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm1    ## xmm1 = mem[0],zero
	jmp	LBB49_42
	.p2align	4, 0x90
LBB49_53:                               ##   in Loop: Header=BB49_51 Depth=1
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
LBB49_59:                               ##   in Loop: Header=BB49_51 Depth=1
	mulsd	LCPI49_0(%rip), %xmm0
	addsd	%xmm0, %xmm2
	movq	64(%r12), %rax
LBB49_60:                               ##   in Loop: Header=BB49_51 Depth=1
	incq	%r14
	cmpq	%rax, %r14
	jge	LBB49_61
LBB49_51:                               ## =>This Inner Loop Header: Depth=1
	movq	144(%r12), %rcx
	movq	(%rcx,%r15,8), %rcx
	cmpq	$0, (%rcx,%r14,8)
	je	LBB49_60
## %bb.52:                              ##   in Loop: Header=BB49_51 Depth=1
	movsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	movl	$1, %ecx
	movq	%r12, %rdi
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	%r14, %rdx
	callq	__ZN8MARKOVLV6dGetDKElll
	subsd	-72(%rbp), %xmm0        ## 8-byte Folded Reload
	movq	136(%r12), %rax
	movq	(%rax,%r15,8), %rax
	movq	(%rax,%r14,8), %rax
	testq	%rax, %rax
	je	LBB49_53
## %bb.54:                              ##   in Loop: Header=BB49_51 Depth=1
	xorpd	%xmm1, %xmm1
	cmpq	$-1, %rbx
	jl	LBB49_55
## %bb.56:                              ##   in Loop: Header=BB49_51 Depth=1
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, 24(%rax)
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	jle	LBB49_58
## %bb.57:                              ##   in Loop: Header=BB49_51 Depth=1
	movq	32(%rax), %rax
	movsd	8(%rax,%rbx,8), %xmm1   ## xmm1 = mem[0],zero
	jmp	LBB49_58
LBB49_55:                               ##   in Loop: Header=BB49_51 Depth=1
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
LBB49_58:                               ##   in Loop: Header=BB49_51 Depth=1
	addsd	%xmm1, %xmm0
	jmp	LBB49_59
LBB49_61:
	movapd	%xmm2, %xmm0
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB49_8:
	xorl	%ebx, %ebx
	xorpd	%xmm2, %xmm2
	jmp	LBB49_9
	.p2align	4, 0x90
LBB49_11:                               ##   in Loop: Header=BB49_9 Depth=1
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
LBB49_49:                               ##   in Loop: Header=BB49_9 Depth=1
	mulsd	LCPI49_0(%rip), %xmm0
	addsd	%xmm0, %xmm2
LBB49_50:                               ##   in Loop: Header=BB49_9 Depth=1
	incq	%rbx
	cmpq	%rbx, %r14
	je	LBB49_27
LBB49_9:                                ## =>This Inner Loop Header: Depth=1
	movq	144(%r12), %rax
	movq	(%rax,%r15,8), %rax
	cmpq	$0, (%rax,%rbx,8)
	je	LBB49_50
## %bb.10:                              ##   in Loop: Header=BB49_9 Depth=1
	movsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	movl	$1, %ecx
	movq	%r12, %rdi
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	%rbx, %rdx
	callq	__ZN8MARKOVLV6dGetDKElll
	subsd	-72(%rbp), %xmm0        ## 8-byte Folded Reload
	movq	136(%r12), %rax
	movq	(%rax,%r15,8), %rax
	movq	(%rax,%rbx,8), %rax
	testq	%rax, %rax
	je	LBB49_11
## %bb.44:                              ##   in Loop: Header=BB49_9 Depth=1
	xorpd	%xmm1, %xmm1
	cmpq	$-1, -80(%rbp)          ## 8-byte Folded Reload
	jl	LBB49_45
## %bb.46:                              ##   in Loop: Header=BB49_9 Depth=1
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, 24(%rax)
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	jle	LBB49_48
## %bb.47:                              ##   in Loop: Header=BB49_9 Depth=1
	movq	32(%rax), %rax
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movsd	8(%rax,%rcx,8), %xmm1   ## xmm1 = mem[0],zero
	jmp	LBB49_48
LBB49_45:                               ##   in Loop: Header=BB49_9 Depth=1
	movsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
LBB49_48:                               ##   in Loop: Header=BB49_9 Depth=1
	addsd	%xmm1, %xmm0
	jmp	LBB49_49
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV6dGetSPEll ## -- Begin function _ZN8MARKOVLV6dGetSPEll
	.p2align	4, 0x90
__ZN8MARKOVLV6dGetSPEll:                ## @_ZN8MARKOVLV6dGetSPEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	248(%rdi), %rax
	movq	(%rax,%rdx,8), %rdx
	cmpb	$0, 281(%rdi)
	movq	%rdx, %rax
	cmoveq	%r14, %rax
	xorpd	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB50_4
## %bb.1:
	movq	152(%rbx), %rcx
	movq	(%rcx,%r14,8), %rcx
	movq	(%rcx,%rax,8), %rax
	testq	%rax, %rax
	je	LBB50_4
## %bb.2:
	cmpq	%r15, 24(%rax)
	jle	LBB50_4
## %bb.3:
	movq	32(%rax), %rax
	movsd	(%rax,%r15,8), %xmm0    ## xmm0 = mem[0],zero
LBB50_4:
	movsd	%xmm0, -32(%rbp)        ## 8-byte Spill
	leaq	1(%r15), %rsi
	movl	$1, %ecx
	movq	%rbx, %rdi
	callq	__ZN8MARKOVLV6dGetDKElll
	mulsd	-32(%rbp), %xmm0        ## 8-byte Folded Reload
	movsd	%xmm0, -32(%rbp)        ## 8-byte Spill
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	__ZN8MARKOVLV6dGetDKElll
	movsd	-32(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV8dGetRegPEll ## -- Begin function _ZN8MARKOVLV8dGetRegPEll
	.p2align	4, 0x90
__ZN8MARKOVLV8dGetRegPEll:              ## @_ZN8MARKOVLV8dGetRegPEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	248(%rdi), %rax
	movq	(%rax,%rdx,8), %rax
	xorpd	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB51_4
## %bb.1:
	movq	128(%rdi), %rcx
	movq	(%rcx,%rdx,8), %rcx
	testq	%rcx, %rcx
	je	LBB51_4
## %bb.2:
	cmpq	%rsi, 24(%rcx)
	jle	LBB51_4
## %bb.3:
	movq	32(%rcx), %rcx
	movsd	(%rcx,%rsi,8), %xmm0    ## xmm0 = mem[0],zero
LBB51_4:
	testq	%rsi, %rsi
	js	LBB51_8
## %bb.5:
	movq	136(%rdi), %rcx
	movq	(%rcx,%rdx,8), %rcx
	movq	(%rcx,%rax,8), %rax
	cmpq	%rsi, 24(%rax)
	jle	LBB51_8
## %bb.6:
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm1    ## xmm1 = mem[0],zero
	xorpd	%xmm2, %xmm2
	ucomisd	%xmm2, %xmm1
	jne	LBB51_7
	jnp	LBB51_8
LBB51_7:
	addsd	%xmm1, %xmm0
LBB51_8:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV16lSetFolgezustandEll ## -- Begin function _ZN8MARKOVLV16lSetFolgezustandEll
	.p2align	4, 0x90
__ZN8MARKOVLV16lSetFolgezustandEll:     ## @_ZN8MARKOVLV16lSetFolgezustandEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	cmpb	$0, 280(%rdi)
	movq	248(%rdi), %rax
	je	LBB52_1
## %bb.2:
	movq	(%rax,%rsi,8), %rax
	popq	%rbp
	retq
LBB52_1:
	movq	%rdx, (%rax,%rsi,8)
	movq	$0, 272(%rdi)
	movq	(%rax,%rsi,8), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV13vSetInitStateEl ## -- Begin function _ZN8MARKOVLV13vSetInitStateEl
	.p2align	4, 0x90
__ZN8MARKOVLV13vSetInitStateEl:         ## @_ZN8MARKOVLV13vSetInitStateEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rsi, 328(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV19vGenerateTrajectoryEv
LCPI54_0:
	.quad	0                       ## double 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV19vGenerateTrajectoryEv
	.p2align	4, 0x90
__ZN8MARKOVLV19vGenerateTrajectoryEv:   ## @_ZN8MARKOVLV19vGenerateTrajectoryEv
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r13
	cmpq	$0, 288(%rdi)
	je	LBB54_1
## %bb.3:
	cmpq	$0, 296(%r13)
	je	LBB54_4
LBB54_6:
	cmpq	$0, 304(%r13)
	je	LBB54_7
LBB54_9:
	cmpq	$0, 312(%r13)
	je	LBB54_10
LBB54_12:
	cmpq	$0, 336(%r13)
	je	LBB54_13
LBB54_29:
	cmpq	$0, 344(%r13)
	je	LBB54_30
LBB54_46:
	movq	56(%r13), %rax
	testq	%rax, %rax
	js	LBB54_47
LBB54_48:
	movq	32(%r13), %rcx
	cmpq	%rcx, %rax
	jl	LBB54_50
LBB54_49:
	decq	%rcx
	movq	%rcx, 56(%r13)
LBB54_50:
	movq	288(%r13), %rax
	movq	24(%rax), %rsi
	movq	32(%rax), %rdi
	shlq	$3, %rsi
	callq	___bzero
	incq	320(%r13)
	movq	48(%r13), %rcx
	movq	56(%r13), %rbx
	cmpq	%rcx, %rbx
	jge	LBB54_55
## %bb.51:
	movq	328(%r13), %rax
	leaq	8(%r13), %r14
	movl	$1, %r15d
	jmp	LBB54_52
	.p2align	4, 0x90
LBB54_105:                              ##   in Loop: Header=BB54_52 Depth=1
	incq	%rbx
	movq	48(%r13), %rcx
	cmpq	%rcx, %rbx
	jge	LBB54_54
LBB54_52:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB54_75 Depth 2
                                        ##     Child Loop BB54_68 Depth 2
	movq	%rax, %r12
	movq	%r14, %rdi
	callq	__Z4ran2Pl
	movq	64(%r13), %rcx
	testq	%rcx, %rcx
	jle	LBB54_53
## %bb.66:                              ##   in Loop: Header=BB54_52 Depth=1
	movq	144(%r13), %rax
	movq	(%rax,%r12,8), %rsi
	testq	%rbx, %rbx
	js	LBB54_74
## %bb.67:                              ##   in Loop: Header=BB54_52 Depth=1
	cvtss2sd	%xmm0, %xmm0
	xorpd	%xmm1, %xmm1
	xorl	%edx, %edx
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB54_68:                               ##   Parent Loop BB54_52 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	(%rsi,%rax,8), %rdi
	testq	%rdi, %rdi
	je	LBB54_72
## %bb.69:                              ##   in Loop: Header=BB54_68 Depth=2
	xorpd	%xmm2, %xmm2
	cmpq	%rbx, 24(%rdi)
	jle	LBB54_71
## %bb.70:                              ##   in Loop: Header=BB54_68 Depth=2
	movq	32(%rdi), %rdx
	movsd	(%rdx,%rbx,8), %xmm2    ## xmm2 = mem[0],zero
LBB54_71:                               ##   in Loop: Header=BB54_68 Depth=2
	addsd	%xmm2, %xmm1
	movb	$1, %dl
LBB54_72:                               ##   in Loop: Header=BB54_68 Depth=2
	ucomisd	%xmm0, %xmm1
	ja	LBB54_78
## %bb.73:                              ##   in Loop: Header=BB54_68 Depth=2
	incq	%rax
	cmpq	%rcx, %rax
	jl	LBB54_68
	jmp	LBB54_77
	.p2align	4, 0x90
LBB54_53:                               ##   in Loop: Header=BB54_52 Depth=1
	xorl	%edx, %edx
	jmp	LBB54_77
	.p2align	4, 0x90
LBB54_74:                               ##   in Loop: Header=BB54_52 Depth=1
	xorl	%edx, %edx
	xorl	%eax, %eax
	xorps	%xmm1, %xmm1
	.p2align	4, 0x90
LBB54_75:                               ##   Parent Loop BB54_52 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpq	$0, (%rsi,%rax,8)
	movzbl	%dl, %edx
	cmovnel	%r15d, %edx
	ucomiss	%xmm0, %xmm1
	ja	LBB54_78
## %bb.76:                              ##   in Loop: Header=BB54_75 Depth=2
	incq	%rax
	cmpq	%rcx, %rax
	jl	LBB54_75
	.p2align	4, 0x90
LBB54_77:                               ##   in Loop: Header=BB54_52 Depth=1
	decq	%rcx
	movq	%rcx, %rax
LBB54_78:                               ##   in Loop: Header=BB54_52 Depth=1
	testq	%rbx, %rbx
	js	LBB54_81
## %bb.79:                              ##   in Loop: Header=BB54_52 Depth=1
	movq	288(%r13), %rcx
	cmpq	%rbx, 24(%rcx)
	jle	LBB54_81
## %bb.80:                              ##   in Loop: Header=BB54_52 Depth=1
	movq	32(%rcx), %rcx
	movq	%r12, (%rcx,%rbx,8)
LBB54_81:                               ##   in Loop: Header=BB54_52 Depth=1
	testb	$1, %dl
	cmoveq	%r12, %rax
	cmpb	$0, 281(%r13)
	movq	%rax, %rcx
	cmoveq	%r12, %rcx
	movq	152(%r13), %rdx
	movq	(%rdx,%r12,8), %rdx
	movq	(%rdx,%rcx,8), %rcx
	xorps	%xmm0, %xmm0
	testq	%rcx, %rcx
	je	LBB54_85
## %bb.82:                              ##   in Loop: Header=BB54_52 Depth=1
	testq	%rbx, %rbx
	js	LBB54_88
## %bb.83:                              ##   in Loop: Header=BB54_52 Depth=1
	cmpq	%rbx, 24(%rcx)
	jle	LBB54_86
## %bb.84:                              ##   in Loop: Header=BB54_52 Depth=1
	movq	32(%rcx), %rcx
	movsd	(%rcx,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
	jmp	LBB54_86
	.p2align	4, 0x90
LBB54_85:                               ##   in Loop: Header=BB54_52 Depth=1
	testq	%rbx, %rbx
	js	LBB54_88
LBB54_86:                               ##   in Loop: Header=BB54_52 Depth=1
	movq	312(%r13), %rcx
	cmpq	%rbx, 24(%rcx)
	jle	LBB54_88
## %bb.87:                              ##   in Loop: Header=BB54_52 Depth=1
	movq	32(%rcx), %rcx
	movsd	%xmm0, (%rcx,%rbx,8)
LBB54_88:                               ##   in Loop: Header=BB54_52 Depth=1
	movq	136(%r13), %rcx
	movq	(%rcx,%r12,8), %rcx
	movq	(%rcx,%rax,8), %rcx
	xorps	%xmm1, %xmm1
	testq	%rcx, %rcx
	je	LBB54_92
## %bb.89:                              ##   in Loop: Header=BB54_52 Depth=1
	testq	%rbx, %rbx
	js	LBB54_92
## %bb.90:                              ##   in Loop: Header=BB54_52 Depth=1
	cmpq	%rbx, 24(%rcx)
	jle	LBB54_92
## %bb.91:                              ##   in Loop: Header=BB54_52 Depth=1
	movq	32(%rcx), %rcx
	movsd	(%rcx,%rbx,8), %xmm1    ## xmm1 = mem[0],zero
LBB54_92:                               ##   in Loop: Header=BB54_52 Depth=1
	movq	128(%r13), %rcx
	movq	(%rcx,%r12,8), %rcx
	testq	%rcx, %rcx
	je	LBB54_97
## %bb.93:                              ##   in Loop: Header=BB54_52 Depth=1
	testq	%rbx, %rbx
	js	LBB54_105
## %bb.94:                              ##   in Loop: Header=BB54_52 Depth=1
	xorpd	%xmm2, %xmm2
	cmpq	%rbx, 24(%rcx)
	jle	LBB54_96
## %bb.95:                              ##   in Loop: Header=BB54_52 Depth=1
	movq	32(%rcx), %rcx
	movsd	(%rcx,%rbx,8), %xmm2    ## xmm2 = mem[0],zero
LBB54_96:                               ##   in Loop: Header=BB54_52 Depth=1
	mulsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	movq	296(%r13), %rcx
	cmpq	%rbx, 24(%rcx)
	jle	LBB54_101
LBB54_100:                              ##   in Loop: Header=BB54_52 Depth=1
	movq	32(%rcx), %rcx
	movsd	%xmm0, (%rcx,%rbx,8)
LBB54_101:                              ##   in Loop: Header=BB54_52 Depth=1
	testq	%r12, %r12
	js	LBB54_105
## %bb.102:                             ##   in Loop: Header=BB54_52 Depth=1
	movq	336(%r13), %rcx
	cmpq	%rbx, 8(%rcx)
	jle	LBB54_105
## %bb.103:                             ##   in Loop: Header=BB54_52 Depth=1
	cmpq	%r12, 16(%rcx)
	jle	LBB54_105
## %bb.104:                             ##   in Loop: Header=BB54_52 Depth=1
	movq	40(%rcx), %rcx
	movq	(%rcx,%rbx,8), %rcx
	addsd	(%rcx,%r12,8), %xmm0
	movsd	%xmm0, (%rcx,%r12,8)
	jmp	LBB54_105
	.p2align	4, 0x90
LBB54_97:                               ##   in Loop: Header=BB54_52 Depth=1
	testq	%rbx, %rbx
	js	LBB54_105
## %bb.98:                              ##   in Loop: Header=BB54_52 Depth=1
	mulsd	%xmm1, %xmm0
	addsd	LCPI54_0(%rip), %xmm0
	movq	296(%r13), %rcx
	cmpq	%rbx, 24(%rcx)
	jg	LBB54_100
	jmp	LBB54_101
LBB54_54:
	movq	56(%r13), %rbx
LBB54_55:
	cmpq	%rbx, %rcx
	jle	LBB54_113
## %bb.56:
	movq	312(%r13), %rax
	xorpd	%xmm0, %xmm0
	xorpd	%xmm1, %xmm1
	jmp	LBB54_57
	.p2align	4, 0x90
LBB54_106:                              ##   in Loop: Header=BB54_57 Depth=1
	mulsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
LBB54_112:                              ##   in Loop: Header=BB54_57 Depth=1
	cmpq	%rbx, %rcx
	jle	LBB54_113
LBB54_57:                               ## =>This Inner Loop Header: Depth=1
	movq	%rcx, %rdx
	decq	%rcx
	testq	%rdx, %rdx
	jle	LBB54_106
## %bb.58:                              ##   in Loop: Header=BB54_57 Depth=1
	xorpd	%xmm2, %xmm2
	xorpd	%xmm3, %xmm3
	cmpq	%rdx, 24(%rax)
	jge	LBB54_59
## %bb.60:                              ##   in Loop: Header=BB54_57 Depth=1
	mulsd	%xmm3, %xmm1
	movq	296(%r13), %rsi
	cmpq	%rdx, 24(%rsi)
	jge	LBB54_61
LBB54_62:                               ##   in Loop: Header=BB54_57 Depth=1
	addsd	%xmm2, %xmm1
	movq	304(%r13), %rsi
	cmpq	%rdx, 24(%rsi)
	jge	LBB54_63
LBB54_64:                               ##   in Loop: Header=BB54_57 Depth=1
	movq	288(%r13), %rdi
	movq	344(%r13), %rsi
	cmpq	%rdx, 24(%rdi)
	jge	LBB54_107
LBB54_65:                               ##   in Loop: Header=BB54_57 Depth=1
	xorl	%edi, %edi
	testq	%rdi, %rdi
	jns	LBB54_109
	jmp	LBB54_112
	.p2align	4, 0x90
LBB54_59:                               ##   in Loop: Header=BB54_57 Depth=1
	movq	32(%rax), %rsi
	movsd	-8(%rsi,%rdx,8), %xmm3  ## xmm3 = mem[0],zero
	mulsd	%xmm3, %xmm1
	movq	296(%r13), %rsi
	cmpq	%rdx, 24(%rsi)
	jl	LBB54_62
LBB54_61:                               ##   in Loop: Header=BB54_57 Depth=1
	movq	32(%rsi), %rsi
	movsd	-8(%rsi,%rdx,8), %xmm2  ## xmm2 = mem[0],zero
	addsd	%xmm2, %xmm1
	movq	304(%r13), %rsi
	cmpq	%rdx, 24(%rsi)
	jl	LBB54_64
LBB54_63:                               ##   in Loop: Header=BB54_57 Depth=1
	movq	32(%rsi), %rsi
	movsd	%xmm1, -8(%rsi,%rdx,8)
	movq	288(%r13), %rdi
	movq	344(%r13), %rsi
	cmpq	%rdx, 24(%rdi)
	jl	LBB54_65
LBB54_107:                              ##   in Loop: Header=BB54_57 Depth=1
	movq	32(%rdi), %rdi
	movq	-8(%rdi,%rdx,8), %rdi
	testq	%rdi, %rdi
	js	LBB54_112
LBB54_109:                              ##   in Loop: Header=BB54_57 Depth=1
	cmpq	%rdx, 8(%rsi)
	jl	LBB54_112
## %bb.110:                             ##   in Loop: Header=BB54_57 Depth=1
	cmpq	%rdi, 16(%rsi)
	jle	LBB54_112
## %bb.111:                             ##   in Loop: Header=BB54_57 Depth=1
	movq	40(%rsi), %rsi
	movq	-8(%rsi,%rdx,8), %rdx
	movsd	(%rdx,%rdi,8), %xmm2    ## xmm2 = mem[0],zero
	addsd	%xmm1, %xmm2
	movsd	%xmm2, (%rdx,%rdi,8)
	jmp	LBB54_112
LBB54_113:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB54_1:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %r14
	movq	32(%r13), %r15
	movl	$8, %ecx
	movq	%r15, %rax
	mulq	%rcx
	movq	%r15, 24(%r14)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp44:
	callq	__Znam
Ltmp45:
## %bb.2:
	movq	%rax, 32(%r14)
	shlq	$3, %r15
	movq	$0, (%r14)
	movq	$0, 8(%r14)
	movq	$0, 16(%r14)
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	___bzero
	movq	%r14, 288(%r13)
	cmpq	$0, 296(%r13)
	jne	LBB54_6
LBB54_4:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %r14
	movq	32(%r13), %r15
	movl	$8, %ecx
	movq	%r15, %rax
	mulq	%rcx
	movq	%r15, 24(%r14)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp47:
	callq	__Znam
Ltmp48:
## %bb.5:
	movq	%rax, 32(%r14)
	shlq	$3, %r15
	movq	$0, (%r14)
	movq	$0, 8(%r14)
	movq	$0, 16(%r14)
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	___bzero
	movq	%r14, 296(%r13)
	cmpq	$0, 304(%r13)
	jne	LBB54_9
LBB54_7:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %r14
	movq	32(%r13), %r15
	movl	$8, %ecx
	movq	%r15, %rax
	mulq	%rcx
	movq	%r15, 24(%r14)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp50:
	callq	__Znam
Ltmp51:
## %bb.8:
	movq	%rax, 32(%r14)
	shlq	$3, %r15
	movq	$0, (%r14)
	movq	$0, 8(%r14)
	movq	$0, 16(%r14)
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	___bzero
	movq	%r14, 304(%r13)
	cmpq	$0, 312(%r13)
	jne	LBB54_12
LBB54_10:
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %r14
	movq	32(%r13), %r15
	movl	$8, %ecx
	movq	%r15, %rax
	mulq	%rcx
	movq	%r15, 24(%r14)
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
Ltmp53:
	callq	__Znam
Ltmp54:
## %bb.11:
	movq	%rax, 32(%r14)
	shlq	$3, %r15
	movq	$0, (%r14)
	movq	$0, 8(%r14)
	movq	$0, 16(%r14)
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	___bzero
	movq	%r14, 312(%r13)
	cmpq	$0, 336(%r13)
	jne	LBB54_29
LBB54_13:
	movl	$48, %edi
	callq	__Znwm
	movq	%rax, %r14
	movq	32(%r13), %r15
	movq	64(%r13), %rbx
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	movq	%rbx, %rax
	imulq	%r15, %rax
	movl	$8, %ebx
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	mulq	%rbx
	movq	$-1, %r12
	cmovoq	%r12, %rax
Ltmp56:
	movq	%rax, %rdi
	callq	__Znam
Ltmp57:
## %bb.14:
	movq	%rax, %rcx
	movq	%rax, 32(%r14)
	movq	%r15, %rax
	mulq	%rbx
	cmovnoq	%rax, %r12
Ltmp58:
	movq	%rcx, %rbx
	movq	%r12, %rdi
	callq	__Znam
Ltmp59:
## %bb.15:
	movq	%rbx, %r8
	movq	%rax, 40(%r14)
	testq	%r15, %r15
	jle	LBB54_16
## %bb.17:
	movq	%r8, (%rax)
	cmpq	$1, %r15
	movq	-48(%rbp), %r11         ## 8-byte Reload
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	je	LBB54_28
## %bb.18:
	leaq	(%r8,%r11,8), %rcx
	movq	%rcx, 8(%rax)
	cmpq	$2, %r15
	je	LBB54_28
## %bb.19:
	leaq	(%rcx,%r11,8), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$3, %r15
	je	LBB54_27
## %bb.20:
	leal	-3(%r15), %eax
	leaq	-4(%r15), %rbx
	andl	$3, %eax
	movl	$3, %ecx
	cmpq	$3, %rbx
	jb	LBB54_24
## %bb.21:
	movq	%r11, %r10
	shlq	$5, %r10
	movq	%r15, %rsi
	movq	%r11, %r15
	shlq	$4, %r15
	leaq	(%r15,%r15,2), %r9
	leaq	(,%r11,8), %rcx
	leaq	(%rcx,%rcx,4), %r11
	leaq	(%rcx,%rcx,2), %r12
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	subq	%rax, %rsi
	movl	$3, %ecx
	.p2align	4, 0x90
LBB54_22:                               ## =>This Inner Loop Header: Depth=1
	movq	%r8, %rbx
	movq	40(%r14), %rdx
	leaq	(%r8,%r12), %rdi
	movq	%rdi, (%rdx,%rcx,8)
	movq	40(%r14), %rdx
	leaq	(%r8,%r10), %r8
	movq	%r8, 8(%rdx,%rcx,8)
	movq	40(%r14), %rdx
	leaq	(%rbx,%r11), %rdi
	movq	%rdi, 16(%rdx,%rcx,8)
	movq	40(%r14), %rdx
	addq	%r9, %rbx
	movq	%rbx, 24(%rdx,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rsi
	jne	LBB54_22
## %bb.23:
	addq	%r15, %r8
	movq	%r8, %rdx
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	-48(%rbp), %r11         ## 8-byte Reload
	movq	-64(%rbp), %r15         ## 8-byte Reload
LBB54_24:
	testq	%rax, %rax
	je	LBB54_27
## %bb.25:
	leaq	(%rdx,%r11,8), %rdx
	leaq	(,%r11,8), %rbx
	.p2align	4, 0x90
LBB54_26:                               ## =>This Inner Loop Header: Depth=1
	movq	40(%r14), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rbx, %rdx
	decq	%rax
	jne	LBB54_26
LBB54_27:
	movq	32(%r14), %r8
	jmp	LBB54_28
LBB54_16:
	movq	-48(%rbp), %r11         ## 8-byte Reload
	movq	-56(%rbp), %rsi         ## 8-byte Reload
LBB54_28:
	movq	%r15, 8(%r14)
	movq	%r11, 16(%r14)
	movq	$0, 24(%r14)
	movq	$0, (%r14)
	shlq	$3, %rsi
	movq	%r8, %rdi
	callq	___bzero
	movq	%r14, 336(%r13)
	cmpq	$0, 344(%r13)
	jne	LBB54_46
LBB54_30:
	movl	$48, %edi
	callq	__Znwm
	movq	%rax, %r14
	movq	32(%r13), %r15
	movq	64(%r13), %rbx
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	movq	%rbx, %rax
	imulq	%r15, %rax
	movl	$8, %ebx
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	mulq	%rbx
	movq	$-1, %r12
	cmovoq	%r12, %rax
Ltmp61:
	movq	%rax, %rdi
	callq	__Znam
Ltmp62:
## %bb.31:
	movq	%rax, %rcx
	movq	%rax, 32(%r14)
	movq	%r15, %rax
	mulq	%rbx
	cmovnoq	%rax, %r12
Ltmp63:
	movq	%rcx, %rbx
	movq	%r12, %rdi
	callq	__Znam
Ltmp64:
## %bb.32:
	movq	%rbx, %r8
	movq	%rax, 40(%r14)
	testq	%r15, %r15
	jle	LBB54_33
## %bb.34:
	movq	%r8, (%rax)
	cmpq	$1, %r15
	movq	-48(%rbp), %r11         ## 8-byte Reload
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	je	LBB54_45
## %bb.35:
	leaq	(%r8,%r11,8), %rcx
	movq	%rcx, 8(%rax)
	cmpq	$2, %r15
	je	LBB54_45
## %bb.36:
	leaq	(%rcx,%r11,8), %rdx
	movq	%rdx, 16(%rax)
	cmpq	$3, %r15
	je	LBB54_44
## %bb.37:
	leal	-3(%r15), %eax
	leaq	-4(%r15), %rbx
	andl	$3, %eax
	movl	$3, %ecx
	cmpq	$3, %rbx
	jb	LBB54_41
## %bb.38:
	movq	%r11, %r10
	shlq	$5, %r10
	movq	%r15, %rsi
	movq	%r11, %r15
	shlq	$4, %r15
	leaq	(%r15,%r15,2), %r9
	leaq	(,%r11,8), %rcx
	leaq	(%rcx,%rcx,4), %r11
	leaq	(%rcx,%rcx,2), %r12
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	subq	%rax, %rsi
	movl	$3, %ecx
	.p2align	4, 0x90
LBB54_39:                               ## =>This Inner Loop Header: Depth=1
	movq	%r8, %rbx
	movq	40(%r14), %rdx
	leaq	(%r8,%r12), %rdi
	movq	%rdi, (%rdx,%rcx,8)
	movq	40(%r14), %rdx
	leaq	(%r8,%r10), %r8
	movq	%r8, 8(%rdx,%rcx,8)
	movq	40(%r14), %rdx
	leaq	(%rbx,%r11), %rdi
	movq	%rdi, 16(%rdx,%rcx,8)
	movq	40(%r14), %rdx
	addq	%r9, %rbx
	movq	%rbx, 24(%rdx,%rcx,8)
	addq	$4, %rcx
	cmpq	%rcx, %rsi
	jne	LBB54_39
## %bb.40:
	addq	%r15, %r8
	movq	%r8, %rdx
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	-48(%rbp), %r11         ## 8-byte Reload
	movq	-64(%rbp), %r15         ## 8-byte Reload
LBB54_41:
	testq	%rax, %rax
	je	LBB54_44
## %bb.42:
	leaq	(%rdx,%r11,8), %rdx
	leaq	(,%r11,8), %rbx
	.p2align	4, 0x90
LBB54_43:                               ## =>This Inner Loop Header: Depth=1
	movq	40(%r14), %rdi
	movq	%rdx, (%rdi,%rcx,8)
	incq	%rcx
	addq	%rbx, %rdx
	decq	%rax
	jne	LBB54_43
LBB54_44:
	movq	32(%r14), %r8
	jmp	LBB54_45
LBB54_33:
	movq	-48(%rbp), %r11         ## 8-byte Reload
	movq	-56(%rbp), %rsi         ## 8-byte Reload
LBB54_45:
	movq	%r15, 8(%r14)
	movq	%r11, 16(%r14)
	movq	$0, 24(%r14)
	movq	$0, (%r14)
	shlq	$3, %rsi
	movq	%r8, %rdi
	callq	___bzero
	movq	%r14, 344(%r13)
	movq	56(%r13), %rax
	testq	%rax, %rax
	jns	LBB54_48
LBB54_47:
	movq	$0, 56(%r13)
	xorl	%eax, %eax
	movq	32(%r13), %rcx
	cmpq	%rcx, %rax
	jge	LBB54_49
	jmp	LBB54_50
LBB54_118:
Ltmp55:
	jmp	LBB54_115
LBB54_117:
Ltmp52:
	jmp	LBB54_115
LBB54_116:
Ltmp49:
	jmp	LBB54_115
LBB54_114:
Ltmp46:
	jmp	LBB54_115
LBB54_120:
Ltmp65:
	jmp	LBB54_115
LBB54_119:
Ltmp60:
LBB54_115:
	movq	%rax, %rbx
	movq	%r14, %rdi
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table54:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6 ## >> Call Site 1 <<
	.uleb128 Ltmp44-Lfunc_begin6    ##   Call between Lfunc_begin6 and Ltmp44
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp44-Lfunc_begin6    ## >> Call Site 2 <<
	.uleb128 Ltmp45-Ltmp44          ##   Call between Ltmp44 and Ltmp45
	.uleb128 Ltmp46-Lfunc_begin6    ##     jumps to Ltmp46
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp45-Lfunc_begin6    ## >> Call Site 3 <<
	.uleb128 Ltmp47-Ltmp45          ##   Call between Ltmp45 and Ltmp47
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp47-Lfunc_begin6    ## >> Call Site 4 <<
	.uleb128 Ltmp48-Ltmp47          ##   Call between Ltmp47 and Ltmp48
	.uleb128 Ltmp49-Lfunc_begin6    ##     jumps to Ltmp49
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp48-Lfunc_begin6    ## >> Call Site 5 <<
	.uleb128 Ltmp50-Ltmp48          ##   Call between Ltmp48 and Ltmp50
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp50-Lfunc_begin6    ## >> Call Site 6 <<
	.uleb128 Ltmp51-Ltmp50          ##   Call between Ltmp50 and Ltmp51
	.uleb128 Ltmp52-Lfunc_begin6    ##     jumps to Ltmp52
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp51-Lfunc_begin6    ## >> Call Site 7 <<
	.uleb128 Ltmp53-Ltmp51          ##   Call between Ltmp51 and Ltmp53
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp53-Lfunc_begin6    ## >> Call Site 8 <<
	.uleb128 Ltmp54-Ltmp53          ##   Call between Ltmp53 and Ltmp54
	.uleb128 Ltmp55-Lfunc_begin6    ##     jumps to Ltmp55
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp54-Lfunc_begin6    ## >> Call Site 9 <<
	.uleb128 Ltmp56-Ltmp54          ##   Call between Ltmp54 and Ltmp56
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp56-Lfunc_begin6    ## >> Call Site 10 <<
	.uleb128 Ltmp59-Ltmp56          ##   Call between Ltmp56 and Ltmp59
	.uleb128 Ltmp60-Lfunc_begin6    ##     jumps to Ltmp60
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp59-Lfunc_begin6    ## >> Call Site 11 <<
	.uleb128 Ltmp61-Ltmp59          ##   Call between Ltmp59 and Ltmp61
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp61-Lfunc_begin6    ## >> Call Site 12 <<
	.uleb128 Ltmp64-Ltmp61          ##   Call between Ltmp61 and Ltmp64
	.uleb128 Ltmp65-Lfunc_begin6    ##     jumps to Ltmp65
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp64-Lfunc_begin6    ## >> Call Site 13 <<
	.uleb128 Lfunc_end6-Ltmp64      ##   Call between Ltmp64 and Lfunc_end6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end6:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV9vGetStateEl ## -- Begin function _ZN8MARKOVLV9vGetStateEl
	.p2align	4, 0x90
__ZN8MARKOVLV9vGetStateEl:              ## @_ZN8MARKOVLV9vGetStateEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	288(%rdi), %rax
	testq	%rax, %rax
	je	LBB55_4
## %bb.1:
	testq	%rsi, %rsi
	js	LBB55_6
## %bb.2:
	cmpq	%rsi, 24(%rax)
	jle	LBB55_6
## %bb.3:
	movq	32(%rax), %rax
	movq	(%rax,%rsi,8), %rax
	popq	%rbp
	retq
LBB55_6:
	xorl	%eax, %eax
	popq	%rbp
	retq
LBB55_4:
	movq	$-1, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV10dGetRandCFEl
LCPI56_0:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV10dGetRandCFEl
	.p2align	4, 0x90
__ZN8MARKOVLV10dGetRandCFEl:            ## @_ZN8MARKOVLV10dGetRandCFEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	296(%rdi), %rax
	testq	%rax, %rax
	je	LBB56_1
## %bb.2:
	xorps	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB56_5
## %bb.3:
	cmpq	%rsi, 24(%rax)
	jle	LBB56_5
## %bb.4:
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0    ## xmm0 = mem[0],zero
LBB56_5:
	popq	%rbp
	retq
LBB56_1:
	movsd	LCPI56_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _ZN8MARKOVLV10dGetRandDKEll
LCPI57_0:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV10dGetRandDKEll
	.p2align	4, 0x90
__ZN8MARKOVLV10dGetRandDKEll:           ## @_ZN8MARKOVLV10dGetRandDKEll
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	304(%rdi), %rax
	testq	%rax, %rax
	je	LBB57_1
## %bb.2:
	xorps	%xmm0, %xmm0
	testq	%rsi, %rsi
	js	LBB57_5
## %bb.3:
	cmpq	%rsi, 24(%rax)
	jle	LBB57_5
## %bb.4:
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0    ## xmm0 = mem[0],zero
LBB57_5:
	popq	%rbp
	retq
LBB57_1:
	movsd	LCPI57_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV10dGetMeanCFElll ## -- Begin function _ZN8MARKOVLV10dGetMeanCFElll
	.p2align	4, 0x90
__ZN8MARKOVLV10dGetMeanCFElll:          ## @_ZN8MARKOVLV10dGetMeanCFElll
	.cfi_startproc
## %bb.0:
	testq	%rcx, %rcx
	je	LBB58_1
## %bb.2:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r12
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	320(%rbx), %rax
	cmpq	%r12, %rax
	jge	LBB58_5
	.p2align	4, 0x90
LBB58_3:                                ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	__ZN8MARKOVLV19vGenerateTrajectoryEv
	movq	320(%rbx), %rax
	cmpq	%r12, %rax
	jl	LBB58_3
LBB58_5:
	xorpd	%xmm0, %xmm0
	testq	%r15, %r15
	js	LBB58_10
## %bb.6:
	testq	%r14, %r14
	js	LBB58_10
## %bb.7:
	movq	336(%rbx), %rcx
	cmpq	%r15, 8(%rcx)
	jle	LBB58_10
## %bb.8:
	cmpq	%r14, 16(%rcx)
	jle	LBB58_10
## %bb.9:
	movq	40(%rcx), %rcx
	movq	(%rcx,%r15,8), %rcx
	movsd	(%rcx,%r14,8), %xmm0    ## xmm0 = mem[0],zero
LBB58_10:
	cvtsi2sd	%rax, %xmm1
	divsd	%xmm1, %xmm0
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB58_1:
	xorps	%xmm0, %xmm0
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV10dGetMeanDKElll ## -- Begin function _ZN8MARKOVLV10dGetMeanDKElll
	.p2align	4, 0x90
__ZN8MARKOVLV10dGetMeanDKElll:          ## @_ZN8MARKOVLV10dGetMeanDKElll
	.cfi_startproc
## %bb.0:
	testq	%rcx, %rcx
	je	LBB59_1
## %bb.2:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r12
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	320(%rbx), %rax
	cmpq	%r12, %rax
	jge	LBB59_5
	.p2align	4, 0x90
LBB59_3:                                ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	__ZN8MARKOVLV19vGenerateTrajectoryEv
	movq	320(%rbx), %rax
	cmpq	%r12, %rax
	jl	LBB59_3
LBB59_5:
	xorpd	%xmm0, %xmm0
	testq	%r15, %r15
	js	LBB59_10
## %bb.6:
	testq	%r14, %r14
	js	LBB59_10
## %bb.7:
	movq	344(%rbx), %rcx
	cmpq	%r15, 8(%rcx)
	jle	LBB59_10
## %bb.8:
	cmpq	%r14, 16(%rcx)
	jle	LBB59_10
## %bb.9:
	movq	40(%rcx), %rcx
	movq	(%rcx,%r15,8), %rcx
	movsd	(%rcx,%r14,8), %xmm0    ## xmm0 = mem[0],zero
LBB59_10:
	cvtsi2sd	%rax, %xmm1
	divsd	%xmm1, %xmm0
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB59_1:
	xorps	%xmm0, %xmm0
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV8vNewSeedEl ## -- Begin function _ZN8MARKOVLV8vNewSeedEl
	.p2align	4, 0x90
__ZN8MARKOVLV8vNewSeedEl:               ## @_ZN8MARKOVLV8vNewSeedEl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rsi, 8(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV17vResetMeanResultsEv ## -- Begin function _ZN8MARKOVLV17vResetMeanResultsEv
	.p2align	4, 0x90
__ZN8MARKOVLV17vResetMeanResultsEv:     ## @_ZN8MARKOVLV17vResetMeanResultsEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movq	288(%rdi), %r14
	testq	%r14, %r14
	je	LBB61_4
## %bb.1:
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB61_3
## %bb.2:
	callq	__ZdlPv
LBB61_3:
	movq	%r14, %rdi
	callq	__ZdlPv
LBB61_4:
	movq	$0, 288(%rbx)
	movq	296(%rbx), %r14
	testq	%r14, %r14
	je	LBB61_8
## %bb.5:
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB61_7
## %bb.6:
	callq	__ZdlPv
LBB61_7:
	movq	%r14, %rdi
	callq	__ZdlPv
LBB61_8:
	movq	$0, 296(%rbx)
	movq	304(%rbx), %r14
	testq	%r14, %r14
	je	LBB61_12
## %bb.9:
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB61_11
## %bb.10:
	callq	__ZdlPv
LBB61_11:
	movq	%r14, %rdi
	callq	__ZdlPv
LBB61_12:
	movq	$0, 304(%rbx)
	movq	336(%rbx), %r14
	testq	%r14, %r14
	je	LBB61_18
## %bb.13:
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB61_15
## %bb.14:
	callq	__ZdlPv
LBB61_15:
	movq	40(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB61_17
## %bb.16:
	callq	__ZdlPv
LBB61_17:
	movq	%r14, %rdi
	callq	__ZdlPv
LBB61_18:
	movq	$0, 336(%rbx)
	movq	344(%rbx), %r14
	testq	%r14, %r14
	je	LBB61_24
## %bb.19:
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB61_21
## %bb.20:
	callq	__ZdlPv
LBB61_21:
	movq	40(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB61_23
## %bb.22:
	callq	__ZdlPv
LBB61_23:
	movq	%r14, %rdi
	callq	__ZdlPv
LBB61_24:
	movq	$0, 344(%rbx)
	movq	312(%rbx), %r14
	addq	$312, %rbx              ## imm = 0x138
	testq	%r14, %r14
	je	LBB61_28
## %bb.25:
	movq	32(%r14), %rdi
	testq	%rdi, %rdi
	je	LBB61_27
## %bb.26:
	callq	__ZdlPv
LBB61_27:
	movq	%r14, %rdi
	callq	__ZdlPv
LBB61_28:
	movq	$0, 8(%rbx)
	movq	$0, (%rbx)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN8MARKOVLV17vPrintTeXFileNameEPcbS0_b ## -- Begin function _ZN8MARKOVLV17vPrintTeXFileNameEPcbS0_b
	.p2align	4, 0x90
__ZN8MARKOVLV17vPrintTeXFileNameEPcbS0_b: ## @_ZN8MARKOVLV17vPrintTeXFileNameEPcbS0_b
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r15d
	movq	%rcx, %r14
	movl	%edx, %r12d
	movq	%rsi, %rax
	movq	%rdi, %r13
	leaq	L_.str.4(%rip), %rsi
	movq	%rax, %rdi
	callq	_fopen
	testq	%rax, %rax
	je	LBB62_1
## %bb.2:
	movq	%rax, %rbx
	movzbl	%r12b, %edx
	movzbl	%r15b, %r8d
	movq	%r13, %rdi
	movq	%rax, %rsi
	movq	%r14, %rcx
	callq	__ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_fclose                 ## TAILCALL
LBB62_1:
	leaq	L_str(%rip), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_puts                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb
LCPI63_0:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI63_1:
	.quad	4457293557087583675     ## double 1.0E-10
LCPI63_2:
	.quad	-4586634745500139520    ## double -100
LCPI63_3:
	.quad	4636737291354636288     ## double 100
LCPI63_4:
	.quad	-4556648864387432448    ## double -1.0E+4
LCPI63_5:
	.quad	4666723172467343360     ## double 1.0E+4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb
	.p2align	4, 0x90
__ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb:  ## @_ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$280, %rsp              ## imm = 0x118
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, -268(%rbp)        ## 4-byte Spill
	movq	%rcx, %r15
	movl	%edx, %ebx
	movq	%rsi, %r14
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movapd	L___const._ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb.pcTableEntryL(%rip), %xmm0
	movapd	%xmm0, -80(%rbp)
	movabsq	$35294787736919410, %rax ## imm = 0x7D646C257B5D72
	movq	%rax, -64(%rbp)
	movb	280(%rdi), %al
	movb	%al, -281(%rbp)         ## 1-byte Spill
	movq	%rdi, -240(%rbp)        ## 8-byte Spill
	movb	$1, 280(%rdi)
	movq	_strPrgVersionStatic(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movl	%ebx, -300(%rbp)        ## 4-byte Spill
	testb	%bl, %bl
	je	LBB63_2
## %bb.1:
	leaq	L_.str.6(%rip), %rdi
	movl	$39, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.7(%rip), %rdi
	movl	$75, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.8(%rip), %r12
	movq	%r14, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.9(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.10(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.11(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.12(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.13(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.14(%rip), %rdi
	movl	$38, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.15(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.16(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.17(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.18(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.19(%rip), %rdi
	movl	$30, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.20(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.21(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.22(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.23(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.24(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.25(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.26(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.27(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.28(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.29(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.30(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.31(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.32(%rip), %rdi
	movl	$15, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.33(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.34(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.35(%rip), %rdi
	movl	$17, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.36(%rip), %rdi
	movl	$15, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
LBB63_2:
	leaq	L_.str.45(%rip), %rsi
	movq	%r14, %rdi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.46(%rip), %rdi
	movl	$22, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.53(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.41(%rip), %r15
	movl	$20, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.54(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movq	-240(%rbp), %rbx        ## 8-byte Reload
	movq	32(%rbx), %rdx
	leaq	L_.str.55(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movq	64(%rbx), %rdx
	leaq	L_.str.56(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	48(%rbx), %rax
	movq	%rax, -216(%rbp)        ## 8-byte Spill
	movq	48(%rbx), %rdx
	leaq	L_.str.57(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	56(%rbx), %rax
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	movq	56(%rbx), %rdx
	leaq	L_.str.58(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movq	_strPrgVersionStatic(%rip), %rdx
	incq	%rdx
	leaq	L_.str.59(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.43(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.44(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.47(%rip), %rdi
	movl	$36, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movq	64(%rbx), %rax
	testq	%rax, %rax
	movq	%r14, -224(%rbp)        ## 8-byte Spill
	jle	LBB63_77
## %bb.3:
	movl	-268(%rbp), %ecx        ## 4-byte Reload
                                        ## kill: def $cl killed $cl killed $ecx
	xorb	$1, %cl
	movb	%cl, -296(%rbp)         ## 1-byte Spill
	movb	$1, %r13b
	leaq	-80(%rbp), %r15
	xorl	%ecx, %ecx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	xorl	%r12d, %r12d
	jmp	LBB63_4
	.p2align	4, 0x90
LBB63_52:                               ##   in Loop: Header=BB63_4 Depth=1
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	incq	%rdx
	movq	%rdx, %rcx
	movq	%rdx, -232(%rbp)        ## 8-byte Spill
	cmpq	%rax, %rdx
	jge	LBB63_53
LBB63_4:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_6 Depth 2
                                        ##       Child Loop BB63_9 Depth 3
                                        ##       Child Loop BB63_16 Depth 3
                                        ##       Child Loop BB63_19 Depth 3
                                        ##       Child Loop BB63_23 Depth 3
                                        ##         Child Loop BB63_25 Depth 4
                                        ##         Child Loop BB63_36 Depth 4
                                        ##         Child Loop BB63_39 Depth 4
                                        ##       Child Loop BB63_44 Depth 3
	testq	%rax, %rax
	jle	LBB63_52
## %bb.5:                               ##   in Loop: Header=BB63_4 Depth=1
	xorl	%eax, %eax
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	jmp	LBB63_6
	.p2align	4, 0x90
LBB63_50:                               ##   in Loop: Header=BB63_6 Depth=2
	movq	-232(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp)
	movq	%r12, -208(%rbp)
	movq	%r12, %rcx
	movl	$1, %r12d
LBB63_51:                               ##   in Loop: Header=BB63_6 Depth=2
	incq	%rcx
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
	movq	%rcx, %rdx
	movq	%rcx, -248(%rbp)        ## 8-byte Spill
	cmpq	%rax, %rcx
	jge	LBB63_52
LBB63_6:                                ##   Parent Loop BB63_4 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB63_9 Depth 3
                                        ##       Child Loop BB63_16 Depth 3
                                        ##       Child Loop BB63_19 Depth 3
                                        ##       Child Loop BB63_23 Depth 3
                                        ##         Child Loop BB63_25 Depth 4
                                        ##         Child Loop BB63_36 Depth 4
                                        ##         Child Loop BB63_39 Depth 4
                                        ##       Child Loop BB63_44 Depth 3
	testb	$1, %r13b
	jne	LBB63_7
## %bb.14:                              ##   in Loop: Header=BB63_6 Depth=2
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_20
## %bb.15:                              ##   in Loop: Header=BB63_6 Depth=2
	xorl	%ebx, %ebx
	leaq	L_.str.63(%rip), %r13
	.p2align	4, 0x90
LBB63_16:                               ##   Parent Loop BB63_4 Depth=1
                                        ##     Parent Loop BB63_6 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_16
## %bb.17:                              ##   in Loop: Header=BB63_6 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_21
## %bb.18:                              ##   in Loop: Header=BB63_6 Depth=2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_19:                               ##   Parent Loop BB63_4 Depth=1
                                        ##     Parent Loop BB63_6 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_19
	jmp	LBB63_21
	.p2align	4, 0x90
LBB63_7:                                ##   in Loop: Header=BB63_6 Depth=2
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r14b
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	jg	LBB63_11
	.p2align	4, 0x90
LBB63_9:                                ##   Parent Loop BB63_4 Depth=1
                                        ##     Parent Loop BB63_6 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	callq	__ZN8MARKOVLV7dSetPijEllld
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_10
## %bb.8:                               ##   in Loop: Header=BB63_9 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	jl	LBB63_9
LBB63_11:                               ##   in Loop: Header=BB63_6 Depth=2
	testb	%r14b, -296(%rbp)       ## 1-byte Folded Reload
	je	LBB63_13
LBB63_12:                               ##   in Loop: Header=BB63_6 Depth=2
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	jmp	LBB63_51
LBB63_20:                               ##   in Loop: Header=BB63_6 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
LBB63_21:                               ##   in Loop: Header=BB63_6 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r13
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	jle	LBB63_22
LBB63_43:                               ##   in Loop: Header=BB63_6 Depth=2
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r13b
	movb	$1, %al
	movq	-216(%rbp), %rcx        ## 8-byte Reload
	cmpq	(%rcx), %rbx
	movq	-248(%rbp), %r12        ## 8-byte Reload
	jg	LBB63_48
	.p2align	4, 0x90
LBB63_44:                               ##   Parent Loop BB63_4 Depth=1
                                        ##     Parent Loop BB63_6 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	%r12, %rcx
	callq	__ZN8MARKOVLV7dSetPijEllld
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_47
## %bb.45:                              ##   in Loop: Header=BB63_44 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	jl	LBB63_44
## %bb.46:                              ##   in Loop: Header=BB63_6 Depth=2
	movb	$1, %al
LBB63_48:                               ##   in Loop: Header=BB63_6 Depth=2
	testb	%al, -296(%rbp)         ## 1-byte Folded Reload
	je	LBB63_50
	jmp	LBB63_49
	.p2align	4, 0x90
LBB63_22:                               ##   in Loop: Header=BB63_6 Depth=2
	xorl	%r14d, %r14d
	movq	%r12, -280(%rbp)        ## 8-byte Spill
	jmp	LBB63_23
LBB63_40:                               ##   in Loop: Header=BB63_23 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	leaq	-80(%rbp), %r15
	movq	-280(%rbp), %r12        ## 8-byte Reload
LBB63_41:                               ##   in Loop: Header=BB63_23 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %r14
LBB63_42:                               ##   in Loop: Header=BB63_23 Depth=3
	incq	%r14
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	leaq	1(%r13), %r13
	jge	LBB63_43
LBB63_23:                               ##   Parent Loop BB63_4 Depth=1
                                        ##     Parent Loop BB63_6 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB63_25 Depth 4
                                        ##         Child Loop BB63_36 Depth 4
                                        ##         Child Loop BB63_39 Depth 4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.66(%rip), %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	testq	%r12, %r12
	jle	LBB63_32
## %bb.24:                              ##   in Loop: Header=BB63_23 Depth=3
	xorl	%ebx, %ebx
	jmp	LBB63_25
	.p2align	4, 0x90
LBB63_31:                               ##   in Loop: Header=BB63_25 Depth=4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	je	LBB63_32
LBB63_25:                               ##   Parent Loop BB63_4 Depth=1
                                        ##     Parent Loop BB63_6 Depth=2
                                        ##       Parent Loop BB63_23 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movq	-144(%rbp,%rbx,8), %rdx
	movq	-208(%rbp,%rbx,8), %rcx
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r13, %rsi
	callq	__ZN8MARKOVLV7dSetPijEllld
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_27
## %bb.26:                              ##   in Loop: Header=BB63_25 Depth=4
	leaq	L_.str.1(%rip), %rcx
LBB63_27:                               ##   in Loop: Header=BB63_25 Depth=4
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_29
## %bb.28:                              ##   in Loop: Header=BB63_25 Depth=4
	movq	%rcx, %rax
LBB63_29:                               ##   in Loop: Header=BB63_25 Depth=4
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.3(%rip), %rsi
	cmovaq	%rsi, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	ja	LBB63_31
## %bb.30:                              ##   in Loop: Header=BB63_25 Depth=4
	movq	%rax, %rsi
	jmp	LBB63_31
	.p2align	4, 0x90
LBB63_32:                               ##   in Loop: Header=BB63_23 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	callq	_fwrite
	cmpq	$50, %r14
	jl	LBB63_42
## %bb.33:                              ##   in Loop: Header=BB63_23 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	je	LBB63_42
## %bb.34:                              ##   in Loop: Header=BB63_23 Depth=3
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_40
## %bb.35:                              ##   in Loop: Header=BB63_23 Depth=3
	xorl	%ebx, %ebx
	leaq	-80(%rbp), %r15
	movq	-280(%rbp), %r12        ## 8-byte Reload
	.p2align	4, 0x90
LBB63_36:                               ##   Parent Loop BB63_4 Depth=1
                                        ##     Parent Loop BB63_6 Depth=2
                                        ##       Parent Loop BB63_23 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_36
## %bb.37:                              ##   in Loop: Header=BB63_23 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_41
## %bb.38:                              ##   in Loop: Header=BB63_23 Depth=3
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_39:                               ##   Parent Loop BB63_4 Depth=1
                                        ##     Parent Loop BB63_6 Depth=2
                                        ##       Parent Loop BB63_23 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_39
	jmp	LBB63_41
LBB63_10:                               ##   in Loop: Header=BB63_6 Depth=2
	xorl	%r14d, %r14d
	testb	%r14b, -296(%rbp)       ## 1-byte Folded Reload
	jne	LBB63_12
LBB63_13:                               ##   in Loop: Header=BB63_6 Depth=2
	movq	-232(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp,%r12,8)
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -208(%rbp,%r12,8)
	cmpq	$6, %r12
	leaq	1(%r12), %r12
	movzbl	%r13b, %r13d
	movl	$0, %eax
	cmovgl	%eax, %r13d
	movq	-224(%rbp), %r14        ## 8-byte Reload
	jmp	LBB63_51
LBB63_47:                               ##   in Loop: Header=BB63_6 Depth=2
	xorl	%eax, %eax
	testb	%al, -296(%rbp)         ## 1-byte Folded Reload
	je	LBB63_50
LBB63_49:                               ##   in Loop: Header=BB63_6 Depth=2
	movq	%r12, %rcx
	xorl	%r12d, %r12d
	jmp	LBB63_51
LBB63_53:
	testq	%r12, %r12
	jle	LBB63_77
## %bb.54:
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.62(%rip), %rdi
	movl	$5, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	movq	%r14, %r13
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_55:                               ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_55
## %bb.56:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.65(%rip), %rdi
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_57:                               ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_57
## %bb.58:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r15
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	movq	%r13, %r14
	jle	LBB63_59
LBB63_76:
	leaq	L_.str.43(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.44(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
LBB63_77:
	leaq	L_.str.48(%rip), %rdi
	movl	$42, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
	testq	%rax, %rax
	jle	LBB63_152
## %bb.78:
	movl	-268(%rbp), %ecx        ## 4-byte Reload
                                        ## kill: def $cl killed $cl killed $ecx
	xorb	$1, %cl
	movb	%cl, -249(%rbp)         ## 1-byte Spill
	movb	$1, %r13b
	leaq	-80(%rbp), %r15
	xorl	%edx, %edx
	xorl	%r12d, %r12d
	jmp	LBB63_79
	.p2align	4, 0x90
LBB63_126:                              ##   in Loop: Header=BB63_79 Depth=1
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
LBB63_127:                              ##   in Loop: Header=BB63_79 Depth=1
	movq	-312(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdx
	cmpq	%rax, %rcx
	jge	LBB63_128
LBB63_79:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_80 Depth 2
                                        ##       Child Loop BB63_83 Depth 3
                                        ##       Child Loop BB63_90 Depth 3
                                        ##       Child Loop BB63_93 Depth 3
                                        ##       Child Loop BB63_97 Depth 3
                                        ##         Child Loop BB63_99 Depth 4
                                        ##         Child Loop BB63_110 Depth 4
                                        ##         Child Loop BB63_113 Depth 4
                                        ##       Child Loop BB63_118 Depth 3
	movq	-240(%rbp), %rcx        ## 8-byte Reload
	cmpb	$0, 281(%rcx)
	movl	$0, %ecx
	cmoveq	%rdx, %rcx
	movq	%rdx, -248(%rbp)        ## 8-byte Spill
	leaq	1(%rdx), %rdx
	movq	%rax, %rsi
	movq	%rdx, -312(%rbp)        ## 8-byte Spill
	cmoveq	%rdx, %rsi
	movq	%rsi, -296(%rbp)        ## 8-byte Spill
	cmpq	%rsi, %rcx
	jl	LBB63_80
	jmp	LBB63_127
	.p2align	4, 0x90
LBB63_124:                              ##   in Loop: Header=BB63_80 Depth=2
	movq	%r12, -144(%rbp)
	movq	%rcx, -208(%rbp)
	movl	$1, %r12d
LBB63_125:                              ##   in Loop: Header=BB63_80 Depth=2
	incq	%rcx
	cmpq	-296(%rbp), %rcx        ## 8-byte Folded Reload
	je	LBB63_126
LBB63_80:                               ##   Parent Loop BB63_79 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB63_83 Depth 3
                                        ##       Child Loop BB63_90 Depth 3
                                        ##       Child Loop BB63_93 Depth 3
                                        ##       Child Loop BB63_97 Depth 3
                                        ##         Child Loop BB63_99 Depth 4
                                        ##         Child Loop BB63_110 Depth 4
                                        ##         Child Loop BB63_113 Depth 4
                                        ##       Child Loop BB63_118 Depth 3
	testb	$1, %r13b
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	jne	LBB63_81
## %bb.88:                              ##   in Loop: Header=BB63_80 Depth=2
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.67(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_94
## %bb.89:                              ##   in Loop: Header=BB63_80 Depth=2
	xorl	%ebx, %ebx
	leaq	L_.str.63(%rip), %r13
	.p2align	4, 0x90
LBB63_90:                               ##   Parent Loop BB63_79 Depth=1
                                        ##     Parent Loop BB63_80 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_90
## %bb.91:                              ##   in Loop: Header=BB63_80 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_95
## %bb.92:                              ##   in Loop: Header=BB63_80 Depth=2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_93:                               ##   Parent Loop BB63_79 Depth=1
                                        ##     Parent Loop BB63_80 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_93
	jmp	LBB63_95
	.p2align	4, 0x90
LBB63_81:                               ##   in Loop: Header=BB63_80 Depth=2
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r14b
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	jg	LBB63_85
	.p2align	4, 0x90
LBB63_83:                               ##   Parent Loop BB63_79 Depth=1
                                        ##     Parent Loop BB63_80 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	-248(%rbp), %rdx        ## 8-byte Reload
	callq	__ZN8MARKOVLV8dSetDiscEllld
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_84
## %bb.82:                              ##   in Loop: Header=BB63_83 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	jl	LBB63_83
LBB63_85:                               ##   in Loop: Header=BB63_80 Depth=2
	testb	%r14b, -249(%rbp)       ## 1-byte Folded Reload
	je	LBB63_87
LBB63_86:                               ##   in Loop: Header=BB63_80 Depth=2
	movq	-224(%rbp), %r14        ## 8-byte Reload
	jmp	LBB63_125
LBB63_94:                               ##   in Loop: Header=BB63_80 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
LBB63_95:                               ##   in Loop: Header=BB63_80 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r13
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	jle	LBB63_96
LBB63_117:                              ##   in Loop: Header=BB63_80 Depth=2
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r13b
	movb	$1, %al
	movq	-216(%rbp), %rcx        ## 8-byte Reload
	cmpq	(%rcx), %rbx
	movq	-248(%rbp), %r12        ## 8-byte Reload
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	jg	LBB63_122
	.p2align	4, 0x90
LBB63_118:                              ##   Parent Loop BB63_79 Depth=1
                                        ##     Parent Loop BB63_80 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	__ZN8MARKOVLV8dSetDiscEllld
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_121
## %bb.119:                             ##   in Loop: Header=BB63_118 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	jl	LBB63_118
## %bb.120:                             ##   in Loop: Header=BB63_80 Depth=2
	movb	$1, %al
LBB63_122:                              ##   in Loop: Header=BB63_80 Depth=2
	testb	%al, -249(%rbp)         ## 1-byte Folded Reload
	je	LBB63_124
	jmp	LBB63_123
	.p2align	4, 0x90
LBB63_96:                               ##   in Loop: Header=BB63_80 Depth=2
	xorl	%r14d, %r14d
	movq	%r12, -280(%rbp)        ## 8-byte Spill
	jmp	LBB63_97
LBB63_114:                              ##   in Loop: Header=BB63_97 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	leaq	-80(%rbp), %r15
	movq	-280(%rbp), %r12        ## 8-byte Reload
LBB63_115:                              ##   in Loop: Header=BB63_97 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %r14
LBB63_116:                              ##   in Loop: Header=BB63_97 Depth=3
	incq	%r14
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	leaq	1(%r13), %r13
	jge	LBB63_117
LBB63_97:                               ##   Parent Loop BB63_79 Depth=1
                                        ##     Parent Loop BB63_80 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB63_99 Depth 4
                                        ##         Child Loop BB63_110 Depth 4
                                        ##         Child Loop BB63_113 Depth 4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.66(%rip), %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	testq	%r12, %r12
	jle	LBB63_106
## %bb.98:                              ##   in Loop: Header=BB63_97 Depth=3
	xorl	%ebx, %ebx
	jmp	LBB63_99
	.p2align	4, 0x90
LBB63_105:                              ##   in Loop: Header=BB63_99 Depth=4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	je	LBB63_106
LBB63_99:                               ##   Parent Loop BB63_79 Depth=1
                                        ##     Parent Loop BB63_80 Depth=2
                                        ##       Parent Loop BB63_97 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movq	-144(%rbp,%rbx,8), %rdx
	movq	-208(%rbp,%rbx,8), %rcx
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r13, %rsi
	callq	__ZN8MARKOVLV8dSetDiscEllld
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_101
## %bb.100:                             ##   in Loop: Header=BB63_99 Depth=4
	leaq	L_.str.1(%rip), %rcx
LBB63_101:                              ##   in Loop: Header=BB63_99 Depth=4
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_103
## %bb.102:                             ##   in Loop: Header=BB63_99 Depth=4
	movq	%rcx, %rax
LBB63_103:                              ##   in Loop: Header=BB63_99 Depth=4
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.3(%rip), %rsi
	cmovaq	%rsi, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	ja	LBB63_105
## %bb.104:                             ##   in Loop: Header=BB63_99 Depth=4
	movq	%rax, %rsi
	jmp	LBB63_105
	.p2align	4, 0x90
LBB63_106:                              ##   in Loop: Header=BB63_97 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	callq	_fwrite
	cmpq	$50, %r14
	jl	LBB63_116
## %bb.107:                             ##   in Loop: Header=BB63_97 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	je	LBB63_116
## %bb.108:                             ##   in Loop: Header=BB63_97 Depth=3
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.67(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_114
## %bb.109:                             ##   in Loop: Header=BB63_97 Depth=3
	xorl	%ebx, %ebx
	leaq	-80(%rbp), %r15
	movq	-280(%rbp), %r12        ## 8-byte Reload
	.p2align	4, 0x90
LBB63_110:                              ##   Parent Loop BB63_79 Depth=1
                                        ##     Parent Loop BB63_80 Depth=2
                                        ##       Parent Loop BB63_97 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_110
## %bb.111:                             ##   in Loop: Header=BB63_97 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_115
## %bb.112:                             ##   in Loop: Header=BB63_97 Depth=3
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_113:                              ##   Parent Loop BB63_79 Depth=1
                                        ##     Parent Loop BB63_80 Depth=2
                                        ##       Parent Loop BB63_97 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_113
	jmp	LBB63_115
LBB63_84:                               ##   in Loop: Header=BB63_80 Depth=2
	xorl	%r14d, %r14d
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	testb	%r14b, -249(%rbp)       ## 1-byte Folded Reload
	jne	LBB63_86
LBB63_87:                               ##   in Loop: Header=BB63_80 Depth=2
	movq	-248(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp,%r12,8)
	movq	%rcx, -208(%rbp,%r12,8)
	cmpq	$6, %r12
	leaq	1(%r12), %r12
	movzbl	%r13b, %r13d
	movl	$0, %eax
	cmovgl	%eax, %r13d
	movq	-224(%rbp), %r14        ## 8-byte Reload
	jmp	LBB63_125
LBB63_121:                              ##   in Loop: Header=BB63_80 Depth=2
	xorl	%eax, %eax
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	testb	%al, -249(%rbp)         ## 1-byte Folded Reload
	je	LBB63_124
LBB63_123:                              ##   in Loop: Header=BB63_80 Depth=2
	xorl	%r12d, %r12d
	jmp	LBB63_125
LBB63_128:
	testq	%r12, %r12
	jle	LBB63_152
## %bb.129:
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.67(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.62(%rip), %rdi
	movl	$5, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	movq	%r14, %r13
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_130:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_130
## %bb.131:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.65(%rip), %rdi
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_132:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_132
## %bb.133:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r15
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	movq	%r13, %r14
	jle	LBB63_134
LBB63_151:
	leaq	L_.str.43(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.44(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
LBB63_152:
	leaq	L_.str.49(%rip), %rdi
	movl	$46, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movq	-240(%rbp), %rax        ## 8-byte Reload
	cmpq	$0, 64(%rax)
	jle	LBB63_224
## %bb.153:
	movl	-268(%rbp), %eax        ## 4-byte Reload
                                        ## kill: def $al killed $al killed $eax
	xorb	$1, %al
	movb	%al, -280(%rbp)         ## 1-byte Spill
	movb	$1, %r13b
	leaq	-80(%rbp), %r15
	xorl	%eax, %eax
	movq	%rax, -232(%rbp)        ## 8-byte Spill
	xorl	%r12d, %r12d
	jmp	LBB63_154
	.p2align	4, 0x90
LBB63_198:                              ##   in Loop: Header=BB63_154 Depth=1
	movq	%r12, -144(%rbp)
	movq	%r12, -208(%rbp)
	movq	%r12, %rcx
	movl	$1, %r12d
LBB63_199:                              ##   in Loop: Header=BB63_154 Depth=1
	incq	%rcx
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	%rcx, %rdx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	cmpq	64(%rax), %rcx
	jge	LBB63_200
LBB63_154:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_157 Depth 2
                                        ##     Child Loop BB63_164 Depth 2
                                        ##     Child Loop BB63_167 Depth 2
                                        ##     Child Loop BB63_171 Depth 2
                                        ##       Child Loop BB63_173 Depth 3
                                        ##       Child Loop BB63_184 Depth 3
                                        ##       Child Loop BB63_187 Depth 3
                                        ##     Child Loop BB63_192 Depth 2
	testb	$1, %r13b
	jne	LBB63_155
## %bb.162:                             ##   in Loop: Header=BB63_154 Depth=1
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.68(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_168
## %bb.163:                             ##   in Loop: Header=BB63_154 Depth=1
	xorl	%ebx, %ebx
	leaq	L_.str.63(%rip), %r13
	.p2align	4, 0x90
LBB63_164:                              ##   Parent Loop BB63_154 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_164
## %bb.165:                             ##   in Loop: Header=BB63_154 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_169
## %bb.166:                             ##   in Loop: Header=BB63_154 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_167:                              ##   Parent Loop BB63_154 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_167
	jmp	LBB63_169
	.p2align	4, 0x90
LBB63_155:                              ##   in Loop: Header=BB63_154 Depth=1
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r14b
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	jg	LBB63_159
	.p2align	4, 0x90
LBB63_157:                              ##   Parent Loop BB63_154 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	callq	__ZN8MARKOVLV7dSetPreEllld
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_158
## %bb.156:                             ##   in Loop: Header=BB63_157 Depth=2
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	jl	LBB63_157
LBB63_159:                              ##   in Loop: Header=BB63_154 Depth=1
	testb	%r14b, -280(%rbp)       ## 1-byte Folded Reload
	je	LBB63_161
LBB63_160:                              ##   in Loop: Header=BB63_154 Depth=1
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	jmp	LBB63_199
LBB63_168:                              ##   in Loop: Header=BB63_154 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
LBB63_169:                              ##   in Loop: Header=BB63_154 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r13
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	jle	LBB63_170
LBB63_191:                              ##   in Loop: Header=BB63_154 Depth=1
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r13b
	movb	$1, %al
	movq	-216(%rbp), %rcx        ## 8-byte Reload
	cmpq	(%rcx), %rbx
	movq	-232(%rbp), %r12        ## 8-byte Reload
	jg	LBB63_196
	.p2align	4, 0x90
LBB63_192:                              ##   Parent Loop BB63_154 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	__ZN8MARKOVLV7dSetPreEllld
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_195
## %bb.193:                             ##   in Loop: Header=BB63_192 Depth=2
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	jl	LBB63_192
## %bb.194:                             ##   in Loop: Header=BB63_154 Depth=1
	movb	$1, %al
LBB63_196:                              ##   in Loop: Header=BB63_154 Depth=1
	testb	%al, -280(%rbp)         ## 1-byte Folded Reload
	je	LBB63_198
	jmp	LBB63_197
	.p2align	4, 0x90
LBB63_170:                              ##   in Loop: Header=BB63_154 Depth=1
	xorl	%r14d, %r14d
	movq	%r12, -248(%rbp)        ## 8-byte Spill
	jmp	LBB63_171
LBB63_188:                              ##   in Loop: Header=BB63_171 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	leaq	-80(%rbp), %r15
	movq	-248(%rbp), %r12        ## 8-byte Reload
LBB63_189:                              ##   in Loop: Header=BB63_171 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %r14
LBB63_190:                              ##   in Loop: Header=BB63_171 Depth=2
	incq	%r14
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	leaq	1(%r13), %r13
	jge	LBB63_191
LBB63_171:                              ##   Parent Loop BB63_154 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB63_173 Depth 3
                                        ##       Child Loop BB63_184 Depth 3
                                        ##       Child Loop BB63_187 Depth 3
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.66(%rip), %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	testq	%r12, %r12
	jle	LBB63_180
## %bb.172:                             ##   in Loop: Header=BB63_171 Depth=2
	xorl	%ebx, %ebx
	jmp	LBB63_173
	.p2align	4, 0x90
LBB63_179:                              ##   in Loop: Header=BB63_173 Depth=3
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	je	LBB63_180
LBB63_173:                              ##   Parent Loop BB63_154 Depth=1
                                        ##     Parent Loop BB63_171 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	-144(%rbp,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r13, %rsi
	callq	__ZN8MARKOVLV7dSetPreEllld
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_175
## %bb.174:                             ##   in Loop: Header=BB63_173 Depth=3
	leaq	L_.str.1(%rip), %rcx
LBB63_175:                              ##   in Loop: Header=BB63_173 Depth=3
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_177
## %bb.176:                             ##   in Loop: Header=BB63_173 Depth=3
	movq	%rcx, %rax
LBB63_177:                              ##   in Loop: Header=BB63_173 Depth=3
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.3(%rip), %rsi
	cmovaq	%rsi, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	ja	LBB63_179
## %bb.178:                             ##   in Loop: Header=BB63_173 Depth=3
	movq	%rax, %rsi
	jmp	LBB63_179
	.p2align	4, 0x90
LBB63_180:                              ##   in Loop: Header=BB63_171 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	callq	_fwrite
	cmpq	$50, %r14
	jl	LBB63_190
## %bb.181:                             ##   in Loop: Header=BB63_171 Depth=2
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	je	LBB63_190
## %bb.182:                             ##   in Loop: Header=BB63_171 Depth=2
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.68(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_188
## %bb.183:                             ##   in Loop: Header=BB63_171 Depth=2
	xorl	%ebx, %ebx
	leaq	-80(%rbp), %r15
	movq	-248(%rbp), %r12        ## 8-byte Reload
	.p2align	4, 0x90
LBB63_184:                              ##   Parent Loop BB63_154 Depth=1
                                        ##     Parent Loop BB63_171 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_184
## %bb.185:                             ##   in Loop: Header=BB63_171 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_189
## %bb.186:                             ##   in Loop: Header=BB63_171 Depth=2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_187:                              ##   Parent Loop BB63_154 Depth=1
                                        ##     Parent Loop BB63_171 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_187
	jmp	LBB63_189
LBB63_158:                              ##   in Loop: Header=BB63_154 Depth=1
	xorl	%r14d, %r14d
	testb	%r14b, -280(%rbp)       ## 1-byte Folded Reload
	jne	LBB63_160
LBB63_161:                              ##   in Loop: Header=BB63_154 Depth=1
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -144(%rbp,%r12,8)
	movq	%rcx, -208(%rbp,%r12,8)
	cmpq	$6, %r12
	leaq	1(%r12), %r12
	movzbl	%r13b, %r13d
	movl	$0, %eax
	cmovgl	%eax, %r13d
	movq	-224(%rbp), %r14        ## 8-byte Reload
	jmp	LBB63_199
LBB63_195:                              ##   in Loop: Header=BB63_154 Depth=1
	xorl	%eax, %eax
	testb	%al, -280(%rbp)         ## 1-byte Folded Reload
	je	LBB63_198
LBB63_197:                              ##   in Loop: Header=BB63_154 Depth=1
	movq	%r12, %rcx
	xorl	%r12d, %r12d
	jmp	LBB63_199
LBB63_200:
	testq	%r12, %r12
	jle	LBB63_224
## %bb.201:
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.68(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.62(%rip), %rdi
	movl	$5, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	movq	%r14, %r13
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_202:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_202
## %bb.203:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.65(%rip), %rdi
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_204:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_204
## %bb.205:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r15
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	movq	%r13, %r14
	jle	LBB63_206
LBB63_223:
	leaq	L_.str.43(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.44(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
LBB63_224:
	leaq	L_.str.50(%rip), %rdi
	movl	$47, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
	testq	%rax, %rax
	jle	LBB63_299
## %bb.225:
	movl	-268(%rbp), %ecx        ## 4-byte Reload
                                        ## kill: def $cl killed $cl killed $ecx
	xorb	$1, %cl
	movb	%cl, -296(%rbp)         ## 1-byte Spill
	movb	$1, %r13b
	leaq	-80(%rbp), %r15
	xorl	%ecx, %ecx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	xorl	%r12d, %r12d
	jmp	LBB63_226
	.p2align	4, 0x90
LBB63_274:                              ##   in Loop: Header=BB63_226 Depth=1
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	incq	%rdx
	movq	%rdx, %rcx
	movq	%rdx, -232(%rbp)        ## 8-byte Spill
	cmpq	%rax, %rdx
	jge	LBB63_275
LBB63_226:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_228 Depth 2
                                        ##       Child Loop BB63_231 Depth 3
                                        ##       Child Loop BB63_238 Depth 3
                                        ##       Child Loop BB63_241 Depth 3
                                        ##       Child Loop BB63_245 Depth 3
                                        ##         Child Loop BB63_247 Depth 4
                                        ##         Child Loop BB63_258 Depth 4
                                        ##         Child Loop BB63_261 Depth 4
                                        ##       Child Loop BB63_266 Depth 3
	testq	%rax, %rax
	jle	LBB63_274
## %bb.227:                             ##   in Loop: Header=BB63_226 Depth=1
	xorl	%eax, %eax
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	jmp	LBB63_228
	.p2align	4, 0x90
LBB63_272:                              ##   in Loop: Header=BB63_228 Depth=2
	movq	-232(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp)
	movq	%r12, -208(%rbp)
	movq	%r12, %rcx
	movl	$1, %r12d
LBB63_273:                              ##   in Loop: Header=BB63_228 Depth=2
	incq	%rcx
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
	movq	%rcx, %rdx
	movq	%rcx, -248(%rbp)        ## 8-byte Spill
	cmpq	%rax, %rcx
	jge	LBB63_274
LBB63_228:                              ##   Parent Loop BB63_226 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB63_231 Depth 3
                                        ##       Child Loop BB63_238 Depth 3
                                        ##       Child Loop BB63_241 Depth 3
                                        ##       Child Loop BB63_245 Depth 3
                                        ##         Child Loop BB63_247 Depth 4
                                        ##         Child Loop BB63_258 Depth 4
                                        ##         Child Loop BB63_261 Depth 4
                                        ##       Child Loop BB63_266 Depth 3
	testb	$1, %r13b
	jne	LBB63_229
## %bb.236:                             ##   in Loop: Header=BB63_228 Depth=2
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.69(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_242
## %bb.237:                             ##   in Loop: Header=BB63_228 Depth=2
	xorl	%ebx, %ebx
	leaq	L_.str.63(%rip), %r13
	.p2align	4, 0x90
LBB63_238:                              ##   Parent Loop BB63_226 Depth=1
                                        ##     Parent Loop BB63_228 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_238
## %bb.239:                             ##   in Loop: Header=BB63_228 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_243
## %bb.240:                             ##   in Loop: Header=BB63_228 Depth=2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_241:                              ##   Parent Loop BB63_226 Depth=1
                                        ##     Parent Loop BB63_228 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_241
	jmp	LBB63_243
	.p2align	4, 0x90
LBB63_229:                              ##   in Loop: Header=BB63_228 Depth=2
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r14b
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	jg	LBB63_233
	.p2align	4, 0x90
LBB63_231:                              ##   Parent Loop BB63_226 Depth=1
                                        ##     Parent Loop BB63_228 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	callq	__ZN8MARKOVLV8dSetPostEllld
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_232
## %bb.230:                             ##   in Loop: Header=BB63_231 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	jl	LBB63_231
LBB63_233:                              ##   in Loop: Header=BB63_228 Depth=2
	testb	%r14b, -296(%rbp)       ## 1-byte Folded Reload
	je	LBB63_235
LBB63_234:                              ##   in Loop: Header=BB63_228 Depth=2
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	jmp	LBB63_273
LBB63_242:                              ##   in Loop: Header=BB63_228 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
LBB63_243:                              ##   in Loop: Header=BB63_228 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r13
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	jle	LBB63_244
LBB63_265:                              ##   in Loop: Header=BB63_228 Depth=2
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r13b
	movb	$1, %al
	movq	-216(%rbp), %rcx        ## 8-byte Reload
	cmpq	(%rcx), %rbx
	movq	-248(%rbp), %r12        ## 8-byte Reload
	jg	LBB63_270
	.p2align	4, 0x90
LBB63_266:                              ##   Parent Loop BB63_226 Depth=1
                                        ##     Parent Loop BB63_228 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	%r12, %rcx
	callq	__ZN8MARKOVLV8dSetPostEllld
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_269
## %bb.267:                             ##   in Loop: Header=BB63_266 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	jl	LBB63_266
## %bb.268:                             ##   in Loop: Header=BB63_228 Depth=2
	movb	$1, %al
LBB63_270:                              ##   in Loop: Header=BB63_228 Depth=2
	testb	%al, -296(%rbp)         ## 1-byte Folded Reload
	je	LBB63_272
	jmp	LBB63_271
	.p2align	4, 0x90
LBB63_244:                              ##   in Loop: Header=BB63_228 Depth=2
	xorl	%r14d, %r14d
	movq	%r12, -280(%rbp)        ## 8-byte Spill
	jmp	LBB63_245
LBB63_262:                              ##   in Loop: Header=BB63_245 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	leaq	-80(%rbp), %r15
	movq	-280(%rbp), %r12        ## 8-byte Reload
LBB63_263:                              ##   in Loop: Header=BB63_245 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %r14
LBB63_264:                              ##   in Loop: Header=BB63_245 Depth=3
	incq	%r14
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	leaq	1(%r13), %r13
	jge	LBB63_265
LBB63_245:                              ##   Parent Loop BB63_226 Depth=1
                                        ##     Parent Loop BB63_228 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB63_247 Depth 4
                                        ##         Child Loop BB63_258 Depth 4
                                        ##         Child Loop BB63_261 Depth 4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.66(%rip), %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	testq	%r12, %r12
	jle	LBB63_254
## %bb.246:                             ##   in Loop: Header=BB63_245 Depth=3
	xorl	%ebx, %ebx
	jmp	LBB63_247
	.p2align	4, 0x90
LBB63_253:                              ##   in Loop: Header=BB63_247 Depth=4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	je	LBB63_254
LBB63_247:                              ##   Parent Loop BB63_226 Depth=1
                                        ##     Parent Loop BB63_228 Depth=2
                                        ##       Parent Loop BB63_245 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movq	-144(%rbp,%rbx,8), %rdx
	movq	-208(%rbp,%rbx,8), %rcx
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r13, %rsi
	callq	__ZN8MARKOVLV8dSetPostEllld
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_249
## %bb.248:                             ##   in Loop: Header=BB63_247 Depth=4
	leaq	L_.str.1(%rip), %rcx
LBB63_249:                              ##   in Loop: Header=BB63_247 Depth=4
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_251
## %bb.250:                             ##   in Loop: Header=BB63_247 Depth=4
	movq	%rcx, %rax
LBB63_251:                              ##   in Loop: Header=BB63_247 Depth=4
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.3(%rip), %rsi
	cmovaq	%rsi, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	ja	LBB63_253
## %bb.252:                             ##   in Loop: Header=BB63_247 Depth=4
	movq	%rax, %rsi
	jmp	LBB63_253
	.p2align	4, 0x90
LBB63_254:                              ##   in Loop: Header=BB63_245 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	callq	_fwrite
	cmpq	$50, %r14
	jl	LBB63_264
## %bb.255:                             ##   in Loop: Header=BB63_245 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	je	LBB63_264
## %bb.256:                             ##   in Loop: Header=BB63_245 Depth=3
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.69(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_262
## %bb.257:                             ##   in Loop: Header=BB63_245 Depth=3
	xorl	%ebx, %ebx
	leaq	-80(%rbp), %r15
	movq	-280(%rbp), %r12        ## 8-byte Reload
	.p2align	4, 0x90
LBB63_258:                              ##   Parent Loop BB63_226 Depth=1
                                        ##     Parent Loop BB63_228 Depth=2
                                        ##       Parent Loop BB63_245 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_258
## %bb.259:                             ##   in Loop: Header=BB63_245 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_263
## %bb.260:                             ##   in Loop: Header=BB63_245 Depth=3
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_261:                              ##   Parent Loop BB63_226 Depth=1
                                        ##     Parent Loop BB63_228 Depth=2
                                        ##       Parent Loop BB63_245 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_261
	jmp	LBB63_263
LBB63_232:                              ##   in Loop: Header=BB63_228 Depth=2
	xorl	%r14d, %r14d
	testb	%r14b, -296(%rbp)       ## 1-byte Folded Reload
	jne	LBB63_234
LBB63_235:                              ##   in Loop: Header=BB63_228 Depth=2
	movq	-232(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp,%r12,8)
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -208(%rbp,%r12,8)
	cmpq	$6, %r12
	leaq	1(%r12), %r12
	movzbl	%r13b, %r13d
	movl	$0, %eax
	cmovgl	%eax, %r13d
	movq	-224(%rbp), %r14        ## 8-byte Reload
	jmp	LBB63_273
LBB63_269:                              ##   in Loop: Header=BB63_228 Depth=2
	xorl	%eax, %eax
	testb	%al, -296(%rbp)         ## 1-byte Folded Reload
	je	LBB63_272
LBB63_271:                              ##   in Loop: Header=BB63_228 Depth=2
	movq	%r12, %rcx
	xorl	%r12d, %r12d
	jmp	LBB63_273
LBB63_275:
	testq	%r12, %r12
	jle	LBB63_299
## %bb.276:
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.69(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.62(%rip), %rdi
	movl	$5, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	movq	%r14, %r13
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_277:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_277
## %bb.278:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.65(%rip), %rdi
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_279:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_279
## %bb.280:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r15
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	movq	%r13, %r14
	jle	LBB63_281
LBB63_298:
	leaq	L_.str.43(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.44(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
LBB63_299:
	leaq	L_.str.51(%rip), %rdi
	movl	$1, %ebx
	movl	$45, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movq	-240(%rbp), %rax        ## 8-byte Reload
	cmpq	$0, 256(%rax)
	jle	LBB63_361
## %bb.300:
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
	movb	$1, %cl
	leaq	L_.str.63(%rip), %r15
	leaq	-80(%rbp), %r12
	xorl	%r13d, %r13d
	jmp	LBB63_301
	.p2align	4, 0x90
LBB63_336:                              ##   in Loop: Header=BB63_301 Depth=1
	movq	-240(%rbp), %rdx        ## 8-byte Reload
	cmpq	256(%rdx), %rbx
	leaq	1(%rbx), %rbx
	jge	LBB63_337
LBB63_301:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_303 Depth 2
                                        ##       Child Loop BB63_307 Depth 3
                                        ##       Child Loop BB63_310 Depth 3
                                        ##       Child Loop BB63_314 Depth 3
                                        ##         Child Loop BB63_316 Depth 4
                                        ##         Child Loop BB63_327 Depth 4
                                        ##         Child Loop BB63_330 Depth 4
	testq	%rax, %rax
	jle	LBB63_336
## %bb.302:                             ##   in Loop: Header=BB63_301 Depth=1
	xorl	%esi, %esi
	movq	%rbx, -280(%rbp)        ## 8-byte Spill
	jmp	LBB63_303
	.p2align	4, 0x90
LBB63_334:                              ##   in Loop: Header=BB63_303 Depth=2
	movl	$1, %r13d
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	-280(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, -144(%rbp)
	movq	-248(%rbp), %rsi        ## 8-byte Reload
	movq	%rsi, -208(%rbp)
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
	movb	$1, %cl
	leaq	L_.str.63(%rip), %r15
	incq	%rsi
	cmpq	%rax, %rsi
	jge	LBB63_336
LBB63_303:                              ##   Parent Loop BB63_301 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB63_307 Depth 3
                                        ##       Child Loop BB63_310 Depth 3
                                        ##       Child Loop BB63_314 Depth 3
                                        ##         Child Loop BB63_316 Depth 4
                                        ##         Child Loop BB63_327 Depth 4
                                        ##         Child Loop BB63_330 Depth 4
	testb	$1, %cl
	jne	LBB63_304
## %bb.305:                             ##   in Loop: Header=BB63_303 Depth=2
	movq	%rsi, -248(%rbp)        ## 8-byte Spill
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.70(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$7, %esi
	movl	$1, %edx
	leaq	L_.str.71(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r13, %r13
	jle	LBB63_311
## %bb.306:                             ##   in Loop: Header=BB63_303 Depth=2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_307:                              ##   Parent Loop BB63_301 Depth=1
                                        ##     Parent Loop BB63_303 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	LBB63_307
## %bb.308:                             ##   in Loop: Header=BB63_303 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$6, %esi
	movl	$1, %edx
	leaq	L_.str.72(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r13, %r13
	jle	LBB63_312
## %bb.309:                             ##   in Loop: Header=BB63_303 Depth=2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_310:                              ##   Parent Loop BB63_301 Depth=1
                                        ##     Parent Loop BB63_303 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	LBB63_310
	jmp	LBB63_312
	.p2align	4, 0x90
LBB63_304:                              ##   in Loop: Header=BB63_303 Depth=2
	movq	%rbx, -144(%rbp,%r13,8)
	movq	%rsi, -208(%rbp,%r13,8)
	cmpq	$6, %r13
	leaq	1(%r13), %r13
	movzbl	%cl, %ecx
	movl	$0, %edx
	cmovgl	%edx, %ecx
	incq	%rsi
	cmpq	%rax, %rsi
	jl	LBB63_303
	jmp	LBB63_336
LBB63_311:                              ##   in Loop: Header=BB63_303 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$6, %esi
	movl	$1, %edx
	leaq	L_.str.72(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
LBB63_312:                              ##   in Loop: Header=BB63_303 Depth=2
	movq	%r13, -232(%rbp)        ## 8-byte Spill
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %r15
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r13
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	jg	LBB63_334
## %bb.313:                             ##   in Loop: Header=BB63_303 Depth=2
	xorl	%r14d, %r14d
	jmp	LBB63_314
LBB63_331:                              ##   in Loop: Header=BB63_314 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
LBB63_332:                              ##   in Loop: Header=BB63_314 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %r15
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %r14
	leaq	-80(%rbp), %r12
LBB63_333:                              ##   in Loop: Header=BB63_314 Depth=3
	incq	%r14
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	leaq	1(%r13), %r13
	jge	LBB63_334
LBB63_314:                              ##   Parent Loop BB63_301 Depth=1
                                        ##     Parent Loop BB63_303 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB63_316 Depth 4
                                        ##         Child Loop BB63_327 Depth 4
                                        ##         Child Loop BB63_330 Depth 4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.66(%rip), %rsi
	movq	%r13, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	cmpq	$0, -232(%rbp)          ## 8-byte Folded Reload
	jle	LBB63_323
## %bb.315:                             ##   in Loop: Header=BB63_314 Depth=3
	xorl	%ebx, %ebx
	jmp	LBB63_316
	.p2align	4, 0x90
LBB63_322:                              ##   in Loop: Header=BB63_316 Depth=4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, -232(%rbp)        ## 8-byte Folded Reload
	je	LBB63_323
LBB63_316:                              ##   Parent Loop BB63_301 Depth=1
                                        ##     Parent Loop BB63_303 Depth=2
                                        ##       Parent Loop BB63_314 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movq	-208(%rbp,%rbx,8), %rdx
	movq	-144(%rbp,%rbx,8), %rcx
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r13, %rsi
	callq	__ZN8MARKOVLV6dGetDKElll
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_318
## %bb.317:                             ##   in Loop: Header=BB63_316 Depth=4
	leaq	L_.str.1(%rip), %rcx
LBB63_318:                              ##   in Loop: Header=BB63_316 Depth=4
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_320
## %bb.319:                             ##   in Loop: Header=BB63_316 Depth=4
	movq	%rcx, %rax
LBB63_320:                              ##   in Loop: Header=BB63_316 Depth=4
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.3(%rip), %rsi
	cmovaq	%rsi, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	ja	LBB63_322
## %bb.321:                             ##   in Loop: Header=BB63_316 Depth=4
	movq	%rax, %rsi
	jmp	LBB63_322
	.p2align	4, 0x90
LBB63_323:                              ##   in Loop: Header=BB63_314 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	callq	_fwrite
	cmpq	$50, %r14
	jl	LBB63_333
## %bb.324:                             ##   in Loop: Header=BB63_314 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r13
	je	LBB63_333
## %bb.325:                             ##   in Loop: Header=BB63_314 Depth=3
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	cmpq	$0, -232(%rbp)          ## 8-byte Folded Reload
	jle	LBB63_331
## %bb.326:                             ##   in Loop: Header=BB63_314 Depth=3
	xorl	%ebx, %ebx
	movq	-232(%rbp), %r12        ## 8-byte Reload
	leaq	L_.str.63(%rip), %r15
	.p2align	4, 0x90
LBB63_327:                              ##   Parent Loop BB63_301 Depth=1
                                        ##     Parent Loop BB63_303 Depth=2
                                        ##       Parent Loop BB63_314 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_327
## %bb.328:                             ##   in Loop: Header=BB63_314 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r12, %r12
	jle	LBB63_332
## %bb.329:                             ##   in Loop: Header=BB63_314 Depth=3
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_330:                              ##   Parent Loop BB63_301 Depth=1
                                        ##     Parent Loop BB63_303 Depth=2
                                        ##       Parent Loop BB63_314 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_330
	jmp	LBB63_332
LBB63_337:
	testq	%r13, %r13
	jle	LBB63_361
## %bb.338:
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.71(%rip), %rdi
	movl	$7, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	leaq	-80(%rbp), %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_339:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	LBB63_339
## %bb.340:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.72(%rip), %rdi
	movl	$6, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r15
	leaq	-80(%rbp), %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_341:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r12, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	LBB63_341
## %bb.342:
	movq	%r13, -232(%rbp)        ## 8-byte Spill
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r15
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	jle	LBB63_343
LBB63_360:
	leaq	L_.str.43(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.44(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
LBB63_361:
	leaq	L_.str.52(%rip), %rdi
	movl	$34, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	264(%rax), %rcx
	testq	%rcx, %rcx
	jle	LBB63_437
## %bb.362:
	movl	-268(%rbp), %eax        ## 4-byte Reload
	xorb	$1, %al
	movl	%eax, -268(%rbp)        ## 4-byte Spill
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
	movb	$1, %r12b
	leaq	-80(%rbp), %r13
	xorl	%edx, %edx
	movq	%rdx, -232(%rbp)        ## 8-byte Spill
	xorl	%r15d, %r15d
	jmp	LBB63_363
	.p2align	4, 0x90
LBB63_411:                              ##   in Loop: Header=BB63_363 Depth=1
	movq	-240(%rbp), %rcx        ## 8-byte Reload
	movq	264(%rcx), %rcx
LBB63_412:                              ##   in Loop: Header=BB63_363 Depth=1
	movq	-232(%rbp), %rsi        ## 8-byte Reload
	incq	%rsi
	movq	%rsi, %rdx
	movq	%rsi, -232(%rbp)        ## 8-byte Spill
	cmpq	%rcx, %rsi
	jge	LBB63_413
LBB63_363:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_365 Depth 2
                                        ##       Child Loop BB63_368 Depth 3
                                        ##       Child Loop BB63_375 Depth 3
                                        ##       Child Loop BB63_378 Depth 3
                                        ##       Child Loop BB63_382 Depth 3
                                        ##         Child Loop BB63_384 Depth 4
                                        ##         Child Loop BB63_395 Depth 4
                                        ##         Child Loop BB63_398 Depth 4
                                        ##       Child Loop BB63_403 Depth 3
	testq	%rax, %rax
	jle	LBB63_412
## %bb.364:                             ##   in Loop: Header=BB63_363 Depth=1
	xorl	%eax, %eax
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	jmp	LBB63_365
	.p2align	4, 0x90
LBB63_409:                              ##   in Loop: Header=BB63_365 Depth=2
	movq	-232(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp)
	movq	%r15, -208(%rbp)
	movq	%r15, %rcx
	movl	$1, %r15d
LBB63_410:                              ##   in Loop: Header=BB63_365 Depth=2
	incq	%rcx
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rax
	movq	%rcx, %rdx
	movq	%rcx, -248(%rbp)        ## 8-byte Spill
	cmpq	%rax, %rcx
	jge	LBB63_411
LBB63_365:                              ##   Parent Loop BB63_363 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB63_368 Depth 3
                                        ##       Child Loop BB63_375 Depth 3
                                        ##       Child Loop BB63_378 Depth 3
                                        ##       Child Loop BB63_382 Depth 3
                                        ##         Child Loop BB63_384 Depth 4
                                        ##         Child Loop BB63_395 Depth 4
                                        ##         Child Loop BB63_398 Depth 4
                                        ##       Child Loop BB63_403 Depth 3
	testb	$1, %r12b
	jne	LBB63_366
## %bb.373:                             ##   in Loop: Header=BB63_365 Depth=2
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.73(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$7, %esi
	movl	$1, %edx
	leaq	L_.str.71(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r15, %r15
	jle	LBB63_379
## %bb.374:                             ##   in Loop: Header=BB63_365 Depth=2
	xorl	%ebx, %ebx
	leaq	L_.str.63(%rip), %r12
	.p2align	4, 0x90
LBB63_375:                              ##   Parent Loop BB63_363 Depth=1
                                        ##     Parent Loop BB63_365 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB63_375
## %bb.376:                             ##   in Loop: Header=BB63_365 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r15, %r15
	jle	LBB63_380
## %bb.377:                             ##   in Loop: Header=BB63_365 Depth=2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_378:                              ##   Parent Loop BB63_363 Depth=1
                                        ##     Parent Loop BB63_365 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	$3, %esi
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB63_378
	jmp	LBB63_380
	.p2align	4, 0x90
LBB63_366:                              ##   in Loop: Header=BB63_365 Depth=2
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r14b
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	jg	LBB63_370
	.p2align	4, 0x90
LBB63_368:                              ##   Parent Loop BB63_363 Depth=1
                                        ##     Parent Loop BB63_365 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	callq	__ZN8MARKOVLV6dGetCFElll
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_369
## %bb.367:                             ##   in Loop: Header=BB63_368 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	jl	LBB63_368
LBB63_370:                              ##   in Loop: Header=BB63_365 Depth=2
	testb	%r14b, -268(%rbp)       ## 1-byte Folded Reload
	je	LBB63_372
LBB63_371:                              ##   in Loop: Header=BB63_365 Depth=2
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	jmp	LBB63_410
LBB63_379:                              ##   in Loop: Header=BB63_365 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
LBB63_380:                              ##   in Loop: Header=BB63_365 Depth=2
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r12
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r12
	jle	LBB63_381
LBB63_402:                              ##   in Loop: Header=BB63_365 Depth=2
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rbx
	movb	$1, %r12b
	movb	$1, %al
	movq	-216(%rbp), %rcx        ## 8-byte Reload
	cmpq	(%rcx), %rbx
	movq	-248(%rbp), %r15        ## 8-byte Reload
	jg	LBB63_407
	.p2align	4, 0x90
LBB63_403:                              ##   Parent Loop BB63_363 Depth=1
                                        ##     Parent Loop BB63_365 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%rbx, %rsi
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	%r15, %rcx
	callq	__ZN8MARKOVLV6dGetCFElll
	andpd	LCPI63_0(%rip), %xmm0
	ucomisd	LCPI63_1(%rip), %xmm0
	ja	LBB63_406
## %bb.404:                             ##   in Loop: Header=BB63_403 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %rbx
	leaq	1(%rbx), %rbx
	jl	LBB63_403
## %bb.405:                             ##   in Loop: Header=BB63_365 Depth=2
	movb	$1, %al
LBB63_407:                              ##   in Loop: Header=BB63_365 Depth=2
	testb	%al, -268(%rbp)         ## 1-byte Folded Reload
	je	LBB63_409
	jmp	LBB63_408
	.p2align	4, 0x90
LBB63_381:                              ##   in Loop: Header=BB63_365 Depth=2
	xorl	%r14d, %r14d
	movq	%r15, -280(%rbp)        ## 8-byte Spill
	jmp	LBB63_382
LBB63_399:                              ##   in Loop: Header=BB63_382 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	leaq	-80(%rbp), %r13
	movq	-280(%rbp), %r15        ## 8-byte Reload
LBB63_400:                              ##   in Loop: Header=BB63_382 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %r14
LBB63_401:                              ##   in Loop: Header=BB63_382 Depth=3
	incq	%r14
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r12
	leaq	1(%r12), %r12
	jge	LBB63_402
LBB63_382:                              ##   Parent Loop BB63_363 Depth=1
                                        ##     Parent Loop BB63_365 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB63_384 Depth 4
                                        ##         Child Loop BB63_395 Depth 4
                                        ##         Child Loop BB63_398 Depth 4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.66(%rip), %rsi
	movq	%r12, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	testq	%r15, %r15
	jle	LBB63_391
## %bb.383:                             ##   in Loop: Header=BB63_382 Depth=3
	xorl	%ebx, %ebx
	jmp	LBB63_384
	.p2align	4, 0x90
LBB63_390:                              ##   in Loop: Header=BB63_384 Depth=4
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	je	LBB63_391
LBB63_384:                              ##   Parent Loop BB63_363 Depth=1
                                        ##     Parent Loop BB63_365 Depth=2
                                        ##       Parent Loop BB63_382 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movq	-144(%rbp,%rbx,8), %rdx
	movq	-208(%rbp,%rbx,8), %rcx
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r12, %rsi
	callq	__ZN8MARKOVLV6dGetCFElll
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_386
## %bb.385:                             ##   in Loop: Header=BB63_384 Depth=4
	leaq	L_.str.1(%rip), %rcx
LBB63_386:                              ##   in Loop: Header=BB63_384 Depth=4
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_388
## %bb.387:                             ##   in Loop: Header=BB63_384 Depth=4
	movq	%rcx, %rax
LBB63_388:                              ##   in Loop: Header=BB63_384 Depth=4
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.3(%rip), %rsi
	cmovaq	%rsi, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	ja	LBB63_390
## %bb.389:                             ##   in Loop: Header=BB63_384 Depth=4
	movq	%rax, %rsi
	jmp	LBB63_390
	.p2align	4, 0x90
LBB63_391:                              ##   in Loop: Header=BB63_382 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	callq	_fwrite
	cmpq	$50, %r14
	jl	LBB63_401
## %bb.392:                             ##   in Loop: Header=BB63_382 Depth=3
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r12
	je	LBB63_401
## %bb.393:                             ##   in Loop: Header=BB63_382 Depth=3
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r15, %r15
	jle	LBB63_399
## %bb.394:                             ##   in Loop: Header=BB63_382 Depth=3
	xorl	%ebx, %ebx
	leaq	-80(%rbp), %r13
	movq	-280(%rbp), %r15        ## 8-byte Reload
	.p2align	4, 0x90
LBB63_395:                              ##   Parent Loop BB63_363 Depth=1
                                        ##     Parent Loop BB63_365 Depth=2
                                        ##       Parent Loop BB63_382 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB63_395
## %bb.396:                             ##   in Loop: Header=BB63_382 Depth=3
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	testq	%r15, %r15
	jle	LBB63_400
## %bb.397:                             ##   in Loop: Header=BB63_382 Depth=3
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_398:                              ##   Parent Loop BB63_363 Depth=1
                                        ##     Parent Loop BB63_365 Depth=2
                                        ##       Parent Loop BB63_382 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	movq	%r13, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB63_398
	jmp	LBB63_400
LBB63_369:                              ##   in Loop: Header=BB63_365 Depth=2
	xorl	%r14d, %r14d
	testb	%r14b, -268(%rbp)       ## 1-byte Folded Reload
	jne	LBB63_371
LBB63_372:                              ##   in Loop: Header=BB63_365 Depth=2
	movq	-232(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp,%r15,8)
	movq	-248(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -208(%rbp,%r15,8)
	cmpq	$6, %r15
	leaq	1(%r15), %r15
	movzbl	%r12b, %r12d
	movl	$0, %eax
	cmovgl	%eax, %r12d
	movq	-224(%rbp), %r14        ## 8-byte Reload
	jmp	LBB63_410
LBB63_406:                              ##   in Loop: Header=BB63_365 Depth=2
	xorl	%eax, %eax
	testb	%al, -268(%rbp)         ## 1-byte Folded Reload
	je	LBB63_409
LBB63_408:                              ##   in Loop: Header=BB63_365 Depth=2
	movq	%r15, %rcx
	xorl	%r15d, %r15d
	jmp	LBB63_410
LBB63_413:
	testq	%r15, %r15
	jle	LBB63_437
## %bb.414:
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.62(%rip), %rdi
	movl	$5, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r12
	movq	%r14, %r13
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_415:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB63_415
## %bb.416:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.65(%rip), %rdi
	movl	$3, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	leaq	L_.str.63(%rip), %r12
	leaq	-80(%rbp), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_417:                              ## =>This Inner Loop Header: Depth=1
	movl	$3, %esi
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%r13, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB63_417
## %bb.418:
	leaq	L_.str.64(%rip), %rdi
	movl	$4, %esi
	movl	$1, %edx
	movq	%r13, %rcx
	callq	_fwrite
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %r12
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r12
	movq	%r13, %r14
	jle	LBB63_419
LBB63_436:
	leaq	L_.str.43(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.41(%rip), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.44(%rip), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	_fprintf
LBB63_437:
	cmpb	$0, -300(%rbp)          ## 1-byte Folded Reload
	je	LBB63_439
## %bb.438:
	leaq	L_.str.38(%rip), %rdi
	movl	$12, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
	leaq	L_.str.39(%rip), %rdi
	movl	$15, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	_fwrite
LBB63_439:
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movb	-281(%rbp), %cl         ## 1-byte Reload
	movb	%cl, 280(%rax)
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB63_441
## %bb.440:
	addq	$280, %rsp              ## imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB63_59:
	leaq	L_.str.3(%rip), %r13
	leaq	L_.str.63(%rip), %rbx
	xorl	%ecx, %ecx
	jmp	LBB63_60
	.p2align	4, 0x90
LBB63_75:                               ##   in Loop: Header=BB63_60 Depth=1
	incq	%rcx
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	leaq	1(%r15), %r15
	jge	LBB63_76
LBB63_60:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_61 Depth 2
                                        ##     Child Loop BB63_71 Depth 2
                                        ##     Child Loop BB63_73 Depth 2
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movq	%r14, %rdi
	leaq	L_.str.66(%rip), %rsi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	xorl	%r14d, %r14d
	jmp	LBB63_61
	.p2align	4, 0x90
LBB63_67:                               ##   in Loop: Header=BB63_61 Depth=2
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%r14
	cmpq	%r14, %r12
	je	LBB63_68
LBB63_61:                               ##   Parent Loop BB63_60 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-144(%rbp,%r14,8), %rdx
	movq	-208(%rbp,%r14,8), %rcx
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	callq	__ZN8MARKOVLV7dSetPijEllld
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_63
## %bb.62:                              ##   in Loop: Header=BB63_61 Depth=2
	leaq	L_.str.1(%rip), %rcx
LBB63_63:                               ##   in Loop: Header=BB63_61 Depth=2
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_65
## %bb.64:                              ##   in Loop: Header=BB63_61 Depth=2
	movq	%rcx, %rax
LBB63_65:                               ##   in Loop: Header=BB63_61 Depth=2
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	cmovaq	%r13, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	movq	%r13, %rsi
	ja	LBB63_67
## %bb.66:                              ##   in Loop: Header=BB63_61 Depth=2
	movq	%rax, %rsi
	jmp	LBB63_67
	.p2align	4, 0x90
LBB63_68:                               ##   in Loop: Header=BB63_60 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	cmpq	$50, %rcx
	jl	LBB63_75
## %bb.69:                              ##   in Loop: Header=BB63_60 Depth=1
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	je	LBB63_75
## %bb.70:                              ##   in Loop: Header=BB63_60 Depth=1
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_71:                               ##   Parent Loop BB63_60 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_71
## %bb.72:                              ##   in Loop: Header=BB63_60 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_73:                               ##   Parent Loop BB63_60 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_73
## %bb.74:                              ##   in Loop: Header=BB63_60 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %rcx
	leaq	L_.str.63(%rip), %rbx
	jmp	LBB63_75
LBB63_134:
	leaq	L_.str.3(%rip), %r13
	leaq	L_.str.63(%rip), %rbx
	xorl	%ecx, %ecx
	jmp	LBB63_135
	.p2align	4, 0x90
LBB63_150:                              ##   in Loop: Header=BB63_135 Depth=1
	incq	%rcx
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	leaq	1(%r15), %r15
	jge	LBB63_151
LBB63_135:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_136 Depth 2
                                        ##     Child Loop BB63_146 Depth 2
                                        ##     Child Loop BB63_148 Depth 2
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movq	%r14, %rdi
	leaq	L_.str.66(%rip), %rsi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	xorl	%r14d, %r14d
	jmp	LBB63_136
	.p2align	4, 0x90
LBB63_142:                              ##   in Loop: Header=BB63_136 Depth=2
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%r14
	cmpq	%r14, %r12
	je	LBB63_143
LBB63_136:                              ##   Parent Loop BB63_135 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-144(%rbp,%r14,8), %rdx
	movq	-208(%rbp,%r14,8), %rcx
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	callq	__ZN8MARKOVLV8dSetDiscEllld
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_138
## %bb.137:                             ##   in Loop: Header=BB63_136 Depth=2
	leaq	L_.str.1(%rip), %rcx
LBB63_138:                              ##   in Loop: Header=BB63_136 Depth=2
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_140
## %bb.139:                             ##   in Loop: Header=BB63_136 Depth=2
	movq	%rcx, %rax
LBB63_140:                              ##   in Loop: Header=BB63_136 Depth=2
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	cmovaq	%r13, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	movq	%r13, %rsi
	ja	LBB63_142
## %bb.141:                             ##   in Loop: Header=BB63_136 Depth=2
	movq	%rax, %rsi
	jmp	LBB63_142
	.p2align	4, 0x90
LBB63_143:                              ##   in Loop: Header=BB63_135 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	cmpq	$50, %rcx
	jl	LBB63_150
## %bb.144:                             ##   in Loop: Header=BB63_135 Depth=1
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	je	LBB63_150
## %bb.145:                             ##   in Loop: Header=BB63_135 Depth=1
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.67(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_146:                              ##   Parent Loop BB63_135 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_146
## %bb.147:                             ##   in Loop: Header=BB63_135 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_148:                              ##   Parent Loop BB63_135 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_148
## %bb.149:                             ##   in Loop: Header=BB63_135 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %rcx
	leaq	L_.str.63(%rip), %rbx
	jmp	LBB63_150
LBB63_206:
	leaq	L_.str.3(%rip), %r13
	leaq	L_.str.63(%rip), %rbx
	xorl	%ecx, %ecx
	jmp	LBB63_207
	.p2align	4, 0x90
LBB63_222:                              ##   in Loop: Header=BB63_207 Depth=1
	incq	%rcx
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	leaq	1(%r15), %r15
	jge	LBB63_223
LBB63_207:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_208 Depth 2
                                        ##     Child Loop BB63_218 Depth 2
                                        ##     Child Loop BB63_220 Depth 2
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movq	%r14, %rdi
	leaq	L_.str.66(%rip), %rsi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	xorl	%r14d, %r14d
	jmp	LBB63_208
	.p2align	4, 0x90
LBB63_214:                              ##   in Loop: Header=BB63_208 Depth=2
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%r14
	cmpq	%r14, %r12
	je	LBB63_215
LBB63_208:                              ##   Parent Loop BB63_207 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-144(%rbp,%r14,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	callq	__ZN8MARKOVLV7dSetPreEllld
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_210
## %bb.209:                             ##   in Loop: Header=BB63_208 Depth=2
	leaq	L_.str.1(%rip), %rcx
LBB63_210:                              ##   in Loop: Header=BB63_208 Depth=2
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_212
## %bb.211:                             ##   in Loop: Header=BB63_208 Depth=2
	movq	%rcx, %rax
LBB63_212:                              ##   in Loop: Header=BB63_208 Depth=2
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	cmovaq	%r13, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	movq	%r13, %rsi
	ja	LBB63_214
## %bb.213:                             ##   in Loop: Header=BB63_208 Depth=2
	movq	%rax, %rsi
	jmp	LBB63_214
	.p2align	4, 0x90
LBB63_215:                              ##   in Loop: Header=BB63_207 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	cmpq	$50, %rcx
	jl	LBB63_222
## %bb.216:                             ##   in Loop: Header=BB63_207 Depth=1
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	je	LBB63_222
## %bb.217:                             ##   in Loop: Header=BB63_207 Depth=1
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.68(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_218:                              ##   Parent Loop BB63_207 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_218
## %bb.219:                             ##   in Loop: Header=BB63_207 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_220:                              ##   Parent Loop BB63_207 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_220
## %bb.221:                             ##   in Loop: Header=BB63_207 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %rcx
	leaq	L_.str.63(%rip), %rbx
	jmp	LBB63_222
LBB63_281:
	leaq	L_.str.3(%rip), %r13
	leaq	L_.str.63(%rip), %rbx
	xorl	%ecx, %ecx
	jmp	LBB63_282
	.p2align	4, 0x90
LBB63_297:                              ##   in Loop: Header=BB63_282 Depth=1
	incq	%rcx
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	leaq	1(%r15), %r15
	jge	LBB63_298
LBB63_282:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_283 Depth 2
                                        ##     Child Loop BB63_293 Depth 2
                                        ##     Child Loop BB63_295 Depth 2
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movq	%r14, %rdi
	leaq	L_.str.66(%rip), %rsi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	xorl	%r14d, %r14d
	jmp	LBB63_283
	.p2align	4, 0x90
LBB63_289:                              ##   in Loop: Header=BB63_283 Depth=2
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%r14
	cmpq	%r14, %r12
	je	LBB63_290
LBB63_283:                              ##   Parent Loop BB63_282 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-144(%rbp,%r14,8), %rdx
	movq	-208(%rbp,%r14,8), %rcx
	xorpd	%xmm0, %xmm0
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	callq	__ZN8MARKOVLV8dSetPostEllld
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_285
## %bb.284:                             ##   in Loop: Header=BB63_283 Depth=2
	leaq	L_.str.1(%rip), %rcx
LBB63_285:                              ##   in Loop: Header=BB63_283 Depth=2
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_287
## %bb.286:                             ##   in Loop: Header=BB63_283 Depth=2
	movq	%rcx, %rax
LBB63_287:                              ##   in Loop: Header=BB63_283 Depth=2
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	cmovaq	%r13, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	movq	%r13, %rsi
	ja	LBB63_289
## %bb.288:                             ##   in Loop: Header=BB63_283 Depth=2
	movq	%rax, %rsi
	jmp	LBB63_289
	.p2align	4, 0x90
LBB63_290:                              ##   in Loop: Header=BB63_282 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	cmpq	$50, %rcx
	jl	LBB63_297
## %bb.291:                             ##   in Loop: Header=BB63_282 Depth=1
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	je	LBB63_297
## %bb.292:                             ##   in Loop: Header=BB63_282 Depth=1
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.69(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_293:                              ##   Parent Loop BB63_282 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_293
## %bb.294:                             ##   in Loop: Header=BB63_282 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_295:                              ##   Parent Loop BB63_282 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_295
## %bb.296:                             ##   in Loop: Header=BB63_282 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %rcx
	leaq	L_.str.63(%rip), %rbx
	jmp	LBB63_297
LBB63_343:
	leaq	L_.str.3(%rip), %r13
	leaq	L_.str.63(%rip), %r12
	xorl	%r14d, %r14d
	jmp	LBB63_344
	.p2align	4, 0x90
LBB63_359:                              ##   in Loop: Header=BB63_344 Depth=1
	incq	%r14
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	leaq	1(%r15), %r15
	jge	LBB63_360
LBB63_344:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_345 Depth 2
                                        ##     Child Loop BB63_355 Depth 2
                                        ##     Child Loop BB63_357 Depth 2
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.66(%rip), %rsi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	xorl	%ebx, %ebx
	jmp	LBB63_345
	.p2align	4, 0x90
LBB63_351:                              ##   in Loop: Header=BB63_345 Depth=2
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, -232(%rbp)        ## 8-byte Folded Reload
	je	LBB63_352
LBB63_345:                              ##   Parent Loop BB63_344 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-208(%rbp,%rbx,8), %rdx
	movq	-144(%rbp,%rbx,8), %rcx
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	callq	__ZN8MARKOVLV6dGetDKElll
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_347
## %bb.346:                             ##   in Loop: Header=BB63_345 Depth=2
	leaq	L_.str.1(%rip), %rcx
LBB63_347:                              ##   in Loop: Header=BB63_345 Depth=2
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_349
## %bb.348:                             ##   in Loop: Header=BB63_345 Depth=2
	movq	%rcx, %rax
LBB63_349:                              ##   in Loop: Header=BB63_345 Depth=2
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	cmovaq	%r13, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	movq	%r13, %rsi
	ja	LBB63_351
## %bb.350:                             ##   in Loop: Header=BB63_345 Depth=2
	movq	%rax, %rsi
	jmp	LBB63_351
	.p2align	4, 0x90
LBB63_352:                              ##   in Loop: Header=BB63_344 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	callq	_fwrite
	cmpq	$50, %r14
	jl	LBB63_359
## %bb.353:                             ##   in Loop: Header=BB63_344 Depth=1
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r15
	je	LBB63_359
## %bb.354:                             ##   in Loop: Header=BB63_344 Depth=1
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	movq	-232(%rbp), %r12        ## 8-byte Reload
	.p2align	4, 0x90
LBB63_355:                              ##   Parent Loop BB63_344 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_355
## %bb.356:                             ##   in Loop: Header=BB63_344 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_357:                              ##   Parent Loop BB63_344 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r12
	jne	LBB63_357
## %bb.358:                             ##   in Loop: Header=BB63_344 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %r14
	leaq	L_.str.63(%rip), %r12
	jmp	LBB63_359
LBB63_419:
	leaq	L_.str.3(%rip), %r13
	leaq	L_.str.63(%rip), %rbx
	xorl	%ecx, %ecx
	jmp	LBB63_420
	.p2align	4, 0x90
LBB63_435:                              ##   in Loop: Header=BB63_420 Depth=1
	incq	%rcx
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r12
	leaq	1(%r12), %r12
	jge	LBB63_436
LBB63_420:                              ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_421 Depth 2
                                        ##     Child Loop BB63_431 Depth 2
                                        ##     Child Loop BB63_433 Depth 2
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movq	%r14, %rdi
	leaq	L_.str.66(%rip), %rsi
	movq	%r12, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	xorl	%r14d, %r14d
	jmp	LBB63_421
	.p2align	4, 0x90
LBB63_427:                              ##   in Loop: Header=BB63_421 Depth=2
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	movb	$1, %al
	callq	_fprintf
	incq	%r14
	cmpq	%r14, %r15
	je	LBB63_428
LBB63_421:                              ##   Parent Loop BB63_420 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-144(%rbp,%r14,8), %rdx
	movq	-208(%rbp,%r14,8), %rcx
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	movq	%r12, %rsi
	callq	__ZN8MARKOVLV6dGetCFElll
	movsd	LCPI63_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	leaq	L_.str.2(%rip), %rcx
	ja	LBB63_423
## %bb.422:                             ##   in Loop: Header=BB63_421 Depth=2
	leaq	L_.str.1(%rip), %rcx
LBB63_423:                              ##   in Loop: Header=BB63_421 Depth=2
	ucomisd	LCPI63_3(%rip), %xmm0
	leaq	L_.str.2(%rip), %rax
	ja	LBB63_425
## %bb.424:                             ##   in Loop: Header=BB63_421 Depth=2
	movq	%rcx, %rax
LBB63_425:                              ##   in Loop: Header=BB63_421 Depth=2
	movsd	LCPI63_4(%rip), %xmm1   ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	cmovaq	%r13, %rax
	ucomisd	LCPI63_5(%rip), %xmm0
	movq	%r13, %rsi
	ja	LBB63_427
## %bb.426:                             ##   in Loop: Header=BB63_421 Depth=2
	movq	%rax, %rsi
	jmp	LBB63_427
	.p2align	4, 0x90
LBB63_428:                              ##   in Loop: Header=BB63_420 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	-224(%rbp), %r14        ## 8-byte Reload
	movq	%r14, %rcx
	callq	_fwrite
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	cmpq	$50, %rcx
	jl	LBB63_435
## %bb.429:                             ##   in Loop: Header=BB63_420 Depth=1
	movq	-216(%rbp), %rax        ## 8-byte Reload
	cmpq	(%rax), %r12
	je	LBB63_435
## %bb.430:                             ##   in Loop: Header=BB63_420 Depth=1
	movl	$21, %esi
	movl	$1, %edx
	leaq	L_.str.43(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$20, %esi
	movl	$1, %edx
	leaq	L_.str.41(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.44(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%r14, %rdi
	leaq	L_.str.40(%rip), %rsi
	leaq	L_.str.60(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$20, %esi
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	%r14, %rdi
	leaq	L_.str.42(%rip), %rsi
	leaq	L_.str.61(%rip), %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$5, %esi
	movl	$1, %edx
	leaq	L_.str.62(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_431:                              ##   Parent Loop BB63_420 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-144(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB63_431
## %bb.432:                             ##   in Loop: Header=BB63_420 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.65(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB63_433:                              ##   Parent Loop BB63_420 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$3, %esi
	movl	$1, %edx
	leaq	L_.str.63(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	-208(%rbp,%rbx,8), %rdx
	movq	%r14, %rdi
	leaq	-80(%rbp), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB63_433
## %bb.434:                             ##   in Loop: Header=BB63_420 Depth=1
	movl	$4, %esi
	movl	$1, %edx
	leaq	L_.str.64(%rip), %rdi
	movq	%r14, %rcx
	callq	_fwrite
	movq	$-1, %rcx
	leaq	L_.str.63(%rip), %rbx
	jmp	LBB63_435
LBB63_441:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%% This is omarkov V2.00 - Michael Koller 2011 \n"

	.section	__DATA,__data
	.globl	_strPrgVersionStatic    ## @strPrgVersionStatic
	.p2align	3
_strPrgVersionStatic:
	.quad	L_.str

	.p2align	3               ## @_ZZ4ran2PlE5idum2
__ZZ4ran2PlE5idum2:
	.quad	123456789               ## 0x75bcd15

.zerofill __DATA,__bss,__ZZ4ran2PlE2iy,8,3 ## @_ZZ4ran2PlE2iy
.zerofill __DATA,__bss,__ZZ4ran2PlE2iv,256,4 ## @_ZZ4ran2PlE2iv
	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	" & %10.6f"

L_.str.2:                               ## @.str.2
	.asciz	" & %10.3f"

L_.str.3:                               ## @.str.3
	.asciz	" & %10.1f"

L_.str.4:                               ## @.str.4
	.asciz	"w"

L_.str.6:                               ## @.str.6
	.asciz	"\\documentclass[11pt,a4paper]{article} \n"

L_.str.7:                               ## @.str.7
	.asciz	"\\typeout{================================================================}\n"

L_.str.8:                               ## @.str.8
	.asciz	"%%================================================================\n"

L_.str.9:                               ## @.str.9
	.asciz	"%%\\usepackage{cl2emono}\n"

L_.str.10:                              ## @.str.10
	.asciz	"%%\\usepackage{mkfoot}\n"

L_.str.11:                              ## @.str.11
	.asciz	"\\usepackage[T1]{fontenc}%%\n"

L_.str.12:                              ## @.str.12
	.asciz	"\\usepackage[ansinew]{inputenc,}%%\n"

L_.str.13:                              ## @.str.13
	.asciz	"\\usepackage{a4}%%\n"

L_.str.14:                              ## @.str.14
	.asciz	"\\usepackage{makeidx,multind,mathcomp}\n"

L_.str.15:                              ## @.str.15
	.asciz	"\\usepackage{enumerate}%%\n"

L_.str.16:                              ## @.str.16
	.asciz	"\\usepackage{color}%%\n"

L_.str.17:                              ## @.str.17
	.asciz	"\\usepackage{amsfonts,amsmath,amssymb,amsthm,txfonts} %%%% txfonts hinzugef\\{u}gt 2.12.2002\n"

L_.str.18:                              ## @.str.18
	.asciz	"\\usepackage{supertabular}%%\n"

L_.str.19:                              ## @.str.19
	.asciz	"\\usepackage[pdftex]{graphicx}\n"

L_.str.20:                              ## @.str.20
	.asciz	"\\usepackage[pdftex,\n"

L_.str.21:                              ## @.str.21
	.asciz	"            colorlinks=true,            %% Schrift von Links in Farbe (true), sonst mit Rahmen (false)\n"

L_.str.22:                              ## @.str.22
	.asciz	"            bookmarksnumbered=true,     %% Lesezeichen im pdf mit Nummerierung\n"

L_.str.23:                              ## @.str.23
	.asciz	"            bookmarksopen=true,         %% Oeffnet die Lesezeichen vom pdf beim Start\n"

L_.str.24:                              ## @.str.24
	.asciz	"            bookmarksopenlevel=0,       %% Default ist maxdim\n"

L_.str.25:                              ## @.str.25
	.asciz	"            pdfstartview=FitH,          %% startet mit Seitenbreite\n"

L_.str.26:                              ## @.str.26
	.asciz	"            linkcolor=blue,             %% Standard 'red'\n"

L_.str.27:                              ## @.str.27
	.asciz	"            citecolor=blue,             %% Standard 'green'\n"

L_.str.28:                              ## @.str.28
	.asciz	"            urlcolor=cyan,              %% Standard 'cyan'\n"

L_.str.29:                              ## @.str.29
	.asciz	"            filecolor=blue,             %%\n"

L_.str.30:                              ## @.str.30
	.asciz	"            plainpages=false,pdfpagelabels]{hyperref} %%\n"

L_.str.31:                              ## @.str.31
	.asciz	"%%%%================================================================\n"

L_.str.32:                              ## @.str.32
	.asciz	"\\parindent 0mm\n"

L_.str.33:                              ## @.str.33
	.asciz	"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n"

L_.str.34:                              ## @.str.34
	.asciz	"%% Document generated by OMARKOV.cpp \n"

L_.str.35:                              ## @.str.35
	.asciz	"\\begin{document}\n"

L_.str.36:                              ## @.str.36
	.asciz	"\\begin{small} \n"

L_.str.38:                              ## @.str.38
	.asciz	"\\end{small}\n"

L_.str.39:                              ## @.str.39
	.asciz	"\\end{document}\n"

L_.str.40:                              ## @.str.40
	.asciz	"%% ---------- Start Tabular  %s ---------- \n"

L_.str.41:                              ## @.str.41
	.asciz	"\\par \\bigskip      \n"

L_.str.42:                              ## @.str.42
	.asciz	"\\begin{tabular}{%s} \n"

L_.str.43:                              ## @.str.43
	.asciz	"\\end{tabular}       \n"

L_.str.44:                              ## @.str.44
	.asciz	"%% ---------- End Tabular ---------- \n"

L_.str.45:                              ## @.str.45
	.asciz	"\\section{%s} \n"

L_.str.46:                              ## @.str.46
	.asciz	"\\subsection{General} \n"

L_.str.47:                              ## @.str.47
	.asciz	"\\newpage \\subsection{Probabilites} \n"

L_.str.48:                              ## @.str.48
	.asciz	"\\newpage \\subsection{Technical Interest} \n"

L_.str.49:                              ## @.str.49
	.asciz	"\\newpage \\subsection{Prenummerando Benefits} \n"

L_.str.50:                              ## @.str.50
	.asciz	"\\newpage \\subsection{Postnummerando Benefits} \n"

L_.str.51:                              ## @.str.51
	.asciz	"\\newpage \\subsection{Mathematical Reserves} \n"

L_.str.52:                              ## @.str.52
	.asciz	"\\newpage \\subsection{Cash Flows} \n"

	.p2align	4               ## @__const._ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb.pcTableEntryL
L___const._ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb.pcTableEntryL:
	.asciz	"\\makebox[1.5cm][r]{%ld}"

L_.str.53:                              ## @.str.53
	.asciz	"General"

L_.str.54:                              ## @.str.54
	.asciz	"ll"

L_.str.55:                              ## @.str.55
	.asciz	"Max. Time  & %ld \\\\ \n"

L_.str.56:                              ## @.str.56
	.asciz	"Nr States  & %ld \\\\ \n"

L_.str.57:                              ## @.str.57
	.asciz	"Start Time & %ld \\\\ \n"

L_.str.58:                              ## @.str.58
	.asciz	"Stop Time  & %ld \\\\ \n"

L_.str.59:                              ## @.str.59
	.asciz	"Prg Version  & %s \\\\ \n"

L_.str.60:                              ## @.str.60
	.asciz	"Prob."

L_.str.61:                              ## @.str.61
	.asciz	"lrrrrrrrr"

L_.str.62:                              ## @.str.62
	.asciz	"From "

L_.str.63:                              ## @.str.63
	.asciz	" & "

L_.str.64:                              ## @.str.64
	.asciz	"\\\\ \n"

L_.str.65:                              ## @.str.65
	.asciz	"To "

L_.str.66:                              ## @.str.66
	.asciz	"%ld "

L_.str.67:                              ## @.str.67
	.asciz	"Disc."

L_.str.68:                              ## @.str.68
	.asciz	"Pre"

L_.str.69:                              ## @.str.69
	.asciz	"Post"

L_.str.70:                              ## @.str.70
	.asciz	"MR."

L_.str.71:                              ## @.str.71
	.asciz	"Moment "

L_.str.72:                              ## @.str.72
	.asciz	"State "

L_.str.73:                              ## @.str.73
	.asciz	"From"

L_str:                                  ## @str
	.asciz	"\n Could not open FILE"

.subsections_via_symbols
