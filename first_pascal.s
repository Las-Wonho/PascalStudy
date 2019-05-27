	.file "first_pascal.pas"
# Begin asmlist al_procedures

.section .text.n_p$helloworld_$$_check$shortstring$$boolean
	.balign 16,0x90
.globl	P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN
	.type	P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN,@function
P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN:
.Lc1:
# Temps allocated between rsp+8 and rsp+264
# [first_pascal.pas]
# [15] begin
	leaq	-264(%rsp),%rsp
.Lc3:
# Var $result located in register al
# Var i located in register esi
# Var up located in register r8b
# Var res located in register al
# Var n located at rsp+0, size=OS_64
	movq	%rdi,(%rsp)
	movq	(%rsp),%rdx
	movq	$255,%rsi
	leaq	8(%rsp),%rdi
	call	fpc_shortstr_to_shortstr
	movq	$264,%rdi
	call	FPC_STACKCHECK
# Var up located in register r8b
# [16] up := true;
	movb	$1,%r8b
# Var res located in register al
# [17] res := true;
	movb	$1,%al
# [18] for i := 2 to Length(n) do begin
	movzbl	8(%rsp),%edx
# Var i located in register esi
	movl	$2,%esi
	cmpl	%esi,%edx
	jl	.Lj12
	subl	$1,%esi
	.balign 8,0x90
.Lj13:
	addl	$1,%esi
# [19] if n[i-1] < n[i] then
	movslq	%esi,%rcx
	subq	$1,%rcx
	jno	.Lj16
	call	FPC_OVERFLOW
.Lj16:
# PeepHole Optimization,var9
	andl	$255,%ecx
	movb	%sil,%dil
# PeepHole Optimization,var9
	andl	$255,%edi
	movb	8(%rsp,%rcx,1),%cl
	cmpb	8(%rsp,%rdi,1),%cl
	jnb	.Lj15
# [20] if not up then
	testb	%r8b,%r8b
	jne	.Lj18
# [21] res := false;
	movb	$0,%al
.Lj18:
.Lj15:
# [22] if n[i-1] > n[i] then
	movslq	%esi,%rcx
	subq	$1,%rcx
	jno	.Lj23
	call	FPC_OVERFLOW
.Lj23:
# PeepHole Optimization,var9
	andl	$255,%ecx
	movb	%sil,%dil
# PeepHole Optimization,var9
	andl	$255,%edi
	movb	8(%rsp,%rcx,1),%cl
	cmpb	8(%rsp,%rdi,1),%cl
	jna	.Lj22
# [23] up := false;
	movb	$0,%r8b
.Lj22:
	cmpl	%esi,%edx
	jg	.Lj13
.Lj12:
# Var $result located in register al
# Var res located in register al
# PeepHole Optimization,var9
# [27] end;
	andl	$255,%eax
	leaq	264(%rsp),%rsp
	ret
.Lc2:
.Le0:
	.size	P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN, .Le0 - P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN

.section .text.n_p$helloworld_$$_count$longint$longint$longint$longint$shortstring$pc$$int64
	.balign 16,0x90
.globl	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64
	.type	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64,@function
P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64:
.Lc4:
# Temps allocated between rsp+8 and rsp+304
# [34] begin
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	leaq	-304(%rsp),%rsp
.Lc6:
# Var idx located in register eax
# Var pr located in register eax
# Var s1 located in register eax
# Var s2 located in register eax
# Var cache located in register rcx
# Var $result located in register rax
# Var res located in register rax
# Var tmp located in register r14d
# Var len located in register ecx
# Var i located in register r12d
# Var n located at rsp+0, size=OS_64
	movl	%edi,%eax
	movq	%rax,272(%rsp)
	movl	%esi,%eax
	movq	%rax,280(%rsp)
	movl	%edx,%eax
	movq	%rax,288(%rsp)
	movl	%ecx,%eax
	movq	%rax,296(%rsp)
	movq	%r8,(%rsp)
	movq	%r9,%r15
	movq	(%rsp),%rdx
	movq	$255,%rsi
	leaq	8(%rsp),%rdi
	call	fpc_shortstr_to_shortstr
	movq	$304,%rdi
	call	FPC_STACKCHECK
# [35] len := Length(n);
	movzbl	8(%rsp),%ecx
