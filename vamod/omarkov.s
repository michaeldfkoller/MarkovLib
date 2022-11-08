	.text
	.align 4,0x90
.globl __Z4ran2Pl
__Z4ran2Pl:
LFB21:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	movq	(%rdi), %rcx
	leaq	__ZZ4ran2PlE2iv(%rip), %r10
	testq	%rcx, %rcx
	jle	L28
L2:
	movabsq	$-7183739866224372601, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	addq	%rcx, %rdx
	sarq	$15, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	imulq	$53668, %rdx, %rax
	subq	%rax, %rcx
	imulq	$40014, %rcx, %rsi
	imulq	$12211, %rdx, %rdx
	subq	%rdx, %rsi
	movq	%rsi, (%rdi)
	testq	%rsi, %rsi
	js	L29
L14:
	movq	__ZZ4ran2PlE5idum2(%rip), %rcx
	movabsq	$5726900650010560005, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$14, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	imulq	$52774, %rdx, %rax
	subq	%rax, %rcx
	imulq	$40692, %rcx, %rcx
	imulq	$3791, %rdx, %rdx
	subq	%rdx, %rcx
	movq	%rcx, __ZZ4ran2PlE5idum2(%rip)
	testq	%rcx, %rcx
	js	L30
L16:
	movq	__ZZ4ran2PlE2iy(%rip), %rdi
	movabsq	$-9223371761976860671, %rdx
	movq	%rdi, %rax
	imulq	%rdx
	addq	%rdi, %rdx
	sarq	$25, %rdx
	sarq	$63, %rdi
	subl	%edi, %edx
	movslq	%edx,%rdx
	movq	(%r10,%rdx,8), %rax
	subq	%rcx, %rax
	movq	%rax, __ZZ4ran2PlE2iy(%rip)
	movq	%rsi, (%r10,%rdx,8)
	testq	%rax, %rax
	jle	L31
L18:
	cvtsi2sdq	__ZZ4ran2PlE2iy(%rip), %xmm0
	mulsd	LC0(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm1
	cvtss2sd	%xmm1, %xmm0
	ucomisd	LC1(%rip), %xmm0
	ja	L32
	movaps	%xmm1, %xmm0
	leave
	ret
L32:
	movss	LC2(%rip), %xmm1
	movaps	%xmm1, %xmm0
	leave
	ret
L31:
	addq	$2147483562, %rax
	movq	%rax, __ZZ4ran2PlE2iy(%rip)
	jmp	L18
L30:
	addq	$2147483399, %rcx
	movq	%rcx, __ZZ4ran2PlE5idum2(%rip)
	jmp	L16
L29:
	addq	$2147483563, %rsi
	movq	%rsi, (%rdi)
	jmp	L14
L28:
	negq	%rcx
	je	L33
	movq	%rcx, (%rdi)
L6:
	movq	%rcx, __ZZ4ran2PlE5idum2(%rip)
	leaq	__ZZ4ran2PlE2iv(%rip), %r10
	movq	%r10, %r8
	movl	$39, %esi
	movabsq	$-7183739866224372601, %r9
	jmp	L7
	.align 4,0x90
L35:
	movq	%rax, %rcx
L10:
	cmpl	$31, %esi
	jg	L11
	movq	%rax, 312(%r8)
L11:
	decl	%esi
	subq	$8, %r8
	cmpl	$-1, %esi
	je	L34
L7:
	movq	%rcx, %rax
	imulq	%r9
	addq	%rcx, %rdx
	sarq	$15, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	imulq	$53668, %rdx, %rax
	subq	%rax, %rcx
	imulq	$40014, %rcx, %rax
	imulq	$12211, %rdx, %rdx
	subq	%rdx, %rax
	jns	L35
	leaq	2147483563(%rax), %rcx
	movq	%rcx, %rax
	jmp	L10
L33:
	movq	$1, (%rdi)
	movl	$1, %ecx
	jmp	L6
L34:
	movq	%rcx, (%rdi)
	movq	__ZZ4ran2PlE2iv(%rip), %rax
	movq	%rax, __ZZ4ran2PlE2iy(%rip)
	jmp	L2
LFE21:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_VECTOR9dSetValueEld
__ZN9LV_VECTOR9dSetValueEld:
LFB30:
	pushq	%rbp
LCFI2:
	movq	%rsp, %rbp
LCFI3:
	testq	%rsi, %rsi
	js	L37
	cmpq	24(%rdi), %rsi
	jge	L37
	movq	32(%rdi), %rax
	movsd	%xmm0, (%rax,%rsi,8)
	movq	32(%rdi), %rax
	movsd	(%rax,%rsi,8), %xmm0
	leave
	ret
	.align 4,0x90
L37:
	subsd	LC3(%rip), %xmm0
	leave
	ret
LFE30:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_VECTOR9dAddValueEld
__ZN9LV_VECTOR9dAddValueEld:
LFB31:
	pushq	%rbp
LCFI4:
	movq	%rsp, %rbp
LCFI5:
	testq	%rsi, %rsi
	js	L43
	cmpq	24(%rdi), %rsi
	jge	L43
	leaq	0(,%rsi,8), %rax
	addq	32(%rdi), %rax
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movq	32(%rdi), %rax
	movsd	(%rax,%rsi,8), %xmm0
	leave
	ret
	.align 4,0x90
L43:
	xorpd	%xmm0, %xmm0
	leave
	ret
LFE31:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_VECTOR9dGetValueEl
__ZN9LV_VECTOR9dGetValueEl:
LFB32:
	pushq	%rbp
LCFI6:
	movq	%rsp, %rbp
LCFI7:
	testq	%rsi, %rsi
	js	L49
	cmpq	24(%rdi), %rsi
	jge	L49
	movq	32(%rdi), %rax
	movsd	(%rax,%rsi,8), %xmm0
	leave
	ret
	.align 4,0x90
L49:
	xorpd	%xmm0, %xmm0
	leave
	ret
LFE32:
	.align 1,0x90
	.align 4,0x90
.globl __ZN10ILV_VECTOR9lSetValueEll
__ZN10ILV_VECTOR9lSetValueEll:
LFB40:
	pushq	%rbp
LCFI8:
	movq	%rsp, %rbp
LCFI9:
	testq	%rsi, %rsi
	js	L55
	cmpq	24(%rdi), %rsi
	jge	L55
	movq	32(%rdi), %rax
	movq	%rdx, (%rax,%rsi,8)
	movq	32(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	leave
	ret
	.align 4,0x90
L55:
	leaq	-1(%rdx), %rax
	leave
	ret
LFE40:
	.align 1,0x90
	.align 4,0x90
.globl __ZN10ILV_VECTOR9lAddValueEll
__ZN10ILV_VECTOR9lAddValueEll:
LFB41:
	pushq	%rbp
LCFI10:
	movq	%rsp, %rbp
LCFI11:
	testq	%rsi, %rsi
	js	L61
	cmpq	24(%rdi), %rsi
	jge	L61
	leaq	0(,%rsi,8), %rax
	addq	32(%rdi), %rax
	addq	%rdx, (%rax)
	movq	32(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	leave
	ret
	.align 4,0x90
L61:
	xorl	%eax, %eax
	leave
	ret
LFE41:
	.align 1,0x90
	.align 4,0x90
.globl __ZN10ILV_VECTOR9lGetValueEl
__ZN10ILV_VECTOR9lGetValueEl:
LFB42:
	pushq	%rbp
LCFI12:
	movq	%rsp, %rbp
LCFI13:
	testq	%rsi, %rsi
	js	L67
	cmpq	24(%rdi), %rsi
	jge	L67
	movq	32(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	leave
	ret
	.align 4,0x90
L67:
	xorl	%eax, %eax
	leave
	ret
LFE42:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIX9dSetValueElld
__ZN9LV_MATRIX9dSetValueElld:
LFB50:
	pushq	%rbp
LCFI14:
	movq	%rsp, %rbp
LCFI15:
	testq	%rsi, %rsi
	js	L73
	cmpq	%rsi, 8(%rdi)
	jle	L73
	testq	%rdx, %rdx
	js	L73
	cmpq	16(%rdi), %rdx
	jge	L73
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	%xmm0, (%rax,%rdx,8)
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%rdx,8), %xmm0
	leave
	ret
	.align 4,0x90
L73:
	subsd	LC3(%rip), %xmm0
	leave
	ret
LFE50:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIX9dAddValueElld
__ZN9LV_MATRIX9dAddValueElld:
LFB51:
	pushq	%rbp
LCFI16:
	movq	%rsp, %rbp
LCFI17:
	movq	%rdx, %rcx
	testq	%rsi, %rsi
	js	L80
	cmpq	%rsi, 8(%rdi)
	jle	L80
	testq	%rdx, %rdx
	js	L80
	cmpq	16(%rdi), %rdx
	jge	L80
	leaq	0(,%rdx,8), %rax
	movq	40(%rdi), %rdx
	addq	(%rdx,%rsi,8), %rax
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%rcx,8), %xmm0
	leave
	ret
	.align 4,0x90
L80:
	xorpd	%xmm0, %xmm0
	leave
	ret
LFE51:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIX14dMultiplyValueElld
__ZN9LV_MATRIX14dMultiplyValueElld:
LFB52:
	pushq	%rbp
LCFI18:
	movq	%rsp, %rbp
LCFI19:
	movq	%rdx, %rcx
	testq	%rsi, %rsi
	js	L87
	cmpq	%rsi, 8(%rdi)
	jle	L87
	testq	%rdx, %rdx
	js	L87
	cmpq	16(%rdi), %rdx
	jge	L87
	leaq	0(,%rdx,8), %rax
	movq	40(%rdi), %rdx
	addq	(%rdx,%rsi,8), %rax
	mulsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%rcx,8), %xmm0
	leave
	ret
	.align 4,0x90
L87:
	xorpd	%xmm0, %xmm0
	leave
	ret
LFE52:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIX9dGetValueEll
__ZN9LV_MATRIX9dGetValueEll:
LFB53:
	pushq	%rbp
LCFI20:
	movq	%rsp, %rbp
LCFI21:
	testq	%rsi, %rsi
	js	L94
	cmpq	%rsi, 8(%rdi)
	jle	L94
	testq	%rdx, %rdx
	js	L94
	cmpq	16(%rdi), %rdx
	jge	L94
	movq	40(%rdi), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%rdx,8), %xmm0
	leave
	ret
	.align 4,0x90
L94:
	xorpd	%xmm0, %xmm0
	leave
	ret
LFE53:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV11vSetGetDataEb
__ZN8MARKOVLV11vSetGetDataEb:
LFB65:
	pushq	%rbp
LCFI22:
	movq	%rsp, %rbp
LCFI23:
	movb	%sil, 280(%rdi)
	leave
	ret
LFE65:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV11lGetMaxTimeEv
__ZN8MARKOVLV11lGetMaxTimeEv:
LFB74:
	pushq	%rbp
LCFI24:
	movq	%rsp, %rbp
LCFI25:
	movq	32(%rdi), %rax
	leave
	ret
LFE74:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV12lGetNrStatesEv
__ZN8MARKOVLV12lGetNrStatesEv:
LFB75:
	pushq	%rbp
LCFI26:
	movq	%rsp, %rbp
LCFI27:
	movq	64(%rdi), %rax
	leave
	ret
LFE75:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV13lGetStartTimeEv
__ZN8MARKOVLV13lGetStartTimeEv:
LFB76:
	pushq	%rbp
LCFI28:
	movq	%rsp, %rbp
LCFI29:
	movq	48(%rdi), %rax
	leave
	ret
LFE76:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV12lGetStopTimeEv
__ZN8MARKOVLV12lGetStopTimeEv:
LFB77:
	pushq	%rbp
LCFI30:
	movq	%rsp, %rbp
LCFI31:
	movq	56(%rdi), %rax
	leave
	ret
LFE77:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV16lSetFolgezustandEll
__ZN8MARKOVLV16lSetFolgezustandEll:
LFB81:
	pushq	%rbp
LCFI32:
	movq	%rsp, %rbp
LCFI33:
	cmpb	$0, 280(%rdi)
	jne	L115
	leaq	0(,%rsi,8), %rcx
	movq	248(%rdi), %rax
	movq	%rdx, (%rax,%rcx)
	movq	$0, 272(%rdi)
L113:
	movq	248(%rdi), %rax
	movq	(%rax,%rcx), %rax
	leave
	ret
	.align 4,0x90
L115:
	leaq	0(,%rsi,8), %rcx
	jmp	L113
LFE81:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV13vSetInitStateEl
__ZN8MARKOVLV13vSetInitStateEl:
LFB82:
	pushq	%rbp
LCFI34:
	movq	%rsp, %rbp
LCFI35:
	movq	%rsi, 328(%rdi)
	leave
	ret
LFE82:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV8vNewSeedEl
__ZN8MARKOVLV8vNewSeedEl:
LFB89:
	pushq	%rbp
LCFI36:
	movq	%rsp, %rbp
LCFI37:
	movq	%rsi, 8(%rdi)
	leave
	ret
LFE89:
	.cstring
LC7:
	.ascii " & %10.1f\0"
LC10:
	.ascii " & %10.3f\0"
LC11:
	.ascii " & %10.6f\0"
	.text
	.align 4,0x90
.globl __Z15vPrintTexNumberP7__sFILEd
__Z15vPrintTexNumberP7__sFILEd:
LFB22:
	pushq	%rbp
LCFI38:
	movq	%rsp, %rbp
LCFI39:
	ucomisd	LC5(%rip), %xmm0
	ja	L121
	ucomisd	LC6(%rip), %xmm0
	jb	L131
L123:
	ucomisd	LC8(%rip), %xmm0
	ja	L125
	ucomisd	LC9(%rip), %xmm0
	jae	L127
	jp	L127
L125:
	leaq	LC10(%rip), %rsi
	movl	$1, %eax
	leave
	jmp	_fprintf
	.align 4,0x90
L131:
	jp	L123
L121:
	leaq	LC7(%rip), %rsi
	movl	$1, %eax
	leave
	jmp	_fprintf
L127:
	leaq	LC11(%rip), %rsi
	movl	$1, %eax
	leave
	jmp	_fprintf
LFE22:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIXD1Ev
__ZN9LV_MATRIXD1Ev:
LFB48:
	pushq	%rbp
LCFI40:
	movq	%rsp, %rbp
LCFI41:
	pushq	%rbx
LCFI42:
	subq	$8, %rsp
LCFI43:
	movq	%rdi, %rbx
	movq	32(%rdi), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	addq	$8, %rsp
	popq	%rbx
	leave
	jmp	__ZdlPv
LFE48:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIXD2Ev
__ZN9LV_MATRIXD2Ev:
LFB47:
	pushq	%rbp
LCFI44:
	movq	%rsp, %rbp
LCFI45:
	pushq	%rbx
LCFI46:
	subq	$8, %rsp
LCFI47:
	movq	%rdi, %rbx
	movq	32(%rdi), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	addq	$8, %rsp
	popq	%rbx
	leave
	jmp	__ZdlPv
LFE47:
	.align 1,0x90
	.align 4,0x90
.globl __ZN10ILV_VECTORD1Ev
__ZN10ILV_VECTORD1Ev:
LFB38:
	pushq	%rbp
LCFI48:
	movq	%rsp, %rbp
LCFI49:
	movq	32(%rdi), %rdi
	leave
	jmp	__ZdlPv
LFE38:
	.align 1,0x90
	.align 4,0x90
.globl __ZN10ILV_VECTORD2Ev
__ZN10ILV_VECTORD2Ev:
LFB37:
	pushq	%rbp
LCFI50:
	movq	%rsp, %rbp
LCFI51:
	movq	32(%rdi), %rdi
	leave
	jmp	__ZdlPv
LFE37:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_VECTORD1Ev
__ZN9LV_VECTORD1Ev:
LFB28:
	pushq	%rbp
LCFI52:
	movq	%rsp, %rbp
LCFI53:
	movq	32(%rdi), %rdi
	leave
	jmp	__ZdlPv
LFE28:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_VECTORD2Ev
__ZN9LV_VECTORD2Ev:
LFB27:
	pushq	%rbp
LCFI54:
	movq	%rsp, %rbp
LCFI55:
	movq	32(%rdi), %rdi
	leave
	jmp	__ZdlPv
LFE27:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLVC2Elll
__ZN8MARKOVLVC2Elll:
LFB55:
	pushq	%rbp
LCFI56:
	movq	%rsp, %rbp
LCFI57:
	pushq	%rbx
LCFI58:
	subq	$8, %rsp
