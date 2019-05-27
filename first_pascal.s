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
# [20] begin
	leaq	-264(%rsp),%rsp
.Lc3:
# Var $result located in register al
# Var i located in register si
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
# [21] up := true;
	movb	$1,%r8b
# Var res located in register al
# [22] res := true;
	movb	$1,%al
# [23] for i := 2 to Length(n) do begin
	movzbw	8(%rsp),%dx
# Var i located in register si
	movw	$2,%si
	cmpw	%si,%dx
	jl	.Lj12
	subw	$1,%si
	.balign 8,0x90
.Lj13:
	addw	$1,%si
# [24] if n[i-1] < n[i] then
	movswq	%si,%rcx
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
# [25] if not up then
	testb	%r8b,%r8b
	jne	.Lj18
# [26] res := false;
	movb	$0,%al
.Lj18:
.Lj15:
# [27] if n[i-1] > n[i] then
	movswq	%si,%rcx
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
# [28] up := false;
	movb	$0,%r8b
.Lj22:
	cmpw	%si,%dx
	jg	.Lj13
.Lj12:
# Var $result located in register al
# Var res located in register al
# PeepHole Optimization,var9
# [32] end;
	andl	$255,%eax
	leaq	264(%rsp),%rsp
	ret
.Lc2:
.Le0:
	.size	P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN, .Le0 - P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN

.section .text.n_p$helloworld_$$_count$longint$longint$shortint$shortint$ps$$int64
	.balign 16,0x90
.globl	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64
	.type	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64,@function
P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64:
.Lc4:
# Temps allocated between rsp+0 and rsp+48
# [39] begin
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	leaq	-48(%rsp),%rsp
.Lc6:
# Var idx located in register eax
# Var pr located in register eax
# Var s1 located in register al
# Var s2 located in register al
# Var n located in register rax
# Var $result located in register rax
# Var res located in register rax
# Var tmp located in register r14w
# Var t located in register bx
# Var i located in register r13w
	movl	%edi,%eax
	movq	%rax,(%rsp)
	movl	%esi,%eax
	movq	%rax,24(%rsp)
	movb	%dl,32(%rsp)
	movb	%cl,40(%rsp)
	movq	%r8,8(%rsp)
	movq	$48,%rdi
	call	FPC_STACKCHECK
# [40] res := cache[idx,pr,s1,s2];
	movl	(%rsp),%edx
	movl	%edx,%eax
	andl	$4294967295,%eax
	imulq	$792,%rax,%rcx
	movl	24(%rsp),%edx
	movl	%edx,%eax
	andl	$4294967295,%eax
	imulq	$72,%rax,%rdx
	movb	32(%rsp),%al
# PeepHole Optimization,var9
	andl	$255,%eax
	leaq	U_$P$HELLOWORLD_$$_CACHE(%rcx,%rdx),%rcx
	imulq	$24,%rax,%rax
	movb	40(%rsp),%dl
# PeepHole Optimization,var9
	andl	$255,%edx
	leaq	(%rcx,%rax),%rax
# Var res located in register rax
	movq	(%rax,%rdx,8),%rax
# [41] if(res<>-1) then Exit(res);
	cmpq	$-1,%rax
	je	.Lj33
	movq	%rax,16(%rsp)
	jmp	.Lj28
.Lj33:
# Var tmp located in register r14w
# [42] tmp := 0;
	movw	$0,%r14w
# [43] if(idx = len) then begin
	movslq	(%rsp),%rax
	cmpq	U_$P$HELLOWORLD_$$_LEN,%rax
	jne	.Lj39
# [44] Exit(s1);
	movsbq	32(%rsp),%rax
	movq	%rax,16(%rsp)
	jmp	.Lj28
.Lj39:
# Var res located in register r15
# [46] res := 0;
	movq	$0,%r15
# [48] if(s1 = 1) then
	cmpb	$1,32(%rsp)
	jne	.Lj45
# [50] for i := 0 to 9 do begin
	movw	$0,%r13w
	subw	$1,%r13w
	.balign 8,0x90
.Lj48:
	addw	$1,%r13w
# [51] if(s2 = 0) then
	movb	40(%rsp),%al
	testb	%al,%al
	jne	.Lj50
# [53] if(pr <= i) then
	movswl	%r13w,%eax
	movl	24(%rsp),%edx
	cmpl	%edx,%eax
	jnge	.Lj52