# Var len located in register ecx
# Var tmp located in register r14d
# [36] tmp := 0;
	movl	$0,%r14d
# [37] if(cache^[idx,pr,s1,s2]<>-5) then Exit(cache^[idx,pr,s1,s2]);
	movl	272(%rsp),%eax
	movl	%eax,%edx
	andl	$4294967295,%edx
	imulq	$792,%rdx,%rsi
	movl	280(%rsp),%eax
	movl	%eax,%edx
	andl	$4294967295,%edx
	leaq	(%r15,%rsi),%rdi
	imulq	$72,%rdx,%rdx
	movl	288(%rsp),%eax
	movl	%eax,%esi
	andl	$4294967295,%esi
	leaq	(%rdi,%rdx),%rdi
	imulq	$24,%rsi,%rdx
	movl	296(%rsp),%eax
	movl	%eax,%esi
	andl	$4294967295,%esi
	leaq	(%rdi,%rdx),%rax
	cmpq	$-5,(%rax,%rsi,8)
	je	.Lj35
	movl	272(%rsp),%eax
	movl	%eax,%edx
	andl	$4294967295,%edx
	imulq	$792,%rdx,%rsi
	movl	280(%rsp),%eax
	movl	%eax,%edx
	andl	$4294967295,%edx
	leaq	(%r15,%rsi),%rdi
	imulq	$72,%rdx,%rdx
	movl	288(%rsp),%eax
	movl	%eax,%esi
	andl	$4294967295,%esi
	leaq	(%rdi,%rdx),%rdi
	imulq	$24,%rsi,%rdx
	movl	296(%rsp),%eax
	movl	%eax,%esi
	andl	$4294967295,%esi
	leaq	(%rdi,%rdx),%rdx
	movq	(%rdx,%rsi,8),%rax
	movq	%rax,264(%rsp)
	jmp	.Lj28
.Lj35:
# [38] if(idx = len) then begin
	movl	272(%rsp),%eax
	cmpl	%ecx,%eax
	jne	.Lj39
# [39] Exit(s1);
	movslq	288(%rsp),%rax
	movq	%rax,264(%rsp)
	jmp	.Lj28
.Lj39:
# Var res located in register r13
# [41] res := 0;
	movq	$0,%r13
# [43] if(s1 = 1) then
	movl	288(%rsp),%eax
	cmpl	$1,%eax
	jne	.Lj45
# [45] for i := 0 to 9 do begin
	movl	$0,%r12d
	subl	$1,%r12d
	.balign 8,0x90
.Lj48:
	addl	$1,%r12d
# [46] if(s2 = 0) then
	movl	296(%rsp),%eax
	testl	%eax,%eax
	jne	.Lj50
# [48] if(pr <= i) then
	movl	280(%rsp),%eax
	cmpl	%r12d,%eax
	jnle	.Lj52
# [49] res := res + count(idx+1, i, s1, 0, n, cache)
	movslq	272(%rsp),%rax
	addq	$1,%rax
	jno	.Lj57
	call	FPC_OVERFLOW
.Lj57:
	movl	%eax,%edi
	movq	%r15,%r9
	leaq	8(%rsp),%r8
	movl	288(%rsp),%eax
	movl	%eax,%edx
	movl	%r12d,%eax
	movl	$0,%ecx
	movl	%eax,%esi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64
	addq	%r13,%rax
	jno	.Lj68
	call	FPC_OVERFLOW
.Lj68:
	movq	%rax,%r13
	jmp	.Lj86
.Lj52:
# [50] else res := res + count(idx+1, i, s1, 1, n, cache);
	movslq	272(%rsp),%rax
	addq	$1,%rax
	jno	.Lj74
	call	FPC_OVERFLOW
.Lj74:
	movl	%eax,%edi
	movq	%r15,%r9
	leaq	8(%rsp),%r8
	movl	288(%rsp),%eax
	movl	%eax,%edx
	movl	%r12d,%eax
	movl	$1,%ecx
	movl	%eax,%esi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64
	addq	%r13,%rax
	jno	.Lj85
	call	FPC_OVERFLOW
.Lj85:
	movq	%rax,%r13
	jmp	.Lj86
.Lj50:
# [52] else if(pr >= i) then
	movl	280(%rsp),%eax
	cmpl	%r12d,%eax
	jnge	.Lj88