LCFI59:
	movq	%rdi, %rbx
	movq	%rsi, 32(%rdi)
	movq	%rdx, 40(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 56(%rdi)
	movq	$0, 64(%rdi)
	movq	%rcx, 72(%rdi)
	movq	$0, 80(%rdi)
	movq	$0, 88(%rdi)
	movq	$0, 96(%rdi)
	movq	$0, 104(%rdi)
	movq	$0, 112(%rdi)
	movq	$0, 120(%rdi)
	movb	$0, (%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	0(,%rdx,8), %rdi
	call	__Znam
	movq	%rax, 128(%rbx)
	movq	40(%rbx), %rax
	testq	%rax, %rax
	jle	L151
	xorl	%edx, %edx
	.align 4,0x90
L153:
	movq	128(%rbx), %rax
	movq	$0, (%rax,%rdx,8)
	incq	%rdx
	movq	40(%rbx), %rax
	cmpq	%rdx, %rax
	jg	L153
L151:
	leaq	0(,%rax,8), %rdi
	call	__Znam
	movq	%rax, 136(%rbx)
	movq	40(%rbx), %rdi
	imulq	%rdi, %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, %rsi
	movq	40(%rbx), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	jle	L154
	xorl	%ecx, %ecx
	.align 4,0x90
L156:
	movq	$0, (%rsi,%rcx,8)
	incq	%rcx
	movq	40(%rbx), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rcx, %rax
	jg	L156
L154:
	xorl	%ecx, %ecx
	testq	%rdx, %rdx
	jle	L191
	.align 4,0x90
L160:
	movq	136(%rbx), %rax
	movq	%rsi, (%rax,%rcx,8)
	movq	40(%rbx), %rax
	leaq	0(,%rax,8), %rdi
	addq	%rdi, %rsi
	incq	%rcx
	cmpq	%rcx, %rax
	jg	L160
L159:
	call	__Znam
	movq	%rax, 144(%rbx)
	movq	40(%rbx), %rdi
	imulq	%rdi, %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, %rsi
	movq	40(%rbx), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	jle	L161
	xorl	%ecx, %ecx
	.align 4,0x90
L163:
	movq	$0, (%rsi,%rcx,8)
	incq	%rcx
	movq	40(%rbx), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rcx, %rax
	jg	L163
L161:
	xorl	%ecx, %ecx
	testq	%rdx, %rdx
	jle	L192
	.align 4,0x90
L167:
	movq	144(%rbx), %rax
	movq	%rsi, (%rax,%rcx,8)
	movq	40(%rbx), %rax
	leaq	0(,%rax,8), %rdi
	addq	%rdi, %rsi
	incq	%rcx
	cmpq	%rcx, %rax
	jg	L167
L166:
	call	__Znam
	movq	%rax, 152(%rbx)
	movq	40(%rbx), %rdi
	imulq	%rdi, %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, %rsi
	movq	40(%rbx), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	jle	L168
	xorl	%ecx, %ecx
	.align 4,0x90
L170:
	movq	$0, (%rsi,%rcx,8)
	incq	%rcx
	movq	40(%rbx), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rcx, %rax
	jg	L170
L168:
	xorl	%ecx, %ecx
	testq	%rdx, %rdx
	jle	L193
	.align 4,0x90
L174:
	movq	152(%rbx), %rax
	movq	%rsi, (%rax,%rcx,8)
	movq	40(%rbx), %rax
	leaq	0(,%rax,8), %rdi
	addq	%rdi, %rsi
	incq	%rcx
	cmpq	%rcx, %rax
	jg	L174
L173:
	call	__Znam
	movq	%rax, 240(%rbx)
	cmpq	$0, 40(%rbx)
	jle	L175
	xorl	%edx, %edx
	.align 4,0x90
L177:
	movq	240(%rbx), %rax
	movq	$0, (%rax,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 40(%rbx)
	jg	L177
L175:
	movq	$0, 256(%rbx)
	movq	$0, 264(%rbx)
	movb	$0, 280(%rbx)
	movb	$0, 281(%rbx)
	movq	$0, 160(%rbx)
	movq	$0, 168(%rbx)
	movq	$0, 176(%rbx)
	movq	$0, 184(%rbx)
	movq	$0, 192(%rbx)
	movq	$0, 200(%rbx)
	movq	$0, 208(%rbx)
	movq	$0, 216(%rbx)
	movq	$0, 224(%rbx)
	movq	$0, 232(%rbx)
	movq	$0, 272(%rbx)
	movq	40(%rbx), %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, 248(%rbx)
	cmpq	$0, 40(%rbx)
	jle	L178
	xorl	%edx, %edx
	.align 4,0x90
L180:
	movq	248(%rbx), %rax
	movq	%rdx, (%rax,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 40(%rbx)
	jg	L180
L178:
	movq	$0, 288(%rbx)
	movq	$0, 312(%rbx)
	movq	$0, 296(%rbx)
	movq	$0, 304(%rbx)
	movq	$1234567, 8(%rbx)
	movq	$0, 328(%rbx)
	movq	$0, 320(%rbx)
	movq	$0, 336(%rbx)
	movq	$0, 344(%rbx)
	addq	$8, %rsp
	popq	%rbx
	leave
	ret
L191:
	leaq	0(,%rdx,8), %rdi
	jmp	L159
L192:
	leaq	0(,%rdx,8), %rdi
	jmp	L166
L193:
	leaq	0(,%rdx,8), %rdi
	jmp	L173
LFE55:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLVC1Elll
__ZN8MARKOVLVC1Elll:
LFB56:
	pushq	%rbp
LCFI60:
	movq	%rsp, %rbp
LCFI61:
	leave
	jmp	__ZN8MARKOVLVC2Elll
LFE56:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIX6vResetEv
__ZN9LV_MATRIX6vResetEv:
LFB49:
	pushq	%rbp
LCFI62:
	movq	%rsp, %rbp
LCFI63:
	movq	16(%rdi), %rdx
	imulq	8(%rdi), %rdx
	salq	$3, %rdx
	movq	32(%rdi), %rdi
	xorl	%esi, %esi
	leave
	jmp	_memset
LFE49:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIXC1Elll
__ZN9LV_MATRIXC1Elll:
LFB45:
	pushq	%rbp
LCFI64:
	movq	%rsp, %rbp
LCFI65:
	pushq	%r14
LCFI66:
	pushq	%r13
LCFI67:
	pushq	%r12
LCFI68:
	pushq	%rbx
LCFI69:
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %r13
	movq	%rcx, %r14
	movq	%rdx, %rdi
	imulq	%rsi, %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, 32(%rbx)
	leaq	0(,%r12,8), %rdi
	call	__Znam
	movq	%rax, 40(%rbx)
	movq	32(%rbx), %rdi
	movq	%rdi, %rdx
	testq	%r12, %r12
	jle	L199
	leaq	0(,%r13,8), %rsi
	xorl	%ecx, %ecx
	.align 4,0x90
L201:
	movq	40(%rbx), %rax
	movq	%rdx, (%rax,%rcx,8)
	addq	%rsi, %rdx
	incq	%rcx
	cmpq	%r12, %rcx
	jne	L201
	movq	32(%rbx), %rdi
L199:
	movq	%r12, 8(%rbx)
	movq	%r13, 16(%rbx)
	movq	%r14, 24(%rbx)
	movq	$0, (%rbx)
	imulq	%r12, %r13
	leaq	0(,%r13,8), %rdx
	xorl	%esi, %esi
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	leave
	jmp	_memset
LFE45:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_MATRIXC2Elll
__ZN9LV_MATRIXC2Elll:
LFB44:
	pushq	%rbp
LCFI70:
	movq	%rsp, %rbp
LCFI71:
	pushq	%r14
LCFI72:
	pushq	%r13
LCFI73:
	pushq	%r12
LCFI74:
	pushq	%rbx
LCFI75:
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %r13
	movq	%rcx, %r14
	movq	%rdx, %rdi
	imulq	%rsi, %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, 32(%rbx)
	leaq	0(,%r12,8), %rdi
	call	__Znam
	movq	%rax, 40(%rbx)
	movq	32(%rbx), %rdi
	movq	%rdi, %rdx
	testq	%r12, %r12
	jle	L206
	leaq	0(,%r13,8), %rsi
	xorl	%ecx, %ecx
	.align 4,0x90
L208:
	movq	40(%rbx), %rax
	movq	%rdx, (%rax,%rcx,8)
	addq	%rsi, %rdx
	incq	%rcx
	cmpq	%r12, %rcx
	jne	L208
	movq	32(%rbx), %rdi
L206:
	movq	%r12, 8(%rbx)
	movq	%r13, 16(%rbx)
	movq	%r14, 24(%rbx)
	movq	$0, (%rbx)
	imulq	%r12, %r13
	leaq	0(,%r13,8), %rdx
	xorl	%esi, %esi
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	leave
	jmp	_memset
LFE44:
	.align 1,0x90
	.align 4,0x90
.globl __ZN10ILV_VECTOR6vResetEv
__ZN10ILV_VECTOR6vResetEv:
LFB39:
	pushq	%rbp
LCFI76:
	movq	%rsp, %rbp
LCFI77:
	movq	24(%rdi), %rdx
	salq	$3, %rdx
	movq	32(%rdi), %rdi
	xorl	%esi, %esi
	leave
	jmp	_memset
LFE39:
	.align 1,0x90
	.align 4,0x90
.globl __ZN10ILV_VECTORC1Elll
__ZN10ILV_VECTORC1Elll:
LFB35:
	pushq	%rbp
LCFI78:
	movq	%rsp, %rbp
LCFI79:
	movq	%rbx, -24(%rbp)
LCFI80:
	movq	%r12, -16(%rbp)
LCFI81:
	movq	%r13, -8(%rbp)
LCFI82:
	subq	$32, %rsp
LCFI83:
	movq	%rdi, %rbx
	movq	%rdx, %r12
	movq	%rcx, %r13
	movq	%rsi, 24(%rdi)
	leaq	0(,%rsi,8), %rdi
	call	__Znam
	movq	%rax, %rdi
	movq	%rax, 32(%rbx)
	movq	%r12, 8(%rbx)
	movq	%r13, 16(%rbx)
	movq	$0, (%rbx)
	movq	24(%rbx), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	movq	-24(%rbp), %rbx
	movq	-16(%rbp), %r12
	movq	-8(%rbp), %r13
	leave
	jmp	_memset
LFE35:
	.align 1,0x90
	.align 4,0x90
.globl __ZN10ILV_VECTORC2Elll
__ZN10ILV_VECTORC2Elll:
LFB34:
	pushq	%rbp
LCFI84:
	movq	%rsp, %rbp
LCFI85:
	movq	%rbx, -24(%rbp)
LCFI86:
	movq	%r12, -16(%rbp)
LCFI87:
	movq	%r13, -8(%rbp)
LCFI88:
	subq	$32, %rsp
LCFI89:
	movq	%rdi, %rbx
	movq	%rdx, %r12
	movq	%rcx, %r13
	movq	%rsi, 24(%rdi)
	leaq	0(,%rsi,8), %rdi
	call	__Znam
	movq	%rax, %rdi
	movq	%rax, 32(%rbx)
	movq	%r12, 8(%rbx)
	movq	%r13, 16(%rbx)
	movq	$0, (%rbx)
	movq	24(%rbx), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	movq	-24(%rbp), %rbx
	movq	-16(%rbp), %r12
	movq	-8(%rbp), %r13
	leave
	jmp	_memset
LFE34:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_VECTOR6vResetEv
__ZN9LV_VECTOR6vResetEv:
LFB29:
	pushq	%rbp
LCFI90:
	movq	%rsp, %rbp
LCFI91:
	movq	24(%rdi), %rdx
	salq	$3, %rdx
	movq	32(%rdi), %rdi
	xorl	%esi, %esi
	leave
	jmp	_memset
LFE29:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_VECTORC1Elll
__ZN9LV_VECTORC1Elll:
LFB25:
	pushq	%rbp
LCFI92:
	movq	%rsp, %rbp
LCFI93:
	movq	%rbx, -24(%rbp)
LCFI94:
	movq	%r12, -16(%rbp)
LCFI95:
	movq	%r13, -8(%rbp)
LCFI96:
	subq	$32, %rsp
LCFI97:
	movq	%rdi, %rbx
	movq	%rdx, %r12
	movq	%rcx, %r13
	movq	%rsi, 24(%rdi)
	leaq	0(,%rsi,8), %rdi
	call	__Znam
	movq	%rax, %rdi
	movq	%rax, 32(%rbx)
	movq	%r12, 8(%rbx)
	movq	%r13, 16(%rbx)
	movq	$0, (%rbx)
	movq	24(%rbx), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	movq	-24(%rbp), %rbx
	movq	-16(%rbp), %r12
	movq	-8(%rbp), %r13
	leave
	jmp	_memset
LFE25:
	.align 1,0x90
	.align 4,0x90
.globl __ZN9LV_VECTORC2Elll
__ZN9LV_VECTORC2Elll:
LFB24:
	pushq	%rbp
LCFI98:
	movq	%rsp, %rbp
LCFI99:
	movq	%rbx, -24(%rbp)
LCFI100:
	movq	%r12, -16(%rbp)
LCFI101:
	movq	%r13, -8(%rbp)
LCFI102:
	subq	$32, %rsp
LCFI103:
	movq	%rdi, %rbx
	movq	%rdx, %r12
	movq	%rcx, %r13
	movq	%rsi, 24(%rdi)
	leaq	0(,%rsi,8), %rdi
	call	__Znam
	movq	%rax, %rdi
	movq	%rax, 32(%rbx)
	movq	%r12, 8(%rbx)
	movq	%r13, 16(%rbx)
	movq	$0, (%rbx)
	movq	24(%rbx), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	movq	-24(%rbp), %rbx
	movq	-16(%rbp), %r12
	movq	-8(%rbp), %r13
	leave
	jmp	_memset
LFE24:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV10dGetRandDKEll
__ZN8MARKOVLV10dGetRandDKEll:
LFB86:
	pushq	%rbp
LCFI104:
	movq	%rsp, %rbp
LCFI105:
	movq	304(%rdi), %rax
	testq	%rax, %rax
	je	L232
	testq	%rsi, %rsi
	js	L228
	cmpq	24(%rax), %rsi
	jge	L228
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0
	leave
	ret
	.align 4,0x90
L228:
	xorpd	%xmm0, %xmm0
	leave
	ret
	.align 4,0x90
L232:
	movsd	LC12(%rip), %xmm0
	leave
	ret
LFE86:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV10dGetRandCFEl
__ZN8MARKOVLV10dGetRandCFEl:
LFB85:
	pushq	%rbp
LCFI106:
	movq	%rsp, %rbp
LCFI107:
	movq	296(%rdi), %rax
	testq	%rax, %rax
	je	L241
	testq	%rsi, %rsi
	js	L237
	cmpq	24(%rax), %rsi
	jge	L237
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0
	leave
	ret
	.align 4,0x90
L237:
	xorpd	%xmm0, %xmm0
	leave
	ret
	.align 4,0x90
L241:
	movsd	LC12(%rip), %xmm0
	leave
	ret
LFE85:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV8dGetRegPEll
__ZN8MARKOVLV8dGetRegPEll:
LFB80:
	pushq	%rbp
LCFI108:
	movq	%rsp, %rbp
LCFI109:
	salq	$3, %rdx
	movq	248(%rdi), %rax
	movq	(%rax,%rdx), %rcx
	movq	128(%rdi), %rax
	movq	(%rax,%rdx), %rax
	testq	%rax, %rax
	je	L246
	testq	%rsi, %rsi
	js	L246
	cmpq	24(%rax), %rsi
	jl	L255
L246:
	xorpd	%xmm2, %xmm2
L245:
	movq	136(%rdi), %rax
	movq	(%rax,%rdx), %rax
	movq	(%rax,%rcx,8), %rax
	testq	%rsi, %rsi
	js	L249
	cmpq	24(%rax), %rsi
	jge	L249
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0
	movapd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	cmpneqsd	LC4(%rip), %xmm0
	andpd	%xmm0, %xmm1
	andnpd	%xmm2, %xmm0
	movapd	%xmm0, %xmm2
	orpd	%xmm1, %xmm2
L249:
	movapd	%xmm2, %xmm0
	leave
	ret
	.align 4,0x90
L255:
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm2
	jmp	L245
LFE80:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV9vGetStateEl
__ZN8MARKOVLV9vGetStateEl:
LFB84:
	pushq	%rbp
LCFI110:
	movq	%rsp, %rbp
LCFI111:
	movq	288(%rdi), %rdx
	movq	$-1, %rax
	testq	%rdx, %rdx
	je	L259
	testq	%rsi, %rsi
	js	L260
	cmpq	24(%rdx), %rsi
	jge	L260
	movq	32(%rdx), %rax
	movq	(%rax,%rsi,8), %rax
L259:
	leave
	ret
	.align 4,0x90
L260:
	xorl	%eax, %eax
	leave
	ret
LFE84:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV13vSetStartTimeEl
__ZN8MARKOVLV13vSetStartTimeEl:
LFB62:
	pushq	%rbp
LCFI112:
	movq	%rsp, %rbp
LCFI113:
	pushq	%r12
LCFI114:
	pushq	%rbx
LCFI115:
	movq	%rdi, %r12
	xorl	%eax, %eax
	testq	%rsi, %rsi
	cmovns	%rsi, %rax
	movq	%rax, 48(%rdi)
	movq	32(%rdi), %rax
	cmpq	%rax, %rsi
	jl	L267
	decq	%rax
	movq	%rax, 48(%rdi)
L267:
	movq	256(%r12), %rax
	testq	%rax, %rax
	jle	L269
	negq	%rax
	movq	%rax, 256(%r12)
L269:
	movq	112(%r12), %rbx
	testq	%rbx, %rbx
	je	L271
	.align 4,0x90
L278:
	movq	16(%rbx), %rdx
	imulq	8(%rbx), %rdx
	salq	$3, %rdx
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	call	_memset
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	L278
L271:
	movq	264(%r12), %rax
	testq	%rax, %rax
	jle	L273
	negq	%rax
	movq	%rax, 264(%r12)
L273:
	movq	120(%r12), %rbx
	testq	%rbx, %rbx
	je	L277
	.align 4,0x90
L279:
	movq	16(%rbx), %rdx
	imulq	8(%rbx), %rdx
	salq	$3, %rdx
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	call	_memset
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	L279
L277:
	popq	%rbx
	popq	%r12
	leave
	ret
LFE62:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV12vSetStopTimeEl
__ZN8MARKOVLV12vSetStopTimeEl:
LFB63:
	pushq	%rbp
LCFI116:
	movq	%rsp, %rbp
LCFI117:
	pushq	%r12
LCFI118:
	pushq	%rbx
LCFI119:
	movq	%rdi, %r12
	xorl	%eax, %eax
	testq	%rsi, %rsi
	cmovns	%rsi, %rax
	movq	%rax, 56(%rdi)
	movq	32(%rdi), %rax
	cmpq	%rax, %rsi
	jl	L285
	decq	%rax
	movq	%rax, 56(%rdi)
L285:
	movq	256(%r12), %rax
	testq	%rax, %rax
	jle	L287
	negq	%rax
	movq	%rax, 256(%r12)
L287:
	movq	112(%r12), %rbx
	testq	%rbx, %rbx
	je	L289
	.align 4,0x90
L296:
	movq	16(%rbx), %rdx
	imulq	8(%rbx), %rdx
	salq	$3, %rdx
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	call	_memset
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	L296
L289:
	movq	264(%r12), %rax
	testq	%rax, %rax
	jle	L291
	negq	%rax
	movq	%rax, 264(%r12)
L291:
	movq	120(%r12), %rbx
	testq	%rbx, %rbx
	je	L295
	.align 4,0x90
L297:
	movq	16(%rbx), %rdx
	imulq	8(%rbx), %rdx
	salq	$3, %rdx
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	call	_memset
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	L297
L295:
	popq	%rbx
	popq	%r12
	leave
	ret
LFE63:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV6vResetEv
__ZN8MARKOVLV6vResetEv:
LFB60:
	pushq	%rbp
LCFI120:
	movq	%rsp, %rbp
LCFI121:
	pushq	%r13
LCFI122:
	pushq	%r12
LCFI123:
	pushq	%rbx
LCFI124:
	subq	$8, %rsp
LCFI125:
	movq	%rdi, %r12
	movq	$0, 256(%rdi)
	movq	$0, 264(%rdi)
	movb	$0, (%rdi)
	movq	80(%rdi), %rbx
	testq	%rbx, %rbx
	jne	L336
	jmp	L301
	.align 4,0x90
L343:
	movq	%r13, %rbx
L336:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L343
L301:
	movq	88(%r12), %rbx
	testq	%rbx, %rbx
	jne	L337
	jmp	L304
	.align 4,0x90
L344:
	movq	%r13, %rbx
L337:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L344
L304:
	movq	96(%r12), %rbx
	testq	%rbx, %rbx
	jne	L338
	jmp	L307
	.align 4,0x90
L345:
	movq	%r13, %rbx
L338:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L345
L307:
	movq	104(%r12), %rbx
	testq	%rbx, %rbx
	jne	L339
	jmp	L310
	.align 4,0x90
L346:
	movq	%r13, %rbx
L339:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L346
L310:
	movq	112(%r12), %rbx
	testq	%rbx, %rbx
	jne	L340
	jmp	L313
	.align 4,0x90
L347:
	movq	%r13, %rbx
L340:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L347
L313:
	movq	120(%r12), %rbx
	testq	%rbx, %rbx
	jne	L341
	jmp	L316
	.align 4,0x90
L348:
	movq	%r13, %rbx
L341:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L348
L316:
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	jle	L319
	xorl	%ecx, %ecx
	.align 4,0x90
L321:
	leaq	0(,%rcx,8), %rdx
	movq	136(%r12), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rdx)
	movq	144(%r12), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rdx)
	movq	152(%r12), %rax
	movq	(%rax), %rax
	movq	$0, (%rax,%rdx)
	incq	%rcx
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rcx, %rax
	jg	L321
L319:
	testq	%rdx, %rdx
	jle	L322
	xorl	%edx, %edx
	.align 4,0x90
L324:
	movq	128(%r12), %rax
	movq	$0, (%rax,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 40(%r12)
	jg	L324
L322:
	movq	$0, 80(%r12)
	movq	$0, 88(%r12)
	movq	$0, 96(%r12)
	movq	$0, 104(%r12)
	movq	$0, 112(%r12)
	movq	$0, 120(%r12)
	movq	$0, 160(%r12)
	movq	$0, 168(%r12)
	movq	$0, 176(%r12)
	movq	$0, 184(%r12)
	movq	$0, 192(%r12)
	movq	$0, 200(%r12)
	movq	$0, 208(%r12)
	movq	$0, 216(%r12)
	movq	$0, 224(%r12)
	movq	$0, 232(%r12)
	cmpq	$0, 40(%r12)
	jle	L331
	xorl	%edx, %edx
	.align 4,0x90
L327:
	movq	240(%r12), %rax
	movq	$0, (%rax,%rdx,8)
	incq	%rdx
	movq	40(%r12), %rax
	cmpq	%rdx, %rax
	jg	L327
	testq	%rax, %rax
	jle	L331
	xorl	%edx, %edx
	.align 4,0x90
L330:
	movq	248(%r12), %rax
	movq	%rdx, (%rax,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 40(%r12)
	jg	L330
L331:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	leave
	ret
LFE60:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV17vSetInterestModelEb
__ZN8MARKOVLV17vSetInterestModelEb:
LFB70:
	pushq	%rbp
LCFI126:
	movq	%rsp, %rbp
LCFI127:
	movq	%rbx, -16(%rbp)
LCFI128:
	movq	%r12, -8(%rbp)
LCFI129:
	subq	$16, %rsp
LCFI130:
	movq	%rdi, %rbx
	movl	%esi, %r12d
	cmpb	%sil, 281(%rdi)
	je	L350
	call	__ZN8MARKOVLV6vResetEv
L350:
	movb	%r12b, 281(%rbx)
	movq	(%rsp), %rbx
	movq	8(%rsp), %r12
	leave
	ret
LFE70:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLVD2Ev
__ZN8MARKOVLVD2Ev:
LFB58:
	pushq	%rbp
LCFI131:
	movq	%rsp, %rbp
LCFI132:
	pushq	%r13
LCFI133:
	pushq	%r12
LCFI134:
	pushq	%rbx
LCFI135:
	subq	$8, %rsp
LCFI136:
	movq	%rdi, %r13
	movq	80(%rdi), %rbx
	testq	%rbx, %rbx
	jne	L390
	jmp	L354
	.align 4,0x90
L396:
	movq	%r12, %rbx
L390:
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r12, %r12
	jne	L396
L354:
	movq	88(%r13), %rbx
	testq	%rbx, %rbx
	jne	L391
	jmp	L357
	.align 4,0x90
L397:
	movq	%r12, %rbx
L391:
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r12, %r12
	jne	L397
L357:
	movq	96(%r13), %rbx
	testq	%rbx, %rbx
	jne	L392
	jmp	L360
	.align 4,0x90
L398:
	movq	%r12, %rbx
L392:
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r12, %r12
	jne	L398
L360:
	movq	104(%r13), %rbx
	testq	%rbx, %rbx
	jne	L393
	jmp	L363
	.align 4,0x90
L399:
	movq	%r12, %rbx
L393:
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r12, %r12
	jne	L399
L363:
	movq	112(%r13), %rbx
	testq	%rbx, %rbx
	jne	L394
	jmp	L366
	.align 4,0x90
L400:
	movq	%r12, %rbx
L394:
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r12, %r12
	jne	L400
L366:
	movq	120(%r13), %rbx
	testq	%rbx, %rbx
	jne	L395
	jmp	L369
	.align 4,0x90
L401:
	movq	%r12, %rbx
L395:
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r12, %r12
	jne	L401
L369:
	movq	136(%r13), %rax
	movq	(%rax), %rdi
	call	__ZdlPv
	movq	144(%r13), %rax
	movq	(%rax), %rdi
	call	__ZdlPv
	movq	152(%r13), %rax
	movq	(%rax), %rdi
	call	__ZdlPv
	movq	136(%r13), %rdi
	call	__ZdlPv
	movq	144(%r13), %rdi
	call	__ZdlPv
	movq	152(%r13), %rdi
	call	__ZdlPv
	movq	128(%r13), %rdi
	call	__ZdlPv
	movq	240(%r13), %rdi
	call	__ZdlPv
	movq	248(%r13), %rdi
	call	__ZdlPv
	movq	288(%r13), %rbx
	testq	%rbx, %rbx
	je	L372
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L372:
	movq	296(%r13), %rbx
	testq	%rbx, %rbx
	je	L374
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L374:
	movq	304(%r13), %rbx
	testq	%rbx, %rbx
	je	L376
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L376:
	movq	336(%r13), %rbx
	testq	%rbx, %rbx
	je	L378
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L378:
	movq	344(%r13), %rbx
	testq	%rbx, %rbx
	je	L380
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L380:
	movq	312(%r13), %rbx
	testq	%rbx, %rbx
	je	L382
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L382:
	movq	16(%r13), %rdi
	testq	%rdi, %rdi
	je	L384
	call	__ZdlPv
L384:
	movq	24(%r13), %rdi
	testq	%rdi, %rdi
	je	L386
	call	__ZdlPv
L386:
	movq	$0, 320(%r13)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	leave
	ret
LFE58:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLVD1Ev
__ZN8MARKOVLVD1Ev:
LFB59:
	pushq	%rbp
LCFI137:
	movq	%rsp, %rbp
LCFI138:
	leave
	jmp	__ZN8MARKOVLVD2Ev
LFE59:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV17vResetMeanResultsEv
__ZN8MARKOVLV17vResetMeanResultsEv:
LFB90:
	pushq	%rbp
LCFI139:
	movq	%rsp, %rbp
LCFI140:
	pushq	%r12
LCFI141:
	pushq	%rbx
LCFI142:
	movq	%rdi, %r12
	movq	288(%rdi), %rbx
	testq	%rbx, %rbx
	je	L405
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L405:
	movq	$0, 288(%r12)
	movq	296(%r12), %rbx
	testq	%rbx, %rbx
	je	L407
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L407:
	movq	$0, 296(%r12)
	movq	304(%r12), %rbx
	testq	%rbx, %rbx
	je	L409
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L409:
	movq	$0, 304(%r12)
	movq	336(%r12), %rbx
	testq	%rbx, %rbx
	je	L411
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L411:
	movq	$0, 336(%r12)
	movq	344(%r12), %rbx
	testq	%rbx, %rbx
	je	L413
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L413:
	movq	$0, 344(%r12)
	movq	312(%r12), %rbx
	testq	%rbx, %rbx
	je	L415
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L415:
	movq	$0, 312(%r12)
	movq	$0, 320(%r12)
	popq	%rbx
	popq	%r12
	leave
	ret
LFE90:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV20vSetDefaultNrMomentsEl
__ZN8MARKOVLV20vSetDefaultNrMomentsEl:
LFB71:
	pushq	%rbp
LCFI143:
	movq	%rsp, %rbp
LCFI144:
	pushq	%r14
LCFI145:
	pushq	%r13
LCFI146:
	pushq	%r12
LCFI147:
	pushq	%rbx
LCFI148:
	movq	%rdi, %r12
	movq	%rsi, %r14
	movq	112(%rdi), %rbx
	testq	%rbx, %rbx
	jne	L430
	jmp	L419
	.align 4,0x90
L432:
	movq	%r13, %rbx
L430:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L432
L419:
	movq	120(%r12), %rbx
	testq	%rbx, %rbx
	jne	L431
	jmp	L422
	.align 4,0x90
L433:
	movq	%r13, %rbx
L431:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L433
L422:
	movq	$0, 160(%r12)
	movq	$0, 168(%r12)
	movq	$0, 176(%r12)
	movq	$0, 184(%r12)
	movq	$0, 192(%r12)
	movq	$0, 200(%r12)
	movq	$0, 208(%r12)
	movq	$0, 216(%r12)
	movq	$0, 224(%r12)
	movq	$0, 232(%r12)
	cmpq	$0, 40(%r12)
	jle	L425
	xorl	%edx, %edx
	.align 4,0x90
L427:
	movq	240(%r12), %rax
	movq	$0, (%rax,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 40(%r12)
	jg	L427
L425:
	movq	$0, 256(%r12)
	movq	$0, 264(%r12)
	movq	%r14, 72(%r12)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	leave
	ret
LFE71:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV12vSetNrStatesEl
__ZN8MARKOVLV12vSetNrStatesEl:
LFB64:
	pushq	%rbp
LCFI149:
	movq	%rsp, %rbp
LCFI150:
	pushq	%r13
LCFI151:
	pushq	%r12
LCFI152:
	pushq	%rbx
LCFI153:
	subq	$8, %rsp
LCFI154:
	movq	%rdi, %r13
	movl	$1, %eax
	testq	%rsi, %rsi
	cmovns	%rsi, %rax
	movq	%rax, 64(%rdi)
	movq	40(%rdi), %rax
	cmpq	%rax, %rsi
	jl	L437
	movq	%rax, 64(%rdi)
L437:
	movq	$0, 256(%r13)
	movq	$0, 264(%r13)
	movq	112(%r13), %rbx
	testq	%rbx, %rbx
	jne	L446
	jmp	L439
	.align 4,0x90
L448:
	movq	%r12, %rbx
L446:
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r12, %r12
	jne	L448
L439:
	movq	120(%r13), %rbx
	testq	%rbx, %rbx
	jne	L447
	jmp	L442
	.align 4,0x90
L449:
	movq	%r12, %rbx
L447:
	movq	(%rbx), %r12
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r12, %r12
	jne	L449
L442:
	movq	$0, 160(%r13)
	movq	$0, 168(%r13)
	movq	$0, 176(%r13)
	movq	$0, 184(%r13)
	movq	$0, 192(%r13)
	movq	$0, 200(%r13)
	movq	$0, 208(%r13)
	movq	$0, 216(%r13)
	movq	$0, 224(%r13)
	movq	$0, 232(%r13)
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	leave
	ret
LFE64:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV13vSetInternalsEll
__ZN8MARKOVLV13vSetInternalsEll:
LFB61:
	pushq	%rbp
LCFI155:
	movq	%rsp, %rbp
LCFI156:
	pushq	%r15
LCFI157:
	pushq	%r14
LCFI158:
	pushq	%r13
LCFI159:
	pushq	%r12
LCFI160:
	pushq	%rbx
LCFI161:
	subq	$24, %rsp
LCFI162:
	movq	%rdi, %r12
	movq	%rsi, %r15
	movq	%rdx, %r14
	movq	72(%rdi), %rax
	movq	%rax, -56(%rbp)
	call	__ZN8MARKOVLV6vResetEv
	movq	80(%r12), %rbx
	testq	%rbx, %rbx
	jne	L521
	jmp	L451
	.align 4,0x90
L527:
	movq	%r13, %rbx
L521:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L527
L451:
	movq	88(%r12), %rbx
	testq	%rbx, %rbx
	jne	L522
	jmp	L454
	.align 4,0x90
L528:
	movq	%r13, %rbx
L522:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L528
L454:
	movq	96(%r12), %rbx
	testq	%rbx, %rbx
	jne	L523
	jmp	L457
	.align 4,0x90
L529:
	movq	%r13, %rbx
L523:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L529
L457:
	movq	104(%r12), %rbx
	testq	%rbx, %rbx
	jne	L524
	jmp	L460
	.align 4,0x90
L530:
	movq	%r13, %rbx
L524:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L530
L460:
	movq	112(%r12), %rbx
	testq	%rbx, %rbx
	jne	L525
	jmp	L463
	.align 4,0x90
L531:
	movq	%r13, %rbx
L525:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L531
L463:
	movq	120(%r12), %rbx
	testq	%rbx, %rbx
	jne	L526
	jmp	L466
	.align 4,0x90
L532:
	movq	%r13, %rbx
L526:
	movq	(%rbx), %r13
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
	testq	%r13, %r13
	jne	L532
L466:
	movq	136(%r12), %rax
	movq	(%rax), %rdi
	call	__ZdlPv
	movq	144(%r12), %rax
	movq	(%rax), %rdi
	call	__ZdlPv
	movq	152(%r12), %rax
	movq	(%rax), %rdi
	call	__ZdlPv
	movq	136(%r12), %rdi
	call	__ZdlPv
	movq	144(%r12), %rdi
	call	__ZdlPv
	movq	152(%r12), %rdi
	call	__ZdlPv
	movq	128(%r12), %rdi
	call	__ZdlPv
	movq	240(%r12), %rdi
	call	__ZdlPv
	movq	248(%r12), %rdi
	call	__ZdlPv
	movq	%r15, 32(%r12)
	movq	%r14, 40(%r12)
	movq	$0, 48(%r12)
	movq	$0, 56(%r12)
	movq	$0, 64(%r12)
	movq	-56(%rbp), %rax
	movq	%rax, 72(%r12)
	movq	$0, 80(%r12)
	movq	$0, 88(%r12)
	movq	$0, 96(%r12)
	movq	$0, 104(%r12)
	movq	$0, 112(%r12)
	movq	$0, 120(%r12)
	movb	$0, (%r12)
	leaq	0(,%r14,8), %rdi
	call	__Znam
	movq	%rax, 128(%r12)
	movq	40(%r12), %rax
	testq	%rax, %rax
	jle	L469
	xorl	%edx, %edx
	.align 4,0x90
L471:
	movq	128(%r12), %rax
	movq	$0, (%rax,%rdx,8)
	incq	%rdx
	movq	40(%r12), %rax
	cmpq	%rdx, %rax
	jg	L471
L469:
	leaq	0(,%rax,8), %rdi
	call	__Znam
	movq	%rax, 136(%r12)
	movq	40(%r12), %rdi
	imulq	%rdi, %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, %rsi
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	jle	L472
	xorl	%ecx, %ecx
	.align 4,0x90
L474:
	movq	$0, (%rsi,%rcx,8)
	incq	%rcx
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rcx, %rax
	jg	L474
L472:
	xorl	%ecx, %ecx
	testq	%rdx, %rdx
	jle	L533
	.align 4,0x90
L478:
	movq	136(%r12), %rax
	movq	%rsi, (%rax,%rcx,8)
	movq	40(%r12), %rax
	leaq	0(,%rax,8), %rdi
	addq	%rdi, %rsi
	incq	%rcx
	cmpq	%rcx, %rax
	jg	L478
L477:
	call	__Znam
	movq	%rax, 144(%r12)
	movq	40(%r12), %rdi
	imulq	%rdi, %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, %rsi
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	jle	L479
	xorl	%ecx, %ecx
	.align 4,0x90
L481:
	movq	$0, (%rsi,%rcx,8)
	incq	%rcx
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rcx, %rax
	jg	L481
L479:
	xorl	%ecx, %ecx
	testq	%rdx, %rdx
	jle	L534
	.align 4,0x90
L485:
	movq	144(%r12), %rax
	movq	%rsi, (%rax,%rcx,8)
	movq	40(%r12), %rax
	leaq	0(,%rax,8), %rdi
	addq	%rdi, %rsi
	incq	%rcx
	cmpq	%rcx, %rax
	jg	L485
L484:
	call	__Znam
	movq	%rax, 152(%r12)
	movq	40(%r12), %rdi
	imulq	%rdi, %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, %rsi
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	jle	L486
	xorl	%ecx, %ecx
	.align 4,0x90
L488:
	movq	$0, (%rsi,%rcx,8)
	incq	%rcx
	movq	40(%r12), %rdx
	movq	%rdx, %rax
	imulq	%rdx, %rax
	cmpq	%rcx, %rax
	jg	L488
L486:
	xorl	%ecx, %ecx
	testq	%rdx, %rdx
	jle	L535
	.align 4,0x90
L492:
	movq	152(%r12), %rax
	movq	%rsi, (%rax,%rcx,8)
	movq	40(%r12), %rax
	leaq	0(,%rax,8), %rdi
	addq	%rdi, %rsi
	incq	%rcx
	cmpq	%rcx, %rax
	jg	L492
L491:
	call	__Znam
	movq	%rax, 240(%r12)
	cmpq	$0, 40(%r12)
	jle	L493
	xorl	%edx, %edx
	.align 4,0x90
L495:
	movq	240(%r12), %rax
	movq	$0, (%rax,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 40(%r12)
	jg	L495
L493:
	movq	$0, 256(%r12)
	movq	$0, 264(%r12)
	movb	$0, 280(%r12)
	movb	$0, 281(%r12)
	movq	$0, 160(%r12)
	movq	$0, 168(%r12)
	movq	$0, 176(%r12)
	movq	$0, 184(%r12)
	movq	$0, 192(%r12)
	movq	$0, 200(%r12)
	movq	$0, 208(%r12)
	movq	$0, 216(%r12)
	movq	$0, 224(%r12)
	movq	$0, 232(%r12)
	movq	$0, 272(%r12)
	movq	40(%r12), %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, 248(%r12)
	cmpq	$0, 40(%r12)
	jle	L496
	xorl	%edx, %edx
	.align 4,0x90
L498:
	movq	248(%r12), %rax
	movq	%rdx, (%rax,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 40(%r12)
	jg	L498
L496:
	movq	288(%r12), %rbx
	testq	%rbx, %rbx
	je	L499
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L499:
	movq	296(%r12), %rbx
	testq	%rbx, %rbx
	je	L501
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L501:
	movq	304(%r12), %rbx
	testq	%rbx, %rbx
	je	L503
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L503:
	movq	336(%r12), %rbx
	testq	%rbx, %rbx
	je	L505
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L505:
	movq	344(%r12), %rbx
	testq	%rbx, %rbx
	je	L507
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	40(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L507:
	movq	312(%r12), %rbx
	testq	%rbx, %rbx
	je	L509
	movq	32(%rbx), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__ZdlPv
L509:
	movq	$0, 288(%r12)
	movq	$0, 312(%r12)
	movq	$0, 296(%r12)
	movq	$0, 304(%r12)
	movq	$1234567, 8(%r12)
	movq	$0, 328(%r12)
	movq	$0, 320(%r12)
	movq	$0, 336(%r12)
	movq	$0, 344(%r12)
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
L533:
	leaq	0(,%rdx,8), %rdi
	jmp	L477
L534:
	leaq	0(,%rdx,8), %rdi
	jmp	L484
L535:
	leaq	0(,%rdx,8), %rdi
	jmp	L491
LFE61:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV7dSetPreEllld
__ZN8MARKOVLV7dSetPreEllld:
LFB66:
	pushq	%rbp
LCFI163:
	movq	%rsp, %rbp
LCFI164:
	movq	%rbx, -40(%rbp)
LCFI165:
	movq	%r12, -32(%rbp)
LCFI166:
	movq	%r13, -24(%rbp)
LCFI167:
	movq	%r14, -16(%rbp)
LCFI168:
	movq	%r15, -8(%rbp)
LCFI169:
	subq	$64, %rsp
LCFI170:
	movq	%rdi, %rbx
	movq	%rsi, %r15
	movq	%rdx, %r13
	movsd	%xmm0, -64(%rbp)
	cmpb	$0, 280(%rdi)
	je	L537
	movq	128(%rdi), %rax
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	je	L555
	testq	%rsi, %rsi
	js	L555
	cmpq	24(%rax), %rsi
	jl	L565
L555:
	xorpd	%xmm0, %xmm0
L541:
	movq	-40(%rbp), %rbx
	movq	-32(%rbp), %r12
	movq	-24(%rbp), %r13
	movq	-16(%rbp), %r14
	movq	-8(%rbp), %r15
	leave
	ret
	.align 4,0x90
L537:
	leaq	0(,%rdx,8), %rax
	movq	%rax, -56(%rbp)
	movq	128(%rdi), %rax
	movq	-56(%rbp), %rcx
	movq	(%rax,%rcx), %rdx
	testq	%rdx, %rdx
	je	L566
L545:
	cmpb	$0, (%rbx)
	je	L553
	testq	%r15, %r15
	js	L555
	cmpq	24(%rdx), %r15
	jge	L555
	leaq	0(,%r15,8), %rax
	addq	32(%rdx), %rax
	movsd	-64(%rbp), %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movq	32(%rdx), %rax
	movsd	(%rax,%r15,8), %xmm0
	jmp	L541
	.align 4,0x90
L553:
	testq	%r15, %r15
	js	L558
	cmpq	24(%rdx), %r15
	jge	L558
	movq	32(%rdx), %rax
	movsd	-64(%rbp), %xmm0
	movsd	%xmm0, (%rax,%r15,8)
	movq	32(%rdx), %rax
	movsd	(%rax,%r15,8), %xmm0
	jmp	L541
	.align 4,0x90
L565:
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0
	jmp	L541
L566:
	movq	80(%rdi), %r12
	testq	%r12, %r12
	jne	L564
	jmp	L568
	.align 4,0x90
L550:
	movq	%rax, %r12
L564:
	movq	(%r12), %rax
	testq	%rax, %rax
	jne	L550
	movl	$40, %edi
LEHB0:
	call	__Znwm
LEHE0:
	movq	%rax, %r14
	movq	32(%rbx), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB1:
	call	__Znam
LEHE1:
	movq	%rax, %rdi
	movq	%rax, 32(%r14)
	movq	%r13, 8(%r14)
	movq	%r13, 16(%r14)
	movq	$0, (%r14)
	movq	24(%r14), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r14, (%r12)
	movq	128(%rbx), %rax
	movq	-56(%rbp), %rdx
	movq	%r14, (%rdx,%rax)
	movq	128(%rbx), %rax
	movq	-56(%rbp), %rcx
	movq	(%rcx,%rax), %rdx
	jmp	L545
	.align 4,0x90
L558:
	movsd	-64(%rbp), %xmm0
	subsd	LC3(%rip), %xmm0
	jmp	L541
L568:
	movl	$40, %edi
LEHB2:
	call	__Znwm
LEHE2:
	movq	%rax, %r12
	movq	32(%rbx), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB3:
	call	__Znam
LEHE3:
	movq	%rax, %rdi
	movq	%rax, 32(%r12)
	movq	%r13, 8(%r12)
	movq	%r13, 16(%r12)
	movq	$0, (%r12)
	movq	24(%r12), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r12, 80(%rbx)
	movq	128(%rbx), %rax
	movq	%r12, (%rax,%r13,8)
	movq	128(%rbx), %rax
	movq	(%rax,%r13,8), %rdx
	jmp	L545
L562:
	movq	%rax, %rbx
L552:
	movq	%r14, %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
LEHB4:
	call	__Unwind_Resume
L563:
	movq	%rax, %rbx
L549:
	movq	%r12, %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__Unwind_Resume
LEHE4:
LFE66:
	.section __TEXT,__gcc_except_tab
GCC_except_table0:
LLSDA66:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$0,LEHB0-LFB66
	.long L$set$0
	.set L$set$1,LEHE0-LEHB0
	.long L$set$1
	.long	0x0
	.byte	0x0
	.set L$set$2,LEHB1-LFB66
	.long L$set$2
	.set L$set$3,LEHE1-LEHB1
	.long L$set$3
	.set L$set$4,L562-LFB66
	.long L$set$4
	.byte	0x0
	.set L$set$5,LEHB2-LFB66
	.long L$set$5
	.set L$set$6,LEHE2-LEHB2
	.long L$set$6
	.long	0x0
	.byte	0x0
	.set L$set$7,LEHB3-LFB66
	.long L$set$7
	.set L$set$8,LEHE3-LEHB3
	.long L$set$8
	.set L$set$9,L563-LFB66
	.long L$set$9
	.byte	0x0
	.set L$set$10,LEHB4-LFB66
	.long L$set$10
	.set L$set$11,LEHE4-LEHB4
	.long L$set$11
	.long	0x0
	.byte	0x0
	.text
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV8dSetDiscEllld
__ZN8MARKOVLV8dSetDiscEllld:
LFB69:
	pushq	%rbp
LCFI171:
	movq	%rsp, %rbp
LCFI172:
	movq	%rbx, -40(%rbp)
LCFI173:
	movq	%r12, -32(%rbp)
LCFI174:
	movq	%r13, -24(%rbp)
LCFI175:
	movq	%r14, -16(%rbp)
LCFI176:
	movq	%r15, -8(%rbp)
LCFI177:
	subq	$80, %rsp
LCFI178:
	movq	%rdi, %r12
	movq	%rsi, %r15
	movq	%rdx, %r13
	movq	%rcx, %rbx
	movsd	%xmm0, -80(%rbp)
	cmpb	$0, 281(%rdi)
	cmove	%rdx, %rbx
	cmpb	$0, 280(%rdi)
	je	L572
	movq	152(%rdi), %rax
	movq	(%rax,%rdx,8), %rax
	movq	(%rax,%rbx,8), %rax
	testq	%rax, %rax
	je	L577
	testq	%rsi, %rsi
	js	L577
	cmpq	24(%rax), %rsi
	jge	L577
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0
	jmp	L576
	.align 4,0x90
L572:
	leaq	0(,%rdx,8), %rax
	movq	%rax, -56(%rbp)
	leaq	0(,%rbx,8), %rdx
	movq	%rdx, -64(%rbp)
	movq	152(%rdi), %rax
	movq	-56(%rbp), %rcx
	movq	(%rax,%rcx), %rax
	movq	(%rax,%rdx), %rdx
	testq	%rdx, %rdx
	je	L595
L580:
	testq	%r15, %r15
	js	L588
	cmpq	24(%rdx), %r15
	jl	L596
L588:
	movsd	-80(%rbp), %xmm0
	subsd	LC3(%rip), %xmm0
	.align 4,0x90
L576:
	movq	-40(%rbp), %rbx
	movq	-32(%rbp), %r12
	movq	-24(%rbp), %r13
	movq	-16(%rbp), %r14
	movq	-8(%rbp), %r15
	leave
	ret
	.align 4,0x90
L577:
	xorpd	%xmm0, %xmm0
	jmp	L576
	.align 4,0x90
L596:
	movq	32(%rdx), %rax
	movsd	-80(%rbp), %xmm0
	movsd	%xmm0, (%rax,%r15,8)
	movq	32(%rdx), %rax
	movsd	(%rax,%r15,8), %xmm0
	jmp	L576
L595:
	movq	104(%rdi), %r14
	testq	%r14, %r14
	jne	L594
	jmp	L598
	.align 4,0x90
L585:
	movq	%rax, %r14
L594:
	movq	(%r14), %rax
	testq	%rax, %rax
	jne	L585
	movl	$40, %edi
LEHB5:
	call	__Znwm
LEHE5:
	movq	%rax, -72(%rbp)
	movq	32(%r12), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB6:
	call	__Znam
LEHE6:
	movq	%rax, %rdi
	movq	-72(%rbp), %rax
	movq	%rdi, 32(%rax)
	movq	%r13, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	$0, (%rax)
	movq	24(%rax), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	-72(%rbp), %rdx
	movq	%rdx, (%r14)
	movq	152(%r12), %rax
	movq	-56(%rbp), %rcx
	movq	(%rcx,%rax), %rax
	movq	-64(%rbp), %rcx
	movq	%rdx, (%rcx,%rax)
	movq	152(%r12), %rax
	movq	-56(%rbp), %rdx
	movq	(%rdx,%rax), %rax
	movq	(%rcx,%rax), %rdx
	jmp	L580
L598:
	movl	$40, %edi
LEHB7:
	call	__Znwm
LEHE7:
	movq	%rax, %r14
	movq	32(%r12), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB8:
	call	__Znam
LEHE8:
	movq	%rax, %rdi
	movq	%rax, 32(%r14)
	movq	%r13, 8(%r14)
	movq	%rbx, 16(%r14)
	movq	$0, (%r14)
	movq	24(%r14), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r14, 104(%r12)
	movq	152(%r12), %rax
	movq	(%rax,%r13,8), %rax
	movq	%r14, (%rax,%rbx,8)
	movq	152(%r12), %rax
	movq	(%rax,%r13,8), %rax
	movq	(%rax,%rbx,8), %rdx
	jmp	L580
L592:
	movq	%rax, %rbx
L587:
	movq	-72(%rbp), %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
LEHB9:
	call	__Unwind_Resume
L593:
	movq	%rax, %rbx
L584:
	movq	%r14, %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__Unwind_Resume
LEHE9:
LFE69:
	.section __TEXT,__gcc_except_tab
GCC_except_table1:
LLSDA69:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$12,LEHB5-LFB69
	.long L$set$12
	.set L$set$13,LEHE5-LEHB5
	.long L$set$13
	.long	0x0
	.byte	0x0
	.set L$set$14,LEHB6-LFB69
	.long L$set$14
	.set L$set$15,LEHE6-LEHB6
	.long L$set$15
	.set L$set$16,L592-LFB69
	.long L$set$16
	.byte	0x0
	.set L$set$17,LEHB7-LFB69
	.long L$set$17
	.set L$set$18,LEHE7-LEHB7
	.long L$set$18
	.long	0x0
	.byte	0x0
	.set L$set$19,LEHB8-LFB69
	.long L$set$19
	.set L$set$20,LEHE8-LEHB8
	.long L$set$20
	.set L$set$21,L593-LFB69
	.long L$set$21
	.byte	0x0
	.set L$set$22,LEHB9-LFB69
	.long L$set$22
	.set L$set$23,LEHE9-LEHB9
	.long L$set$23
	.long	0x0
	.byte	0x0
	.text
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV7dSetPijEllld
__ZN8MARKOVLV7dSetPijEllld:
LFB68:
	pushq	%rbp
LCFI179:
	movq	%rsp, %rbp
LCFI180:
	movq	%rbx, -40(%rbp)
LCFI181:
	movq	%r12, -32(%rbp)
LCFI182:
	movq	%r13, -24(%rbp)
LCFI183:
	movq	%r14, -16(%rbp)
LCFI184:
	movq	%r15, -8(%rbp)
LCFI185:
	subq	$80, %rsp
LCFI186:
	movq	%rdi, %rbx
	movq	%rsi, %r13
	movq	%rdx, %r15
	movq	%rcx, -72(%rbp)
	movsd	%xmm0, -80(%rbp)
	cmpb	$0, 280(%rdi)
	je	L600
	movq	144(%rdi), %rax
	movq	(%rax,%rdx,8), %rax
	movq	(%rax,%rcx,8), %rax
	testq	%rax, %rax
	je	L605
	testq	%rsi, %rsi
	js	L605
	cmpq	24(%rax), %rsi
	jge	L605
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0
	jmp	L604
	.align 4,0x90
L600:
	movq	%rcx, %rdx
	leaq	0(,%r15,8), %rax
	movq	%rax, -56(%rbp)
	salq	$3, %rdx
	movq	%rdx, -64(%rbp)
	movq	144(%rdi), %rax
	movq	-56(%rbp), %rcx
	movq	(%rax,%rcx), %rax
	movq	(%rax,%rdx), %rdx
	testq	%rdx, %rdx
	je	L623
L608:
	testq	%r13, %r13
	js	L616
	cmpq	24(%rdx), %r13
	jl	L624
L616:
	movsd	-80(%rbp), %xmm0
	subsd	LC3(%rip), %xmm0
	.align 4,0x90
L604:
	movq	-40(%rbp), %rbx
	movq	-32(%rbp), %r12
	movq	-24(%rbp), %r13
	movq	-16(%rbp), %r14
	movq	-8(%rbp), %r15
	leave
	ret
	.align 4,0x90
L605:
	xorpd	%xmm0, %xmm0
	jmp	L604
	.align 4,0x90
L624:
	movq	32(%rdx), %rax
	movsd	-80(%rbp), %xmm0
	movsd	%xmm0, (%rax,%r13,8)
	movq	32(%rdx), %rax
	movsd	(%rax,%r13,8), %xmm0
	jmp	L604
L623:
	movq	96(%rdi), %r12
	testq	%r12, %r12
	jne	L622
	jmp	L626
	.align 4,0x90
L613:
	movq	%rax, %r12
L622:
	movq	(%r12), %rax
	testq	%rax, %rax
	jne	L613
	movl	$40, %edi
LEHB10:
	call	__Znwm
LEHE10:
	movq	%rax, %r14
	movq	32(%rbx), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB11:
	call	__Znam
LEHE11:
	movq	%rax, %rdi
	movq	%rax, 32(%r14)
	movq	%r15, 8(%r14)
	movq	-72(%rbp), %rax
	movq	%rax, 16(%r14)
	movq	$0, (%r14)
	movq	24(%r14), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r14, (%r12)
	movq	144(%rbx), %rax
	movq	-56(%rbp), %rdx
	movq	(%rdx,%rax), %rax
	movq	-64(%rbp), %rcx
	movq	%r14, (%rcx,%rax)
	movq	144(%rbx), %rax
	movq	(%rdx,%rax), %rax
	movq	(%rcx,%rax), %rdx
	jmp	L608
L626:
	movl	$40, %edi
LEHB12:
	call	__Znwm
LEHE12:
	movq	%rax, %r12
	movq	32(%rbx), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB13:
	call	__Znam
LEHE13:
	movq	%rax, %rdi
	movq	%rax, 32(%r12)
	movq	%r15, 8(%r12)
	movq	-72(%rbp), %rax
	movq	%rax, 16(%r12)
	movq	$0, (%r12)
	movq	24(%r12), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r12, 96(%rbx)
	movq	144(%rbx), %rax
	movq	(%rax,%r15,8), %rax
	movq	-72(%rbp), %rdx
	movq	%r12, (%rax,%rdx,8)
	movq	144(%rbx), %rax
	movq	(%rax,%r15,8), %rax
	movq	-72(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdx
	jmp	L608
L620:
	movq	%rax, %rbx
L615:
	movq	%r14, %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
LEHB14:
	call	__Unwind_Resume
L621:
	movq	%rax, %rbx
L612:
	movq	%r12, %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__Unwind_Resume
LEHE14:
LFE68:
	.section __TEXT,__gcc_except_tab
GCC_except_table2:
LLSDA68:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$24,LEHB10-LFB68
	.long L$set$24
	.set L$set$25,LEHE10-LEHB10
	.long L$set$25
	.long	0x0
	.byte	0x0
	.set L$set$26,LEHB11-LFB68
	.long L$set$26
	.set L$set$27,LEHE11-LEHB11
	.long L$set$27
	.set L$set$28,L620-LFB68
	.long L$set$28
	.byte	0x0
	.set L$set$29,LEHB12-LFB68
	.long L$set$29
	.set L$set$30,LEHE12-LEHB12
	.long L$set$30
	.long	0x0
	.byte	0x0
	.set L$set$31,LEHB13-LFB68
	.long L$set$31
	.set L$set$32,LEHE13-LEHB13
	.long L$set$32
	.set L$set$33,L621-LFB68
	.long L$set$33
	.byte	0x0
	.set L$set$34,LEHB14-LFB68
	.long L$set$34
	.set L$set$35,LEHE14-LEHB14
	.long L$set$35
	.long	0x0
	.byte	0x0
	.text
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV8dSetPostEllld
__ZN8MARKOVLV8dSetPostEllld:
LFB67:
	pushq	%rbp
LCFI187:
	movq	%rsp, %rbp
LCFI188:
	movq	%rbx, -40(%rbp)
LCFI189:
	movq	%r12, -32(%rbp)
LCFI190:
	movq	%r13, -24(%rbp)
LCFI191:
	movq	%r14, -16(%rbp)
LCFI192:
	movq	%r15, -8(%rbp)
LCFI193:
	subq	$80, %rsp
LCFI194:
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%rdx, %r15
	movq	%rcx, -72(%rbp)
	movsd	%xmm0, -80(%rbp)
	cmpb	$0, 280(%rdi)
	je	L628
	movq	136(%rdi), %rax
	movq	(%rax,%rdx,8), %rax
	movq	(%rax,%rcx,8), %rax
	testq	%rax, %rax
	je	L646
	testq	%rsi, %rsi
	js	L646
	cmpq	24(%rax), %rsi
	jl	L656
L646:
	xorpd	%xmm0, %xmm0
L632:
	movq	-40(%rbp), %rbx
	movq	-32(%rbp), %r12
	movq	-24(%rbp), %r13
	movq	-16(%rbp), %r14
	movq	-8(%rbp), %r15
	leave
	ret
	.align 4,0x90
L628:
	movq	%rcx, %rdx
	leaq	0(,%r15,8), %rax
	movq	%rax, -56(%rbp)
	salq	$3, %rdx
	movq	%rdx, -64(%rbp)
	movq	136(%rdi), %rax
	movq	-56(%rbp), %rcx
	movq	(%rax,%rcx), %rax
	movq	(%rax,%rdx), %rdx
	testq	%rdx, %rdx
	je	L657
L636:
	cmpb	$0, (%rbx)
	je	L644
	testq	%r14, %r14
	js	L646
	cmpq	24(%rdx), %r14
	jge	L646
	leaq	0(,%r14,8), %rax
	addq	32(%rdx), %rax
	movsd	-80(%rbp), %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movq	32(%rdx), %rax
	movsd	(%rax,%r14,8), %xmm0
	jmp	L632
	.align 4,0x90
L644:
	testq	%r14, %r14
	js	L649
	cmpq	24(%rdx), %r14
	jge	L649
	movq	32(%rdx), %rax
	movsd	-80(%rbp), %xmm0
	movsd	%xmm0, (%rax,%r14,8)
	movq	32(%rdx), %rax
	movsd	(%rax,%r14,8), %xmm0
	jmp	L632
	.align 4,0x90
L656:
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm0
	jmp	L632
L657:
	movq	88(%rdi), %r12
	testq	%r12, %r12
	jne	L655
	jmp	L659
	.align 4,0x90
L641:
	movq	%rax, %r12
L655:
	movq	(%r12), %rax
	testq	%rax, %rax
	jne	L641
	movl	$40, %edi
LEHB15:
	call	__Znwm
LEHE15:
	movq	%rax, %r13
	movq	32(%rbx), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB16:
	call	__Znam
LEHE16:
	movq	%rax, %rdi
	movq	%rax, 32(%r13)
	movq	%r15, 8(%r13)
	movq	-72(%rbp), %rax
	movq	%rax, 16(%r13)
	movq	$0, (%r13)
	movq	24(%r13), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r13, (%r12)
	movq	136(%rbx), %rax
	movq	-56(%rbp), %rdx
	movq	(%rdx,%rax), %rax
	movq	-64(%rbp), %rcx
	movq	%r13, (%rcx,%rax)
	movq	136(%rbx), %rax
	movq	(%rdx,%rax), %rax
	movq	(%rcx,%rax), %rdx
	jmp	L636
	.align 4,0x90
L649:
	movsd	-80(%rbp), %xmm0
	subsd	LC3(%rip), %xmm0
	jmp	L632
L659:
	movl	$40, %edi
LEHB17:
	call	__Znwm
LEHE17:
	movq	%rax, %r12
	movq	32(%rbx), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB18:
	call	__Znam
LEHE18:
	movq	%rax, %rdi
	movq	%rax, 32(%r12)
	movq	%r15, 8(%r12)
	movq	-72(%rbp), %rax
	movq	%rax, 16(%r12)
	movq	$0, (%r12)
	movq	24(%r12), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r12, 88(%rbx)
	movq	136(%rbx), %rax
	movq	(%rax,%r15,8), %rax
	movq	-72(%rbp), %rdx
	movq	%r12, (%rax,%rdx,8)
	movq	136(%rbx), %rax
	movq	(%rax,%r15,8), %rax
	movq	-72(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdx
	jmp	L636
L653:
	movq	%rax, %rbx
L643:
	movq	%r13, %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
LEHB19:
	call	__Unwind_Resume
L654:
	movq	%rax, %rbx
L640:
	movq	%r12, %rdi
	call	__ZdlPv
	movq	%rbx, %rdi
	call	__Unwind_Resume
LEHE19:
LFE67:
	.section __TEXT,__gcc_except_tab
GCC_except_table3:
LLSDA67:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$36,LEHB15-LFB67
	.long L$set$36
	.set L$set$37,LEHE15-LEHB15
	.long L$set$37
	.long	0x0
	.byte	0x0
	.set L$set$38,LEHB16-LFB67
	.long L$set$38
	.set L$set$39,LEHE16-LEHB16
	.long L$set$39
	.set L$set$40,L653-LFB67
	.long L$set$40
	.byte	0x0
	.set L$set$41,LEHB17-LFB67
	.long L$set$41
	.set L$set$42,LEHE17-LEHB17
	.long L$set$42
	.long	0x0
	.byte	0x0
	.set L$set$43,LEHB18-LFB67
	.long L$set$43
	.set L$set$44,LEHE18-LEHB18
	.long L$set$44
	.set L$set$45,L654-LFB67
	.long L$set$45
	.byte	0x0
	.set L$set$46,LEHB19-LFB67
	.long L$set$46
	.set L$set$47,LEHE19-LEHB19
	.long L$set$47
	.long	0x0
	.byte	0x0
	.text
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV6dGetDKElll
__ZN8MARKOVLV6dGetDKElll:
LFB72:
	pushq	%rbp
LCFI195:
	movq	%rsp, %rbp
LCFI196:
	pushq	%r15
LCFI197:
	pushq	%r14
LCFI198:
	pushq	%r13
LCFI199:
	pushq	%r12
LCFI200:
	pushq	%rbx
LCFI201:
	subq	$1032, %rsp
LCFI202:
	movq	%rdi, %r14
	movq	%rsi, -976(%rbp)
	movq	%rdx, -984(%rbp)
	testq	%rcx, %rcx
	movl	$1, %eax
	cmovg	%rcx, %rax
	movq	%rax, -992(%rbp)
	movq	256(%rdi), %rax
	cmpq	%rax, -992(%rbp)
	jg	L663
	movq	-992(%rbp), %rdx
	movq	160(%rdi,%rdx,8), %rax
	testq	%rsi, %rsi
	js	L766
	cmpq	8(%rax), %rsi
	jge	L766
	cmpq	$0, -984(%rbp)
	js	L766
	movq	-984(%rbp), %rcx
	cmpq	16(%rax), %rcx
	jge	L766
	movq	40(%rax), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%rcx,8), %xmm0
L669:
	addq	$1032, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
L682:
	movq	48(%r14), %rax
	leaq	-1(%rax), %r13
	cmpq	56(%r14), %r13
	jl	L693
	movq	%rax, -944(%rbp)
	leaq	-8(,%rax,8), %r8
	leaq	-128(%rbp), %rcx
	movq	%rcx, -1024(%rbp)
L695:
	cmpq	$0, 72(%r14)
	jle	L734
	leaq	8(%r8), %r9
	movq	%r9, -952(%rbp)
	movl	$1, %ebx
L696:
	movq	96(%r14), %r12
	testq	%r12, %r12
	je	L697
	cvtsi2sdq	%rbx, %xmm0
	movsd	%xmm0, -1008(%rbp)
	leaq	(%rbx,%rbx,4), %rax
	salq	$4, %rax
	addq	-1000(%rbp), %rax
	movq	%rax, -1016(%rbp)
L698:
	movq	8(%r12), %r15
	movq	16(%r12), %rcx
	cmpb	$0, 281(%r14)
	movq	%rcx, %rax
	cmove	%r15, %rax
	leaq	0(,%r15,8), %r9
	movq	%r9, -960(%rbp)
	movq	152(%r14), %rdx
	movq	(%rdx,%r9), %rdx
	movq	(%rdx,%rax,8), %rax
	xorpd	%xmm4, %xmm4
	testq	%rax, %rax
	je	L704
	testq	%r13, %r13
	js	L705
	cmpq	24(%rax), %r13
	jge	L705
	movq	32(%rax), %rax
	movsd	(%r8,%rax), %xmm4
L704:
	testq	%r13, %r13
	js	L708
	cmpq	24(%r12), %r13
	jge	L708
	movq	32(%r12), %rax
	movsd	(%r8,%rax), %xmm5
L711:
	leaq	0(,%rcx,8), %rdx
	movq	136(%r14), %rax
	movq	-960(%rbp), %rsi
	movq	(%rsi,%rax), %rax
	movq	(%rax,%rdx), %rax
	xorpd	%xmm3, %xmm3
	testq	%rax, %rax
	je	L714
	testq	%r13, %r13
	js	L715
	cmpq	24(%rax), %r13
	jge	L715
	movq	32(%rax), %rax
	movsd	(%r8,%rax), %xmm3
L714:
	movsd	LC3(%rip), %xmm2
	testq	%rbx, %rbx
	jle	L720
	cmpq	$0, -944(%rbp)
	jns	L721
	movq	-1016(%rbp), %rax
	xorpd	%xmm2, %xmm2
	movsd	LC3(%rip), %xmm1
	xorl	%edx, %edx
	.align 4,0x90
L723:
	movapd	%xmm1, %xmm0
	mulsd	(%rax), %xmm0
	xorpd	%xmm6, %xmm6
	mulsd	%xmm6, %xmm0
	addsd	%xmm0, %xmm2
	mulsd	%xmm3, %xmm1
	incq	%rdx
	addq	$8, %rax
	cmpq	%rbx, %rdx
	jne	L723
L724:
	addsd	%xmm1, %xmm2
L720:
	movsd	-1008(%rbp), %xmm1
	movapd	%xmm4, %xmm0
	movsd	%xmm2, -1040(%rbp)
	movsd	%xmm5, -1056(%rbp)
	movq	%r8, -1064(%rbp)
	call	_pow
	movq	160(%r14,%rbx,8), %rax
	testq	%r13, %r13
	movsd	-1040(%rbp), %xmm2
	movsd	-1056(%rbp), %xmm5
	movq	-1064(%rbp), %r8
	js	L730
	cmpq	8(%rax), %r13
	jge	L730
	testq	%r15, %r15
	js	L730
	cmpq	16(%rax), %r15
	jge	L730
	movq	40(%rax), %rax
	movq	(%r8,%rax), %rax
	addq	-960(%rbp), %rax
	mulsd	%xmm0, %xmm5
	mulsd	%xmm5, %xmm2
	addsd	(%rax), %xmm2
	movsd	%xmm2, (%rax)
	.align 4,0x90
L730:
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	L698
L697:
	incq	%rbx
	cmpq	%rbx, 72(%r14)
	jge	L696
L734:
	cmpq	$0, 64(%r14)
	jle	L735
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
L737:
	movl	$80, %edx
	xorl	%esi, %esi
	movq	-1024(%rbp), %rdi
	movq	%r8, -1064(%rbp)
	call	_memset
	movq	128(%r14), %rax
	movq	(%rax,%r12), %rax
	xorpd	%xmm3, %xmm3
	testq	%rax, %rax
	movq	-1064(%rbp), %r8
	je	L740
	testq	%r13, %r13
	js	L741
	cmpq	24(%rax), %r13
	jge	L741
	movq	32(%rax), %rax
	movsd	(%rax,%r8), %xmm3
L740:
	cmpq	$0, 72(%r14)
	jle	L744
	testq	%r13, %r13
	jns	L746
	movl	$1, %eax
L748:
	movq	-1024(%rbp), %rdx
	movq	$0, (%rdx,%rax,8)
	incq	%rax
	cmpq	72(%r14), %rax
	jle	L748
L749:
	movl	$1, %esi
	cmpq	$0, 72(%r14)
	jle	L744
L762:
	leaq	(%rsi,%rsi,4), %rax
	salq	$4, %rax
	movq	-1000(%rbp), %rcx
	addq	%rax, %rcx
	xorpd	%xmm2, %xmm2
	movsd	LC3(%rip), %xmm1
	xorl	%eax, %eax
	xorl	%edx, %edx
	.align 4,0x90
L756:
	movapd	%xmm1, %xmm0
	mulsd	(%rcx), %xmm0
	movq	%rsi, %rdi
	subq	%rax, %rdi
	mulsd	-128(%rbp,%rdi,8), %xmm0
	addsd	%xmm0, %xmm2
	mulsd	%xmm3, %xmm1
	incq	%rdx
	movq	%rdx, %rax
	addq	$8, %rcx
	cmpq	%rsi, %rdx
	jl	L756
	movq	160(%r14,%rsi,8), %rax
	testq	%r13, %r13
	js	L758
	cmpq	8(%rax), %r13
	jge	L758
	cmpq	%rbx, 16(%rax)
	jle	L758
	movq	40(%rax), %rax
	movq	(%rax,%r8), %rax
	addsd	%xmm1, %xmm2
	movsd	%xmm2, (%rax,%r12)
L758:
	incq	%rsi
	cmpq	%rsi, 72(%r14)
	jge	L762
L744:
	incq	%rbx
	addq	$8, %r12
	cmpq	%rbx, 64(%r14)
	jg	L737
L735:
	decq	%r13
	decq	-944(%rbp)
	subq	$8, %r8
	cmpq	%r13, 56(%r14)
	jle	L695
L693:
	movq	72(%r14), %rax
	movq	%rax, 256(%r14)
	cmpq	%rax, -992(%rbp)
	jg	L766
	movq	-992(%rbp), %rdx
	movq	160(%r14,%rdx,8), %rax
	cmpq	$0, -976(%rbp)
	js	L766
	movq	-976(%rbp), %rcx
	cmpq	8(%rax), %rcx
	jge	L766
	cmpq	$0, -984(%rbp)
	js	L766
	movq	-984(%rbp), %rsi
	cmpq	16(%rax), %rsi
	jl	L792
L766:
	xorpd	%xmm0, %xmm0
	jmp	L669
L663:
	testq	%rax, %rax
	je	L793
L670:
	leaq	-928(%rbp), %rax
	movq	%rax, -1000(%rbp)
	movl	$80, %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$80, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$160, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$240, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$320, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$400, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$480, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$560, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$640, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	movq	-1000(%rbp), %rdi
	addq	$720, %rdi
	movl	$80, %edx
	xorl	%esi, %esi
	call	_memset
	cmpq	$0, 72(%r14)
	js	L682
	xorl	%ecx, %ecx
	movq	72(%r14), %rdi
	movabsq	$4607182418800017408, %rsi
L684:
	leaq	(%rcx,%rcx,4), %rax
	salq	$4, %rax
	movq	-1000(%rbp), %rdx
	leaq	-88(%rax,%rdx), %rax
	xorl	%edx, %edx
	jmp	L685
L794:
	cmpq	%rdx, %rcx
	je	L688
	movsd	(%rax), %xmm0
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 88(%rax)
	incq	%rdx
	addq	$8, %rax
	cmpq	%rdx, %rcx
	jl	L789
L685:
	testq	%rdx, %rdx
	jne	L794
L688:
	movq	%rsi, 88(%rax)
	incq	%rdx
	addq	$8, %rax
	cmpq	%rdx, %rcx
	jge	L685
L789:
	incq	%rcx
	cmpq	%rcx, %rdi
	jl	L682
	testq	%rcx, %rcx
	jns	L684
	jmp	L789
	.align 4,0x90
L708:
	xorpd	%xmm5, %xmm5
	jmp	L711
L705:
	xorpd	%xmm4, %xmm4
	jmp	L704
L715:
	xorpd	%xmm3, %xmm3
	jmp	L714
L741:
	xorpd	%xmm3, %xmm3
	jmp	L740
L793:
	movl	$48, %edi
LEHB20:
	call	__Znwm
LEHE20:
	movq	%rax, %r13
	movq	64(%r14), %r12
	movq	32(%r14), %rbx
	movq	%rbx, %rdi
	imulq	%r12, %rdi
	salq	$3, %rdi
LEHB21:
	call	__Znam
	movq	%rax, 32(%r13)
	leaq	0(,%rbx,8), %rdi
	call	__Znam
LEHE21:
	movq	%rax, 40(%r13)
	movq	32(%r13), %rdi
	movq	%rdi, %rdx
	testq	%rbx, %rbx
	jle	L672
	leaq	0(,%r12,8), %rsi
	xorl	%ecx, %ecx
L674:
	movq	40(%r13), %rax
	movq	%rdx, (%rax,%rcx,8)
	addq	%rsi, %rdx
	incq	%rcx
	cmpq	%rbx, %rcx
	jne	L674
	movq	32(%r13), %rdi
L672:
	movq	%rbx, 8(%r13)
	movq	%r12, 16(%r13)
	movq	$1, 24(%r13)
	movq	$0, (%r13)
	imulq	%rbx, %r12
	leaq	0(,%r12,8), %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r13, 112(%r14)
	movq	%r13, 168(%r14)
	movq	$2, -968(%rbp)
	movq	$3, -936(%rbp)
	cmpq	$1, 72(%r14)
	jle	L670
L677:
	movl	$48, %edi
LEHB22:
	call	__Znwm
LEHE22:
	movq	%rax, %rbx
	movq	64(%r14), %r15
	movq	32(%r14), %r12
	movq	%r12, %rdi
	imulq	%r15, %rdi
	salq	$3, %rdi
LEHB23:
	call	__Znam
	movq	%rax, 32(%rbx)
	leaq	0(,%r12,8), %rdi
	call	__Znam
LEHE23:
	movq	%rax, 40(%rbx)
	movq	32(%rbx), %rdi
	movq	%rdi, %rdx
	testq	%r12, %r12
	jle	L678
	leaq	0(,%r15,8), %rsi
	xorl	%ecx, %ecx
L680:
	movq	40(%rbx), %rax
	movq	%rdx, (%rax,%rcx,8)
	addq	%rsi, %rdx
	incq	%rcx
	cmpq	%r12, %rcx
	jne	L680
	movq	32(%rbx), %rdi
L678:
	movq	%r12, 8(%rbx)
	movq	%r15, 16(%rbx)
	movq	-968(%rbp), %rsi
	movq	%rsi, 24(%rbx)
	movq	$0, (%rbx)
	imulq	%r12, %r15
	leaq	0(,%r15,8), %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%rbx, (%r13)
	movq	-936(%rbp), %rdi
	movq	%rbx, 152(%r14,%rdi,8)
	movq	(%r13), %r13
	movq	%rdi, -968(%rbp)
	incq	%rdi
	movq	%rdi, -936(%rbp)
	movq	-968(%rbp), %r9
	cmpq	%r9, 72(%r14)
	jge	L677
	jmp	L670
L792:
	movq	40(%rax), %rax
	movq	(%rax,%rcx,8), %rax
	movsd	(%rax,%rsi,8), %xmm0
	jmp	L669
L771:
	movq	%rax, %r12
L681:
	movq	%rbx, %rdi
	call	__ZdlPv
	movq	%r12, %rdi
LEHB24:
	call	__Unwind_Resume
L772:
	movq	%rax, %r12
L676:
	movq	%r13, %rdi
	call	__ZdlPv
	movq	%r12, %rdi
	call	__Unwind_Resume
LEHE24:
L746:
	movl	$1, %edx
L750:
	movq	160(%r14,%rdx,8), %rax
	cmpq	8(%rax), %r13
	jge	L751
	cmpq	%rbx, 16(%rax)
	jle	L751
	movq	40(%rax), %rax
	movq	(%rax,%r8), %rax
	movq	(%rax,%r12), %rax
L754:
	movq	-1024(%rbp), %rcx
	movq	%rax, (%rcx,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 72(%r14)
	jge	L750
	jmp	L749
L721:
	movq	-1016(%rbp), %rsi
	xorpd	%xmm2, %xmm2
	movsd	LC3(%rip), %xmm1
	xorl	%eax, %eax
	xorl	%edi, %edi
L725:
	movsd	(%rsi), %xmm6
	movq	%rbx, %r9
	subq	%rax, %r9
	movq	160(%r14,%r9,8), %rax
	movq	-944(%rbp), %r9
	cmpq	8(%rax), %r9
	jge	L726
	testq	%rcx, %rcx
	js	L726
	cmpq	16(%rax), %rcx
	jge	L726
	movq	40(%rax), %rax
	movq	-952(%rbp), %r9
	movq	(%r9,%rax), %rax
	movsd	(%rax,%rdx), %xmm0
L729:
	mulsd	%xmm1, %xmm6
	mulsd	%xmm6, %xmm0
	addsd	%xmm0, %xmm2
	mulsd	%xmm3, %xmm1
	incq	%rdi
	movq	%rdi, %rax
	addq	$8, %rsi
	cmpq	%rdi, %rbx
	jne	L725
	jmp	L724
L751:
	xorl	%eax, %eax
	jmp	L754
L726:
	xorpd	%xmm0, %xmm0
	jmp	L729
LFE72:
	.section __TEXT,__gcc_except_tab
GCC_except_table4:
LLSDA72:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$48,LEHB20-LFB72
	.long L$set$48
	.set L$set$49,LEHE20-LEHB20
	.long L$set$49
	.long	0x0
	.byte	0x0
	.set L$set$50,LEHB21-LFB72
	.long L$set$50
	.set L$set$51,LEHE21-LEHB21
	.long L$set$51
	.set L$set$52,L772-LFB72
	.long L$set$52
	.byte	0x0
	.set L$set$53,LEHB22-LFB72
	.long L$set$53
	.set L$set$54,LEHE22-LEHB22
	.long L$set$54
	.long	0x0
	.byte	0x0
	.set L$set$55,LEHB23-LFB72
	.long L$set$55
	.set L$set$56,LEHE23-LEHB23
	.long L$set$56
	.set L$set$57,L771-LFB72
	.long L$set$57
	.byte	0x0
	.set L$set$58,LEHB24-LFB72
	.long L$set$58
	.set L$set$59,LEHE24-LEHB24
	.long L$set$59
	.long	0x0
	.byte	0x0
	.text
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV6dGetSPEll
__ZN8MARKOVLV6dGetSPEll:
LFB79:
	pushq	%rbp
LCFI203:
	movq	%rsp, %rbp
LCFI204:
	movq	%rbx, -24(%rbp)
LCFI205:
	movq	%r12, -16(%rbp)
LCFI206:
	movq	%r13, -8(%rbp)
LCFI207:
	subq	$48, %rsp
LCFI208:
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %r13
	leaq	0(,%rdx,8), %rcx
	movq	248(%rdi), %rax
	movq	(%rax,%rcx), %rdi
	leaq	0(,%rdi,8), %rdx
	cmpb	$0, 281(%rbx)
	cmove	%rcx, %rdx
	movq	152(%rbx), %rax
	movq	(%rax,%rcx), %rax
	movq	(%rax,%rdx), %rax
	testq	%rax, %rax
	je	L802
	testq	%rsi, %rsi
	js	L802
	cmpq	24(%rax), %rsi
	jl	L806
L802:
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
L801:
	leaq	1(%r12), %rsi
	movl	$1, %ecx
	movq	%rdi, %rdx
	movq	%rbx, %rdi
	call	__ZN8MARKOVLV6dGetDKElll
	movsd	%xmm0, -48(%rbp)
	movl	$1, %ecx
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	__ZN8MARKOVLV6dGetDKElll
	movsd	-48(%rbp), %xmm1
	mulsd	-40(%rbp), %xmm1
	movsd	%xmm1, -40(%rbp)
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	-24(%rbp), %rbx
	movq	-16(%rbp), %r12
	movq	-8(%rbp), %r13
	leave
	ret
	.align 4,0x90
L806:
	movq	32(%rax), %rax
	movsd	(%rax,%rsi,8), %xmm1
	movsd	%xmm1, -40(%rbp)
	jmp	L801
LFE79:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV6dGetRPEll
__ZN8MARKOVLV6dGetRPEll:
LFB78:
	pushq	%rbp
LCFI209:
	movq	%rsp, %rbp
LCFI210:
	pushq	%r15
LCFI211:
	pushq	%r14
LCFI212:
	pushq	%r13
LCFI213:
	pushq	%r12
LCFI214:
	pushq	%rbx
LCFI215:
	subq	$120, %rsp
LCFI216:
	movq	%rdi, %rbx
	movq	%rsi, %r15
	leaq	0(,%rdx,8), %r13
	movq	248(%rdi), %rax
	movq	(%rax,%r13), %rax
	movq	%rax, -104(%rbp)
	leaq	1(%rsi), %r8
	movl	$1, %ecx
	movq	%rax, %rdx
	movq	%r8, %rsi
	movq	%r8, -152(%rbp)
	call	__ZN8MARKOVLV6dGetDKElll
	movsd	%xmm0, -88(%rbp)
	movq	136(%rbx), %rax
	movq	(%rax,%r13), %rax
	movq	-104(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	movq	-152(%rbp), %r8
	je	L860
	testq	%r8, %r8
	js	L810
	cmpq	24(%rax), %r8
	jl	L863
L810:
	xorpd	%xmm3, %xmm3
	movapd	%xmm3, %xmm0
L813:
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -88(%rbp)
L808:
	movsd	%xmm3, -96(%rbp)
	cmpq	$0, -104(%rbp)
	jle	L816
	leaq	0(,%r15,8), %rax
	movq	%rax, -80(%rbp)
	leaq	0(,%r8,8), %rdx
	movq	%rdx, -72(%rbp)
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	movq	144(%rbx), %rcx
	jmp	L817
	.align 4,0x90
L864:
	movq	32(%rdx), %rax
	movq	-80(%rbp), %rdx
	movsd	(%rax,%rdx), %xmm2
L826:
	movl	$1, %ecx
	movq	%r14, %rdx
	movq	%r8, %rsi
	movq	%rbx, %rdi
	movsd	%xmm2, -128(%rbp)
	movsd	%xmm3, -144(%rbp)
	movq	%r8, -152(%rbp)
	call	__ZN8MARKOVLV6dGetDKElll
	subsd	-88(%rbp), %xmm0
	movq	136(%rbx), %rax
	movq	(%r13,%rax), %rax
	movq	(%rax,%r12), %rax
	testq	%rax, %rax
	movsd	-128(%rbp), %xmm2
	movsd	-144(%rbp), %xmm3
	movq	-152(%rbp), %r8
	je	L827
	testq	%r8, %r8
	js	L829
	cmpq	24(%rax), %r8
	jge	L829
	movq	32(%rax), %rax
	movq	-72(%rbp), %rdx
	movsd	(%rax,%rdx), %xmm1
L832:
	addsd	%xmm1, %xmm0
L827:
	movq	144(%rbx), %rcx
	movq	(%r13,%rcx), %rax
	movq	(%rax,%r12), %rax
	testq	%r15, %r15
	js	L833
	cmpq	24(%rax), %r15
	jge	L833
	movq	32(%rax), %rax
	movq	-80(%rbp), %rdx
	movsd	(%rdx,%rax), %xmm1
L836:
	mulsd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	addsd	-96(%rbp), %xmm2
	movsd	%xmm2, -96(%rbp)
L821:
	incq	%r14
	addq	$8, %r12
	cmpq	-104(%rbp), %r14
	je	L816
L817:
	cmpb	$0, 281(%rbx)
	movq	%r12, %rdx
	cmove	%r13, %rdx
	movq	152(%rbx), %rax
	movq	(%r13,%rax), %rax
	movq	(%rax,%rdx), %rdx
	movq	(%r13,%rcx), %rax
	cmpq	$0, (%rax,%r12)
	je	L821
	testq	%r15, %r15
	js	L823
	cmpq	24(%rdx), %r15
	jl	L864
L823:
	movapd	%xmm3, %xmm2
	jmp	L826
L863:
	movq	32(%rax), %rax
	movsd	(%rax,%r8,8), %xmm0
	xorpd	%xmm3, %xmm3
	jmp	L813
	.align 4,0x90
L833:
	movapd	%xmm3, %xmm1
	jmp	L836
	.align 4,0x90
L829:
	movapd	%xmm3, %xmm1
	jmp	L832
L816:
	movq	-104(%rbp), %r14
	incq	%r14
	cmpq	64(%rbx), %r14
	jge	L837
	leaq	0(,%r15,8), %rax
	movq	%rax, -64(%rbp)
	leaq	0(,%r8,8), %rdx
	movq	%rdx, -56(%rbp)
	leaq	0(,%r14,8), %r12
	movq	144(%rbx), %rcx
	jmp	L839
	.align 4,0x90
L865:
	movq	32(%rdx), %rax
	movq	-64(%rbp), %rdx
	movsd	(%rax,%rdx), %xmm2
L848:
	movl	$1, %ecx
	movq	%r14, %rdx
	movq	%r8, %rsi
	movq	%rbx, %rdi
	movsd	%xmm2, -128(%rbp)
	movsd	%xmm3, -144(%rbp)
	movq	%r8, -152(%rbp)
	call	__ZN8MARKOVLV6dGetDKElll
	subsd	-88(%rbp), %xmm0
	movq	136(%rbx), %rax
	movq	(%r13,%rax), %rax
	movq	(%r12,%rax), %rax
	testq	%rax, %rax
	movsd	-128(%rbp), %xmm2
	movsd	-144(%rbp), %xmm3
	movq	-152(%rbp), %r8
	je	L849
	testq	%r8, %r8
	js	L851
	cmpq	24(%rax), %r8
	jge	L851
	movq	32(%rax), %rax
	movq	-56(%rbp), %rdx
	movsd	(%rax,%rdx), %xmm1
L854:
	addsd	%xmm1, %xmm0
L849:
	movq	144(%rbx), %rcx
	movq	(%r13,%rcx), %rax
	movq	(%r12,%rax), %rax
	testq	%r15, %r15
	js	L855
	cmpq	24(%rax), %r15
	jge	L855
	movq	32(%rax), %rax
	movq	-64(%rbp), %rdx
	movsd	(%rdx,%rax), %xmm1
L858:
	mulsd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	addsd	-96(%rbp), %xmm2
	movsd	%xmm2, -96(%rbp)
L843:
	incq	%r14
	addq	$8, %r12
	cmpq	%r14, 64(%rbx)
	jle	L837
L839:
	cmpb	$0, 281(%rbx)
	movq	%r12, %rdx
	cmove	%r13, %rdx
	movq	152(%rbx), %rax
	movq	(%r13,%rax), %rax
	movq	(%rax,%rdx), %rdx
	movq	(%r13,%rcx), %rax
	cmpq	$0, (%rax,%r12)
	je	L843
	testq	%r15, %r15
	js	L845
	cmpq	24(%rdx), %r15
	jl	L865
L845:
	movapd	%xmm3, %xmm2
	jmp	L848
	.align 4,0x90
L855:
	movapd	%xmm3, %xmm1
	jmp	L858
	.align 4,0x90
L851:
	movapd	%xmm3, %xmm1
	jmp	L854
L837:
	movsd	-96(%rbp), %xmm0
	addq	$120, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
L860:
	xorpd	%xmm3, %xmm3
	jmp	L808
LFE78:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV19vGenerateTrajectoryEv
__ZN8MARKOVLV19vGenerateTrajectoryEv:
LFB83:
	pushq	%rbp
LCFI217:
	movq	%rsp, %rbp
LCFI218:
	pushq	%r15
LCFI219:
	pushq	%r14
LCFI220:
	pushq	%r13
LCFI221:
	pushq	%r12
LCFI222:
	pushq	%rbx
LCFI223:
	subq	$24, %rsp
LCFI224:
	movq	%rdi, %r12
	cmpq	$0, 288(%rdi)
	je	L990
L869:
	cmpq	$0, 296(%r12)
	je	L991
L870:
	cmpq	$0, 304(%r12)
	je	L992
L875:
L873:
	cmpq	$0, 312(%r12)
	je	L993
L878:
L876:
	cmpq	$0, 336(%r12)
	je	L994
L884:
L879:
	cmpq	$0, 344(%r12)
	je	L995
L890:
L885:
	movq	56(%r12), %rdx
	testq	%rdx, %rdx
	js	L996
L891:
	movq	32(%r12), %rax
	cmpq	%rdx, %rax
	jg	L893
	decq	%rax
	movq	%rax, 56(%r12)
L893:
	movq	288(%r12), %rax
	movq	24(%rax), %rdx
	salq	$3, %rdx
	movq	32(%rax), %rdi
	xorl	%esi, %esi
	call	_memset
	incq	320(%r12)
	movq	328(%r12), %r14
	movq	56(%r12), %rbx
	movq	48(%r12), %rax
	cmpq	%rax, %rbx
	jge	L895
	leaq	0(,%rbx,8), %r13
	leaq	8(%r12), %r15
	xorpd	%xmm3, %xmm3
L897:
	movq	%r15, %rdi
	movsd	%xmm3, -64(%rbp)
	call	__Z4ran2Pl
	cvtss2sd	%xmm0, %xmm0
	movq	64(%r12), %rdx
	xorl	%r8d, %r8d
	testq	%rdx, %rdx
	movsd	-64(%rbp), %xmm3
	jle	L900
	leaq	0(,%r14,8), %rdi
	movq	144(%r12), %rax
	movq	(%rax,%rdi), %rsi
	testq	%rbx, %rbx
	jns	L901
	xorl	%ecx, %ecx
	xorpd	%xmm1, %xmm1
	jmp	L903
	.align 4,0x90
L997:
	incq	%rcx
	cmpq	%rdx, %rcx
	je	L900
L903:
	cmpq	$0, (%rsi,%rcx,8)
	je	L904
	xorpd	%xmm2, %xmm2
	addsd	%xmm2, %xmm1
	movl	$1, %r8d
L904:
	ucomisd	%xmm0, %xmm1
	jbe	L997
L906:
	movq	288(%r12), %rax
	testq	%rbx, %rbx
	js	L915
	cmpq	24(%rax), %rbx
	jge	L915
	movq	32(%rax), %rax
	movq	%r14, (%rax,%r13)
L915:
	testb	%r8b, %r8b
	jne	L918
	movq	%r14, %rcx
	movq	%rdi, %rsi
L920:
	leaq	0(,%rcx,8), %rax
	cmpb	$0, 281(%r12)
	cmove	%rdi, %rax
	movq	152(%r12), %rdx
	movq	(%rdx,%rdi), %rdx
	movq	(%rdx,%rax), %rax
	xorpd	%xmm2, %xmm2
	testq	%rax, %rax
	je	L926
	testq	%rbx, %rbx
	js	L927
	cmpq	24(%rax), %rbx
	jge	L927
	movq	32(%rax), %rax
	movsd	(%rax,%r13), %xmm2
L926:
	movq	312(%r12), %rax
	testq	%rbx, %rbx
	js	L930
	cmpq	24(%rax), %rbx
	jge	L930
	movq	32(%rax), %rax
	movsd	%xmm2, (%rax,%r13)
L930:
	movq	136(%r12), %rax
	movq	(%rax,%rdi), %rax
	movq	(%rax,%rsi), %rax
	xorpd	%xmm1, %xmm1
	testq	%rax, %rax
	je	L935
	testq	%rbx, %rbx
	js	L936
	cmpq	24(%rax), %rbx
	jge	L936
	movq	32(%rax), %rax
	movsd	(%rax,%r13), %xmm1
L935:
	movq	128(%r12), %rax
	movq	(%rax,%rdi), %rax
	xorpd	%xmm0, %xmm0
	testq	%rax, %rax
	je	L941
	testq	%rbx, %rbx
	js	L942
	cmpq	24(%rax), %rbx
	jge	L942
	movq	32(%rax), %rax
	movsd	(%rax,%r13), %xmm0
L941:
	movq	296(%r12), %rax
	testq	%rbx, %rbx
	js	L945
	mulsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	cmpq	24(%rax), %rbx
	jge	L947
	movq	32(%rax), %rax
	movsd	%xmm1, (%rax,%r13)
L947:
	movq	336(%r12), %rax
	cmpq	8(%rax), %rbx
	jge	L945
	testq	%r14, %r14
	js	L945
	cmpq	16(%rax), %r14
	jge	L945
	movq	40(%rax), %rax
	addq	(%rax,%r13), %rdi
	addsd	(%rdi), %xmm1
	movsd	%xmm1, (%rdi)
	.align 4,0x90
L945:
	incq	%rbx
	movq	48(%r12), %rax
	addq	$8, %r13
	movq	%rcx, %r14
	cmpq	%rbx, %rax
	jg	L897
	movq	56(%r12), %rbx
L895:
	leaq	-1(%rax), %rsi
	cmpq	%rbx, %rsi
	jl	L973
	leaq	-8(,%rax,8), %rdi
	xorpd	%xmm2, %xmm2
	movapd	%xmm2, %xmm3
	jmp	L954
L998:
	movapd	%xmm3, %xmm0
L962:
	mulsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm2
	movq	304(%r12), %rax
	cmpq	24(%rax), %rsi
	jge	L964
	movq	32(%rax), %rax
	movsd	%xmm2, (%rax,%rdi)
L964:
	movq	288(%r12), %rax
	cmpq	24(%rax), %rsi
	jl	L965
	xorl	%edx, %edx
	movl	$1, %eax
L966:
	movq	344(%r12), %rcx
	cmpq	8(%rcx), %rsi
	jge	L960
	testb	%al, %al
	je	L960
	cmpq	16(%rcx), %rdx
	jge	L960
	movq	40(%rcx), %rax
	salq	$3, %rdx
	addq	(%rax,%rdi), %rdx
	movsd	(%rdx), %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%rdx)
	.align 4,0x90
L960:
	decq	%rsi
	subq	$8, %rdi
	cmpq	%rsi, 56(%r12)
	jg	L973
L954:
	movq	312(%r12), %rax
	testq	%rsi, %rsi
	js	L955
	movapd	%xmm3, %xmm1
	cmpq	24(%rax), %rsi
	jge	L959
	movq	32(%rax), %rax
	movsd	(%rax,%rdi), %xmm1
L959:
	movq	296(%r12), %rax
	cmpq	24(%rax), %rsi
	jge	L998
	movq	32(%rax), %rax
	movsd	(%rax,%rdi), %xmm0
	jmp	L962
L901:
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	movapd	%xmm3, %xmm2
L908:
	movq	(%rsi,%rcx,8), %rax
	testq	%rax, %rax
	je	L909
	movapd	%xmm3, %xmm1
	cmpq	24(%rax), %rbx
	jge	L913
	movq	32(%rax), %rax
	movsd	(%rax,%r13), %xmm1
L913:
	addsd	%xmm1, %xmm2
	movl	$1, %r8d
L909:
	ucomisd	%xmm0, %xmm2
	ja	L906
	incq	%rcx
	cmpq	%rdx, %rcx
	jne	L908
L900:
	leaq	-1(%rdx), %rcx
	leaq	0(,%r14,8), %rdi
	jmp	L906
L918:
	leaq	0(,%rcx,8), %rsi
	jmp	L920
L927:
	xorpd	%xmm2, %xmm2
	jmp	L926
L936:
	xorpd	%xmm1, %xmm1
	jmp	L935
L942:
	xorpd	%xmm0, %xmm0
	jmp	L941
L965:
	movq	32(%rax), %rax
	movq	(%rax,%rdi), %rdx
	movq	%rdx, %rax
	notq	%rax
	shrq	$63, %rax
	jmp	L966
L973:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
L955:
	mulsd	%xmm3, %xmm2
	addsd	%xmm3, %xmm2
	jmp	L960
L996:
	movq	$0, 56(%r12)
	xorl	%edx, %edx
	jmp	L891
L995:
	movl	$48, %edi
LEHB25:
	call	__Znwm
LEHE25:
	movq	%rax, %rbx
	movq	64(%r12), %r14
	movq	32(%r12), %r13
	movq	%r13, %rdi
	imulq	%r14, %rdi
	salq	$3, %rdi
LEHB26:
	call	__Znam
	movq	%rax, 32(%rbx)
	leaq	0(,%r13,8), %rdi
	call	__Znam
LEHE26:
	movq	%rax, 40(%rbx)
	movq	32(%rbx), %rdi
	movq	%rdi, %rdx
	testq	%r13, %r13
	jle	L887
	leaq	0(,%r14,8), %rsi
	xorl	%ecx, %ecx
L889:
	movq	40(%rbx), %rax
	movq	%rdx, (%rax,%rcx,8)
	addq	%rsi, %rdx
	incq	%rcx
	cmpq	%r13, %rcx
	jne	L889
	movq	32(%rbx), %rdi
L887:
	movq	%r13, 8(%rbx)
	movq	%r14, 16(%rbx)
	movq	$0, 24(%rbx)
	movq	$0, (%rbx)
	imulq	%r13, %r14
	leaq	0(,%r14,8), %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%rbx, 344(%r12)
	jmp	L885
L990:
	movl	$40, %edi
LEHB27:
	call	__Znwm
LEHE27:
	movq	%rax, %rbx
	movq	32(%r12), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB28:
	call	__Znam
LEHE28:
	movq	%rax, %rdi
	movq	%rax, 32(%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, (%rbx)
	movq	24(%rbx), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%rbx, 288(%r12)
	cmpq	$0, 296(%r12)
	jne	L870
L991:
	movl	$40, %edi
LEHB29:
	call	__Znwm
LEHE29:
	movq	%rax, %rbx
	movq	32(%r12), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB30:
	call	__Znam
LEHE30:
	movq	%rax, %rdi
	movq	%rax, 32(%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, (%rbx)
	movq	24(%rbx), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%rbx, 296(%r12)
	cmpq	$0, 304(%r12)
	jne	L873
L992:
	movl	$40, %edi
LEHB31:
	call	__Znwm
LEHE31:
	movq	%rax, %rbx
	movq	32(%r12), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB32:
	call	__Znam
LEHE32:
	movq	%rax, %rdi
	movq	%rax, 32(%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, (%rbx)
	movq	24(%rbx), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%rbx, 304(%r12)
	cmpq	$0, 312(%r12)
	jne	L876
L993:
	movl	$40, %edi
LEHB33:
	call	__Znwm
LEHE33:
	movq	%rax, %rbx
	movq	32(%r12), %rdi
	movq	%rdi, 24(%rax)
	salq	$3, %rdi
LEHB34:
	call	__Znam
LEHE34:
	movq	%rax, %rdi
	movq	%rax, 32(%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, (%rbx)
	movq	24(%rbx), %rdx
	salq	$3, %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%rbx, 312(%r12)
	cmpq	$0, 336(%r12)
	jne	L879
L994:
	movl	$48, %edi
LEHB35:
	call	__Znwm
LEHE35:
	movq	%rax, %rbx
	movq	64(%r12), %r14
	movq	32(%r12), %r13
	movq	%r13, %rdi
	imulq	%r14, %rdi
	salq	$3, %rdi
LEHB36:
	call	__Znam
	movq	%rax, 32(%rbx)
	leaq	0(,%r13,8), %rdi
	call	__Znam
LEHE36:
	movq	%rax, 40(%rbx)
	movq	32(%rbx), %rdi
	movq	%rdi, %rdx
	testq	%r13, %r13
	jle	L881
	leaq	0(,%r14,8), %rsi
	xorl	%ecx, %ecx
L883:
	movq	40(%rbx), %rax
	movq	%rdx, (%rax,%rcx,8)
	addq	%rsi, %rdx
	incq	%rcx
	cmpq	%r13, %rcx
	jne	L883
	movq	32(%rbx), %rdi
L881:
	movq	%r13, 8(%rbx)
	movq	%r14, 16(%rbx)
	movq	$0, 24(%rbx)
	movq	$0, (%rbx)
	imulq	%r13, %r14
	leaq	0(,%r14,8), %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%rbx, 336(%r12)
	jmp	L879
L974:
L989:
	movq	%rax, %r12
L872:
	movq	%rbx, %rdi
	call	__ZdlPv
	movq	%r12, %rdi
LEHB37:
	call	__Unwind_Resume
LEHE37:
L975:
	jmp	L989
L976:
	jmp	L989
L977:
	jmp	L989
L978:
	jmp	L989
L979:
	jmp	L989
LFE83:
	.section __TEXT,__gcc_except_tab
GCC_except_table5:
LLSDA83:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0xa9,0x1
	.set L$set$60,LEHB25-LFB83
	.long L$set$60
	.set L$set$61,LEHE25-LEHB25
	.long L$set$61
	.long	0x0
	.byte	0x0
	.set L$set$62,LEHB26-LFB83
	.long L$set$62
	.set L$set$63,LEHE26-LEHB26
	.long L$set$63
	.set L$set$64,L974-LFB83
	.long L$set$64
	.byte	0x0
	.set L$set$65,LEHB27-LFB83
	.long L$set$65
	.set L$set$66,LEHE27-LEHB27
	.long L$set$66
	.long	0x0
	.byte	0x0
	.set L$set$67,LEHB28-LFB83
	.long L$set$67
	.set L$set$68,LEHE28-LEHB28
	.long L$set$68
	.set L$set$69,L979-LFB83
	.long L$set$69
	.byte	0x0
	.set L$set$70,LEHB29-LFB83
	.long L$set$70
	.set L$set$71,LEHE29-LEHB29
	.long L$set$71
	.long	0x0
	.byte	0x0
	.set L$set$72,LEHB30-LFB83
	.long L$set$72
	.set L$set$73,LEHE30-LEHB30
	.long L$set$73
	.set L$set$74,L978-LFB83
	.long L$set$74
	.byte	0x0
	.set L$set$75,LEHB31-LFB83
	.long L$set$75
	.set L$set$76,LEHE31-LEHB31
	.long L$set$76
	.long	0x0
	.byte	0x0
	.set L$set$77,LEHB32-LFB83
	.long L$set$77
	.set L$set$78,LEHE32-LEHB32
	.long L$set$78
	.set L$set$79,L977-LFB83
	.long L$set$79
	.byte	0x0
	.set L$set$80,LEHB33-LFB83
	.long L$set$80
	.set L$set$81,LEHE33-LEHB33
	.long L$set$81
	.long	0x0
	.byte	0x0
	.set L$set$82,LEHB34-LFB83
	.long L$set$82
	.set L$set$83,LEHE34-LEHB34
	.long L$set$83
	.set L$set$84,L976-LFB83
	.long L$set$84
	.byte	0x0
	.set L$set$85,LEHB35-LFB83
	.long L$set$85
	.set L$set$86,LEHE35-LEHB35
	.long L$set$86
	.long	0x0
	.byte	0x0
	.set L$set$87,LEHB36-LFB83
	.long L$set$87
	.set L$set$88,LEHE36-LEHB36
	.long L$set$88
	.set L$set$89,L975-LFB83
	.long L$set$89
	.byte	0x0
	.set L$set$90,LEHB37-LFB83
	.long L$set$90
	.set L$set$91,LEHE37-LEHB37
	.long L$set$91
	.long	0x0
	.byte	0x0
	.text
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV10dGetMeanDKElll
__ZN8MARKOVLV10dGetMeanDKElll:
LFB88:
	pushq	%rbp
LCFI225:
	movq	%rsp, %rbp
LCFI226:
	movq	%rbx, -32(%rbp)
LCFI227:
	movq	%r12, -24(%rbp)
LCFI228:
	movq	%r13, -16(%rbp)
LCFI229:
	movq	%r14, -8(%rbp)
LCFI230:
	subq	$32, %rsp
LCFI231:
	movq	%rdi, %rbx
	movq	%rsi, %r13
	movq	%rdx, %r14
	movq	%rcx, %r12
	xorpd	%xmm0, %xmm0
	testq	%rcx, %rcx
	jne	L1013
	jmp	L1002
	.align 4,0x90
L1011:
	movq	%rbx, %rdi
	call	__ZN8MARKOVLV19vGenerateTrajectoryEv
L1013:
	movq	320(%rbx), %rcx
	cmpq	%rcx, %r12
	jg	L1011
	movq	344(%rbx), %rax
	testq	%r13, %r13
	js	L1005
	cmpq	8(%rax), %r13
	jl	L1014
L1005:
	xorpd	%xmm1, %xmm1
L1009:
	cvtsi2sdq	%rcx, %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
L1002:
	movq	(%rsp), %rbx
	movq	8(%rsp), %r12
	movq	16(%rsp), %r13
	movq	24(%rsp), %r14
	leave
	ret
L1014:
	testq	%r14, %r14
	js	L1005
	cmpq	16(%rax), %r14
	jge	L1005
	movq	40(%rax), %rax
	movq	(%rax,%r13,8), %rax
	movsd	(%rax,%r14,8), %xmm1
	jmp	L1009
LFE88:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV10dGetMeanCFElll
__ZN8MARKOVLV10dGetMeanCFElll:
LFB87:
	pushq	%rbp
LCFI232:
	movq	%rsp, %rbp
LCFI233:
	movq	%rbx, -32(%rbp)
LCFI234:
	movq	%r12, -24(%rbp)
LCFI235:
	movq	%r13, -16(%rbp)
LCFI236:
	movq	%r14, -8(%rbp)
LCFI237:
	subq	$32, %rsp
LCFI238:
	movq	%rdi, %rbx
	movq	%rsi, %r13
	movq	%rdx, %r14
	movq	%rcx, %r12
	xorpd	%xmm0, %xmm0
	testq	%rcx, %rcx
	jne	L1029
	jmp	L1018
	.align 4,0x90
L1027:
	movq	%rbx, %rdi
	call	__ZN8MARKOVLV19vGenerateTrajectoryEv
L1029:
	movq	320(%rbx), %rcx
	cmpq	%rcx, %r12
	jg	L1027
	movq	336(%rbx), %rax
	testq	%r13, %r13
	js	L1021
	cmpq	8(%rax), %r13
	jl	L1030
L1021:
	xorpd	%xmm1, %xmm1
L1025:
	cvtsi2sdq	%rcx, %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
L1018:
	movq	(%rsp), %rbx
	movq	8(%rsp), %r12
	movq	16(%rsp), %r13
	movq	24(%rsp), %r14
	leave
	ret
L1030:
	testq	%r14, %r14
	js	L1021
	cmpq	16(%rax), %r14
	jge	L1021
	movq	40(%rax), %rax
	movq	(%rax,%r13,8), %rax
	movsd	(%rax,%r14,8), %xmm1
	jmp	L1025
LFE87:
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV6dGetCFElll
__ZN8MARKOVLV6dGetCFElll:
LFB73:
	pushq	%rbp
LCFI239:
	movq	%rsp, %rbp
LCFI240:
	pushq	%r15
LCFI241:
	pushq	%r14
LCFI242:
	pushq	%r13
LCFI243:
	pushq	%r12
LCFI244:
	pushq	%rbx
LCFI245:
	subq	$72, %rsp
LCFI246:
	movq	%rdi, %r12
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	%rcx, -112(%rbp)
	movq	64(%rdi), %rdx
	cmpq	-104(%rbp), %rdx
	jle	L1032
	cmpq	$0, -104(%rbp)
	js	L1032
	cmpq	%rcx, %rdx
	jle	L1032
	testq	%rcx, %rcx
	js	L1032
	cmpq	$0, 264(%rdi)
	jle	L1035
	movq	240(%rdi), %rax
	movq	-104(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rsi, %rsi
	js	L1032
	cmpq	8(%rax), %rsi
	jl	L1138
L1032:
	xorpd	%xmm0, %xmm0
L1041:
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
L1138:
	cmpq	16(%rax), %rcx
	jge	L1032
	movq	40(%rax), %rax
	movq	(%rax,%rsi,8), %rax
	movsd	(%rax,%rcx,8), %xmm0
	jmp	L1041
L1035:
	jne	L1042
	movl	$48, %edi
LEHB38:
	call	__Znwm
LEHE38:
	movq	%rax, %r15
	movq	64(%r12), %r13
	movq	32(%r12), %rbx
	movq	%rbx, %rdi
	imulq	%r13, %rdi
	salq	$3, %rdi
LEHB39:
	call	__Znam
	movq	%rax, 32(%r15)
	leaq	0(,%rbx,8), %rdi
	call	__Znam
LEHE39:
	movq	%rax, 40(%r15)
	movq	32(%r15), %rdi
	movq	%rdi, %rdx
	testq	%rbx, %rbx
	jle	L1044
	leaq	0(,%r13,8), %rsi
	xorl	%ecx, %ecx
L1046:
	movq	40(%r15), %rax
	movq	%rdx, (%rax,%rcx,8)
	addq	%rsi, %rdx
	incq	%rcx
	cmpq	%rbx, %rcx
	jne	L1046
	movq	32(%r15), %rdi
L1044:
	movq	%rbx, 8(%r15)
	movq	%r13, 16(%r15)
	movq	$1, 24(%r15)
	movq	$0, (%r15)
	imulq	%rbx, %r13
	leaq	0(,%r13,8), %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%r15, 120(%r12)
	movq	240(%r12), %rax
	movq	%r15, (%rax)
	cmpq	$1, 64(%r12)
	jle	L1137
	movq	$1, -88(%rbp)
	movq	$2, -64(%rbp)
	movq	$8, -56(%rbp)
L1049:
	movl	$48, %edi
LEHB40:
	call	__Znwm
LEHE40:
	movq	%rax, %rbx
	movq	64(%r12), %r14
	movq	32(%r12), %r13
	movq	%r13, %rdi
	imulq	%r14, %rdi
	salq	$3, %rdi
LEHB41:
	call	__Znam
	movq	%rax, 32(%rbx)
	leaq	0(,%r13,8), %rdi
	call	__Znam
LEHE41:
	movq	%rax, 40(%rbx)
	movq	32(%rbx), %rdi
	movq	%rdi, %rdx
	testq	%r13, %r13
	jle	L1050
	leaq	0(,%r14,8), %rsi
	xorl	%ecx, %ecx
	.align 4,0x90
L1052:
	movq	40(%rbx), %rax
	movq	%rdx, (%rax,%rcx,8)
	addq	%rsi, %rdx
	incq	%rcx
	cmpq	%r13, %rcx
	jne	L1052
	movq	32(%rbx), %rdi
L1050:
	movq	%r13, 8(%rbx)
	movq	%r14, 16(%rbx)
	movq	-88(%rbp), %rax
	movq	%rax, 24(%rbx)
	movq	$0, (%rbx)
	imulq	%r13, %r14
	leaq	0(,%r14,8), %rdx
	xorl	%esi, %esi
	call	_memset
	movq	%rbx, (%r15)
	movq	240(%r12), %rax
	movq	-56(%rbp), %rdx
	movq	%rbx, (%rax,%rdx)
	movq	(%r15), %r15
	movq	-64(%rbp), %rdi
	movq	%rdi, -88(%rbp)
	incq	%rdi
	movq	%rdi, -64(%rbp)
	addq	$8, %rdx
	movq	%rdx, -56(%rbp)
	movq	-88(%rbp), %rax
	cmpq	%rax, 64(%r12)
	jg	L1049
L1137:
	movq	64(%r12), %rdx
L1042:
	leaq	0(,%rdx,8), %rdi
LEHB42:
	call	__Znam
	movq	%rax, %r15
	movq	64(%r12), %rdi
	salq	$3, %rdi
	call	__Znam
	movq	%rax, %r14
	movq	64(%r12), %rax
	testq	%rax, %rax
	jle	L1054
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
L1056:
	leaq	0(,%rax,8), %rdx
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	_memset
	movq	-80(%rbp), %rdx
	movabsq	$4607182418800017408, %rax
	movq	%rax, (%r15,%rdx,8)
	movq	56(%r12), %rbx
	cmpq	48(%r12), %rbx
	jge	L1119
	leaq	0(,%rbx,8), %r13
	movq	64(%r12), %rdx
L1059:
	salq	$3, %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	_memset
	movq	96(%r12), %rcx
	testq	%rcx, %rcx
	jne	L1120
	jmp	L1060
	.align 4,0x90
L1139:
	movq	32(%rcx), %rax
	movsd	(%rax,%r13), %xmm1
L1075:
	leaq	0(,%r8,8), %rdx
	leaq	(%rdx,%r14), %rax
	movapd	%xmm1, %xmm0
	mulsd	(%rsi,%r15), %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movq	136(%r12), %rax
	movq	(%rsi,%rax), %rax
	movq	(%rax,%rdx), %rax
	xorpd	%xmm0, %xmm0
	testq	%rax, %rax
	je	L1078
	testq	%rbx, %rbx
	js	L1079
	cmpq	%rbx, 24(%rax)
	jle	L1079
	movq	32(%rax), %rax
	movsd	(%rax,%r13), %xmm0
	.align 4,0x90
L1078:
	movq	240(%r12), %rax
	movq	-72(%rbp), %rdx
	movq	(%rax,%rdx), %rax
	testq	%rbx, %rbx
	js	L1082
	cmpq	8(%rax), %rbx
	jge	L1082
	testq	%rdi, %rdi
	js	L1082
	cmpq	16(%rax), %rdi
	jge	L1082
	movq	40(%rax), %rax
	addq	(%rax,%r13), %rsi
	mulsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm1
	addsd	(%rsi), %xmm1
	movsd	%xmm1, (%rsi)
	.align 4,0x90
L1082:
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	L1060
L1120:
	movq	8(%rcx), %rdi
	movq	16(%rcx), %r8
	cmpb	$0, 281(%r12)
	movq	%r8, %rax
	cmove	%rdi, %rax
	leaq	0(,%rdi,8), %rsi
	movq	152(%r12), %rdx
	movq	(%rdx,%rsi), %rdx
	movq	(%rdx,%rax,8), %rax
	xorpd	%xmm2, %xmm2
	testq	%rax, %rax
	je	L1068
	testq	%rbx, %rbx
	js	L1069
	cmpq	%rbx, 24(%rax)
	jle	L1069
	movq	32(%rax), %rax
	movsd	(%rax,%r13), %xmm2
	.align 4,0x90
L1068:
	testq	%rbx, %rbx
	js	L1072
	cmpq	%rbx, 24(%rcx)
	jg	L1139
L1072:
	xorpd	%xmm1, %xmm1
	jmp	L1075
	.align 4,0x90
L1079:
	xorpd	%xmm0, %xmm0
	jmp	L1078
	.align 4,0x90
L1069:
	xorpd	%xmm2, %xmm2
	jmp	L1068
L1060:
	movq	64(%r12), %rdx
	testq	%rdx, %rdx
	jle	L1086
	testq	%rbx, %rbx
	jns	L1088
	xorl	%eax, %eax
	.align 4,0x90
L1090:
	incq	%rax
	cmpq	%rax, %rdx
	jg	L1090
L1091:
	testq	%rbx, %rbx
	jns	L1102
	xorl	%eax, %eax
	.align 4,0x90
L1104:
	incq	%rax
	cmpq	%rdx, %rax
	jl	L1104
L1105:
	testq	%rdx, %rdx
	jle	L1086
	xorl	%edx, %edx
	.align 4,0x90
L1111:
	movq	(%r14,%rdx,8), %rax
	movq	%rax, (%r15,%rdx,8)
	incq	%rdx
	cmpq	%rdx, 64(%r12)
	jg	L1111
	movq	64(%r12), %rdx
L1086:
	incq	%rbx
	addq	$8, %r13
	cmpq	%rbx, 48(%r12)
	jg	L1059
L1057:
	incq	-80(%rbp)
	movq	%rdx, %rax
	addq	$8, -72(%rbp)
	cmpq	-80(%rbp), %rdx
	jg	L1056
L1054:
	movq	%r15, %rdi
	call	__ZdlPv
	movq	%r14, %rdi
	call	__ZdlPv
	movq	64(%r12), %rax
	movq	%rax, 264(%r12)
	movq	240(%r12), %rax
	movq	-104(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	cmpq	$0, -96(%rbp)
	js	L1032
	movq	-96(%rbp), %rdi
	cmpq	8(%rax), %rdi
	jge	L1032
	cmpq	$0, -112(%rbp)
	js	L1032
	movq	-112(%rbp), %rdx
	cmpq	16(%rax), %rdx
	jge	L1032
	movq	40(%rax), %rax
	movq	(%rax,%rdi,8), %rax
	movsd	(%rax,%rdx,8), %xmm0
	jmp	L1041
L1119:
	movq	64(%r12), %rdx
	jmp	L1057
L1102:
	xorl	%ecx, %ecx
L1106:
	leaq	0(,%rcx,8), %rsi
	movsd	(%r15,%rcx,8), %xmm0
	movq	240(%r12), %rax
	movq	-72(%rbp), %rdi
	movq	(%rax,%rdi), %rax
	cmpq	8(%rax), %rbx
	jge	L1107
	cmpq	16(%rax), %rcx
	jge	L1107
	movq	40(%rax), %rax
	addq	(%rax,%r13), %rsi
	mulsd	(%rsi), %xmm0
	movsd	%xmm0, (%rsi)
	movq	64(%r12), %rdx
L1107:
	incq	%rcx
	cmpq	%rcx, %rdx
	jg	L1106
	jmp	L1105
L1118:
	movq	%rax, %r12
L1048:
	movq	%r15, %rdi
	call	__ZdlPv
	movq	%r12, %rdi
	call	__Unwind_Resume
L1088:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
L1092:
	movq	128(%r12), %rax
	movq	(%rax,%rsi), %rax
	xorpd	%xmm0, %xmm0
	testq	%rax, %rax
	je	L1095
	cmpq	24(%rax), %rbx
	jge	L1095
	movq	32(%rax), %rax
	movsd	(%rax,%r13), %xmm0
L1095:
	movq	240(%r12), %rax
	movq	-72(%rbp), %rdi
	movq	(%rax,%rdi), %rax
	cmpq	8(%rax), %rbx
	jge	L1098
	cmpq	16(%rax), %rcx
	jge	L1098
	movq	40(%rax), %rax
	movq	(%rax,%r13), %rdx
	leaq	(%rsi,%rdx), %rax
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movq	64(%r12), %rdx
L1098:
	incq	%rcx
	addq	$8, %rsi
	cmpq	%rcx, %rdx
	jg	L1092
	testq	%rdx, %rdx
	jg	L1091
	jmp	L1086
L1117:
	movq	%rax, %r12
L1053:
	movq	%rbx, %rdi
	call	__ZdlPv
	movq	%r12, %rdi
	call	__Unwind_Resume
LEHE42:
LFE73:
	.section __TEXT,__gcc_except_tab
GCC_except_table6:
LLSDA73:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$92,LEHB38-LFB73
	.long L$set$92
	.set L$set$93,LEHE38-LEHB38
	.long L$set$93
	.long	0x0
	.byte	0x0
	.set L$set$94,LEHB39-LFB73
	.long L$set$94
	.set L$set$95,LEHE39-LEHB39
	.long L$set$95
	.set L$set$96,L1118-LFB73
	.long L$set$96
	.byte	0x0
	.set L$set$97,LEHB40-LFB73
	.long L$set$97
	.set L$set$98,LEHE40-LEHB40
	.long L$set$98
	.long	0x0
	.byte	0x0
	.set L$set$99,LEHB41-LFB73
	.long L$set$99
	.set L$set$100,LEHE41-LEHB41
	.long L$set$100
	.set L$set$101,L1117-LFB73
	.long L$set$101
	.byte	0x0
	.set L$set$102,LEHB42-LFB73
	.long L$set$102
	.set L$set$103,LEHE42-LEHB42
	.long L$set$103
	.long	0x0
	.byte	0x0
	.text
	.cstring
LC14:
	.ascii "\\section{%s} \12\0"
LC15:
	.ascii "\\subsection{General} \12\0"
LC16:
	.ascii "General\0"
	.align 3
LC17:
	.ascii "%% ---------- Start Tabular  %s ---------- \12\0"
LC18:
	.ascii "\\par \\bigskip      \12\0"
LC19:
	.ascii "ll\0"
LC20:
	.ascii "\\begin{tabular}{%s} \12\0"
LC21:
	.ascii "Max. Time  & %ld \\\\ \12\0"
LC22:
	.ascii "Nr States  & %ld \\\\ \12\0"
LC23:
	.ascii "Start Time & %ld \\\\ \12\0"
LC24:
	.ascii "Stop Time  & %ld \\\\ \12\0"
LC25:
	.ascii "\\end{tabular}       \12\0"
	.align 3
LC26:
	.ascii "%% ---------- End Tabular ---------- \12\0"
	.align 3
LC27:
	.ascii "\\newpage \\subsection{Probabilites} \12\0"
LC30:
	.ascii "Prob.\0"
LC31:
	.ascii "lrrrrrrrr\0"
LC32:
	.ascii "From \0"
LC33:
	.ascii " & \0"
LC34:
	.ascii "\\\\ \12\0"
LC35:
	.ascii "To \0"
LC36:
	.ascii "%d \0"
	.align 3
LC37:
	.ascii "\\newpage \\subsection{Technical Interest} \12\0"
LC38:
	.ascii "Disc.\0"
	.align 3
LC39:
	.ascii "\\newpage \\subsection{Prenummerando Benefits} \12\0"
LC40:
	.ascii "Pre\0"
	.align 3
LC41:
	.ascii "\\newpage \\subsection{Postnummerando Benefits} \12\0"
LC42:
	.ascii "Post\0"
	.align 3
LC43:
	.ascii "\\newpage \\subsection{Mathematical Reserves} \12\0"
LC44:
	.ascii "MR.\0"
LC45:
	.ascii "Moment \0"
LC46:
	.ascii "State \0"
	.align 3
LC47:
	.ascii "\\newpage \\subsection{Cash Flows} \12\0"
LC48:
	.ascii "From\0"
LC49:
	.ascii "\\end{small}\12\0"
LC50:
	.ascii "\\end{document}\12\0"
LC51:
	.ascii "\0"
LC13:
	.ascii "\\makebox[1.5cm][r]{%ld}\0"
	.text
	.align 1,0x90
	.align 4,0x90
.globl __ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb
__ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb:
LFB91:
	pushq	%rbp
LCFI247:
	movq	%rsp, %rbp
LCFI248:
	pushq	%r15
LCFI249:
	pushq	%r14
LCFI250:
	pushq	%r13
LCFI251:
	pushq	%r12
LCFI252:
	pushq	%rbx
LCFI253:
	subq	$856, %rsp
LCFI254:
	movq	%rdi, %r15
	movq	%rsi, %r12
	movq	%rcx, %r13
	movb	%dl, -713(%rbp)
	movb	%r8b, -714(%rbp)
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rdx, -56(%rbp)
	xorl	%edx, %edx
	leaq	-512(%rbp), %rbx
	movw	$264, %dx
	leaq	__ZZN8MARKOVLV9vPrintTeXEP7__sFILEbPcbE4C.94(%rip), %rsi
	movq	%rbx, %rdi
	call	_memcpy
	movq	LC13(%rip), %rax
	movq	%rax, -80(%rbp)
	movq	8+LC13(%rip), %rax
	movq	%rax, -72(%rbp)
	movq	16+LC13(%rip), %rax
	movq	%rax, -64(%rbp)
	movzbl	280(%r15), %ecx
	movb	%cl, -689(%rbp)
	movb	$1, 280(%r15)
	movq	_strPrgVersionStatic(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	cmpb	$0, -713(%rbp)
	je	L1141
	movq	-512(%rbp), %rsi
	cmpb	$0, (%rsi)
	je	L1141
L1144:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	8(%rbx), %rsi
	addq	$8, %rbx
	cmpb	$0, (%rsi)
	jne	L1144
L1141:
	movq	%r13, %rdx
	leaq	LC14(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	LC15(%rip), %rdi
	call	_fwrite
	leaq	LC16(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC19(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	32(%r15), %rdx
	leaq	LC21(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	64(%r15), %rdx
	leaq	LC22(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	48(%r15), %rdx
	leaq	LC23(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	56(%r15), %rdx
	leaq	LC24(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$36, %edx
	movl	$1, %esi
	leaq	LC27(%rip), %rdi
	call	_fwrite
	cmpq	$0, 64(%r15)
	jle	L1145
	movq	$0, -704(%rbp)
	movl	$1, %r13d
	movq	$0, -672(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -880(%rbp)
	leaq	-240(%rbp), %rdx
	movq	%rdx, -888(%rbp)
	leaq	-80(%rbp), %rcx
	movq	%rcx, -896(%rbp)
L1147:
	movq	$0, -712(%rbp)
L1148:
	testb	%r13b, %r13b
	je	L1149
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1152
	jmp	L1151
	.align 4,0x90
L1153:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1151
L1152:
	xorpd	%xmm0, %xmm0
	movq	-712(%rbp), %rcx
	movq	-672(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV7dSetPijEllld
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1153
	movl	$1, %eax
L1156:
	cmpb	$0, -714(%rbp)
	jne	L1157
	testb	%al, %al
	je	L1159
L1157:
	movq	-672(%rbp), %rdx
	movq	-704(%rbp), %rax
	movq	%rdx, -176(%rbp,%rax,8)
	movq	-712(%rbp), %rcx
	movq	%rcx, -240(%rbp,%rax,8)
	incq	%rax
	movq	%rax, -704(%rbp)
	cmpq	$7, %rax
	jle	L1159
	xorl	%r13d, %r13d
L1159:
	incq	-712(%rbp)
	movq	64(%r15), %rax
	cmpq	-712(%rbp), %rax
	jg	L1148
	testq	%rax, %rax
	jg	L1802
L1203:
	cmpq	$0, -704(%rbp)
	jle	L1145
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%r14d, %r14d
	leaq	-176(%rbp), %rcx
	movq	%rcx, -744(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, -752(%rbp)
L1206:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rcx
	movq	(%rcx,%r14,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r14
	cmpq	-704(%rbp), %r14
	jne	L1206
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	leaq	-240(%rbp), %rax
	movq	%rax, -736(%rbp)
L1208:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1208
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r13
	cmpq	%r13, 48(%r15)
	jl	L1210
	movq	$0, -664(%rbp)
L1212:
	movq	%r13, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	xorl	%ebx, %ebx
	jmp	L1213
L1216:
	ucomisd	LC8(%rip), %xmm0
	ja	L1219
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1221
L1219:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1218:
	incq	%rbx
	cmpq	%rbx, %r14
	je	L1803
L1213:
	movq	-736(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV7dSetPijEllld
	ucomisd	LC5(%rip), %xmm0
	ja	L1214
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1216
L1214:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1213
L1803:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, -664(%rbp)
	jg	L1224
	incq	-664(%rbp)
	movq	48(%r15), %rax
L1226:
	incq	%r13
	cmpq	%rax, %r13
	jle	L1212
L1210:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
L1145:
	movq	%r12, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	LC37(%rip), %rdi
	call	_fwrite
	movq	64(%r15), %rdx
	movq	%rdx, -688(%rbp)
	testq	%rdx, %rdx
	jle	L1233
	movq	$0, -584(%rbp)
	movq	$0, -616(%rbp)
	movl	$1, %r13d
	leaq	-176(%rbp), %rax
	movq	%rax, -856(%rbp)
	leaq	-240(%rbp), %rcx
	movq	%rcx, -864(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, -872(%rbp)
L1235:
	xorl	%eax, %eax
	movq	-616(%rbp), %rcx
	incq	%rcx
	movq	%rcx, -728(%rbp)
	cmpb	$0, 281(%r15)
	jne	L1238
	movq	%rcx, -688(%rbp)
	movq	-616(%rbp), %rax
L1238:
	cmpq	-688(%rbp), %rax
	jge	L1239
	movq	%rax, -544(%rbp)
L1241:
	testb	%r13b, %r13b
	je	L1242
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1245
	jmp	L1244
	.align 4,0x90
L1246:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1244
L1245:
	xorpd	%xmm0, %xmm0
	movq	-544(%rbp), %rcx
	movq	-616(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV8dSetDiscEllld
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1246
	movl	$1, %eax
L1249:
	cmpb	$0, -714(%rbp)
	jne	L1250
	testb	%al, %al
	je	L1252
L1250:
	movq	-616(%rbp), %rcx
	movq	-584(%rbp), %rdx
	movq	%rcx, -176(%rbp,%rdx,8)
	movq	-544(%rbp), %rax
	movq	%rax, -240(%rbp,%rdx,8)
	incq	%rdx
	movq	%rdx, -584(%rbp)
	cmpq	$7, %rdx
	jle	L1252
	xorl	%r13d, %r13d
L1252:
	incq	-544(%rbp)
	movq	-688(%rbp), %rcx
	cmpq	%rcx, -544(%rbp)
	jne	L1241
	movq	64(%r15), %rdx
L1239:
	movq	-728(%rbp), %rax
	movq	%rax, -616(%rbp)
	movq	%rdx, -688(%rbp)
	cmpq	%rax, %rdx
	jg	L1235
	cmpq	$0, -584(%rbp)
	jle	L1233
	leaq	LC38(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%r14d, %r14d
	leaq	-176(%rbp), %rdx
	movq	%rdx, -744(%rbp)
	leaq	-80(%rbp), %rcx
	movq	%rcx, -752(%rbp)
L1297:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rax
	movq	(%rax,%r14,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r14
	cmpq	-584(%rbp), %r14
	jne	L1297
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	leaq	-240(%rbp), %rdx
	movq	%rdx, -736(%rbp)
L1299:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1299
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r13
	cmpq	48(%r15), %r13
	jg	L1301
	movq	$0, -640(%rbp)
L1303:
	movq	%r13, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	xorl	%ebx, %ebx
	jmp	L1304
L1307:
	ucomisd	LC8(%rip), %xmm0
	ja	L1310
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1312
L1310:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1309:
	incq	%rbx
	cmpq	%rbx, %r14
	je	L1804
L1304:
	movq	-736(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV8dSetDiscEllld
	ucomisd	LC5(%rip), %xmm0
	ja	L1305
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1307
L1305:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1304
L1804:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, -640(%rbp)
	jg	L1315
	incq	-640(%rbp)
	movq	48(%r15), %rax
L1317:
	incq	%r13
	cmpq	%rax, %r13
	jle	L1303
L1301:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
L1233:
	movq	%r12, %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	LC39(%rip), %rdi
	call	_fwrite
	cmpq	$0, 64(%r15)
	jle	L1324
	movq	$0, -576(%rbp)
	movq	$0, -608(%rbp)
	movl	$1, %r13d
	leaq	-176(%rbp), %rax
	movq	%rax, -832(%rbp)
	leaq	-240(%rbp), %rdx
	movq	%rdx, -840(%rbp)
	leaq	-80(%rbp), %rcx
	movq	%rcx, -848(%rbp)
L1326:
	testb	%r13b, %r13b
	je	L1327
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1330
	jmp	L1329
	.align 4,0x90
L1331:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1329
L1330:
	xorpd	%xmm0, %xmm0
	movq	-608(%rbp), %rcx
	movq	%rcx, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV7dSetPreEllld
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1331
	movl	$1, %eax
L1334:
	cmpb	$0, -714(%rbp)
	jne	L1335
	testb	%al, %al
	je	L1337
L1335:
	movq	-608(%rbp), %rdx
	movq	-576(%rbp), %rax
	movq	%rdx, -176(%rbp,%rax,8)
	movq	%rdx, -240(%rbp,%rax,8)
	incq	%rax
	movq	%rax, -576(%rbp)
	cmpq	$7, %rax
	jle	L1337
	xorl	%r13d, %r13d
L1337:
	incq	-608(%rbp)
	movq	-608(%rbp), %rdx
	cmpq	%rdx, 64(%r15)
	jg	L1326
	cmpq	$0, -576(%rbp)
	jle	L1324
	leaq	LC40(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%r14d, %r14d
	leaq	-176(%rbp), %rcx
	movq	%rcx, -744(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, -752(%rbp)
L1382:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rcx
	movq	(%rcx,%r14,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r14
	cmpq	-576(%rbp), %r14
	jne	L1382
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	leaq	-240(%rbp), %rax
	movq	%rax, -736(%rbp)
L1384:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1384
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r13
	cmpq	48(%r15), %r13
	jg	L1386
	movq	$0, -656(%rbp)
L1388:
	movq	%r13, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	xorl	%ebx, %ebx
	jmp	L1389
L1392:
	ucomisd	LC8(%rip), %xmm0
	ja	L1395
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1397
L1395:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1394:
	incq	%rbx
	cmpq	%rbx, %r14
	je	L1805
L1389:
	movq	-736(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV7dSetPreEllld
	ucomisd	LC5(%rip), %xmm0
	ja	L1390
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1392
L1390:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1389
L1805:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, -656(%rbp)
	jg	L1400
	incq	-656(%rbp)
	movq	48(%r15), %rax
L1402:
	incq	%r13
	cmpq	%rax, %r13
	jle	L1388
L1386:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
L1324:
	movq	%r12, %rcx
	movl	$47, %edx
	movl	$1, %esi
	leaq	LC41(%rip), %rdi
	call	_fwrite
	cmpq	$0, 64(%r15)
	jle	L1409
	movq	$0, -568(%rbp)
	movl	$1, %r13d
	movq	$0, -680(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -808(%rbp)
	leaq	-240(%rbp), %rdx
	movq	%rdx, -816(%rbp)
	leaq	-80(%rbp), %rcx
	movq	%rcx, -824(%rbp)
L1411:
	movq	$0, -536(%rbp)
L1412:
	testb	%r13b, %r13b
	je	L1413
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1416
	jmp	L1415
	.align 4,0x90
L1417:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1415
L1416:
	xorpd	%xmm0, %xmm0
	movq	-536(%rbp), %rcx
	movq	-680(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV8dSetPostEllld
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1417
	movl	$1, %eax
L1420:
	cmpb	$0, -714(%rbp)
	jne	L1421
	testb	%al, %al
	je	L1423
L1421:
	movq	-680(%rbp), %rdx
	movq	-568(%rbp), %rax
	movq	%rdx, -176(%rbp,%rax,8)
	movq	-536(%rbp), %rcx
	movq	%rcx, -240(%rbp,%rax,8)
	incq	%rax
	movq	%rax, -568(%rbp)
	cmpq	$7, %rax
	jle	L1423
	xorl	%r13d, %r13d
L1423:
	incq	-536(%rbp)
	movq	64(%r15), %rax
	cmpq	-536(%rbp), %rax
	jg	L1412
	testq	%rax, %rax
	jg	L1806
L1467:
	cmpq	$0, -568(%rbp)
	jle	L1409
	leaq	LC42(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%r14d, %r14d
	leaq	-176(%rbp), %rcx
	movq	%rcx, -744(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, -752(%rbp)
L1470:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rcx
	movq	(%rcx,%r14,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r14
	cmpq	-568(%rbp), %r14
	jne	L1470
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	leaq	-240(%rbp), %rax
	movq	%rax, -736(%rbp)
L1472:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1472
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r13
	cmpq	48(%r15), %r13
	jg	L1474
	movq	$0, -632(%rbp)
L1476:
	movq	%r13, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	xorl	%ebx, %ebx
	jmp	L1477
L1480:
	ucomisd	LC8(%rip), %xmm0
	ja	L1483
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1485
L1483:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1482:
	incq	%rbx
	cmpq	%rbx, %r14
	je	L1807
L1477:
	movq	-736(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV8dSetPostEllld
	ucomisd	LC5(%rip), %xmm0
	ja	L1478
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1480
L1478:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1477
L1807:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, -632(%rbp)
	jg	L1488
	incq	-632(%rbp)
	movq	48(%r15), %rax
L1490:
	incq	%r13
	cmpq	%r13, %rax
	jge	L1476
L1474:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
L1409:
	movq	%r12, %rcx
	movl	$45, %edx
	movl	$1, %esi
	leaq	LC43(%rip), %rdi
	call	_fwrite
	cmpq	$0, 256(%r15)
	jle	L1497
	movq	$0, -560(%rbp)
	movl	$1, %eax
	movq	$1, -600(%rbp)
	leaq	-176(%rbp), %rdx
	movq	%rdx, -784(%rbp)
	leaq	-240(%rbp), %rcx
	movq	%rcx, -792(%rbp)
	leaq	-80(%rbp), %rdx
	movq	%rdx, -800(%rbp)
L1499:
	movq	$0, -528(%rbp)
	cmpq	$0, 64(%r15)
	jg	L1501
	jmp	L1538
L1808:
	movq	-600(%rbp), %rdx
	movq	-560(%rbp), %rcx
	movq	%rdx, -176(%rbp,%rcx,8)
	movq	-528(%rbp), %rdx
	movq	%rdx, -240(%rbp,%rcx,8)
	incq	%rcx
	movq	%rcx, -560(%rbp)
	cmpq	$7, %rcx
	jle	L1504
	xorl	%eax, %eax
L1504:
	incq	-528(%rbp)
	movq	-528(%rbp), %rcx
	cmpq	%rcx, 64(%r15)
	jle	L1538
L1501:
	testb	%al, %al
	jne	L1808
	leaq	LC44(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	LC45(%rip), %rdi
	call	_fwrite
	cmpq	$0, -560(%rbp)
	jle	L1506
	xorl	%r13d, %r13d
L1508:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-784(%rbp), %rcx
	movq	(%rcx,%r13,8), %rdx
	movq	-800(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-560(%rbp), %r13
	jne	L1508
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	LC46(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1510:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-792(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-800(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1510
	jmp	L1511
L1151:
	xorl	%eax, %eax
	jmp	L1156
L1149:
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -704(%rbp)
	jle	L1161
	xorl	%r13d, %r13d
L1163:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-880(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-896(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-704(%rbp), %r13
	jne	L1163
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1165:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-888(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-896(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1165
	jmp	L1166
L1244:
	xorl	%eax, %eax
	jmp	L1249
L1242:
	leaq	LC38(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -584(%rbp)
	jle	L1254
	xorl	%r13d, %r13d
L1256:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-856(%rbp), %rcx
	movq	(%rcx,%r13,8), %rdx
	movq	-872(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-584(%rbp), %r13
	jne	L1256
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1258:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-864(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-872(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1258
	jmp	L1259
L1415:
	xorl	%eax, %eax
	jmp	L1420
L1413:
	leaq	LC42(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -568(%rbp)
	jle	L1425
	xorl	%r13d, %r13d
L1427:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-808(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-824(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-568(%rbp), %r13
	jne	L1427
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1429:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-816(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-824(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1429
	jmp	L1430
L1538:
	incq	-600(%rbp)
	movq	-600(%rbp), %rdx
	cmpq	%rdx, 256(%r15)
	jge	L1499
	cmpq	$0, -560(%rbp)
	jle	L1497
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	LC45(%rip), %rdi
	call	_fwrite
	xorl	%r14d, %r14d
	leaq	-176(%rbp), %rcx
	movq	%rcx, -744(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, -752(%rbp)
L1541:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rcx
	movq	(%rcx,%r14,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r14
	cmpq	-560(%rbp), %r14
	jne	L1541
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	LC46(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	leaq	-240(%rbp), %rax
	movq	%rax, -736(%rbp)
L1543:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1543
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r13
	cmpq	48(%r15), %r13
	jg	L1545
	movq	$0, -648(%rbp)
L1547:
	movq	%r13, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	xorl	%ebx, %ebx
	jmp	L1548
L1551:
	ucomisd	LC8(%rip), %xmm0
	ja	L1554
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1556
L1554:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1553:
	incq	%rbx
	cmpq	%rbx, %r14
	je	L1809
L1548:
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-736(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV6dGetDKElll
	ucomisd	LC5(%rip), %xmm0
	ja	L1549
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1551
L1549:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1548
L1809:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, -648(%rbp)
	jg	L1559
	incq	-648(%rbp)
	movq	48(%r15), %rax
L1561:
	incq	%r13
	cmpq	%r13, %rax
	jge	L1547
L1545:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
L1497:
	movq	%r12, %rcx
	movl	$34, %edx
	movl	$1, %esi
	leaq	LC47(%rip), %rdi
	call	_fwrite
	cmpq	$0, 264(%r15)
	jle	L1568
	movq	$0, -552(%rbp)
	movl	$1, %r13d
	movq	$0, -592(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -760(%rbp)
	leaq	-240(%rbp), %rdx
	movq	%rdx, -768(%rbp)
	leaq	-80(%rbp), %rcx
	movq	%rcx, -776(%rbp)
L1570:
	movq	$0, -520(%rbp)
	cmpq	$0, 64(%r15)
	jle	L1626
L1572:
	testb	%r13b, %r13b
	je	L1573
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1576
	jmp	L1575
	.align 4,0x90
L1577:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1575
L1576:
	movq	-520(%rbp), %rcx
	movq	-592(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV6dGetCFElll
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1577
	movl	$1, %eax
L1580:
	cmpb	$0, -714(%rbp)
	jne	L1581
	testb	%al, %al
	je	L1583
L1581:
	movq	-592(%rbp), %rdx
	movq	-552(%rbp), %rax
	movq	%rdx, -176(%rbp,%rax,8)
	movq	-520(%rbp), %rcx
	movq	%rcx, -240(%rbp,%rax,8)
	incq	%rax
	movq	%rax, -552(%rbp)
	cmpq	$7, %rax
	jle	L1583
	xorl	%r13d, %r13d
L1583:
	incq	-520(%rbp)
	movq	-520(%rbp), %rcx
	cmpq	%rcx, 64(%r15)
	jg	L1572
L1626:
	incq	-592(%rbp)
	movq	-592(%rbp), %rax
	cmpq	%rax, 264(%r15)
	jg	L1570
	cmpq	$0, -552(%rbp)
	jle	L1568
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%r14d, %r14d
	leaq	-176(%rbp), %rdx
	movq	%rdx, -744(%rbp)
	leaq	-80(%rbp), %rcx
	movq	%rcx, -752(%rbp)
L1629:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rax
	movq	(%rax,%r14,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r14
	cmpq	-552(%rbp), %r14
	jne	L1629
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	leaq	-240(%rbp), %rdx
	movq	%rdx, -736(%rbp)
L1631:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1631
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r13
	cmpq	48(%r15), %r13
	jg	L1633
	movq	$0, -624(%rbp)
L1635:
	movq	%r13, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	xorl	%ebx, %ebx
	jmp	L1636
L1639:
	ucomisd	LC8(%rip), %xmm0
	ja	L1642
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1644
L1642:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1641:
	incq	%rbx
	cmpq	%rbx, %r14
	je	L1810
L1636:
	movq	-736(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV6dGetCFElll
	ucomisd	LC5(%rip), %xmm0
	ja	L1637
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1639
L1637:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1636
L1810:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, -624(%rbp)
	jg	L1647
	incq	-624(%rbp)
	movq	48(%r15), %rax
L1649:
	incq	%r13
	cmpq	%rax, %r13
	jle	L1635
L1633:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
L1568:
	cmpb	$0, -713(%rbp)
	je	L1656
	leaq	LC49(%rip), %rax
	movq	%rax, -112(%rbp)
	leaq	LC50(%rip), %rdx
	movq	%rdx, -104(%rbp)
	leaq	LC51(%rip), %rcx
	movq	%rcx, -96(%rbp)
	movq	%rax, %rsi
	cmpb	$0, LC49(%rip)
	je	L1656
	leaq	-112(%rbp), %rbx
L1659:
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	8(%rbx), %rsi
	addq	$8, %rbx
	cmpb	$0, (%rsi)
	jne	L1659
L1656:
	movzbl	-689(%rbp), %eax
	movb	%al, 280(%r15)
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdx
	movq	-56(%rbp), %rcx
	xorq	(%rdx), %rcx
	jne	L1811
	addq	$856, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	leave
	ret
L1575:
	xorl	%eax, %eax
	jmp	L1580
L1573:
	leaq	LC48(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	LC45(%rip), %rdi
	call	_fwrite
	cmpq	$0, -552(%rbp)
	jle	L1585
	xorl	%r13d, %r13d
L1587:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-760(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-776(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-552(%rbp), %r13
	jne	L1587
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1589:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-768(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-776(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r13, %rbx
	jne	L1589
	jmp	L1590
L1644:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1641
L1556:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1553
L1485:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1482
L1397:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1394
L1312:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1309
L1221:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1218
L1329:
	xorl	%eax, %eax
	jmp	L1334
L1315:
	cmpq	48(%r15), %r13
	jne	L1318
	incq	-640(%rbp)
	movq	%r13, %rax
	jmp	L1317
L1224:
	cmpq	48(%r15), %r13
	jne	L1227
	incq	-664(%rbp)
	movq	%r13, %rax
	jmp	L1226
L1400:
	cmpq	48(%r15), %r13
	jne	L1403
	incq	-656(%rbp)
	movq	%r13, %rax
	jmp	L1402
L1647:
	cmpq	48(%r15), %r13
	jne	L1650
	incq	-624(%rbp)
	movq	%r13, %rax
	jmp	L1649
L1488:
	cmpq	48(%r15), %r13
	jne	L1491
	incq	-632(%rbp)
	movq	%r13, %rax
	jmp	L1490
L1559:
	cmpq	48(%r15), %r13
	jne	L1562
	incq	-648(%rbp)
	movq	%r13, %rax
	jmp	L1561
L1327:
	leaq	LC40(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -576(%rbp)
	jle	L1339
	xorl	%r13d, %r13d
L1341:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-832(%rbp), %rcx
	movq	(%rcx,%r13,8), %rdx
	movq	-848(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-576(%rbp), %r13
	jne	L1341
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1343:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-840(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-848(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1343
	jmp	L1344
L1254:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1259:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r14
	cmpq	48(%r15), %r14
	jg	L1260
	xorl	%r13d, %r13d
L1262:
	movq	%r14, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	cmpq	$0, -584(%rbp)
	jle	L1263
	xorl	%ebx, %ebx
	jmp	L1265
	.align 4,0x90
L1268:
	ucomisd	LC8(%rip), %xmm0
	ja	L1271
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1273
L1271:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1270:
	incq	%rbx
	cmpq	-584(%rbp), %rbx
	je	L1263
	.align 4,0x90
L1265:
	movq	-864(%rbp), %rdx
	movq	(%rdx,%rbx,8), %rcx
	movq	-856(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV8dSetDiscEllld
	ucomisd	LC5(%rip), %xmm0
	ja	L1266
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1268
L1266:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	-584(%rbp), %rbx
	jne	L1265
L1263:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, %r13
	jg	L1275
	incq	%r13
	movq	48(%r15), %rax
L1277:
	incq	%r14
	cmpq	%rax, %r14
	jle	L1262
L1260:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1287
	jmp	L1286
	.align 4,0x90
L1288:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1286
L1287:
	xorpd	%xmm0, %xmm0
	movq	-544(%rbp), %rcx
	movq	-616(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV8dSetDiscEllld
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1288
	movl	$1, %eax
L1291:
	cmpb	$0, -714(%rbp)
	jne	L1292
	movq	$0, -584(%rbp)
	movl	$1, %r13d
	testb	%al, %al
	je	L1252
L1292:
	movq	-616(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-544(%rbp), %rdx
	movq	%rdx, -240(%rbp)
	movq	$1, -584(%rbp)
	movl	$1, %r13d
	jmp	L1252
L1273:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1270
L1275:
	cmpq	48(%r15), %r14
	jne	L1278
	incq	%r13
	movq	%r14, %rax
	jmp	L1277
L1278:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC38(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -584(%rbp)
	jle	L1280
	xorl	%r13d, %r13d
	.align 4,0x90
L1282:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-856(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-872(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-584(%rbp), %r13
	jne	L1282
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	.align 4,0x90
L1284:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-864(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-872(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1284
	jmp	L1285
L1286:
	xorl	%eax, %eax
	jmp	L1291
L1280:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1285:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	xorl	%r13d, %r13d
	jmp	L1277
L1161:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1166:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r14
	cmpq	48(%r15), %r14
	jg	L1167
	xorl	%r13d, %r13d
L1169:
	movq	%r14, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	cmpq	$0, -704(%rbp)
	jle	L1170
	xorl	%ebx, %ebx
	jmp	L1172
	.align 4,0x90
L1175:
	ucomisd	LC8(%rip), %xmm0
	ja	L1178
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1180
L1178:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1177:
	incq	%rbx
	cmpq	-704(%rbp), %rbx
	je	L1170
	.align 4,0x90
L1172:
	movq	-888(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-880(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV7dSetPijEllld
	ucomisd	LC5(%rip), %xmm0
	ja	L1173
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1175
L1173:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	-704(%rbp), %rbx
	jne	L1172
L1170:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, %r13
	jg	L1182
	incq	%r13
	movq	48(%r15), %rax
L1184:
	incq	%r14
	cmpq	%r14, %rax
	jge	L1169
L1167:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1194
	jmp	L1193
	.align 4,0x90
L1195:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1193
L1194:
	xorpd	%xmm0, %xmm0
	movq	-712(%rbp), %rcx
	movq	-672(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV7dSetPijEllld
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1195
	movl	$1, %eax
L1198:
	cmpb	$0, -714(%rbp)
	jne	L1199
	movq	$0, -704(%rbp)
	movl	$1, %r13d
	testb	%al, %al
	je	L1159
L1199:
	movq	-672(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-712(%rbp), %rdx
	movq	%rdx, -240(%rbp)
	movq	$1, -704(%rbp)
	movl	$1, %r13d
	jmp	L1159
L1180:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1177
L1182:
	cmpq	48(%r15), %r14
	jne	L1185
	incq	%r13
	movq	%r14, %rax
	jmp	L1184
L1185:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -704(%rbp)
	jle	L1187
	xorl	%r13d, %r13d
	.align 4,0x90
L1189:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-880(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-896(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-704(%rbp), %r13
	jne	L1189
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	.align 4,0x90
L1191:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-888(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-896(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1191
	jmp	L1192
L1193:
	xorl	%eax, %eax
	jmp	L1198
L1187:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1192:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	xorl	%r13d, %r13d
	jmp	L1184
L1585:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1590:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r14
	cmpq	48(%r15), %r14
	jg	L1591
	xorl	%r13d, %r13d
L1593:
	movq	%r14, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	cmpq	$0, -552(%rbp)
	jle	L1594
	xorl	%ebx, %ebx
	jmp	L1596
	.align 4,0x90
L1599:
	ucomisd	LC8(%rip), %xmm0
	ja	L1602
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1604
L1602:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1601:
	incq	%rbx
	cmpq	-552(%rbp), %rbx
	je	L1594
	.align 4,0x90
L1596:
	movq	-768(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-760(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV6dGetCFElll
	ucomisd	LC5(%rip), %xmm0
	ja	L1597
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1599
L1597:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	-552(%rbp), %rbx
	jne	L1596
L1594:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, %r13
	jg	L1606
	incq	%r13
	movq	48(%r15), %rax
L1608:
	incq	%r14
	cmpq	%rax, %r14
	jle	L1593
L1591:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1618
	jmp	L1617
	.align 4,0x90
L1619:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1617
L1618:
	movq	-520(%rbp), %rcx
	movq	-592(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV6dGetCFElll
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1619
	movl	$1, %eax
L1622:
	cmpb	$0, -714(%rbp)
	jne	L1623
	movq	$0, -552(%rbp)
	movl	$1, %r13d
	testb	%al, %al
	je	L1583
L1623:
	movq	-592(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-520(%rbp), %rdx
	movq	%rdx, -240(%rbp)
	movq	$1, -552(%rbp)
	movl	$1, %r13d
	jmp	L1583
L1604:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1601
L1606:
	cmpq	48(%r15), %r14
	jne	L1609
	incq	%r13
	movq	%r14, %rax
	jmp	L1608
L1609:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -552(%rbp)
	jle	L1611
	xorl	%r13d, %r13d
	.align 4,0x90
L1613:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-760(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-776(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-552(%rbp), %r13
	jne	L1613
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	.align 4,0x90
L1615:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-768(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-776(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1615
	jmp	L1616
L1617:
	xorl	%eax, %eax
	jmp	L1622
L1611:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1616:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	xorl	%r13d, %r13d
	jmp	L1608
L1506:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	LC46(%rip), %rdi
	call	_fwrite
L1511:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r14
	cmpq	48(%r15), %r14
	jg	L1512
	xorl	%r13d, %r13d
L1514:
	movq	%r14, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	cmpq	$0, -560(%rbp)
	jle	L1515
	xorl	%ebx, %ebx
	jmp	L1517
	.align 4,0x90
L1520:
	ucomisd	LC8(%rip), %xmm0
	ja	L1523
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1525
L1523:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1522:
	incq	%rbx
	cmpq	-560(%rbp), %rbx
	je	L1515
	.align 4,0x90
L1517:
	movq	-784(%rbp), %rdx
	movq	(%rdx,%rbx,8), %rcx
	movq	-792(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV6dGetDKElll
	ucomisd	LC5(%rip), %xmm0
	ja	L1518
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1520
L1518:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	-560(%rbp), %rbx
	jne	L1517
L1515:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, %r13
	jg	L1527
	incq	%r13
	movq	48(%r15), %rax
L1529:
	incq	%r14
	cmpq	%rax, %r14
	jle	L1514
L1512:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	-600(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-528(%rbp), %rdx
	movq	%rdx, -240(%rbp)
	movq	$1, -560(%rbp)
	movl	$1, %eax
	jmp	L1504
L1525:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1522
L1527:
	cmpq	48(%r15), %r14
	jne	L1530
	incq	%r13
	movq	%r14, %rax
	jmp	L1529
L1530:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -560(%rbp)
	jle	L1532
	xorl	%r13d, %r13d
	.align 4,0x90
L1534:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-784(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-800(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-560(%rbp), %r13
	jne	L1534
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	.align 4,0x90
L1536:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-792(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-800(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r13, %rbx
	jne	L1536
	jmp	L1537
L1532:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1537:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	xorl	%r13d, %r13d
	jmp	L1529
L1425:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1430:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r14
	cmpq	48(%r15), %r14
	jg	L1431
	xorl	%r13d, %r13d
L1433:
	movq	%r14, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	cmpq	$0, -568(%rbp)
	jle	L1434
	xorl	%ebx, %ebx
	jmp	L1436
	.align 4,0x90
L1439:
	ucomisd	LC8(%rip), %xmm0
	ja	L1442
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1444
L1442:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1441:
	incq	%rbx
	cmpq	-568(%rbp), %rbx
	je	L1434
	.align 4,0x90
L1436:
	movq	-816(%rbp), %rax
	movq	(%rax,%rbx,8), %rcx
	movq	-808(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV8dSetPostEllld
	ucomisd	LC5(%rip), %xmm0
	ja	L1437
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1439
L1437:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	-568(%rbp), %rbx
	jne	L1436
L1434:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, %r13
	jg	L1446
	incq	%r13
	movq	48(%r15), %rax
L1448:
	incq	%r14
	cmpq	%r14, %rax
	jge	L1433
L1431:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1458
	jmp	L1457
	.align 4,0x90
L1459:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1457
L1458:
	xorpd	%xmm0, %xmm0
	movq	-536(%rbp), %rcx
	movq	-680(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV8dSetPostEllld
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1459
	movl	$1, %eax
L1462:
	cmpb	$0, -714(%rbp)
	jne	L1463
	movq	$0, -568(%rbp)
	movl	$1, %r13d
	testb	%al, %al
	je	L1423
L1463:
	movq	-680(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-536(%rbp), %rdx
	movq	%rdx, -240(%rbp)
	movq	$1, -568(%rbp)
	movl	$1, %r13d
	jmp	L1423
L1444:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1441
L1446:
	cmpq	48(%r15), %r14
	jne	L1449
	incq	%r13
	movq	%r14, %rax
	jmp	L1448
L1449:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC42(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -568(%rbp)
	jle	L1451
	xorl	%r13d, %r13d
	.align 4,0x90
L1453:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-808(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-824(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-568(%rbp), %r13
	jne	L1453
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
	.align 4,0x90
L1455:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-816(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-824(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1455
	jmp	L1456
L1457:
	xorl	%eax, %eax
	jmp	L1462
L1451:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1456:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	xorl	%r13d, %r13d
	jmp	L1448
L1318:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC38(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1320:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1320
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1322:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1322
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	movq	$0, -640(%rbp)
	jmp	L1317
L1403:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC40(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1405:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r14, %rbx
	jne	L1405
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1407:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r14, %rbx
	jne	L1407
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	movq	$0, -656(%rbp)
	jmp	L1402
L1491:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC42(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1493:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1493
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1495:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r14, %rbx
	jne	L1495
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	movq	$0, -632(%rbp)
	jmp	L1490
L1650:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1652:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1652
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1654:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r14, %rbx
	jne	L1654
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	movq	$0, -624(%rbp)
	jmp	L1649
L1227:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1229:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r14, %rbx
	jne	L1229
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1231:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r14, %rbx
	jne	L1231
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	movq	$0, -664(%rbp)
	jmp	L1226
L1562:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC30(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1564:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-744(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	L1564
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1566:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-736(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-752(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%r14, %rbx
	jne	L1566
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	movq	$0, -648(%rbp)
	jmp	L1561
L1339:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1344:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	56(%r15), %r14
	cmpq	48(%r15), %r14
	jg	L1345
	xorl	%r13d, %r13d
L1347:
	movq	%r14, %rdx
	leaq	LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	cmpq	$0, -576(%rbp)
	jle	L1348
	xorl	%ebx, %ebx
	jmp	L1350
L1353:
	ucomisd	LC8(%rip), %xmm0
	ja	L1356
	movsd	LC9(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1358
L1356:
	leaq	LC10(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
L1355:
	incq	%rbx
	cmpq	-576(%rbp), %rbx
	je	L1348
L1350:
	movq	-840(%rbp), %rdx
	movq	(%rdx,%rbx,8), %rcx
	movq	-832(%rbp), %rax
	movq	(%rax,%rbx,8), %rdx
	xorpd	%xmm0, %xmm0
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV7dSetPreEllld
	ucomisd	LC5(%rip), %xmm0
	ja	L1351
	movsd	LC6(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	L1353
L1351:
	leaq	LC7(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	incq	%rbx
	cmpq	-576(%rbp), %rbx
	jne	L1350
L1348:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	cmpq	$49, %r13
	jg	L1360
	incq	%r13
	movq	48(%r15), %rax
L1362:
	incq	%r14
	cmpq	%r14, %rax
	jge	L1347
L1345:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	56(%r15), %rbx
	cmpq	48(%r15), %rbx
	jle	L1372
	jmp	L1371
	.align 4,0x90
L1373:
	incq	%rbx
	cmpq	%rbx, 48(%r15)
	jl	L1371
L1372:
	xorpd	%xmm0, %xmm0
	movq	-608(%rbp), %rcx
	movq	%rcx, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	__ZN8MARKOVLV7dSetPreEllld
	andpd	LC28(%rip), %xmm0
	ucomisd	LC29(%rip), %xmm0
	jbe	L1373
	movl	$1, %eax
L1376:
	cmpb	$0, -714(%rbp)
	jne	L1377
	movq	$0, -576(%rbp)
	movl	$1, %r13d
	testb	%al, %al
	je	L1337
L1377:
	movq	-608(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	%rax, -240(%rbp)
	movq	$1, -576(%rbp)
	movl	$1, %r13d
	jmp	L1337
L1358:
	leaq	LC11(%rip), %rsi
	movq	%r12, %rdi
	movl	$1, %eax
	call	_fprintf
	jmp	L1355
L1360:
	cmpq	48(%r15), %r14
	jne	L1363
	incq	%r13
	movq	%r14, %rax
	jmp	L1362
L1363:
	movq	%r12, %rcx
	movl	$21, %edx
	movl	$1, %esi
	leaq	LC25(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC26(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	leaq	LC40(%rip), %rdx
	leaq	LC17(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	LC18(%rip), %rdi
	call	_fwrite
	leaq	LC31(%rip), %rdx
	leaq	LC20(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	movq	%r12, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	LC32(%rip), %rdi
	call	_fwrite
	cmpq	$0, -576(%rbp)
	jle	L1365
	xorl	%r13d, %r13d
L1367:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-832(%rbp), %rax
	movq	(%rax,%r13,8), %rdx
	movq	-848(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%r13
	cmpq	-576(%rbp), %r13
	jne	L1367
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
	xorl	%ebx, %ebx
L1369:
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC33(%rip), %rdi
	call	_fwrite
	movq	-840(%rbp), %rcx
	movq	(%rcx,%rbx,8), %rdx
	movq	-848(%rbp), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	_fprintf
	incq	%rbx
	cmpq	%rbx, %r13
	jne	L1369
	jmp	L1370
L1371:
	xorl	%eax, %eax
	jmp	L1376
L1365:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	%r12, %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	LC35(%rip), %rdi
	call	_fwrite
L1370:
	movq	%r12, %rcx
	movl	$4, %edx
	movl	$1, %esi
	leaq	LC34(%rip), %rdi
	call	_fwrite
	movq	48(%r15), %rax
	xorl	%r13d, %r13d
	jmp	L1362
L1802:
	incq	-672(%rbp)
	cmpq	-672(%rbp), %rax
	jg	L1147
	jmp	L1203
L1806:
	incq	-680(%rbp)
	cmpq	%rax, -680(%rbp)
	jl	L1411
	jmp	L1467
L1811:
	call	___stack_chk_fail
LFE91:
.globl _strPrgVersionStatic
	.cstring
	.align 3
LC52:
	.ascii "% This is omarkov V2.00 - Michael Koller 2011 \12\0"
	.data
	.align 3
_strPrgVersionStatic:
	.quad	LC52
	.cstring
	.align 3
LC53:
	.ascii "\\documentclass[11pt,a4paper]{article} \12\0"
	.align 3
LC54:
	.ascii "\\typeout{================================================================}\12\0"
	.align 3
LC55:
	.ascii "%%================================================================\12\0"
LC56:
	.ascii "%%\\usepackage{cl2emono}\12\0"
LC57:
	.ascii "%%\\usepackage{mkfoot}\12\0"
LC58:
	.ascii "\\usepackage[T1]{fontenc}%%\12\0"
	.align 3
LC59:
	.ascii "\\usepackage[ansinew]{inputenc,}%%\12\0"
LC60:
	.ascii "\\usepackage{a4}%%\12\0"
	.align 3
LC61:
	.ascii "\\usepackage{makeidx,multind,mathcomp}\12\0"
LC62:
	.ascii "\\usepackage{enumerate}%%\12\0"
LC63:
	.ascii "\\usepackage{color}%%\12\0"
	.align 3
LC64:
	.ascii "\\usepackage{amsfonts,amsmath,amssymb,amsthm,txfonts} %%%% txfonts hinzugef\\{u}gt 2.12.2002\12\0"
LC65:
	.ascii "\\usepackage{supertabular}%%\12\0"
	.align 3
LC66:
	.ascii "\\usepackage[pdftex]{graphicx}\12\0"
LC67:
	.ascii "\\usepackage[pdftex,\12\0"
	.align 3
LC68:
	.ascii "            colorlinks=true,            %% Schrift von Links in Farbe (true), sonst mit Rahmen (false)\12\0"
	.align 3
LC69:
	.ascii "            bookmarksnumbered=true,     %% Lesezeichen im pdf mit Nummerierung\12\0"
	.align 3
LC70:
	.ascii "            bookmarksopen=true,         %% \326ffnet die Lesezeichen vom pdf beim Start\12\0"
	.align 3
LC71:
	.ascii "            bookmarksopenlevel=0,       %% Default ist maxdim\12\0"
	.align 3
LC72:
	.ascii "            pdfstartview=FitH,          %% startet mit Seitenbreite\12\0"
	.align 3
LC73:
	.ascii "            linkcolor=blue,             %% Standard 'red'\12\0"
	.align 3
LC74:
	.ascii "            citecolor=blue,             %% Standard 'green'\12\0"
	.align 3
LC75:
	.ascii "            urlcolor=cyan,              %% Standard 'cyan'\12\0"
	.align 3
LC76:
	.ascii "            filecolor=blue,             %%\12\0"
	.align 3
LC77:
	.ascii "            plainpages=false,pdfpagelabels]{hyperref} %%\12\0"
	.align 3
LC78:
	.ascii "%%%%================================================================\12\0"
LC79:
	.ascii "\\parindent 0mm\12\0"
	.align 3
LC80:
	.ascii "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\12\0"
	.align 3
LC81:
	.ascii "%% Document generated by OMARKOV.cpp \12\0"
LC82:
	.ascii "\\begin{document}\12\0"
LC83:
	.ascii "\\begin{small} \12\0"
	.const_data
	.align 5
__ZZN8MARKOVLV9vPrintTeXEP7__sFILEbPcbE4C.94:
	.quad	LC53
	.quad	LC54
	.quad	LC55
	.quad	LC56
	.quad	LC57
	.quad	LC58
	.quad	LC59
	.quad	LC60
	.quad	LC61
	.quad	LC62
	.quad	LC63
	.quad	LC64
	.quad	LC65
	.quad	LC66
	.quad	LC55
	.quad	LC67
	.quad	LC68
	.quad	LC69
	.quad	LC70
	.quad	LC71
	.quad	LC72
	.quad	LC73
	.quad	LC74
	.quad	LC75
	.quad	LC76
	.quad	LC77
	.quad	LC78
	.quad	LC79
	.quad	LC80
	.quad	LC81
	.quad	LC82
	.quad	LC83
	.quad	LC51
.lcomm __ZZ4ran2PlE2iv,256,5
.lcomm __ZZ4ran2PlE2iy,8,3
	.data
	.align 3
__ZZ4ran2PlE5idum2:
	.quad	123456789
	.literal8
	.align 3
LC0:
	.long	178257927
	.long	1040187392
	.align 3
LC1:
	.long	3214103385
	.long	1072693247
	.literal4
	.align 2
LC2:
	.long	1065353214
	.literal8
	.align 3
LC3:
	.long	0
	.long	1072693248
	.align 3
LC4:
	.long	0
	.long	0
	.align 3
LC5:
	.long	0
	.long	1086556160
	.align 3
LC6:
	.long	0
	.long	-1060927488
	.align 3
LC8:
	.long	0
	.long	1079574528
	.align 3
LC9:
	.long	0
	.long	-1067909120
	.align 3
LC12:
	.long	0
	.long	-1074790400
	.literal16
	.align 4
LC28:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.literal8
	.align 3
LC29:
	.long	3654794683
	.long	1037794527
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$104,LECIE1-LSCIE1
	.long L$set$104
LSCIE1:
	.long	0x0
	.byte	0x1
	.ascii "zPLR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x7
	.byte	0x9b
	.long	___gxx_personality_v0+4@GOTPCREL
	.byte	0x10
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
.globl __Z4ran2Pl.eh
__Z4ran2Pl.eh:
LSFDE1:
	.set L$set$105,LEFDE1-LASFDE1
	.long L$set$105
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB21-.
	.set L$set$106,LFE21-LFB21
	.quad L$set$106
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$107,LCFI0-LFB21
	.long L$set$107
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$108,LCFI1-LCFI0
	.long L$set$108
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE1:
.globl __ZN9LV_VECTOR9dSetValueEld.eh
__ZN9LV_VECTOR9dSetValueEld.eh:
LSFDE3:
	.set L$set$109,LEFDE3-LASFDE3
	.long L$set$109
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB30-.
	.set L$set$110,LFE30-LFB30
	.quad L$set$110
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$111,LCFI2-LFB30
	.long L$set$111
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$112,LCFI3-LCFI2
	.long L$set$112
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE3:
.globl __ZN9LV_VECTOR9dAddValueEld.eh
__ZN9LV_VECTOR9dAddValueEld.eh:
LSFDE5:
	.set L$set$113,LEFDE5-LASFDE5
	.long L$set$113
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB31-.
	.set L$set$114,LFE31-LFB31
	.quad L$set$114
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$115,LCFI4-LFB31
	.long L$set$115
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$116,LCFI5-LCFI4
	.long L$set$116
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE5:
.globl __ZN9LV_VECTOR9dGetValueEl.eh
__ZN9LV_VECTOR9dGetValueEl.eh:
LSFDE7:
	.set L$set$117,LEFDE7-LASFDE7
	.long L$set$117
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB32-.
	.set L$set$118,LFE32-LFB32
	.quad L$set$118
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$119,LCFI6-LFB32
	.long L$set$119
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$120,LCFI7-LCFI6
	.long L$set$120
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE7:
.globl __ZN10ILV_VECTOR9lSetValueEll.eh
__ZN10ILV_VECTOR9lSetValueEll.eh:
LSFDE9:
	.set L$set$121,LEFDE9-LASFDE9
	.long L$set$121
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB40-.
	.set L$set$122,LFE40-LFB40
	.quad L$set$122
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$123,LCFI8-LFB40
	.long L$set$123
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$124,LCFI9-LCFI8
	.long L$set$124
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE9:
.globl __ZN10ILV_VECTOR9lAddValueEll.eh
__ZN10ILV_VECTOR9lAddValueEll.eh:
LSFDE11:
	.set L$set$125,LEFDE11-LASFDE11
	.long L$set$125
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB41-.
	.set L$set$126,LFE41-LFB41
	.quad L$set$126
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$127,LCFI10-LFB41
	.long L$set$127
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$128,LCFI11-LCFI10
	.long L$set$128
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE11:
.globl __ZN10ILV_VECTOR9lGetValueEl.eh
__ZN10ILV_VECTOR9lGetValueEl.eh:
LSFDE13:
	.set L$set$129,LEFDE13-LASFDE13
	.long L$set$129
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB42-.
	.set L$set$130,LFE42-LFB42
	.quad L$set$130
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$131,LCFI12-LFB42
	.long L$set$131
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$132,LCFI13-LCFI12
	.long L$set$132
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE13:
.globl __ZN9LV_MATRIX9dSetValueElld.eh
__ZN9LV_MATRIX9dSetValueElld.eh:
LSFDE15:
	.set L$set$133,LEFDE15-LASFDE15
	.long L$set$133
LASFDE15:
	.long	LASFDE15-EH_frame1
	.quad	LFB50-.
	.set L$set$134,LFE50-LFB50
	.quad L$set$134
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$135,LCFI14-LFB50
	.long L$set$135
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$136,LCFI15-LCFI14
	.long L$set$136
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE15:
.globl __ZN9LV_MATRIX9dAddValueElld.eh
__ZN9LV_MATRIX9dAddValueElld.eh:
LSFDE17:
	.set L$set$137,LEFDE17-LASFDE17
	.long L$set$137
LASFDE17:
	.long	LASFDE17-EH_frame1
	.quad	LFB51-.
	.set L$set$138,LFE51-LFB51
	.quad L$set$138
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$139,LCFI16-LFB51
	.long L$set$139
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$140,LCFI17-LCFI16
	.long L$set$140
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE17:
.globl __ZN9LV_MATRIX14dMultiplyValueElld.eh
__ZN9LV_MATRIX14dMultiplyValueElld.eh:
LSFDE19:
	.set L$set$141,LEFDE19-LASFDE19
	.long L$set$141
LASFDE19:
	.long	LASFDE19-EH_frame1
	.quad	LFB52-.
	.set L$set$142,LFE52-LFB52
	.quad L$set$142
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$143,LCFI18-LFB52
	.long L$set$143
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$144,LCFI19-LCFI18
	.long L$set$144
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE19:
.globl __ZN9LV_MATRIX9dGetValueEll.eh
__ZN9LV_MATRIX9dGetValueEll.eh:
LSFDE21:
	.set L$set$145,LEFDE21-LASFDE21
	.long L$set$145
LASFDE21:
	.long	LASFDE21-EH_frame1
	.quad	LFB53-.
	.set L$set$146,LFE53-LFB53
	.quad L$set$146
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$147,LCFI20-LFB53
	.long L$set$147
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$148,LCFI21-LCFI20
	.long L$set$148
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE21:
.globl __ZN8MARKOVLV11vSetGetDataEb.eh
__ZN8MARKOVLV11vSetGetDataEb.eh:
LSFDE23:
	.set L$set$149,LEFDE23-LASFDE23
	.long L$set$149
LASFDE23:
	.long	LASFDE23-EH_frame1
	.quad	LFB65-.
	.set L$set$150,LFE65-LFB65
	.quad L$set$150
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$151,LCFI22-LFB65
	.long L$set$151
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$152,LCFI23-LCFI22
	.long L$set$152
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE23:
.globl __ZN8MARKOVLV11lGetMaxTimeEv.eh
__ZN8MARKOVLV11lGetMaxTimeEv.eh:
LSFDE25:
	.set L$set$153,LEFDE25-LASFDE25
	.long L$set$153
LASFDE25:
	.long	LASFDE25-EH_frame1
	.quad	LFB74-.
	.set L$set$154,LFE74-LFB74
	.quad L$set$154
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$155,LCFI24-LFB74
	.long L$set$155
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$156,LCFI25-LCFI24
	.long L$set$156
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE25:
.globl __ZN8MARKOVLV12lGetNrStatesEv.eh
__ZN8MARKOVLV12lGetNrStatesEv.eh:
LSFDE27:
	.set L$set$157,LEFDE27-LASFDE27
	.long L$set$157
LASFDE27:
	.long	LASFDE27-EH_frame1
	.quad	LFB75-.
	.set L$set$158,LFE75-LFB75
	.quad L$set$158
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$159,LCFI26-LFB75
	.long L$set$159
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$160,LCFI27-LCFI26
	.long L$set$160
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE27:
.globl __ZN8MARKOVLV13lGetStartTimeEv.eh
__ZN8MARKOVLV13lGetStartTimeEv.eh:
LSFDE29:
	.set L$set$161,LEFDE29-LASFDE29
	.long L$set$161
LASFDE29:
	.long	LASFDE29-EH_frame1
	.quad	LFB76-.
	.set L$set$162,LFE76-LFB76
	.quad L$set$162
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$163,LCFI28-LFB76
	.long L$set$163
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$164,LCFI29-LCFI28
	.long L$set$164
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE29:
.globl __ZN8MARKOVLV12lGetStopTimeEv.eh
__ZN8MARKOVLV12lGetStopTimeEv.eh:
LSFDE31:
	.set L$set$165,LEFDE31-LASFDE31
	.long L$set$165
LASFDE31:
	.long	LASFDE31-EH_frame1
	.quad	LFB77-.
	.set L$set$166,LFE77-LFB77
	.quad L$set$166
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$167,LCFI30-LFB77
	.long L$set$167
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$168,LCFI31-LCFI30
	.long L$set$168
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE31:
.globl __ZN8MARKOVLV16lSetFolgezustandEll.eh
__ZN8MARKOVLV16lSetFolgezustandEll.eh:
LSFDE33:
	.set L$set$169,LEFDE33-LASFDE33
	.long L$set$169
LASFDE33:
	.long	LASFDE33-EH_frame1
	.quad	LFB81-.
	.set L$set$170,LFE81-LFB81
	.quad L$set$170
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$171,LCFI32-LFB81
	.long L$set$171
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$172,LCFI33-LCFI32
	.long L$set$172
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE33:
.globl __ZN8MARKOVLV13vSetInitStateEl.eh
__ZN8MARKOVLV13vSetInitStateEl.eh:
LSFDE35:
	.set L$set$173,LEFDE35-LASFDE35
	.long L$set$173
LASFDE35:
	.long	LASFDE35-EH_frame1
	.quad	LFB82-.
	.set L$set$174,LFE82-LFB82
	.quad L$set$174
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$175,LCFI34-LFB82
	.long L$set$175
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$176,LCFI35-LCFI34
	.long L$set$176
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE35:
.globl __ZN8MARKOVLV8vNewSeedEl.eh
__ZN8MARKOVLV8vNewSeedEl.eh:
LSFDE37:
	.set L$set$177,LEFDE37-LASFDE37
	.long L$set$177
LASFDE37:
	.long	LASFDE37-EH_frame1
	.quad	LFB89-.
	.set L$set$178,LFE89-LFB89
	.quad L$set$178
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$179,LCFI36-LFB89
	.long L$set$179
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$180,LCFI37-LCFI36
	.long L$set$180
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE37:
.globl __Z15vPrintTexNumberP7__sFILEd.eh
__Z15vPrintTexNumberP7__sFILEd.eh:
LSFDE39:
	.set L$set$181,LEFDE39-LASFDE39
	.long L$set$181
LASFDE39:
	.long	LASFDE39-EH_frame1
	.quad	LFB22-.
	.set L$set$182,LFE22-LFB22
	.quad L$set$182
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$183,LCFI38-LFB22
	.long L$set$183
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$184,LCFI39-LCFI38
	.long L$set$184
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE39:
.globl __ZN9LV_MATRIXD1Ev.eh
__ZN9LV_MATRIXD1Ev.eh:
LSFDE41:
	.set L$set$185,LEFDE41-LASFDE41
	.long L$set$185
LASFDE41:
	.long	LASFDE41-EH_frame1
	.quad	LFB48-.
	.set L$set$186,LFE48-LFB48
	.quad L$set$186
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$187,LCFI40-LFB48
	.long L$set$187
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$188,LCFI41-LCFI40
	.long L$set$188
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$189,LCFI43-LCFI41
	.long L$set$189
	.byte	0x83
	.byte	0x3
	.align 3
LEFDE41:
.globl __ZN9LV_MATRIXD2Ev.eh
__ZN9LV_MATRIXD2Ev.eh:
LSFDE43:
	.set L$set$190,LEFDE43-LASFDE43
	.long L$set$190
LASFDE43:
	.long	LASFDE43-EH_frame1
	.quad	LFB47-.
	.set L$set$191,LFE47-LFB47
	.quad L$set$191
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$192,LCFI44-LFB47
	.long L$set$192
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$193,LCFI45-LCFI44
	.long L$set$193
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$194,LCFI47-LCFI45
	.long L$set$194
	.byte	0x83
	.byte	0x3
	.align 3
LEFDE43:
.globl __ZN10ILV_VECTORD1Ev.eh
__ZN10ILV_VECTORD1Ev.eh:
LSFDE45:
	.set L$set$195,LEFDE45-LASFDE45
	.long L$set$195
LASFDE45:
	.long	LASFDE45-EH_frame1
	.quad	LFB38-.
	.set L$set$196,LFE38-LFB38
	.quad L$set$196
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$197,LCFI48-LFB38
	.long L$set$197
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$198,LCFI49-LCFI48
	.long L$set$198
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE45:
.globl __ZN10ILV_VECTORD2Ev.eh
__ZN10ILV_VECTORD2Ev.eh:
LSFDE47:
	.set L$set$199,LEFDE47-LASFDE47
	.long L$set$199
LASFDE47:
	.long	LASFDE47-EH_frame1
	.quad	LFB37-.
	.set L$set$200,LFE37-LFB37
	.quad L$set$200
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$201,LCFI50-LFB37
	.long L$set$201
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$202,LCFI51-LCFI50
	.long L$set$202
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE47:
.globl __ZN9LV_VECTORD1Ev.eh
__ZN9LV_VECTORD1Ev.eh:
LSFDE49:
	.set L$set$203,LEFDE49-LASFDE49
	.long L$set$203
LASFDE49:
	.long	LASFDE49-EH_frame1
	.quad	LFB28-.
	.set L$set$204,LFE28-LFB28
	.quad L$set$204
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$205,LCFI52-LFB28
	.long L$set$205
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$206,LCFI53-LCFI52
	.long L$set$206
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE49:
.globl __ZN9LV_VECTORD2Ev.eh
__ZN9LV_VECTORD2Ev.eh:
LSFDE51:
	.set L$set$207,LEFDE51-LASFDE51
	.long L$set$207
LASFDE51:
	.long	LASFDE51-EH_frame1
	.quad	LFB27-.
	.set L$set$208,LFE27-LFB27
	.quad L$set$208
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$209,LCFI54-LFB27
	.long L$set$209
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$210,LCFI55-LCFI54
	.long L$set$210
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE51:
.globl __ZN8MARKOVLVC2Elll.eh
__ZN8MARKOVLVC2Elll.eh:
LSFDE53:
	.set L$set$211,LEFDE53-LASFDE53
	.long L$set$211
LASFDE53:
	.long	LASFDE53-EH_frame1
	.quad	LFB55-.
	.set L$set$212,LFE55-LFB55
	.quad L$set$212
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$213,LCFI56-LFB55
	.long L$set$213
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$214,LCFI57-LCFI56
	.long L$set$214
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$215,LCFI59-LCFI57
	.long L$set$215
	.byte	0x83
	.byte	0x3
	.align 3
LEFDE53:
.globl __ZN8MARKOVLVC1Elll.eh
__ZN8MARKOVLVC1Elll.eh:
LSFDE55:
	.set L$set$216,LEFDE55-LASFDE55
	.long L$set$216
LASFDE55:
	.long	LASFDE55-EH_frame1
	.quad	LFB56-.
	.set L$set$217,LFE56-LFB56
	.quad L$set$217
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$218,LCFI60-LFB56
	.long L$set$218
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$219,LCFI61-LCFI60
	.long L$set$219
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE55:
.globl __ZN9LV_MATRIX6vResetEv.eh
__ZN9LV_MATRIX6vResetEv.eh:
LSFDE57:
	.set L$set$220,LEFDE57-LASFDE57
	.long L$set$220
LASFDE57:
	.long	LASFDE57-EH_frame1
	.quad	LFB49-.
	.set L$set$221,LFE49-LFB49
	.quad L$set$221
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$222,LCFI62-LFB49
	.long L$set$222
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$223,LCFI63-LCFI62
	.long L$set$223
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE57:
.globl __ZN9LV_MATRIXC1Elll.eh
__ZN9LV_MATRIXC1Elll.eh:
LSFDE59:
	.set L$set$224,LEFDE59-LASFDE59
	.long L$set$224
LASFDE59:
	.long	LASFDE59-EH_frame1
	.quad	LFB45-.
	.set L$set$225,LFE45-LFB45
	.quad L$set$225
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$226,LCFI64-LFB45
	.long L$set$226
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$227,LCFI65-LCFI64
	.long L$set$227
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$228,LCFI69-LCFI65
	.long L$set$228
	.byte	0x83
	.byte	0x6
	.byte	0x8c
	.byte	0x5
	.byte	0x8d
	.byte	0x4
	.byte	0x8e
	.byte	0x3
	.align 3
LEFDE59:
.globl __ZN9LV_MATRIXC2Elll.eh
__ZN9LV_MATRIXC2Elll.eh:
LSFDE61:
	.set L$set$229,LEFDE61-LASFDE61
	.long L$set$229
LASFDE61:
	.long	LASFDE61-EH_frame1
	.quad	LFB44-.
	.set L$set$230,LFE44-LFB44
	.quad L$set$230
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$231,LCFI70-LFB44
	.long L$set$231
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$232,LCFI71-LCFI70
	.long L$set$232
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$233,LCFI75-LCFI71
	.long L$set$233
	.byte	0x83
	.byte	0x6
	.byte	0x8c
	.byte	0x5
	.byte	0x8d
	.byte	0x4
	.byte	0x8e
	.byte	0x3
	.align 3
LEFDE61:
.globl __ZN10ILV_VECTOR6vResetEv.eh
__ZN10ILV_VECTOR6vResetEv.eh:
LSFDE63:
	.set L$set$234,LEFDE63-LASFDE63
	.long L$set$234
LASFDE63:
	.long	LASFDE63-EH_frame1
	.quad	LFB39-.
	.set L$set$235,LFE39-LFB39
	.quad L$set$235
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$236,LCFI76-LFB39
	.long L$set$236
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$237,LCFI77-LCFI76
	.long L$set$237
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE63:
.globl __ZN10ILV_VECTORC1Elll.eh
__ZN10ILV_VECTORC1Elll.eh:
LSFDE65:
	.set L$set$238,LEFDE65-LASFDE65
	.long L$set$238
LASFDE65:
	.long	LASFDE65-EH_frame1
	.quad	LFB35-.
	.set L$set$239,LFE35-LFB35
	.quad L$set$239
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$240,LCFI78-LFB35
	.long L$set$240
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$241,LCFI79-LCFI78
	.long L$set$241
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$242,LCFI83-LCFI79
	.long L$set$242
	.byte	0x8d
	.byte	0x3
	.byte	0x8c
	.byte	0x4
	.byte	0x83
	.byte	0x5
	.align 3
LEFDE65:
.globl __ZN10ILV_VECTORC2Elll.eh
__ZN10ILV_VECTORC2Elll.eh:
LSFDE67:
	.set L$set$243,LEFDE67-LASFDE67
	.long L$set$243
LASFDE67:
	.long	LASFDE67-EH_frame1
	.quad	LFB34-.
	.set L$set$244,LFE34-LFB34
	.quad L$set$244
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$245,LCFI84-LFB34
	.long L$set$245
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$246,LCFI85-LCFI84
	.long L$set$246
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$247,LCFI89-LCFI85
	.long L$set$247
	.byte	0x8d
	.byte	0x3
	.byte	0x8c
	.byte	0x4
	.byte	0x83
	.byte	0x5
	.align 3
LEFDE67:
.globl __ZN9LV_VECTOR6vResetEv.eh
__ZN9LV_VECTOR6vResetEv.eh:
LSFDE69:
	.set L$set$248,LEFDE69-LASFDE69
	.long L$set$248
LASFDE69:
	.long	LASFDE69-EH_frame1
	.quad	LFB29-.
	.set L$set$249,LFE29-LFB29
	.quad L$set$249
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$250,LCFI90-LFB29
	.long L$set$250
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$251,LCFI91-LCFI90
	.long L$set$251
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE69:
.globl __ZN9LV_VECTORC1Elll.eh
__ZN9LV_VECTORC1Elll.eh:
LSFDE71:
	.set L$set$252,LEFDE71-LASFDE71
	.long L$set$252
LASFDE71:
	.long	LASFDE71-EH_frame1
	.quad	LFB25-.
	.set L$set$253,LFE25-LFB25
	.quad L$set$253
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$254,LCFI92-LFB25
	.long L$set$254
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$255,LCFI93-LCFI92
	.long L$set$255
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$256,LCFI97-LCFI93
	.long L$set$256
	.byte	0x8d
	.byte	0x3
	.byte	0x8c
	.byte	0x4
	.byte	0x83
	.byte	0x5
	.align 3
LEFDE71:
.globl __ZN9LV_VECTORC2Elll.eh
__ZN9LV_VECTORC2Elll.eh:
LSFDE73:
	.set L$set$257,LEFDE73-LASFDE73
	.long L$set$257
LASFDE73:
	.long	LASFDE73-EH_frame1
	.quad	LFB24-.
	.set L$set$258,LFE24-LFB24
	.quad L$set$258
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$259,LCFI98-LFB24
	.long L$set$259
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$260,LCFI99-LCFI98
	.long L$set$260
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$261,LCFI103-LCFI99
	.long L$set$261
	.byte	0x8d
	.byte	0x3
	.byte	0x8c
	.byte	0x4
	.byte	0x83
	.byte	0x5
	.align 3
LEFDE73:
.globl __ZN8MARKOVLV10dGetRandDKEll.eh
__ZN8MARKOVLV10dGetRandDKEll.eh:
LSFDE75:
	.set L$set$262,LEFDE75-LASFDE75
	.long L$set$262
LASFDE75:
	.long	LASFDE75-EH_frame1
	.quad	LFB86-.
	.set L$set$263,LFE86-LFB86
	.quad L$set$263
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$264,LCFI104-LFB86
	.long L$set$264
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$265,LCFI105-LCFI104
	.long L$set$265
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE75:
.globl __ZN8MARKOVLV10dGetRandCFEl.eh
__ZN8MARKOVLV10dGetRandCFEl.eh:
LSFDE77:
	.set L$set$266,LEFDE77-LASFDE77
	.long L$set$266
LASFDE77:
	.long	LASFDE77-EH_frame1
	.quad	LFB85-.
	.set L$set$267,LFE85-LFB85
	.quad L$set$267
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$268,LCFI106-LFB85
	.long L$set$268
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$269,LCFI107-LCFI106
	.long L$set$269
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE77:
.globl __ZN8MARKOVLV8dGetRegPEll.eh
__ZN8MARKOVLV8dGetRegPEll.eh:
LSFDE79:
	.set L$set$270,LEFDE79-LASFDE79
	.long L$set$270
LASFDE79:
	.long	LASFDE79-EH_frame1
	.quad	LFB80-.
	.set L$set$271,LFE80-LFB80
	.quad L$set$271
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$272,LCFI108-LFB80
	.long L$set$272
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$273,LCFI109-LCFI108
	.long L$set$273
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE79:
.globl __ZN8MARKOVLV9vGetStateEl.eh
__ZN8MARKOVLV9vGetStateEl.eh:
LSFDE81:
	.set L$set$274,LEFDE81-LASFDE81
	.long L$set$274
LASFDE81:
	.long	LASFDE81-EH_frame1
	.quad	LFB84-.
	.set L$set$275,LFE84-LFB84
	.quad L$set$275
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$276,LCFI110-LFB84
	.long L$set$276
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$277,LCFI111-LCFI110
	.long L$set$277
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE81:
.globl __ZN8MARKOVLV13vSetStartTimeEl.eh
__ZN8MARKOVLV13vSetStartTimeEl.eh:
LSFDE83:
	.set L$set$278,LEFDE83-LASFDE83
	.long L$set$278
LASFDE83:
	.long	LASFDE83-EH_frame1
	.quad	LFB62-.
	.set L$set$279,LFE62-LFB62
	.quad L$set$279
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$280,LCFI112-LFB62
	.long L$set$280
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$281,LCFI113-LCFI112
	.long L$set$281
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$282,LCFI115-LCFI113
	.long L$set$282
	.byte	0x83
	.byte	0x4
	.byte	0x8c
	.byte	0x3
	.align 3
LEFDE83:
.globl __ZN8MARKOVLV12vSetStopTimeEl.eh
__ZN8MARKOVLV12vSetStopTimeEl.eh:
LSFDE85:
	.set L$set$283,LEFDE85-LASFDE85
	.long L$set$283
LASFDE85:
	.long	LASFDE85-EH_frame1
	.quad	LFB63-.
	.set L$set$284,LFE63-LFB63
	.quad L$set$284
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$285,LCFI116-LFB63
	.long L$set$285
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$286,LCFI117-LCFI116
	.long L$set$286
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$287,LCFI119-LCFI117
	.long L$set$287
	.byte	0x83
	.byte	0x4
	.byte	0x8c
	.byte	0x3
	.align 3
LEFDE85:
.globl __ZN8MARKOVLV6vResetEv.eh
__ZN8MARKOVLV6vResetEv.eh:
LSFDE87:
	.set L$set$288,LEFDE87-LASFDE87
	.long L$set$288
LASFDE87:
	.long	LASFDE87-EH_frame1
	.quad	LFB60-.
	.set L$set$289,LFE60-LFB60
	.quad L$set$289
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$290,LCFI120-LFB60
	.long L$set$290
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$291,LCFI121-LCFI120
	.long L$set$291
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$292,LCFI125-LCFI121
	.long L$set$292
	.byte	0x83
	.byte	0x5
	.byte	0x8c
	.byte	0x4
	.byte	0x8d
	.byte	0x3
	.align 3
LEFDE87:
.globl __ZN8MARKOVLV17vSetInterestModelEb.eh
__ZN8MARKOVLV17vSetInterestModelEb.eh:
LSFDE89:
	.set L$set$293,LEFDE89-LASFDE89
	.long L$set$293
LASFDE89:
	.long	LASFDE89-EH_frame1
	.quad	LFB70-.
	.set L$set$294,LFE70-LFB70
	.quad L$set$294
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$295,LCFI126-LFB70
	.long L$set$295
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$296,LCFI127-LCFI126
	.long L$set$296
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$297,LCFI130-LCFI127
	.long L$set$297
	.byte	0x8c
	.byte	0x3
	.byte	0x83
	.byte	0x4
	.align 3
LEFDE89:
.globl __ZN8MARKOVLVD2Ev.eh
__ZN8MARKOVLVD2Ev.eh:
LSFDE91:
	.set L$set$298,LEFDE91-LASFDE91
	.long L$set$298
LASFDE91:
	.long	LASFDE91-EH_frame1
	.quad	LFB58-.
	.set L$set$299,LFE58-LFB58
	.quad L$set$299
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$300,LCFI131-LFB58
	.long L$set$300
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$301,LCFI132-LCFI131
	.long L$set$301
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$302,LCFI136-LCFI132
	.long L$set$302
	.byte	0x83
	.byte	0x5
	.byte	0x8c
	.byte	0x4
	.byte	0x8d
	.byte	0x3
	.align 3
LEFDE91:
.globl __ZN8MARKOVLVD1Ev.eh
__ZN8MARKOVLVD1Ev.eh:
LSFDE93:
	.set L$set$303,LEFDE93-LASFDE93
	.long L$set$303
LASFDE93:
	.long	LASFDE93-EH_frame1
	.quad	LFB59-.
	.set L$set$304,LFE59-LFB59
	.quad L$set$304
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$305,LCFI137-LFB59
	.long L$set$305
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$306,LCFI138-LCFI137
	.long L$set$306
	.byte	0xd
	.byte	0x6
	.align 3
LEFDE93:
.globl __ZN8MARKOVLV17vResetMeanResultsEv.eh
__ZN8MARKOVLV17vResetMeanResultsEv.eh:
LSFDE95:
	.set L$set$307,LEFDE95-LASFDE95
	.long L$set$307
LASFDE95:
	.long	LASFDE95-EH_frame1
	.quad	LFB90-.
	.set L$set$308,LFE90-LFB90
	.quad L$set$308
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$309,LCFI139-LFB90
	.long L$set$309
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$310,LCFI140-LCFI139
	.long L$set$310
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$311,LCFI142-LCFI140
	.long L$set$311
	.byte	0x83
	.byte	0x4
	.byte	0x8c
	.byte	0x3
	.align 3
LEFDE95:
.globl __ZN8MARKOVLV20vSetDefaultNrMomentsEl.eh
__ZN8MARKOVLV20vSetDefaultNrMomentsEl.eh:
LSFDE97:
	.set L$set$312,LEFDE97-LASFDE97
	.long L$set$312
LASFDE97:
	.long	LASFDE97-EH_frame1
	.quad	LFB71-.
	.set L$set$313,LFE71-LFB71
	.quad L$set$313
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$314,LCFI143-LFB71
	.long L$set$314
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$315,LCFI144-LCFI143
	.long L$set$315
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$316,LCFI148-LCFI144
	.long L$set$316
	.byte	0x83
	.byte	0x6
	.byte	0x8c
	.byte	0x5
	.byte	0x8d
	.byte	0x4
	.byte	0x8e
	.byte	0x3
	.align 3
LEFDE97:
.globl __ZN8MARKOVLV12vSetNrStatesEl.eh
__ZN8MARKOVLV12vSetNrStatesEl.eh:
LSFDE99:
	.set L$set$317,LEFDE99-LASFDE99
	.long L$set$317
LASFDE99:
	.long	LASFDE99-EH_frame1
	.quad	LFB64-.
	.set L$set$318,LFE64-LFB64
	.quad L$set$318
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$319,LCFI149-LFB64
	.long L$set$319
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$320,LCFI150-LCFI149
	.long L$set$320
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$321,LCFI154-LCFI150
	.long L$set$321
	.byte	0x83
	.byte	0x5
	.byte	0x8c
	.byte	0x4
	.byte	0x8d
	.byte	0x3
	.align 3
LEFDE99:
.globl __ZN8MARKOVLV13vSetInternalsEll.eh
__ZN8MARKOVLV13vSetInternalsEll.eh:
LSFDE101:
	.set L$set$322,LEFDE101-LASFDE101
	.long L$set$322
LASFDE101:
	.long	LASFDE101-EH_frame1
	.quad	LFB61-.
	.set L$set$323,LFE61-LFB61
	.quad L$set$323
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$324,LCFI155-LFB61
	.long L$set$324
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$325,LCFI156-LCFI155
	.long L$set$325
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$326,LCFI162-LCFI156
	.long L$set$326
	.byte	0x83
	.byte	0x7
	.byte	0x8c
	.byte	0x6
	.byte	0x8d
	.byte	0x5
	.byte	0x8e
	.byte	0x4
	.byte	0x8f
	.byte	0x3
	.align 3
LEFDE101:
.globl __ZN8MARKOVLV7dSetPreEllld.eh
__ZN8MARKOVLV7dSetPreEllld.eh:
LSFDE103:
	.set L$set$327,LEFDE103-LASFDE103
	.long L$set$327
LASFDE103:
	.long	LASFDE103-EH_frame1
	.quad	LFB66-.
	.set L$set$328,LFE66-LFB66
	.quad L$set$328
	.byte	0x8
	.quad	LLSDA66-.
	.byte	0x4
	.set L$set$329,LCFI163-LFB66
	.long L$set$329
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$330,LCFI164-LCFI163
	.long L$set$330
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$331,LCFI170-LCFI164
	.long L$set$331
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.align 3
LEFDE103:
.globl __ZN8MARKOVLV8dSetDiscEllld.eh
__ZN8MARKOVLV8dSetDiscEllld.eh:
LSFDE105:
	.set L$set$332,LEFDE105-LASFDE105
	.long L$set$332
LASFDE105:
	.long	LASFDE105-EH_frame1
	.quad	LFB69-.
	.set L$set$333,LFE69-LFB69
	.quad L$set$333
	.byte	0x8
	.quad	LLSDA69-.
	.byte	0x4
	.set L$set$334,LCFI171-LFB69
	.long L$set$334
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$335,LCFI172-LCFI171
	.long L$set$335
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$336,LCFI178-LCFI172
	.long L$set$336
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.align 3
LEFDE105:
.globl __ZN8MARKOVLV7dSetPijEllld.eh
__ZN8MARKOVLV7dSetPijEllld.eh:
LSFDE107:
	.set L$set$337,LEFDE107-LASFDE107
	.long L$set$337
LASFDE107:
	.long	LASFDE107-EH_frame1
	.quad	LFB68-.
	.set L$set$338,LFE68-LFB68
	.quad L$set$338
	.byte	0x8
	.quad	LLSDA68-.
	.byte	0x4
	.set L$set$339,LCFI179-LFB68
	.long L$set$339
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$340,LCFI180-LCFI179
	.long L$set$340
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$341,LCFI186-LCFI180
	.long L$set$341
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.align 3
LEFDE107:
.globl __ZN8MARKOVLV8dSetPostEllld.eh
__ZN8MARKOVLV8dSetPostEllld.eh:
LSFDE109:
	.set L$set$342,LEFDE109-LASFDE109
	.long L$set$342
LASFDE109:
	.long	LASFDE109-EH_frame1
	.quad	LFB67-.
	.set L$set$343,LFE67-LFB67
	.quad L$set$343
	.byte	0x8
	.quad	LLSDA67-.
	.byte	0x4
	.set L$set$344,LCFI187-LFB67
	.long L$set$344
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$345,LCFI188-LCFI187
	.long L$set$345
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$346,LCFI194-LCFI188
	.long L$set$346
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.align 3
LEFDE109:
.globl __ZN8MARKOVLV6dGetDKElll.eh
__ZN8MARKOVLV6dGetDKElll.eh:
LSFDE111:
	.set L$set$347,LEFDE111-LASFDE111
	.long L$set$347
LASFDE111:
	.long	LASFDE111-EH_frame1
	.quad	LFB72-.
	.set L$set$348,LFE72-LFB72
	.quad L$set$348
	.byte	0x8
	.quad	LLSDA72-.
	.byte	0x4
	.set L$set$349,LCFI195-LFB72
	.long L$set$349
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$350,LCFI196-LCFI195
	.long L$set$350
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$351,LCFI202-LCFI196
	.long L$set$351
	.byte	0x83
	.byte	0x7
	.byte	0x8c
	.byte	0x6
	.byte	0x8d
	.byte	0x5
	.byte	0x8e
	.byte	0x4
	.byte	0x8f
	.byte	0x3
	.align 3
LEFDE111:
.globl __ZN8MARKOVLV6dGetSPEll.eh
__ZN8MARKOVLV6dGetSPEll.eh:
LSFDE113:
	.set L$set$352,LEFDE113-LASFDE113
	.long L$set$352
LASFDE113:
	.long	LASFDE113-EH_frame1
	.quad	LFB79-.
	.set L$set$353,LFE79-LFB79
	.quad L$set$353
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$354,LCFI203-LFB79
	.long L$set$354
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$355,LCFI204-LCFI203
	.long L$set$355
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$356,LCFI208-LCFI204
	.long L$set$356
	.byte	0x8d
	.byte	0x3
	.byte	0x8c
	.byte	0x4
	.byte	0x83
	.byte	0x5
	.align 3
LEFDE113:
.globl __ZN8MARKOVLV6dGetRPEll.eh
__ZN8MARKOVLV6dGetRPEll.eh:
LSFDE115:
	.set L$set$357,LEFDE115-LASFDE115
	.long L$set$357
LASFDE115:
	.long	LASFDE115-EH_frame1
	.quad	LFB78-.
	.set L$set$358,LFE78-LFB78
	.quad L$set$358
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$359,LCFI209-LFB78
	.long L$set$359
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$360,LCFI210-LCFI209
	.long L$set$360
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$361,LCFI216-LCFI210
	.long L$set$361
	.byte	0x83
	.byte	0x7
	.byte	0x8c
	.byte	0x6
	.byte	0x8d
	.byte	0x5
	.byte	0x8e
	.byte	0x4
	.byte	0x8f
	.byte	0x3
	.align 3
LEFDE115:
.globl __ZN8MARKOVLV19vGenerateTrajectoryEv.eh
__ZN8MARKOVLV19vGenerateTrajectoryEv.eh:
LSFDE117:
	.set L$set$362,LEFDE117-LASFDE117
	.long L$set$362
LASFDE117:
	.long	LASFDE117-EH_frame1
	.quad	LFB83-.
	.set L$set$363,LFE83-LFB83
	.quad L$set$363
	.byte	0x8
	.quad	LLSDA83-.
	.byte	0x4
	.set L$set$364,LCFI217-LFB83
	.long L$set$364
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$365,LCFI218-LCFI217
	.long L$set$365
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$366,LCFI224-LCFI218
	.long L$set$366
	.byte	0x83
	.byte	0x7
	.byte	0x8c
	.byte	0x6
	.byte	0x8d
	.byte	0x5
	.byte	0x8e
	.byte	0x4
	.byte	0x8f
	.byte	0x3
	.align 3
LEFDE117:
.globl __ZN8MARKOVLV10dGetMeanDKElll.eh
__ZN8MARKOVLV10dGetMeanDKElll.eh:
LSFDE119:
	.set L$set$367,LEFDE119-LASFDE119
	.long L$set$367
LASFDE119:
	.long	LASFDE119-EH_frame1
	.quad	LFB88-.
	.set L$set$368,LFE88-LFB88
	.quad L$set$368
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$369,LCFI225-LFB88
	.long L$set$369
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$370,LCFI226-LCFI225
	.long L$set$370
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$371,LCFI231-LCFI226
	.long L$set$371
	.byte	0x8e
	.byte	0x3
	.byte	0x8d
	.byte	0x4
	.byte	0x8c
	.byte	0x5
	.byte	0x83
	.byte	0x6
	.align 3
LEFDE119:
.globl __ZN8MARKOVLV10dGetMeanCFElll.eh
__ZN8MARKOVLV10dGetMeanCFElll.eh:
LSFDE121:
	.set L$set$372,LEFDE121-LASFDE121
	.long L$set$372
LASFDE121:
	.long	LASFDE121-EH_frame1
	.quad	LFB87-.
	.set L$set$373,LFE87-LFB87
	.quad L$set$373
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$374,LCFI232-LFB87
	.long L$set$374
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$375,LCFI233-LCFI232
	.long L$set$375
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$376,LCFI238-LCFI233
	.long L$set$376
	.byte	0x8e
	.byte	0x3
	.byte	0x8d
	.byte	0x4
	.byte	0x8c
	.byte	0x5
	.byte	0x83
	.byte	0x6
	.align 3
LEFDE121:
.globl __ZN8MARKOVLV6dGetCFElll.eh
__ZN8MARKOVLV6dGetCFElll.eh:
LSFDE123:
	.set L$set$377,LEFDE123-LASFDE123
	.long L$set$377
LASFDE123:
	.long	LASFDE123-EH_frame1
	.quad	LFB73-.
	.set L$set$378,LFE73-LFB73
	.quad L$set$378
	.byte	0x8
	.quad	LLSDA73-.
	.byte	0x4
	.set L$set$379,LCFI239-LFB73
	.long L$set$379
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$380,LCFI240-LCFI239
	.long L$set$380
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$381,LCFI246-LCFI240
	.long L$set$381
	.byte	0x83
	.byte	0x7
	.byte	0x8c
	.byte	0x6
	.byte	0x8d
	.byte	0x5
	.byte	0x8e
	.byte	0x4
	.byte	0x8f
	.byte	0x3
	.align 3
LEFDE123:
.globl __ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb.eh
__ZN8MARKOVLV9vPrintTeXEP7__sFILEbPcb.eh:
LSFDE125:
	.set L$set$382,LEFDE125-LASFDE125
	.long L$set$382
LASFDE125:
	.long	LASFDE125-EH_frame1
	.quad	LFB91-.
	.set L$set$383,LFE91-LFB91
	.quad L$set$383
	.byte	0x8
	.quad	0x0
	.byte	0x4
	.set L$set$384,LCFI247-LFB91
	.long L$set$384
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$385,LCFI248-LCFI247
	.long L$set$385
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$386,LCFI254-LCFI248
	.long L$set$386
	.byte	0x83
	.byte	0x7
	.byte	0x8c
	.byte	0x6
	.byte	0x8d
	.byte	0x5
	.byte	0x8e
	.byte	0x4
	.byte	0x8f
	.byte	0x3
	.align 3
LEFDE125:
	.constructor
	.destructor
	.align 1
	.subsections_via_symbols
