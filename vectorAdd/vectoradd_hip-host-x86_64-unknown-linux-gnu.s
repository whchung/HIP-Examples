	.text
	.file	"vectoradd_hip.cpp"
	.globl	_Z30__device_stub__vectorset_floatPKfS0_Pf # -- Begin function _Z30__device_stub__vectorset_floatPKfS0_Pf
	.p2align	4, 0x90
	.type	_Z30__device_stub__vectorset_floatPKfS0_Pf,@function
_Z30__device_stub__vectorset_floatPKfS0_Pf: # @_Z30__device_stub__vectorset_floatPKfS0_Pf
	.cfi_startproc
# %bb.0:
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, 72(%rsp)
	movq	%rsi, 64(%rsp)
	movq	%rdx, 56(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 80(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 88(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 96(%rsp)
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
	leaq	80(%rsp), %r9
	movl	$_Z15vectorset_floatPKfS0_Pf, %edi
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel
	addq	$120, %rsp
	.cfi_adjust_cfa_offset -120
	retq
.Lfunc_end0:
	.size	_Z30__device_stub__vectorset_floatPKfS0_Pf, .Lfunc_end0-_Z30__device_stub__vectorset_floatPKfS0_Pf
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function main
.LCPI1_0:
	.long	0x00000000                      # float 0
	.long	0x3f800000                      # float 1
	.long	0x40000000                      # float 2
	.long	0x40400000                      # float 3
.LCPI1_1:
	.long	0x00000000                      # float 0
	.long	0x42c80000                      # float 100
	.long	0x43480000                      # float 200
	.long	0x43960000                      # float 300
.LCPI1_2:
	.long	0x40800000                      # float 4
	.long	0x40a00000                      # float 5
	.long	0x40c00000                      # float 6
	.long	0x40e00000                      # float 7
.LCPI1_3:
	.long	0x43c80000                      # float 400
	.long	0x43fa0000                      # float 500
	.long	0x44160000                      # float 600
	.long	0x442f0000                      # float 700
.LCPI1_4:
	.long	0x41000000                      # float 8
	.long	0x41100000                      # float 9
	.long	0x41200000                      # float 10
	.long	0x41300000                      # float 11
.LCPI1_5:
	.long	0x44480000                      # float 800
	.long	0x44610000                      # float 900
	.long	0x447a0000                      # float 1000
	.long	0x44898000                      # float 1100
.LCPI1_6:
	.long	0x41400000                      # float 12
	.long	0x41500000                      # float 13
	.long	0x41600000                      # float 14
	.long	0x41700000                      # float 15
.LCPI1_7:
	.long	0x44960000                      # float 1200
	.long	0x44a28000                      # float 1300
	.long	0x44af0000                      # float 1400
	.long	0x44bb8000                      # float 1500
.LCPI1_8:
	.long	0x41800000                      # float 16
	.long	0x41880000                      # float 17
	.long	0x41900000                      # float 18
	.long	0x41980000                      # float 19
.LCPI1_9:
	.long	0x44c80000                      # float 1600
	.long	0x44d48000                      # float 1700
	.long	0x44e10000                      # float 1800
	.long	0x44ed8000                      # float 1900
.LCPI1_10:
	.long	0x41a00000                      # float 20
	.long	0x41a80000                      # float 21
	.long	0x41b00000                      # float 22
	.long	0x41b80000                      # float 23
.LCPI1_11:
	.long	0x44fa0000                      # float 2000
	.long	0x45034000                      # float 2100
	.long	0x45098000                      # float 2200
	.long	0x450fc000                      # float 2300
.LCPI1_12:
	.long	0x41c00000                      # float 24
	.long	0x41c80000                      # float 25
	.long	0x41d00000                      # float 26
	.long	0x41d80000                      # float 27
.LCPI1_13:
	.long	0x45160000                      # float 2400
	.long	0x451c4000                      # float 2500
	.long	0x45228000                      # float 2600
	.long	0x4528c000                      # float 2700
.LCPI1_14:
	.long	0x41e00000                      # float 28
	.long	0x41e80000                      # float 29
	.long	0x41f00000                      # float 30
	.long	0x41f80000                      # float 31
.LCPI1_15:
	.long	0x452f0000                      # float 2800
	.long	0x45354000                      # float 2900
	.long	0x453b8000                      # float 3000
	.long	0x4541c000                      # float 3100
.LCPI1_16:
	.long	0x42000000                      # float 32
	.long	0x42040000                      # float 33
	.long	0x42080000                      # float 34
	.long	0x420c0000                      # float 35
.LCPI1_17:
	.long	0x45480000                      # float 3200
	.long	0x454e4000                      # float 3300
	.long	0x45548000                      # float 3400
	.long	0x455ac000                      # float 3500
.LCPI1_18:
	.long	0x42100000                      # float 36
	.long	0x42140000                      # float 37
	.long	0x42180000                      # float 38
	.long	0x421c0000                      # float 39
.LCPI1_19:
	.long	0x45610000                      # float 3600
	.long	0x45674000                      # float 3700
	.long	0x456d8000                      # float 3800
	.long	0x4573c000                      # float 3900
.LCPI1_20:
	.long	0x42200000                      # float 40
	.long	0x42240000                      # float 41
	.long	0x42280000                      # float 42
	.long	0x422c0000                      # float 43
.LCPI1_21:
	.long	0x457a0000                      # float 4000
	.long	0x45802000                      # float 4100
	.long	0x45834000                      # float 4200
	.long	0x45866000                      # float 4300
.LCPI1_22:
	.long	0x42300000                      # float 44
	.long	0x42340000                      # float 45
	.long	0x42380000                      # float 46
	.long	0x423c0000                      # float 47
.LCPI1_23:
	.long	0x45898000                      # float 4400
	.long	0x458ca000                      # float 4500
	.long	0x458fc000                      # float 4600
	.long	0x4592e000                      # float 4700
.LCPI1_24:
	.long	0x42400000                      # float 48
	.long	0x42440000                      # float 49
	.long	0x42480000                      # float 50
	.long	0x424c0000                      # float 51
.LCPI1_25:
	.long	0x45960000                      # float 4800
	.long	0x45992000                      # float 4900
	.long	0x459c4000                      # float 5000
	.long	0x459f6000                      # float 5100
.LCPI1_26:
	.long	0x42500000                      # float 52
	.long	0x42540000                      # float 53
	.long	0x42580000                      # float 54
	.long	0x425c0000                      # float 55
.LCPI1_27:
	.long	0x45a28000                      # float 5200
	.long	0x45a5a000                      # float 5300
	.long	0x45a8c000                      # float 5400
	.long	0x45abe000                      # float 5500
.LCPI1_28:
	.long	0x42600000                      # float 56
	.long	0x42640000                      # float 57
	.long	0x42680000                      # float 58
	.long	0x426c0000                      # float 59
.LCPI1_29:
	.long	0x45af0000                      # float 5600
	.long	0x45b22000                      # float 5700
	.long	0x45b54000                      # float 5800
	.long	0x45b86000                      # float 5900
.LCPI1_30:
	.long	0x42700000                      # float 60
	.long	0x42740000                      # float 61
	.long	0x42780000                      # float 62
	.long	0x427c0000                      # float 63
.LCPI1_31:
	.long	0x45bb8000                      # float 6000
	.long	0x45bea000                      # float 6100
	.long	0x45c1c000                      # float 6200
	.long	0x45c4e000                      # float 6300
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$912, %rsp                      # imm = 0x390
	.cfi_def_cfa_offset 960
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	120(%rsp), %rdi
	xorl	%esi, %esi
	callq	hipGetDeviceProperties
	movl	$_ZSt4cout, %edi
	movl	$.L.str, %esi
	movl	$14, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	452(%rsp), %esi
	movl	$_ZSt4cout, %edi
	callq	_ZNSolsEi
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.LBB1_30
# %bb.1:                                # %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
	cmpb	$0, 56(%rbx)
	je	.LBB1_3
# %bb.2:
	movb	67(%rbx), %al
	jmp	.LBB1_4
.LBB1_3:
	movq	%rbx, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	movl	$10, %esi
	callq	*48(%rax)
.LBB1_4:                                # %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit
	movsbl	%al, %esi
	movq	%r14, %rdi
	callq	_ZNSo3putEc
	movq	%rax, %rdi
	callq	_ZNSo5flushEv
	movl	$_ZSt4cout, %edi
	movl	$.L.str.1, %esi
	movl	$14, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	448(%rsp), %esi
	movl	$_ZSt4cout, %edi
	callq	_ZNSolsEi
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.LBB1_30
# %bb.5:                                # %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i37
	cmpb	$0, 56(%rbx)
	je	.LBB1_7
# %bb.6:
	movb	67(%rbx), %al
	jmp	.LBB1_8
.LBB1_7:
	movq	%rbx, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	movl	$10, %esi
	callq	*48(%rax)
.LBB1_8:                                # %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit39
	movsbl	%al, %esi
	movq	%r14, %rdi
	callq	_ZNSo3putEc
	movq	%rax, %rdi
	callq	_ZNSo5flushEv
	movl	$_ZSt4cout, %edi
	movl	$.L.str.2, %esi
	movl	$17, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	leaq	120(%rsp), %rbx
	movq	%rbx, %rdi
	callq	strlen
	movl	$_ZSt4cout, %edi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.LBB1_30
# %bb.9:                                # %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i42
	cmpb	$0, 56(%rbx)
	je	.LBB1_11
# %bb.10:
	movb	67(%rbx), %al
	jmp	.LBB1_12
.LBB1_11:
	movq	%rbx, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	movl	$10, %esi
	callq	*48(%rax)
.LBB1_12:                               # %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit44
	movsbl	%al, %esi
	movl	$_ZSt4cout, %edi
	callq	_ZNSo3putEc
	movq	%rax, %rdi
	callq	_ZNSo5flushEv
	movl	$_ZSt4cout, %edi
	movl	$.L.str.3, %esi
	movl	$26, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.LBB1_30
# %bb.13:                               # %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i47
	cmpb	$0, 56(%rbx)
	je	.LBB1_15
# %bb.14:
	movb	67(%rbx), %al
	jmp	.LBB1_16
.LBB1_15:
	movq	%rbx, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	movl	$10, %esi
	callq	*48(%rax)
.LBB1_16:                               # %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit49
	movsbl	%al, %esi
	movl	$_ZSt4cout, %edi
	callq	_ZNSo3putEc
	movq	%rax, %rdi
	callq	_ZNSo5flushEv
	movl	$256, %edi                      # imm = 0x100
	callq	malloc
	movq	%rax, %r14
	movl	$256, %edi                      # imm = 0x100
	callq	malloc
	movq	%rax, %r12
	movl	$256, %edi                      # imm = 0x100
	callq	malloc
	movq	%rax, %r15
	movaps	.LCPI1_0(%rip), %xmm0           # xmm0 = [0.0E+0,1.0E+0,2.0E+0,3.0E+0]
	movaps	%xmm0, (%r14)
	movaps	.LCPI1_1(%rip), %xmm0           # xmm0 = [0.0E+0,1.0E+2,2.0E+2,3.0E+2]
	movaps	%xmm0, (%r12)
	movaps	.LCPI1_2(%rip), %xmm0           # xmm0 = [4.0E+0,5.0E+0,6.0E+0,7.0E+0]
	movaps	%xmm0, 16(%r14)
	movaps	.LCPI1_3(%rip), %xmm0           # xmm0 = [4.0E+2,5.0E+2,6.0E+2,7.0E+2]
	movaps	%xmm0, 16(%r12)
	movaps	.LCPI1_4(%rip), %xmm0           # xmm0 = [8.0E+0,9.0E+0,1.0E+1,1.1E+1]
	movaps	%xmm0, 32(%r14)
	movaps	.LCPI1_5(%rip), %xmm0           # xmm0 = [8.0E+2,9.0E+2,1.0E+3,1.1E+3]
	movaps	%xmm0, 32(%r12)
	movaps	.LCPI1_6(%rip), %xmm0           # xmm0 = [1.2E+1,1.3E+1,1.4E+1,1.5E+1]
	movaps	%xmm0, 48(%r14)
	movaps	.LCPI1_7(%rip), %xmm0           # xmm0 = [1.2E+3,1.3E+3,1.4E+3,1.5E+3]
	movaps	%xmm0, 48(%r12)
	movaps	.LCPI1_8(%rip), %xmm0           # xmm0 = [1.6E+1,1.7E+1,1.8E+1,1.9E+1]
	movaps	%xmm0, 64(%r14)
	movaps	.LCPI1_9(%rip), %xmm0           # xmm0 = [1.6E+3,1.7E+3,1.8E+3,1.9E+3]
	movaps	%xmm0, 64(%r12)
	movaps	.LCPI1_10(%rip), %xmm0          # xmm0 = [2.0E+1,2.1E+1,2.2E+1,2.3E+1]
	movaps	%xmm0, 80(%r14)
	movaps	.LCPI1_11(%rip), %xmm0          # xmm0 = [2.0E+3,2.1E+3,2.2E+3,2.3E+3]
	movaps	%xmm0, 80(%r12)
	movaps	.LCPI1_12(%rip), %xmm0          # xmm0 = [2.4E+1,2.5E+1,2.6E+1,2.7E+1]
	movaps	%xmm0, 96(%r14)
	movaps	.LCPI1_13(%rip), %xmm0          # xmm0 = [2.4E+3,2.5E+3,2.6E+3,2.7E+3]
	movaps	%xmm0, 96(%r12)
	movaps	.LCPI1_14(%rip), %xmm0          # xmm0 = [2.8E+1,2.9E+1,3.0E+1,3.1E+1]
	movaps	%xmm0, 112(%r14)
	movaps	.LCPI1_15(%rip), %xmm0          # xmm0 = [2.8E+3,2.9E+3,3.0E+3,3.1E+3]
	movaps	%xmm0, 112(%r12)
	movaps	.LCPI1_16(%rip), %xmm0          # xmm0 = [3.2E+1,3.3E+1,3.4E+1,3.5E+1]
	movaps	%xmm0, 128(%r14)
	movaps	.LCPI1_17(%rip), %xmm0          # xmm0 = [3.2E+3,3.3E+3,3.4E+3,3.5E+3]
	movaps	%xmm0, 128(%r12)
	movaps	.LCPI1_18(%rip), %xmm0          # xmm0 = [3.6E+1,3.7E+1,3.8E+1,3.9E+1]
	movaps	%xmm0, 144(%r14)
	movaps	.LCPI1_19(%rip), %xmm0          # xmm0 = [3.6E+3,3.7E+3,3.8E+3,3.9E+3]
	movaps	%xmm0, 144(%r12)
	movaps	.LCPI1_20(%rip), %xmm0          # xmm0 = [4.0E+1,4.1E+1,4.2E+1,4.3E+1]
	movaps	%xmm0, 160(%r14)
	movaps	.LCPI1_21(%rip), %xmm0          # xmm0 = [4.0E+3,4.1E+3,4.2E+3,4.3E+3]
	movaps	%xmm0, 160(%r12)
	movaps	.LCPI1_22(%rip), %xmm0          # xmm0 = [4.4E+1,4.5E+1,4.6E+1,4.7E+1]
	movaps	%xmm0, 176(%r14)
	movaps	.LCPI1_23(%rip), %xmm0          # xmm0 = [4.4E+3,4.5E+3,4.6E+3,4.7E+3]
	movaps	%xmm0, 176(%r12)
	movaps	.LCPI1_24(%rip), %xmm0          # xmm0 = [4.8E+1,4.9E+1,5.0E+1,5.1E+1]
	movaps	%xmm0, 192(%r14)
	movaps	.LCPI1_25(%rip), %xmm0          # xmm0 = [4.8E+3,4.9E+3,5.0E+3,5.1E+3]
	movaps	%xmm0, 192(%r12)
	movaps	.LCPI1_26(%rip), %xmm0          # xmm0 = [5.2E+1,5.3E+1,5.4E+1,5.5E+1]
	movaps	%xmm0, 208(%r14)
	movaps	.LCPI1_27(%rip), %xmm0          # xmm0 = [5.2E+3,5.3E+3,5.4E+3,5.5E+3]
	movaps	%xmm0, 208(%r12)
	movaps	.LCPI1_28(%rip), %xmm0          # xmm0 = [5.6E+1,5.7E+1,5.8E+1,5.9E+1]
	movaps	%xmm0, 224(%r14)
	movaps	.LCPI1_29(%rip), %xmm0          # xmm0 = [5.6E+3,5.7E+3,5.8E+3,5.9E+3]
	movaps	%xmm0, 224(%r12)
	movaps	.LCPI1_30(%rip), %xmm0          # xmm0 = [6.0E+1,6.1E+1,6.2E+1,6.3E+1]
	movaps	%xmm0, 240(%r14)
	movaps	.LCPI1_31(%rip), %xmm0          # xmm0 = [6.0E+3,6.1E+3,6.2E+3,6.3E+3]
	movaps	%xmm0, 240(%r12)
	leaq	16(%rsp), %rdi
	movl	$256, %esi                      # imm = 0x100
	callq	hipMalloc
	testl	%eax, %eax
	jne	.LBB1_31
# %bb.17:
	leaq	8(%rsp), %rdi
	movl	$256, %esi                      # imm = 0x100
	callq	hipMalloc
	testl	%eax, %eax
	jne	.LBB1_32
# %bb.18:
	movq	%rsp, %rdi
	movl	$256, %esi                      # imm = 0x100
	callq	hipMalloc
	testl	%eax, %eax
	jne	.LBB1_33
# %bb.19:
	movq	16(%rsp), %rdi
	movl	$256, %edx                      # imm = 0x100
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	hipMemcpy
	testl	%eax, %eax
	jne	.LBB1_34
# %bb.20:
	movq	8(%rsp), %rdi
	movl	$256, %edx                      # imm = 0x100
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	hipMemcpy
	testl	%eax, %eax
	jne	.LBB1_35
# %bb.21:
	movabsq	$4294967297, %rdi               # imm = 0x100000001
	leaq	63(%rdi), %rdx
	movl	$1, %esi
	movl	$1, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration
	testl	%eax, %eax
	jne	.LBB1_23
# %bb.22:
	movq	16(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 96(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 104(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 112(%rsp)
	leaq	56(%rsp), %rdi
	leaq	40(%rsp), %rsi
	leaq	32(%rsp), %rdx
	leaq	24(%rsp), %rcx
	callq	__hipPopCallConfiguration
	movq	56(%rsp), %rsi
	movl	64(%rsp), %edx
	movq	40(%rsp), %rcx
	movl	48(%rsp), %r8d
	leaq	96(%rsp), %r9
	movl	$_Z15vectorset_floatPKfS0_Pf, %edi
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	40(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.LBB1_23:
	movq	(%rsp), %rsi
	movl	$256, %edx                      # imm = 0x100
	movq	%r15, %rdi
	movl	$2, %ecx
	callq	hipMemcpy
	testl	%eax, %eax
	jne	.LBB1_36
# %bb.24:                               # %.preheader.preheader
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_25:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movss	(%r14,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$_ZSt4cout, %edi
	callq	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %r13
	movl	$.L.str.11, %esi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movss	(%r12,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movq	%r13, %rdi
	callq	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %r13
	movl	$.L.str.11, %esi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movss	(%r15,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movq	%r13, %rdi
	callq	_ZNSo9_M_insertIdEERSoT_
	movl	$.L.str.12, %esi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	addq	$1, %rbx
	cmpq	$64, %rbx
	jne	.LBB1_25
# %bb.26:
	movq	16(%rsp), %rdi
	callq	hipFree
	testl	%eax, %eax
	jne	.LBB1_37
# %bb.27:
	movq	8(%rsp), %rdi
	callq	hipFree
	testl	%eax, %eax
	jne	.LBB1_38
# %bb.28:
	movq	(%rsp), %rdi
	callq	hipFree
	testl	%eax, %eax
	jne	.LBB1_39
# %bb.29:
	movq	%r14, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$912, %rsp                      # imm = 0x390
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB1_30:
	.cfi_def_cfa_offset 960
	callq	_ZSt16__throw_bad_castv
.LBB1_31:
	movl	$.L.str.4, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$101, %edx
	callq	__assert_fail
.LBB1_32:
	movl	$.L.str.6, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$102, %edx
	callq	__assert_fail
.LBB1_33:
	movl	$.L.str.7, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$103, %edx
	callq	__assert_fail
.LBB1_34:
	movl	$.L.str.8, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$105, %edx
	callq	__assert_fail
.LBB1_35:
	movl	$.L.str.9, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$106, %edx
	callq	__assert_fail
.LBB1_36:
	movl	$.L.str.10, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$117, %edx
	callq	__assert_fail
.LBB1_37:
	movl	$.L.str.13, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$143, %edx
	callq	__assert_fail
.LBB1_38:
	movl	$.L.str.14, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$144, %edx
	callq	__assert_fail
.LBB1_39:
	movl	$.L.str.15, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$145, %edx
	callq	__assert_fail
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_vectoradd_hip.cpp
	.type	_GLOBAL__sub_I_vectoradd_hip.cpp,@function
_GLOBAL__sub_I_vectoradd_hip.cpp:       # @_GLOBAL__sub_I_vectoradd_hip.cpp
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	callq	_ZNSt8ios_base4InitC1Ev
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	movl	$_ZStL8__ioinit, %esi
	movl	$__dso_handle, %edx
	popq	%rax
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit                    # TAILCALL
.Lfunc_end2:
	.size	_GLOBAL__sub_I_vectoradd_hip.cpp, .Lfunc_end2-_GLOBAL__sub_I_vectoradd_hip.cpp
	.cfi_endproc
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function __hip_module_ctor
	.type	__hip_module_ctor,@function
__hip_module_ctor:                      # @__hip_module_ctor
	.cfi_startproc
# %bb.0:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	__hip_gpubin_handle(%rip), %rdi
	testq	%rdi, %rdi
	jne	.LBB3_2
# %bb.1:
	movl	$__hip_fatbin_wrapper, %edi
	callq	__hipRegisterFatBinary
	movq	%rax, %rdi
	movq	%rax, __hip_gpubin_handle(%rip)
.LBB3_2:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsp)
	movups	%xmm0, (%rsp)
	movl	$_Z15vectorset_floatPKfS0_Pf, %esi
	movl	$.L__unnamed_1, %edx
	movl	$.L__unnamed_1, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	__hipRegisterFunction
	movl	$__hip_module_dtor, %edi
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	jmp	atexit                          # TAILCALL
.Lfunc_end3:
	.size	__hip_module_ctor, .Lfunc_end3-__hip_module_ctor
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __hip_module_dtor
	.type	__hip_module_dtor,@function
__hip_module_dtor:                      # @__hip_module_dtor
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__hip_gpubin_handle(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB4_2
# %bb.1:
	callq	__hipUnregisterFatBinary
	movq	$0, __hip_gpubin_handle(%rip)
.LBB4_2:
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	__hip_module_dtor, .Lfunc_end4-__hip_module_dtor
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.type	_Z15vectorset_floatPKfS0_Pf,@object # @_Z15vectorset_floatPKfS0_Pf
	.section	.rodata,"a",@progbits
	.globl	_Z15vectorset_floatPKfS0_Pf
	.p2align	3
_Z15vectorset_floatPKfS0_Pf:
	.quad	_Z30__device_stub__vectorset_floatPKfS0_Pf
	.size	_Z15vectorset_floatPKfS0_Pf, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" System minor "
	.size	.L.str, 15

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	" System major "
	.size	.L.str.1, 15

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	" agent prop name "
	.size	.L.str.2, 18

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"hip Device prop succeeded "
	.size	.L.str.3, 27

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"(hipMalloc((void**)&deviceA, (64*1) * sizeof(float)))==hipSuccess"
	.size	.L.str.4, 66

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"vectoradd_hip.cpp"
	.size	.L.str.5, 18

	.type	.L__PRETTY_FUNCTION__.main,@object # @__PRETTY_FUNCTION__.main
.L__PRETTY_FUNCTION__.main:
	.asciz	"int main()"
	.size	.L__PRETTY_FUNCTION__.main, 11

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"(hipMalloc((void**)&deviceB, (64*1) * sizeof(float)))==hipSuccess"
	.size	.L.str.6, 66

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"(hipMalloc((void**)&deviceC, (64*1) * sizeof(float)))==hipSuccess"
	.size	.L.str.7, 66

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"(hipMemcpy(deviceA, hostA, (64*1)*sizeof(float), hipMemcpyHostToDevice))==hipSuccess"
	.size	.L.str.8, 85

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"(hipMemcpy(deviceB, hostB, (64*1)*sizeof(float), hipMemcpyHostToDevice))==hipSuccess"
	.size	.L.str.9, 85

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"(hipMemcpy(hostC, deviceC, (64*1)*sizeof(float), hipMemcpyDeviceToHost))==hipSuccess"
	.size	.L.str.10, 85

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	" "
	.size	.L.str.11, 2

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"\n"
	.size	.L.str.12, 2

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"(hipFree(deviceA))==hipSuccess"
	.size	.L.str.13, 31

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"(hipFree(deviceB))==hipSuccess"
	.size	.L.str.14, 31

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"(hipFree(deviceC))==hipSuccess"
	.size	.L.str.15, 31

	.type	.L__unnamed_1,@object           # @0
.L__unnamed_1:
	.asciz	"_Z15vectorset_floatPKfS0_Pf"
	.size	.L__unnamed_1, 28

	.type	.L__unnamed_2,@object           # @1
	.section	.hip_fatbin,"a",@progbits
	.p2align	12
.L__unnamed_2:
	.asciz	"__CLANG_OFFLOAD_BUNDLE__\002\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\031\000\000\000\000\000\000\000host-x86_64-unknown-linux\000\020\000\000\000\000\000\000\250%\000\000\000\000\000\000\037\000\000\000\000\000\000\000hipv4-amdgcn-amd-amdhsa--gfx900\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\177ELF\002\001\001@\002\000\000\000\000\000\000\000\003\000\340\000\001\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000(\"\000\000\000\000\000\000,\001\000\000@\0008\000\b\000@\000\016\000\f\000\006\000\000\000\004\000\000\000@\000\000\000\000\000\000\000@\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\300\001\000\000\000\000\000\000\300\001\000\000\000\000\000\000\b\000\000\000\000\000\000\000\001\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\200\007\000\000\000\000\000\000\200\007\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\005\000\000\000\000\020\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\020\000\000\000\000\000\000X\000\000\000\000\000\000\000X\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\006\000\000\000\000 \000\000\000\000\000\000\000 \000\000\000\000\000\000\000 \000\000\000\000\000\000p\000\000\000\000\000\000\000p\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\002\000\000\000\006\000\000\000\000 \000\000\000\000\000\000\000 \000\000\000\000\000\000\000 \000\000\000\000\000\000p\000\000\000\000\000\000\000p\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000R\345td\004\000\000\000\000 \000\000\000\000\000\000\000 \000\000\000\000\000\000\000 \000\000\000\000\000\000p\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\000\000\000\000Q\345td\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\004\000\000\000\000\002\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\002\000\000\000\000\000\000<\004\000\000\000\000\000\000<\004\000\000\000\000\000\000\004\000\000\000\000\000\000\000\007\000\000\000%\004\000\000 \000\000\000AMDGPU\000\000\203\256amdhsa.kernels\221\217\245.args\232\205\247.access\251read_only\256.address_space\246global\247.offset\000\245.size\b\253.value_kind\255global_buffer\205\247.access\251read_only\256.address_space\246global\247.offset\b\245.size\b\253.value_kind\255global_buffer\204\256.address_space\246global\247.offset\020\245.size\b\253.value_kind\255global_buffer\203\247.offset\030\245.size\b\253.value_kind\266hidden_global_offset_x\203\247.offset \245.size\b\253.value_kind\266hidden_global_offset_y\203\247.offset(\245.size\b\253.value_kind\266hidden_global_offset_z\204\256.address_space\246global\247.offset0\245.size\b\253.value_kind\253hidden_none\204\256.address_space\246global\247.offset8\245.size\b\253.value_kind\253hidden_none\204\256.address_space\246global\247.offset@\245.size\b\253.value_kind\253hidden_none\204\256.address_space\246global\247.offsetH\245.size\b\253.value_kind\271hidden_multigrid_sync_arg\271.group_segment_fixed_size\000\266.kernarg_segment_align\b\265.kernarg_segment_sizeP\251.language\250OpenCL C\261.language_version\222\002\000\270.max_flat_workgroup_size\315\004\000\245.name\273_Z15vectorset_floatPKfS0_Pf\273.private_segment_fixed_size\000\253.sgpr_count\n\261.sgpr_spill_count\000\247.symbol\276_Z15vectorset_floatPKfS0_Pf.kd\253.vgpr_count\004\261.vgpr_spill_count\000\257.wavefront_size@\255amdhsa.target\271amdgcn-amd-amdhsa--gfx900\256amdhsa.version\222\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\022\003\007\000\000\020\000\000\000\000\000\000X\000\000\000\000\000\000\000\035\000\000\000\021\003\006\000@\007\000\000\000\000\000\000@\000\000\000\000\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\032\000\000\000\000@\202\000\001\000\000\000\001\000\000\000P\013\031\203\217g\256^\003\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000_Z15vectorset_floatPKfS0_Pf\000_Z15vectorset_floatPKfS0_Pf.kd\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000P\000\000\000\000\000\000\000\300\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\257\000\214\b\000\000\t\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\006\300\000\000\000\000\202\000\006\300\b\000\000\000\202\001\006\300\020\000\000\000\000\000\375\321\001\r\001\004\202\000\002$\240\000\230}\177\300\214\277\000\200P\334\001\000\000\002\000\200P\334\001\000\002\003p\017\214\277\002\007\004\002\002\005\006\002\003\005\000\000\000\200p\334\001\000\006\000\000\000\201\277\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\006\000\000\000\000\000\000\000@\006\000\000\000\000\000\000\013\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\005\000\000\000\000\000\000\000\314\006\000\000\000\000\000\000\n\000\000\000\000\000\000\000<\000\000\000\000\000\000\000\365\376\377o\000\000\000\000\210\006\000\000\000\000\000\000\004\000\000\000\000\000\000\000\254\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000AMD clang version 14.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.0.0 22051 235b6880e2e515507478181ec11a20c1ec87945b)\000Linker: AMD LLD 14.0.0\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000<\000\000\000\000\002\b\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\022\003\007\000\000\020\000\000\000\000\000\000X\000\000\000\000\000\000\000\035\000\000\000\021\003\006\000@\007\000\000\000\000\000\000@\000\000\000\000\000\000\000\000.note\000.dynsym\000.gnu.hash\000.hash\000.dynstr\000.rodata\000.text\000.dynamic\000.AMDGPU.csdata\000.comment\000.symtab\000.shstrtab\000.strtab\000\000_Z15vectorset_floatPKfS0_Pf\000_Z15vectorset_floatPKfS0_Pf.kd\000_DYNAMIC\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\007\000\000\000\002\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\002\000\000\000\000\000\000<\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\000\000\013\000\000\000\002\000\000\000\000\000\000\000@\006\000\000\000\000\000\000@\006\000\000\000\000\000\000H\000\000\000\000\000\000\000\005\000\000\000\001\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\017\000\000\000\366\377\377o\002\000\000\000\000\000\000\000\210\006\000\000\000\000\000\000\210\006\000\000\000\000\000\000$\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\031\000\000\000\005\000\000\000\002\000\000\000\000\000\000\000\254\006\000\000\000\000\000\000\254\006\000\000\000\000\000\000 \000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\037\000\000\000\003\000\000\000\002\000\000\000\000\000\000\000\314\006\000\000\000\000\000\000\314\006\000\000\000\000\000\000<\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000'\000\000\000\001\000\000\000\002\000\000\000\000\000\000\000@\007\000\000\000\000\000\000@\007\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000/\000\000\000\001\000\000\000\006\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\020\000\000\000\000\000\000X\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\0005\000\000\000\006\000\000\000\003\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000 \000\000\000\000\000\000p\000\000\000\000\000\000\000\005\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000>\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000p \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000M\000\000\000\001\000\000\0000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000p \000\000\000\000\000\000\236\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000V\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\020!\000\000\000\000\000\000`\000\000\000\000\000\000\000\r\000\000\000\002\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000^\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000p!\000\000\000\000\000\000p\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000h\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\340!\000\000\000\000\000\000E\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	.L__unnamed_2, 13737

	.type	__hip_fatbin_wrapper,@object    # @__hip_fatbin_wrapper
	.section	.hipFatBinSegment,"a",@progbits
	.p2align	3
__hip_fatbin_wrapper:
	.long	1212764230                      # 0x48495046
	.long	1                               # 0x1
	.quad	.L__unnamed_2
	.quad	0
	.size	__hip_fatbin_wrapper, 24

	.type	__hip_gpubin_handle,@object     # @__hip_gpubin_handle
	.local	__hip_gpubin_handle
	.comm	__hip_gpubin_handle,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_vectoradd_hip.cpp
	.quad	__hip_module_ctor
	.ident	"AMD clang version 14.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.0.0 22051 235b6880e2e515507478181ec11a20c1ec87945b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z30__device_stub__vectorset_floatPKfS0_Pf
	.addrsig_sym _GLOBAL__sub_I_vectoradd_hip.cpp
	.addrsig_sym __hip_module_ctor
	.addrsig_sym __hip_module_dtor
	.addrsig_sym _ZStL8__ioinit
	.addrsig_sym __dso_handle
	.addrsig_sym _Z15vectorset_floatPKfS0_Pf
	.addrsig_sym _ZSt4cout
	.addrsig_sym .L__unnamed_2
	.addrsig_sym __hip_fatbin_wrapper