# [53] res := res + count(idx+1, i, s1, 1, n, cache);
	movslq	272(%rsp),%rax
	addq	$1,%rax
	jno	.Lj93
	call	FPC_OVERFLOW
.Lj93:
	movl	%eax,%edi
	movq	%r15,%r9
	leaq	8(%rsp),%r8
	movl	288(%rsp),%eax
	movl	%eax,%edx
	movl	%r12d,%eax
	movl	$1,%ecx
	movl	%eax,%esi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64
	addq	%r13,%rax
	jno	.Lj104
	call	FPC_OVERFLOW
.Lj104:
	movq	%rax,%r13
.Lj88:
.Lj86:
	cmpl	$9,%r12d
	jl	.Lj48
	jmp	.Lj105
.Lj45:
# [58] for i := 0 to (i32(n[idx+1])-48) do begin
	movslq	272(%rsp),%rax
	addq	$1,%rax
	jno	.Lj108
	call	FPC_OVERFLOW
.Lj108:
# PeepHole Optimization,var9
	andl	$255,%eax
	movzbl	8(%rsp,%rax,1),%eax
	movslq	%eax,%rax
	subq	$48,%rax
	jno	.Lj109
	call	FPC_OVERFLOW
.Lj109:
	movl	%eax,%ebx
	movl	$0,%r12d
	cmpl	%r12d,%ebx
	jl	.Lj111
	subl	$1,%r12d
	.balign 8,0x90
.Lj112:
	addl	$1,%r12d
# [59] if(i < i32(n[idx+1])-48) then tmp := 1
	movslq	272(%rsp),%rax
	addq	$1,%rax
	jno	.Lj115
	call	FPC_OVERFLOW
.Lj115:
# PeepHole Optimization,var9
	andl	$255,%eax
	movzbl	8(%rsp,%rax,1),%eax
	movslq	%eax,%rax
	subq	$48,%rax
	jno	.Lj116
	call	FPC_OVERFLOW
.Lj116:
	movslq	%r12d,%rdx
	cmpq	%rdx,%rax
	jng	.Lj114
	movl	$1,%r14d
	jmp	.Lj119
.Lj114:
# [60] else tmp := 0;
	movl	$0,%r14d
.Lj119:
# [61] if(s2 = 0) then
	movl	296(%rsp),%eax
	testl	%eax,%eax
	jne	.Lj123
# [63] if(pr <= i) then
	movl	280(%rsp),%eax
	cmpl	%r12d,%eax
	jnle	.Lj125
# [64] res := res + count(idx+1, i, tmp, 0, n,cache)
	movslq	272(%rsp),%rax
	addq	$1,%rax
	jno	.Lj130
	call	FPC_OVERFLOW
.Lj130:
	movl	%eax,%edi
	movq	%r15,%r9
	leaq	8(%rsp),%r8
	movl	%r14d,%edx
	movl	%r12d,%eax
	movl	$0,%ecx
	movl	%eax,%esi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64
	addq	%r13,%rax
	jno	.Lj141
	call	FPC_OVERFLOW
.Lj141:
	movq	%rax,%r13
	jmp	.Lj159
.Lj125:
# [66] res := res + count(idx+1, i, tmp, 1, n,cache);
	movslq	272(%rsp),%rax
	addq	$1,%rax
	jno	.Lj147
	call	FPC_OVERFLOW
.Lj147:
	movl	%eax,%edi
	movq	%r15,%r9
	leaq	8(%rsp),%r8
	movl	%r14d,%edx
	movl	%r12d,%eax
	movl	$1,%ecx
	movl	%eax,%esi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64
	addq	%r13,%rax
	jno	.Lj158
	call	FPC_OVERFLOW
.Lj158:
	movq	%rax,%r13
	jmp	.Lj159
.Lj123:
# [68] else if(pr >= i) then
	movl	280(%rsp),%eax
	cmpl	%r12d,%eax
	jnge	.Lj161
# [69] res := res + count(idx+1, i, tmp, 1, n,cache);
	movslq	272(%rsp),%rax
	addq	$1,%rax
	jno	.Lj166
	call	FPC_OVERFLOW