# [54] res := res + count(idx+1, i, s1, 0, n)
	movslq	(%rsp),%rax
	addq	$1,%rax
	jno	.Lj57
	call	FPC_OVERFLOW
.Lj57:
	movl	%eax,%r9d
	movswl	%r13w,%eax
	movl	%eax,%edi
	movq	8(%rsp),%rsi
	movsbl	32(%rsp),%eax
	movl	$0,%ecx
	movl	%eax,%edx
	movq	%rsi,%r8
	movl	%edi,%esi
	movl	%r9d,%edi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64
	addq	%r15,%rax
	jno	.Lj66
	call	FPC_OVERFLOW
.Lj66:
	movq	%rax,%r15
	jmp	.Lj82
.Lj52:
# [55] else res := res + count(idx+1, i, s1, 1, n);
	movslq	(%rsp),%rax
	addq	$1,%rax
	jno	.Lj72
	call	FPC_OVERFLOW
.Lj72:
	movl	%eax,%r9d
	movswl	%r13w,%eax
	movl	%eax,%edi
	movq	8(%rsp),%rsi
	movsbl	32(%rsp),%eax
	movl	$1,%ecx
	movl	%eax,%edx
	movq	%rsi,%r8
	movl	%edi,%esi
	movl	%r9d,%edi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64
	addq	%r15,%rax
	jno	.Lj81
	call	FPC_OVERFLOW
.Lj81:
	movq	%rax,%r15
	jmp	.Lj82
.Lj50:
# [57] else if(pr >= i) then
	movswl	%r13w,%edx
	movl	24(%rsp),%eax
	cmpl	%eax,%edx
	jnle	.Lj84
# [58] res := res + count(idx+1, i, s1, 1, n);
	movslq	(%rsp),%rax
	addq	$1,%rax
	jno	.Lj89
	call	FPC_OVERFLOW
.Lj89:
	movl	%eax,%r9d
	movswl	%r13w,%eax
	movl	%eax,%edi
	movq	8(%rsp),%rsi
	movsbl	32(%rsp),%eax
	movl	$1,%ecx
	movl	%eax,%edx
	movq	%rsi,%r8
	movl	%edi,%esi
	movl	%r9d,%edi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64
	addq	%r15,%rax
	jno	.Lj98
	call	FPC_OVERFLOW
.Lj98:
	movq	%rax,%r15
.Lj84:
.Lj82:
	cmpw	$9,%r13w
	jl	.Lj48
	jmp	.Lj99
.Lj45:
# [63] t := i32(n^[idx+1])-48;
	movslq	(%rsp),%rax
	addq	$1,%rax
	jno	.Lj102
	call	FPC_OVERFLOW
.Lj102:
# PeepHole Optimization,var9
	andl	$255,%eax
	movq	8(%rsp),%rdx
	movzbl	(%rdx,%rax,1),%eax
	movslq	%eax,%rax
	subq	$48,%rax
	jno	.Lj103
	call	FPC_OVERFLOW
.Lj103:
	movw	%ax,%bx
# [64] for i := 0 to t do begin
	movw	%bx,%r12w
	movw	$0,%r13w
	cmpw	%r13w,%r12w
	jl	.Lj107
	subw	$1,%r13w
	.balign 8,0x90
.Lj108:
	addw	$1,%r13w
# [65] if(i < t) then tmp := 1
	cmpw	%bx,%r13w
	jnl	.Lj110
	movw	$1,%r14w
	jmp	.Lj113
.Lj110:
# [66] else tmp := 0;
	movw	$0,%r14w
.Lj113:
# [67] if(s2 = 0) then
	movb	40(%rsp),%al
	testb	%al,%al
	jne	.Lj117
# [69] if(pr <= i) then
	movswl	%r13w,%eax
	movl	24(%rsp),%edx
	cmpl	%edx,%eax
	jnge	.Lj119
# [70] res := res + count(idx+1, i, tmp, 0, n)
	movslq	(%rsp),%rax
	addq	$1,%rax
	jno	.Lj124
	call	FPC_OVERFLOW
.Lj124:
	movl	%eax,%edi
	movb	%r14b,%al
	movsbl	%al,%edx
	movswl	%r13w,%eax
	movl	%eax,%esi
	movq	8(%rsp),%rax
	movl	$0,%ecx
	movq	%rax,%r8
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64
	addq	%r15,%rax
	jno	.Lj133
	call	FPC_OVERFLOW