.Lj166:
	movl	%eax,%edi
	movq	%r15,%r9
	leaq	8(%rsp),%r8
	movl	%r14d,%edx
	movl	%r12d,%eax
	movl	$1,%ecx
	movl	%eax,%esi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64
	addq	%r13,%rax
	jno	.Lj177
	call	FPC_OVERFLOW
.Lj177:
	movq	%rax,%r13
.Lj161:
.Lj159:
	cmpl	%r12d,%ebx
	jg	.Lj112
.Lj111:
.Lj105:
# [72] cache^[idx,pr,s1,s2] := res;
	movq	%r15,%rcx
# Var cache located in register rcx
	movl	272(%rsp),%eax
	movl	%eax,%edx
	andl	$4294967295,%edx
	imulq	$792,%rdx,%rdx
	movl	280(%rsp),%eax
	movl	%eax,%esi
	andl	$4294967295,%esi
	leaq	(%rcx,%rdx),%rdi
	imulq	$72,%rsi,%rsi
	movl	288(%rsp),%eax
	movl	%eax,%edx
	andl	$4294967295,%edx
	leaq	(%rdi,%rsi),%rdi
	imulq	$24,%rdx,%rdx
	movl	296(%rsp),%eax
	movl	%eax,%esi
	andl	$4294967295,%esi
	leaq	(%rdi,%rdx),%rdx
	movq	%r13,%rax
# Var res located in register rax
	movq	%rax,(%rdx,%rsi,8)
# Var cache located in register rcx
# [73] Exit(cache^[idx,pr,s1,s2]);
	movl	272(%rsp),%eax
	movl	%eax,%edx
	andl	$4294967295,%edx
	imulq	$792,%rdx,%rdx
	movl	280(%rsp),%eax
	movl	%eax,%esi
	andl	$4294967295,%esi
	leaq	(%rcx,%rdx),%rdi
	imulq	$72,%rsi,%rdx
	movl	288(%rsp),%eax
	movl	%eax,%ecx
	andl	$4294967295,%ecx
	leaq	(%rdi,%rdx),%rsi
	imulq	$24,%rcx,%rdx
	movl	296(%rsp),%eax
	movl	%eax,%ecx
	andl	$4294967295,%ecx
	leaq	(%rsi,%rdx),%rdx
	movq	(%rdx,%rcx,8),%rax
	movq	%rax,264(%rsp)
.Lj28:
# [74] end;
	movq	264(%rsp),%rax
	leaq	304(%rsp),%rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	ret
.Lc5:
.Le1:
	.size	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64, .Le1 - P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64

.section .text.n_main
	.balign 16,0x90
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	main
	.type	main,@function
main:
.Lc7:
# Temps allocated between rsp+0 and rsp+8
# [81] begin
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	leaq	-16(%rsp),%rsp
.Lc9:
# Var countc located in register r12w
# Var i located in register r15w
# Var j located in register bx
# Var k located in register r13w
	call	FPC_INITIALIZEUNITS
	movw	$0,%ax
	movw	$0,%r15w
	movw	$0,%bx
	movw	$0,%ax
# [82] readln(countc);
	call	fpc_get_input
	movq	%rax,%r13
	movq	%rsp,%rsi
	movq	%r13,%rdi
	call	fpc_read_text_sint
	call	FPC_IOCHECK
# Var countc located in register r12w
	movw	(%rsp),%r12w
	movq	%r13,%rdi
	call	fpc_readln_end
	call	FPC_IOCHECK
# [83] for k := 0 to countc-1 do begin
	movswq	%r12w,%r12
	subq	$1,%r12
	jno	.Lj194
	call	FPC_OVERFLOW
.Lj194:
# Var k located in register r13w
	movw	$0,%r13w
	cmpw	%r13w,%r12w
	jl	.Lj196
	subw	$1,%r13w
	.balign 8,0x90
.Lj197:
	addw	$1,%r13w
# [84] for i := 0 to 75 do
	movw	$0,%r15w
	subw	$1,%r15w
	.balign 8,0x90
.Lj200:
	addw	$1,%r15w
# [85] for j := 0 to 10 do begin
	movw	$0,%bx
	subw	$1,%bx
	.balign 8,0x90
.Lj203:
	addw	$1,%bx
# [86] cache[i,j,0,0] := -5;
	movw	%r15w,%ax