.Lj133:
	movq	%rax,%r15
	jmp	.Lj149
.Lj119:
# [72] res := res + count(idx+1, i, tmp, 1, n);
	movslq	(%rsp),%rax
	addq	$1,%rax
	jno	.Lj139
	call	FPC_OVERFLOW
.Lj139:
	movl	%eax,%edi
	movb	%r14b,%al
	movsbl	%al,%edx
	movswl	%r13w,%eax
	movl	%eax,%esi
	movq	8(%rsp),%rax
	movl	$1,%ecx
	movq	%rax,%r8
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64
	addq	%r15,%rax
	jno	.Lj148
	call	FPC_OVERFLOW
.Lj148:
	movq	%rax,%r15
	jmp	.Lj149
.Lj117:
# [74] else if(pr >= i) then
	movswl	%r13w,%edx
	movl	24(%rsp),%eax
	cmpl	%eax,%edx
	jnle	.Lj151
# [75] res := res + count(idx+1, i, tmp, 1, n);
	movslq	(%rsp),%rax
	addq	$1,%rax
	jno	.Lj156
	call	FPC_OVERFLOW
.Lj156:
	movl	%eax,%edi
	movb	%r14b,%al
	movsbl	%al,%edx
	movswl	%r13w,%eax
	movl	%eax,%esi
	movq	8(%rsp),%rax
	movl	$1,%ecx
	movq	%rax,%r8
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64
	addq	%r15,%rax
	jno	.Lj165
	call	FPC_OVERFLOW
.Lj165:
	movq	%rax,%r15
.Lj151:
.Lj149:
	cmpw	%r13w,%r12w
	jg	.Lj108
.Lj107:
.Lj99:
# [78] cache[idx,pr,s1,s2] := res;
	movl	(%rsp),%edx
	movl	%edx,%eax
	andl	$4294967295,%eax
	imulq	$792,%rax,%rcx
	movl	24(%rsp),%edx
	movl	%edx,%eax
	andl	$4294967295,%eax
	imulq	$72,%rax,%rdx
	movb	32(%rsp),%al
# PeepHole Optimization,var9
	andl	$255,%eax
	leaq	U_$P$HELLOWORLD_$$_CACHE(%rcx,%rdx),%rdx
	imulq	$24,%rax,%rax
	movb	40(%rsp),%cl
# PeepHole Optimization,var9
	andl	$255,%ecx
	leaq	(%rdx,%rax),%rdx
	movq	%r15,%rax
# Var res located in register rax
	movq	%rax,(%rdx,%rcx,8)
# Var res located in register rax
# [79] Exit(res);
	movq	%rax,16(%rsp)
.Lj28:
# [80] end;
	movq	16(%rsp),%rax
	leaq	48(%rsp),%rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	ret
.Lc5:
.Le1:
	.size	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64, .Le1 - P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64

.section .text.n_main
	.balign 16,0x90
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	main
	.type	main,@function
main:
.Lc7:
# [83] begin
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
.Lc9:
# Var i located in register r15
# Var j located in register rbx
# Var k located in register r13
	call	FPC_INITIALIZEUNITS
	movq	$0,%r15
	movq	$0,%rbx
	movq	$0,%rax
# [84] readln(countc);
	call	fpc_get_input
	movq	%rax,%r12
	movq	$U_$P$HELLOWORLD_$$_COUNTC,%rsi
	movq	%r12,%rdi
	call	fpc_read_text_sint
	call	FPC_IOCHECK
	movq	%r12,%rdi
	call	fpc_readln_end
	call	FPC_IOCHECK
# [85] for k := 0 to countc-1 do begin
	movq	U_$P$HELLOWORLD_$$_COUNTC,%rax
	subq	$1,%rax
	jno	.Lj180
	call	FPC_OVERFLOW
.Lj180:
	movq	%rax,%r12
# Var k located in register r13
	movq	$0,%r13
	cmpq	%r13,%r12
	jl	.Lj182
	subq	$1,%r13
	.balign 8,0x90
.Lj183:
	addq	$1,%r13
# [86] for i := 0 to 75 do
	movq	$0,%r15
	subq	$1,%r15
	.balign 8,0x90
.Lj186:
	addq	$1,%r15
# [87] for j := 0 to 10 do begin
	movq	$0,%rbx
	subq	$1,%rbx
	.balign 8,0x90
.Lj189:
	addq	$1,%rbx
# [88] cache[i,j,0,0] := -1;
	imulq	$792,%r15,%rdx
	imulq	$72,%rbx,%rax
	movq	$-1,U_$P$HELLOWORLD_$$_CACHE(%rdx,%rax)
# [89] cache[i,j,0,1] := -1;
	imulq	$792,%r15,%rax
	imulq	$72,%rbx,%rdx
	movq	$-1,U_$P$HELLOWORLD_$$_CACHE+8(%rax,%rdx)
# [90] cache[i,j,1,0] := -1;
	imulq	$792,%r15,%rax
	imulq	$72,%rbx,%rdx
	movq	$-1,U_$P$HELLOWORLD_$$_CACHE+24(%rax,%rdx)
# [91] cache[i,j,1,1] := -1;
	imulq	$792,%r15,%rax
	imulq	$72,%rbx,%rdx
	movq	$-1,U_$P$HELLOWORLD_$$_CACHE+32(%rax,%rdx)
	cmpq	$10,%rbx
	jl	.Lj189
	cmpq	$75,%r15
	jl	.Lj186
# [93] readln(n);
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
# [94] len := Length(n);
	movzbl	U_$P$HELLOWORLD_$$_N,%eax
	movq	%rax,U_$P$HELLOWORLD_$$_LEN
# [95] if(check(n))then
	movq	$U_$P$HELLOWORLD_$$_N,%rdi
	call	P$HELLOWORLD_$$_CHECK$SHORTSTRING$$BOOLEAN
	testb	%al,%al
	je	.Lj211
# [96] Writeln(count(0,0,0,0,@n))
	call	fpc_get_output
	movq	%rax,%r14
	movq	$U_$P$HELLOWORLD_$$_N,%r8
	movl	$0,%ecx
	movl	$0,%edx
	movl	$0,%esi
	movl	$0,%edi
	call	P$HELLOWORLD_$$_COUNT$LONGINT$LONGINT$SHORTINT$SHORTINT$PS$$INT64
	movq	%rax,%rdx
	movq	%r14,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%r14,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
	jmp	.Lj234
.Lj211:
# [97] else Writeln('-1');
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
.Lj234:
	cmpq	%r13,%r12
	jg	.Lj183
.Lj182:
# [99] end.
	call	FPC_DO_EXIT
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
# [12] n:String;
	.type U_$P$HELLOWORLD_$$_N,@object
	.size U_$P$HELLOWORLD_$$_N,256
U_$P$HELLOWORLD_$$_N:
	.zero 256

.section .bss
	.balign 8
# [13] countc, i, j, k, len: i64;
	.type U_$P$HELLOWORLD_$$_COUNTC,@object
	.size U_$P$HELLOWORLD_$$_COUNTC,8
U_$P$HELLOWORLD_$$_COUNTC:
	.zero 8

.section .bss
	.balign 8
	.type U_$P$HELLOWORLD_$$_I,@object
	.size U_$P$HELLOWORLD_$$_I,8
U_$P$HELLOWORLD_$$_I:
	.zero 8

.section .bss
	.balign 8
	.type U_$P$HELLOWORLD_$$_J,@object
	.size U_$P$HELLOWORLD_$$_J,8
U_$P$HELLOWORLD_$$_J:
	.zero 8

.section .bss
	.balign 8
	.type U_$P$HELLOWORLD_$$_K,@object
	.size U_$P$HELLOWORLD_$$_K,8
U_$P$HELLOWORLD_$$_K:
	.zero 8

.section .bss
	.balign 8
	.type U_$P$HELLOWORLD_$$_LEN,@object
	.size U_$P$HELLOWORLD_$$_LEN,8
U_$P$HELLOWORLD_$$_LEN:
	.zero 8

.section .bss
	.balign 8
# [14] cache: C;
	.type U_$P$HELLOWORLD_$$_CACHE,@object
	.size U_$P$HELLOWORLD_$$_CACHE,60192
U_$P$HELLOWORLD_$$_CACHE:
	.zero 60192

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
# [100] 
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
	.uleb128	56
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
	.uleb128	8
	.balign 4,0
.Lc18:
# End asmlist al_dwarf_frame
.section .note.GNU-stack,"",%progbits