# PeepHole Optimization,var11
	andl	$65535,%eax
	imulq	$792,%rax,%rdx
	movw	%bx,%ax
# PeepHole Optimization,var11
	andl	$65535,%eax
	imulq	$72,%rax,%rax
	movq	$-5,U_$P$HELLOWORLD_$$_CACHE(%rdx,%rax)
# [87] cache[i,j,0,1] := -5;
	movw	%r15w,%ax
# PeepHole Optimization,var11
	andl	$65535,%eax
	imulq	$792,%rax,%rdx
	movw	%bx,%ax
# PeepHole Optimization,var11
	andl	$65535,%eax
	imulq	$72,%rax,%rax
	movq	$-5,U_$P$HELLOWORLD_$$_CACHE+8(%rdx,%rax)
# [88] cache[i,j,1,0] := -5;
	movw	%r15w,%ax
# PeepHole Optimization,var11
	andl	$65535,%eax
	imulq	$792,%rax,%rdx
	movw	%bx,%ax
# PeepHole Optimization,var11
	andl	$65535,%eax
	imulq	$72,%rax,%rax
	movq	$-5,U_$P$HELLOWORLD_$$_CACHE+24(%rdx,%rax)
# [89] cache[i,j,1,1] := -5;
	movw	%r15w,%ax
# PeepHole Optimization,var11
	andl	$65535,%eax
	imulq	$792,%rax,%rdx
	movw	%bx,%ax
# PeepHole Optimization,var11
	andl	$65535,%eax
	imulq	$72,%rax,%rax
	movq	$-5,U_$P$HELLOWORLD_$$_CACHE+32(%rdx,%rax)
	cmpw	$10,%bx
	jl	.Lj203
	cmpw	$75,%r15w
	jl	.Lj200
# [91] readln(n);
	call	fpc_get_input
	movq	%rax,%r14
	movq	$U_$P$HELLOWORLD_$$_N,%rsi
	movq	%r14,%rdi
	movq	$255,%rdx
	call	fpc_read_text_shortstr
	call	FPC_IOCHECK
	movq	%r14,%rdi
	call	fpc_readln_end
	call	FPC_IOCHECK
# [92] if(check(n))then
	movq	$U_$P$HELLOWORLD_$$_N,%rdi
	call	P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN
	testb	%al,%al
	je	.Lj223
# [93] writeln(count(0,0,0,0,n, @cache))
	call	fpc_get_output
	movq	%rax,%r14
	movq	$U_$P$HELLOWORLD_$$_CACHE,%r9
	movq	$U_$P$HELLOWORLD_$$_N,%r8
	movl	$0,%ecx
	movl	$0,%edx
	movl	$0,%esi
	movl	$0,%edi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$LONGINT$LONGINT$SHORTSTRING$PC$$INT64
	movq	%rax,%rdx
	movq	%r14,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%r14,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
	jmp	.Lj248
.Lj223:
# [94] else writeln('-1');
	call	fpc_get_output
	movq	%rax,%r14
	movq	$_$HELLOWORLD$_Ld1,%rdx
	movq	%r14,%rsi
	movl	$0,%edi
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movq	%r14,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
.Lj248:
	cmpw	%r13w,%r12w
	jg	.Lj197
.Lj196:
# [96] end.
	call	FPC_DO_EXIT
	leaq	16(%rsp),%rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	ret
.Lc8:
.Le2:
	.size	main, .Le2 - main

.section .text
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
# [77] n:String;
	.type U_$P$HELLOWORLD_$$_N,@object
	.size U_$P$HELLOWORLD_$$_N,256
U_$P$HELLOWORLD_$$_N:
	.zero 256

.section .bss
	.balign 2
# [78] countc, i, j, k: i16;
	.type U_$P$HELLOWORLD_$$_COUNTC,@object
	.size U_$P$HELLOWORLD_$$_COUNTC,2
U_$P$HELLOWORLD_$$_COUNTC:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$HELLOWORLD_$$_I,@object
	.size U_$P$HELLOWORLD_$$_I,2
U_$P$HELLOWORLD_$$_I:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$HELLOWORLD_$$_J,@object
	.size U_$P$HELLOWORLD_$$_J,2
U_$P$HELLOWORLD_$$_J:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$HELLOWORLD_$$_K,@object
	.size U_$P$HELLOWORLD_$$_K,2
U_$P$HELLOWORLD_$$_K:
	.zero 2

.section .bss
	.balign 8
# [79] cache: C;
	.type U_$P$HELLOWORLD_$$_CACHE,@object
	.size U_$P$HELLOWORLD_$$_CACHE,57024
U_$P$HELLOWORLD_$$_CACHE:
	.zero 57024

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	3,0
	.quad	INIT$_$SYSTEM
	.quad	0
	.quad	INIT$_$UNIX
	.quad	FINALIZE$_$UNIX
	.quad	INIT$_$CRT
	.quad	FINALIZE$_$CRT
# [97] 
.Le3:
	.size	INITFINAL, .Le3 - INITFINAL

.section .data.n_FPC_THREADVARTABLES
	.balign 8
.globl	FPC_THREADVARTABLES
	.type	FPC_THREADVARTABLES,@object
FPC_THREADVARTABLES:
	.long	1
	.quad	THREADVARLIST_$SYSTEM
.Le4:
	.size	FPC_THREADVARTABLES, .Le4 - FPC_THREADVARTABLES

.section .data.n_FPC_RESOURCESTRINGTABLES
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
	.type	FPC_RESOURCESTRINGTABLES,@object
FPC_RESOURCESTRINGTABLES:
	.quad	0
.Le5:
	.size	FPC_RESOURCESTRINGTABLES, .Le5 - FPC_RESOURCESTRINGTABLES

.section .data.n_FPC_WIDEINITTABLES
	.balign 8
.globl	FPC_WIDEINITTABLES
	.type	FPC_WIDEINITTABLES,@object
FPC_WIDEINITTABLES:
	.quad	0
.Le6:
	.size	FPC_WIDEINITTABLES, .Le6 - FPC_WIDEINITTABLES

.section .data.n_FPC_RESSTRINITTABLES
	.balign 8
.globl	FPC_RESSTRINITTABLES
	.type	FPC_RESSTRINITTABLES,@object
FPC_RESSTRINITTABLES:
	.quad	0
.Le7:
	.size	FPC_RESSTRINITTABLES, .Le7 - FPC_RESSTRINITTABLES

.section .fpc.n_version
	.balign 8
	.ascii	"FPC 3.0.0+dfsg-2 [2016/01/28] for x86_64 - Linux"

.section .data.n___stklen
	.balign 8
.globl	__stklen
	.type	__stklen,@object
__stklen:
	.quad	8388608

.section .data.n___heapsize
	.balign 8
.globl	__heapsize
	.type	__heapsize,@object
__heapsize:
	.quad	0

.section .data.n___fpc_valgrind
.globl	__fpc_valgrind
	.type	__fpc_valgrind,@object
__fpc_valgrind:
	.byte	0

.section .data.n_FPC_RESLOCATION
	.balign 8
.globl	FPC_RESLOCATION
	.type	FPC_RESLOCATION,@object
FPC_RESLOCATION:
	.quad	0
# End asmlist al_globals
# Begin asmlist al_typedconsts

.section .rodata.n__$HELLOWORLD$_Ld1
	.balign 8
.globl	_$HELLOWORLD$_Ld1
_$HELLOWORLD$_Ld1:
	.ascii	"\002-1\000"
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc10:
	.long	.Lc12-.Lc11
.Lc11:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	16
	.byte	12
	.uleb128	7
	.uleb128	8
	.byte	5
	.uleb128	16
	.uleb128	2
	.balign 4,0
.Lc12:
	.long	.Lc14-.Lc13
.Lc13:
	.quad	.Lc10
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	272
	.balign 4,0
.Lc14:
	.long	.Lc16-.Lc15
.Lc15:
	.quad	.Lc10
	.quad	.Lc4
	.quad	.Lc5-.Lc4
	.byte	4
	.long	.Lc6-.Lc4
	.byte	14
	.uleb128	312
	.balign 4,0
.Lc16:
	.long	.Lc18-.Lc17
.Lc17:
	.quad	.Lc10
	.quad	.Lc7
	.quad	.Lc8-.Lc7
	.byte	4
	.long	.Lc9-.Lc7
	.byte	14
	.uleb128	24
	.balign 4,0
.Lc18:
# End asmlist al_dwarf_frame
.section .note.GNU-stack,"",%progbits

