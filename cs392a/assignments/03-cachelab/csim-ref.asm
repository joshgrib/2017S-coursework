
csim-ref:     file format elf64-x86-64


Disassembly of section .init:

0000000000400918 <_init>:
  400918:	48 83 ec 08          	sub    $0x8,%rsp
  40091c:	48 8b 05 d5 16 20 00 	mov    0x2016d5(%rip),%rax        # 601ff8 <_DYNAMIC+0x1e0>
  400923:	48 85 c0             	test   %rax,%rax
  400926:	74 05                	je     40092d <_init+0x15>
  400928:	e8 53 01 00 00       	callq  400a80 <strerror@plt+0x10>
  40092d:	48 83 c4 08          	add    $0x8,%rsp
  400931:	c3                   	retq   

Disassembly of section .plt:

0000000000400940 <free@plt-0x10>:
  400940:	ff 35 c2 16 20 00    	pushq  0x2016c2(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400946:	ff 25 c4 16 20 00    	jmpq   *0x2016c4(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40094c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400950 <free@plt>:
  400950:	ff 25 c2 16 20 00    	jmpq   *0x2016c2(%rip)        # 602018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400956:	68 00 00 00 00       	pushq  $0x0
  40095b:	e9 e0 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400960 <putchar@plt>:
  400960:	ff 25 ba 16 20 00    	jmpq   *0x2016ba(%rip)        # 602020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400966:	68 01 00 00 00       	pushq  $0x1
  40096b:	e9 d0 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400970 <__errno_location@plt>:
  400970:	ff 25 b2 16 20 00    	jmpq   *0x2016b2(%rip)        # 602028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400976:	68 02 00 00 00       	pushq  $0x2
  40097b:	e9 c0 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400980 <puts@plt>:
  400980:	ff 25 aa 16 20 00    	jmpq   *0x2016aa(%rip)        # 602030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400986:	68 03 00 00 00       	pushq  $0x3
  40098b:	e9 b0 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400990 <fclose@plt>:
  400990:	ff 25 a2 16 20 00    	jmpq   *0x2016a2(%rip)        # 602038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400996:	68 04 00 00 00       	pushq  $0x4
  40099b:	e9 a0 ff ff ff       	jmpq   400940 <_init+0x28>

00000000004009a0 <__stack_chk_fail@plt>:
  4009a0:	ff 25 9a 16 20 00    	jmpq   *0x20169a(%rip)        # 602040 <_GLOBAL_OFFSET_TABLE_+0x40>
  4009a6:	68 05 00 00 00       	pushq  $0x5
  4009ab:	e9 90 ff ff ff       	jmpq   400940 <_init+0x28>

00000000004009b0 <printf@plt>:
  4009b0:	ff 25 92 16 20 00    	jmpq   *0x201692(%rip)        # 602048 <_GLOBAL_OFFSET_TABLE_+0x48>
  4009b6:	68 06 00 00 00       	pushq  $0x6
  4009bb:	e9 80 ff ff ff       	jmpq   400940 <_init+0x28>

00000000004009c0 <__assert_fail@plt>:
  4009c0:	ff 25 8a 16 20 00    	jmpq   *0x20168a(%rip)        # 602050 <_GLOBAL_OFFSET_TABLE_+0x50>
  4009c6:	68 07 00 00 00       	pushq  $0x7
  4009cb:	e9 70 ff ff ff       	jmpq   400940 <_init+0x28>

00000000004009d0 <pow@plt>:
  4009d0:	ff 25 82 16 20 00    	jmpq   *0x201682(%rip)        # 602058 <_GLOBAL_OFFSET_TABLE_+0x58>
  4009d6:	68 08 00 00 00       	pushq  $0x8
  4009db:	e9 60 ff ff ff       	jmpq   400940 <_init+0x28>

00000000004009e0 <__libc_start_main@plt>:
  4009e0:	ff 25 7a 16 20 00    	jmpq   *0x20167a(%rip)        # 602060 <_GLOBAL_OFFSET_TABLE_+0x60>
  4009e6:	68 09 00 00 00       	pushq  $0x9
  4009eb:	e9 50 ff ff ff       	jmpq   400940 <_init+0x28>

00000000004009f0 <fgets@plt>:
  4009f0:	ff 25 72 16 20 00    	jmpq   *0x201672(%rip)        # 602068 <_GLOBAL_OFFSET_TABLE_+0x68>
  4009f6:	68 0a 00 00 00       	pushq  $0xa
  4009fb:	e9 40 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400a00 <fprintf@plt>:
  400a00:	ff 25 6a 16 20 00    	jmpq   *0x20166a(%rip)        # 602070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400a06:	68 0b 00 00 00       	pushq  $0xb
  400a0b:	e9 30 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400a10 <malloc@plt>:
  400a10:	ff 25 62 16 20 00    	jmpq   *0x201662(%rip)        # 602078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400a16:	68 0c 00 00 00       	pushq  $0xc
  400a1b:	e9 20 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400a20 <__isoc99_sscanf@plt>:
  400a20:	ff 25 5a 16 20 00    	jmpq   *0x20165a(%rip)        # 602080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400a26:	68 0d 00 00 00       	pushq  $0xd
  400a2b:	e9 10 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400a30 <fopen@plt>:
  400a30:	ff 25 52 16 20 00    	jmpq   *0x201652(%rip)        # 602088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400a36:	68 0e 00 00 00       	pushq  $0xe
  400a3b:	e9 00 ff ff ff       	jmpq   400940 <_init+0x28>

0000000000400a40 <getopt@plt>:
  400a40:	ff 25 4a 16 20 00    	jmpq   *0x20164a(%rip)        # 602090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400a46:	68 0f 00 00 00       	pushq  $0xf
  400a4b:	e9 f0 fe ff ff       	jmpq   400940 <_init+0x28>

0000000000400a50 <atoi@plt>:
  400a50:	ff 25 42 16 20 00    	jmpq   *0x201642(%rip)        # 602098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400a56:	68 10 00 00 00       	pushq  $0x10
  400a5b:	e9 e0 fe ff ff       	jmpq   400940 <_init+0x28>

0000000000400a60 <exit@plt>:
  400a60:	ff 25 3a 16 20 00    	jmpq   *0x20163a(%rip)        # 6020a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400a66:	68 11 00 00 00       	pushq  $0x11
  400a6b:	e9 d0 fe ff ff       	jmpq   400940 <_init+0x28>

0000000000400a70 <strerror@plt>:
  400a70:	ff 25 32 16 20 00    	jmpq   *0x201632(%rip)        # 6020a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400a76:	68 12 00 00 00       	pushq  $0x12
  400a7b:	e9 c0 fe ff ff       	jmpq   400940 <_init+0x28>

Disassembly of section .plt.got:

0000000000400a80 <.plt.got>:
  400a80:	ff 25 72 15 20 00    	jmpq   *0x201572(%rip)        # 601ff8 <_DYNAMIC+0x1e0>
  400a86:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400a90 <_start>:
  400a90:	31 ed                	xor    %ebp,%ebp
  400a92:	49 89 d1             	mov    %rdx,%r9
  400a95:	5e                   	pop    %rsi
  400a96:	48 89 e2             	mov    %rsp,%rdx
  400a99:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400a9d:	50                   	push   %rax
  400a9e:	54                   	push   %rsp
  400a9f:	49 c7 c0 50 15 40 00 	mov    $0x401550,%r8
  400aa6:	48 c7 c1 e0 14 40 00 	mov    $0x4014e0,%rcx
  400aad:	48 c7 c7 64 12 40 00 	mov    $0x401264,%rdi
  400ab4:	e8 27 ff ff ff       	callq  4009e0 <__libc_start_main@plt>
  400ab9:	f4                   	hlt    
  400aba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400ac0 <deregister_tm_clones>:
  400ac0:	b8 cf 20 60 00       	mov    $0x6020cf,%eax
  400ac5:	55                   	push   %rbp
  400ac6:	48 2d c8 20 60 00    	sub    $0x6020c8,%rax
  400acc:	48 83 f8 0e          	cmp    $0xe,%rax
  400ad0:	48 89 e5             	mov    %rsp,%rbp
  400ad3:	76 1b                	jbe    400af0 <deregister_tm_clones+0x30>
  400ad5:	b8 00 00 00 00       	mov    $0x0,%eax
  400ada:	48 85 c0             	test   %rax,%rax
  400add:	74 11                	je     400af0 <deregister_tm_clones+0x30>
  400adf:	5d                   	pop    %rbp
  400ae0:	bf c8 20 60 00       	mov    $0x6020c8,%edi
  400ae5:	ff e0                	jmpq   *%rax
  400ae7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400aee:	00 00 
  400af0:	5d                   	pop    %rbp
  400af1:	c3                   	retq   
  400af2:	0f 1f 40 00          	nopl   0x0(%rax)
  400af6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400afd:	00 00 00 

0000000000400b00 <register_tm_clones>:
  400b00:	be c8 20 60 00       	mov    $0x6020c8,%esi
  400b05:	55                   	push   %rbp
  400b06:	48 81 ee c8 20 60 00 	sub    $0x6020c8,%rsi
  400b0d:	48 c1 fe 03          	sar    $0x3,%rsi
  400b11:	48 89 e5             	mov    %rsp,%rbp
  400b14:	48 89 f0             	mov    %rsi,%rax
  400b17:	48 c1 e8 3f          	shr    $0x3f,%rax
  400b1b:	48 01 c6             	add    %rax,%rsi
  400b1e:	48 d1 fe             	sar    %rsi
  400b21:	74 15                	je     400b38 <register_tm_clones+0x38>
  400b23:	b8 00 00 00 00       	mov    $0x0,%eax
  400b28:	48 85 c0             	test   %rax,%rax
  400b2b:	74 0b                	je     400b38 <register_tm_clones+0x38>
  400b2d:	5d                   	pop    %rbp
  400b2e:	bf c8 20 60 00       	mov    $0x6020c8,%edi
  400b33:	ff e0                	jmpq   *%rax
  400b35:	0f 1f 00             	nopl   (%rax)
  400b38:	5d                   	pop    %rbp
  400b39:	c3                   	retq   
  400b3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400b40 <__do_global_dtors_aux>:
  400b40:	80 3d c1 15 20 00 00 	cmpb   $0x0,0x2015c1(%rip)        # 602108 <completed.7585>
  400b47:	75 11                	jne    400b5a <__do_global_dtors_aux+0x1a>
  400b49:	55                   	push   %rbp
  400b4a:	48 89 e5             	mov    %rsp,%rbp
  400b4d:	e8 6e ff ff ff       	callq  400ac0 <deregister_tm_clones>
  400b52:	5d                   	pop    %rbp
  400b53:	c6 05 ae 15 20 00 01 	movb   $0x1,0x2015ae(%rip)        # 602108 <completed.7585>
  400b5a:	f3 c3                	repz retq 
  400b5c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400b60 <frame_dummy>:
  400b60:	bf 10 1e 60 00       	mov    $0x601e10,%edi
  400b65:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400b69:	75 05                	jne    400b70 <frame_dummy+0x10>
  400b6b:	eb 93                	jmp    400b00 <register_tm_clones>
  400b6d:	0f 1f 00             	nopl   (%rax)
  400b70:	b8 00 00 00 00       	mov    $0x0,%eax
  400b75:	48 85 c0             	test   %rax,%rax
  400b78:	74 f1                	je     400b6b <frame_dummy+0xb>
  400b7a:	55                   	push   %rbp
  400b7b:	48 89 e5             	mov    %rsp,%rbp
  400b7e:	ff d0                	callq  *%rax
  400b80:	5d                   	pop    %rbp
  400b81:	e9 7a ff ff ff       	jmpq   400b00 <register_tm_clones>

0000000000400b86 <initCache>:
  400b86:	55                   	push   %rbp
  400b87:	48 89 e5             	mov    %rsp,%rbp
  400b8a:	53                   	push   %rbx
  400b8b:	48 83 ec 28          	sub    $0x28,%rsp
  400b8f:	8b 05 b3 15 20 00    	mov    0x2015b3(%rip),%eax        # 602148 <S>
  400b95:	48 98                	cltq   
  400b97:	48 c1 e0 03          	shl    $0x3,%rax
  400b9b:	48 89 c7             	mov    %rax,%rdi
  400b9e:	e8 6d fe ff ff       	callq  400a10 <malloc@plt>
  400ba3:	48 89 05 96 15 20 00 	mov    %rax,0x201596(%rip)        # 602140 <cache>
  400baa:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  400bb1:	e9 f3 00 00 00       	jmpq   400ca9 <initCache+0x123>
  400bb6:	48 8b 05 83 15 20 00 	mov    0x201583(%rip),%rax        # 602140 <cache>
  400bbd:	8b 55 e8             	mov    -0x18(%rbp),%edx
  400bc0:	48 63 d2             	movslq %edx,%rdx
  400bc3:	48 c1 e2 03          	shl    $0x3,%rdx
  400bc7:	48 8d 1c 10          	lea    (%rax,%rdx,1),%rbx
  400bcb:	8b 05 4b 15 20 00    	mov    0x20154b(%rip),%eax        # 60211c <E>
  400bd1:	48 63 d0             	movslq %eax,%rdx
  400bd4:	48 89 d0             	mov    %rdx,%rax
  400bd7:	48 01 c0             	add    %rax,%rax
  400bda:	48 01 d0             	add    %rdx,%rax
  400bdd:	48 c1 e0 03          	shl    $0x3,%rax
  400be1:	48 89 c7             	mov    %rax,%rdi
  400be4:	e8 27 fe ff ff       	callq  400a10 <malloc@plt>
  400be9:	48 89 03             	mov    %rax,(%rbx)
  400bec:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  400bf3:	e9 9e 00 00 00       	jmpq   400c96 <initCache+0x110>
  400bf8:	48 8b 05 41 15 20 00 	mov    0x201541(%rip),%rax        # 602140 <cache>
  400bff:	8b 55 e8             	mov    -0x18(%rbp),%edx
  400c02:	48 63 d2             	movslq %edx,%rdx
  400c05:	48 c1 e2 03          	shl    $0x3,%rdx
  400c09:	48 01 d0             	add    %rdx,%rax
  400c0c:	48 8b 08             	mov    (%rax),%rcx
  400c0f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400c12:	48 63 d0             	movslq %eax,%rdx
  400c15:	48 89 d0             	mov    %rdx,%rax
  400c18:	48 01 c0             	add    %rax,%rax
  400c1b:	48 01 d0             	add    %rdx,%rax
  400c1e:	48 c1 e0 03          	shl    $0x3,%rax
  400c22:	48 01 c8             	add    %rcx,%rax
  400c25:	c6 00 00             	movb   $0x0,(%rax)
  400c28:	48 8b 05 11 15 20 00 	mov    0x201511(%rip),%rax        # 602140 <cache>
  400c2f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  400c32:	48 63 d2             	movslq %edx,%rdx
  400c35:	48 c1 e2 03          	shl    $0x3,%rdx
  400c39:	48 01 d0             	add    %rdx,%rax
  400c3c:	48 8b 08             	mov    (%rax),%rcx
  400c3f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400c42:	48 63 d0             	movslq %eax,%rdx
  400c45:	48 89 d0             	mov    %rdx,%rax
  400c48:	48 01 c0             	add    %rax,%rax
  400c4b:	48 01 d0             	add    %rdx,%rax
  400c4e:	48 c1 e0 03          	shl    $0x3,%rax
  400c52:	48 01 c8             	add    %rcx,%rax
  400c55:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  400c5c:	00 
  400c5d:	48 8b 05 dc 14 20 00 	mov    0x2014dc(%rip),%rax        # 602140 <cache>
  400c64:	8b 55 e8             	mov    -0x18(%rbp),%edx
  400c67:	48 63 d2             	movslq %edx,%rdx
  400c6a:	48 c1 e2 03          	shl    $0x3,%rdx
  400c6e:	48 01 d0             	add    %rdx,%rax
  400c71:	48 8b 08             	mov    (%rax),%rcx
  400c74:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400c77:	48 63 d0             	movslq %eax,%rdx
  400c7a:	48 89 d0             	mov    %rdx,%rax
  400c7d:	48 01 c0             	add    %rax,%rax
  400c80:	48 01 d0             	add    %rdx,%rax
  400c83:	48 c1 e0 03          	shl    $0x3,%rax
  400c87:	48 01 c8             	add    %rcx,%rax
  400c8a:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  400c91:	00 
  400c92:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  400c96:	8b 05 80 14 20 00    	mov    0x201480(%rip),%eax        # 60211c <E>
  400c9c:	39 45 ec             	cmp    %eax,-0x14(%rbp)
  400c9f:	0f 8c 53 ff ff ff    	jl     400bf8 <initCache+0x72>
  400ca5:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
  400ca9:	8b 05 99 14 20 00    	mov    0x201499(%rip),%eax        # 602148 <S>
  400caf:	39 45 e8             	cmp    %eax,-0x18(%rbp)
  400cb2:	0f 8c fe fe ff ff    	jl     400bb6 <initCache+0x30>
  400cb8:	8b 05 56 14 20 00    	mov    0x201456(%rip),%eax        # 602114 <s>
  400cbe:	66 0f ef c0          	pxor   %xmm0,%xmm0
  400cc2:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
  400cc6:	48 b8 00 00 00 00 00 	movabs $0x4000000000000000,%rax
  400ccd:	00 00 40 
  400cd0:	66 0f 28 c8          	movapd %xmm0,%xmm1
  400cd4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  400cd8:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
  400cdd:	e8 ee fc ff ff       	callq  4009d0 <pow@plt>
  400ce2:	66 0f 28 c8          	movapd %xmm0,%xmm1
  400ce6:	f2 0f 10 05 12 0c 00 	movsd  0xc12(%rip),%xmm0        # 401900 <_IO_stdin_used+0x3a0>
  400ced:	00 
  400cee:	f2 0f 5c c8          	subsd  %xmm0,%xmm1
  400cf2:	66 0f 28 c1          	movapd %xmm1,%xmm0
  400cf6:	66 0f 2e 05 0a 0c 00 	ucomisd 0xc0a(%rip),%xmm0        # 401908 <_IO_stdin_used+0x3a8>
  400cfd:	00 
  400cfe:	73 07                	jae    400d07 <initCache+0x181>
  400d00:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
  400d05:	eb 1e                	jmp    400d25 <initCache+0x19f>
  400d07:	f2 0f 10 0d f9 0b 00 	movsd  0xbf9(%rip),%xmm1        # 401908 <_IO_stdin_used+0x3a8>
  400d0e:	00 
  400d0f:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
  400d13:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
  400d18:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
  400d1f:	00 00 80 
  400d22:	48 31 d0             	xor    %rdx,%rax
  400d25:	48 89 05 24 14 20 00 	mov    %rax,0x201424(%rip)        # 602150 <set_index_mask>
  400d2c:	90                   	nop
  400d2d:	48 83 c4 28          	add    $0x28,%rsp
  400d31:	5b                   	pop    %rbx
  400d32:	5d                   	pop    %rbp
  400d33:	c3                   	retq   

0000000000400d34 <freeCache>:
  400d34:	55                   	push   %rbp
  400d35:	48 89 e5             	mov    %rsp,%rbp
  400d38:	48 83 ec 10          	sub    $0x10,%rsp
  400d3c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400d43:	eb 23                	jmp    400d68 <freeCache+0x34>
  400d45:	48 8b 05 f4 13 20 00 	mov    0x2013f4(%rip),%rax        # 602140 <cache>
  400d4c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  400d4f:	48 63 d2             	movslq %edx,%rdx
  400d52:	48 c1 e2 03          	shl    $0x3,%rdx
  400d56:	48 01 d0             	add    %rdx,%rax
  400d59:	48 8b 00             	mov    (%rax),%rax
  400d5c:	48 89 c7             	mov    %rax,%rdi
  400d5f:	e8 ec fb ff ff       	callq  400950 <free@plt>
  400d64:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400d68:	8b 05 da 13 20 00    	mov    0x2013da(%rip),%eax        # 602148 <S>
  400d6e:	39 45 fc             	cmp    %eax,-0x4(%rbp)
  400d71:	7c d2                	jl     400d45 <freeCache+0x11>
  400d73:	48 8b 05 c6 13 20 00 	mov    0x2013c6(%rip),%rax        # 602140 <cache>
  400d7a:	48 89 c7             	mov    %rax,%rdi
  400d7d:	e8 ce fb ff ff       	callq  400950 <free@plt>
  400d82:	90                   	nop
  400d83:	c9                   	leaveq 
  400d84:	c3                   	retq   

0000000000400d85 <accessData>:
  400d85:	55                   	push   %rbp
  400d86:	48 89 e5             	mov    %rsp,%rbp
  400d89:	48 83 ec 40          	sub    $0x40,%rsp
  400d8d:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  400d91:	48 c7 45 e0 ff ff ff 	movq   $0xffffffffffffffff,-0x20(%rbp)
  400d98:	ff 
  400d99:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  400da0:	8b 05 72 13 20 00    	mov    0x201372(%rip),%eax        # 602118 <b>
  400da6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  400daa:	89 c1                	mov    %eax,%ecx
  400dac:	48 d3 ea             	shr    %cl,%rdx
  400daf:	48 8b 05 9a 13 20 00 	mov    0x20139a(%rip),%rax        # 602150 <set_index_mask>
  400db6:	48 21 d0             	and    %rdx,%rax
  400db9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  400dbd:	8b 15 51 13 20 00    	mov    0x201351(%rip),%edx        # 602114 <s>
  400dc3:	8b 05 4f 13 20 00    	mov    0x20134f(%rip),%eax        # 602118 <b>
  400dc9:	01 d0                	add    %edx,%eax
  400dcb:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  400dcf:	89 c1                	mov    %eax,%ecx
  400dd1:	48 d3 ea             	shr    %cl,%rdx
  400dd4:	48 89 d0             	mov    %rdx,%rax
  400dd7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  400ddb:	48 8b 05 5e 13 20 00 	mov    0x20135e(%rip),%rax        # 602140 <cache>
  400de2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  400de6:	48 c1 e2 03          	shl    $0x3,%rdx
  400dea:	48 01 d0             	add    %rdx,%rax
  400ded:	48 8b 00             	mov    (%rax),%rax
  400df0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400df4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  400dfb:	e9 b4 00 00 00       	jmpq   400eb4 <accessData+0x12f>
  400e00:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400e03:	48 63 d0             	movslq %eax,%rdx
  400e06:	48 89 d0             	mov    %rdx,%rax
  400e09:	48 01 c0             	add    %rax,%rax
  400e0c:	48 01 d0             	add    %rdx,%rax
  400e0f:	48 c1 e0 03          	shl    $0x3,%rax
  400e13:	48 89 c2             	mov    %rax,%rdx
  400e16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400e1a:	48 01 d0             	add    %rdx,%rax
  400e1d:	48 8b 40 08          	mov    0x8(%rax),%rax
  400e21:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  400e25:	0f 85 85 00 00 00    	jne    400eb0 <accessData+0x12b>
  400e2b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400e2e:	48 63 d0             	movslq %eax,%rdx
  400e31:	48 89 d0             	mov    %rdx,%rax
  400e34:	48 01 c0             	add    %rax,%rax
  400e37:	48 01 d0             	add    %rdx,%rax
  400e3a:	48 c1 e0 03          	shl    $0x3,%rax
  400e3e:	48 89 c2             	mov    %rax,%rdx
  400e41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400e45:	48 01 d0             	add    %rdx,%rax
  400e48:	0f b6 00             	movzbl (%rax),%eax
  400e4b:	84 c0                	test   %al,%al
  400e4d:	74 61                	je     400eb0 <accessData+0x12b>
  400e4f:	8b 05 d7 12 20 00    	mov    0x2012d7(%rip),%eax        # 60212c <hit_count>
  400e55:	83 c0 01             	add    $0x1,%eax
  400e58:	89 05 ce 12 20 00    	mov    %eax,0x2012ce(%rip)        # 60212c <hit_count>
  400e5e:	8b 05 ac 12 20 00    	mov    0x2012ac(%rip),%eax        # 602110 <verbosity>
  400e64:	85 c0                	test   %eax,%eax
  400e66:	74 0f                	je     400e77 <accessData+0xf2>
  400e68:	bf 68 15 40 00       	mov    $0x401568,%edi
  400e6d:	b8 00 00 00 00       	mov    $0x0,%eax
  400e72:	e8 39 fb ff ff       	callq  4009b0 <printf@plt>
  400e77:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400e7a:	48 63 d0             	movslq %eax,%rdx
  400e7d:	48 89 d0             	mov    %rdx,%rax
  400e80:	48 01 c0             	add    %rax,%rax
  400e83:	48 01 d0             	add    %rdx,%rax
  400e86:	48 c1 e0 03          	shl    $0x3,%rax
  400e8a:	48 89 c2             	mov    %rax,%rdx
  400e8d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400e91:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  400e95:	48 8b 05 24 12 20 00 	mov    0x201224(%rip),%rax        # 6020c0 <lru_counter>
  400e9c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  400ea0:	48 89 15 19 12 20 00 	mov    %rdx,0x201219(%rip)        # 6020c0 <lru_counter>
  400ea7:	48 89 41 10          	mov    %rax,0x10(%rcx)
  400eab:	e9 5e 01 00 00       	jmpq   40100e <accessData+0x289>
  400eb0:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
  400eb4:	8b 05 62 12 20 00    	mov    0x201262(%rip),%eax        # 60211c <E>
  400eba:	39 45 d8             	cmp    %eax,-0x28(%rbp)
  400ebd:	0f 8c 3d ff ff ff    	jl     400e00 <accessData+0x7b>
  400ec3:	8b 05 5f 12 20 00    	mov    0x20125f(%rip),%eax        # 602128 <miss_count>
  400ec9:	83 c0 01             	add    $0x1,%eax
  400ecc:	89 05 56 12 20 00    	mov    %eax,0x201256(%rip)        # 602128 <miss_count>
  400ed2:	8b 05 38 12 20 00    	mov    0x201238(%rip),%eax        # 602110 <verbosity>
  400ed8:	85 c0                	test   %eax,%eax
  400eda:	74 0f                	je     400eeb <accessData+0x166>
  400edc:	bf 6d 15 40 00       	mov    $0x40156d,%edi
  400ee1:	b8 00 00 00 00       	mov    $0x0,%eax
  400ee6:	e8 c5 fa ff ff       	callq  4009b0 <printf@plt>
  400eeb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  400ef2:	eb 56                	jmp    400f4a <accessData+0x1c5>
  400ef4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400ef7:	48 63 d0             	movslq %eax,%rdx
  400efa:	48 89 d0             	mov    %rdx,%rax
  400efd:	48 01 c0             	add    %rax,%rax
  400f00:	48 01 d0             	add    %rdx,%rax
  400f03:	48 c1 e0 03          	shl    $0x3,%rax
  400f07:	48 89 c2             	mov    %rax,%rdx
  400f0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400f0e:	48 01 d0             	add    %rdx,%rax
  400f11:	48 8b 40 10          	mov    0x10(%rax),%rax
  400f15:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
  400f19:	73 2b                	jae    400f46 <accessData+0x1c1>
  400f1b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400f1e:	89 45 dc             	mov    %eax,-0x24(%rbp)
  400f21:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400f24:	48 63 d0             	movslq %eax,%rdx
  400f27:	48 89 d0             	mov    %rdx,%rax
  400f2a:	48 01 c0             	add    %rax,%rax
  400f2d:	48 01 d0             	add    %rdx,%rax
  400f30:	48 c1 e0 03          	shl    $0x3,%rax
  400f34:	48 89 c2             	mov    %rax,%rdx
  400f37:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400f3b:	48 01 d0             	add    %rdx,%rax
  400f3e:	48 8b 40 10          	mov    0x10(%rax),%rax
  400f42:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  400f46:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
  400f4a:	8b 05 cc 11 20 00    	mov    0x2011cc(%rip),%eax        # 60211c <E>
  400f50:	39 45 d8             	cmp    %eax,-0x28(%rbp)
  400f53:	7c 9f                	jl     400ef4 <accessData+0x16f>
  400f55:	8b 55 dc             	mov    -0x24(%rbp),%edx
  400f58:	48 89 d0             	mov    %rdx,%rax
  400f5b:	48 01 c0             	add    %rax,%rax
  400f5e:	48 01 d0             	add    %rdx,%rax
  400f61:	48 c1 e0 03          	shl    $0x3,%rax
  400f65:	48 89 c2             	mov    %rax,%rdx
  400f68:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400f6c:	48 01 d0             	add    %rdx,%rax
  400f6f:	0f b6 00             	movzbl (%rax),%eax
  400f72:	84 c0                	test   %al,%al
  400f74:	74 28                	je     400f9e <accessData+0x219>
  400f76:	8b 05 b4 11 20 00    	mov    0x2011b4(%rip),%eax        # 602130 <eviction_count>
  400f7c:	83 c0 01             	add    $0x1,%eax
  400f7f:	89 05 ab 11 20 00    	mov    %eax,0x2011ab(%rip)        # 602130 <eviction_count>
  400f85:	8b 05 85 11 20 00    	mov    0x201185(%rip),%eax        # 602110 <verbosity>
  400f8b:	85 c0                	test   %eax,%eax
  400f8d:	74 0f                	je     400f9e <accessData+0x219>
  400f8f:	bf 73 15 40 00       	mov    $0x401573,%edi
  400f94:	b8 00 00 00 00       	mov    $0x0,%eax
  400f99:	e8 12 fa ff ff       	callq  4009b0 <printf@plt>
  400f9e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  400fa1:	48 89 d0             	mov    %rdx,%rax
  400fa4:	48 01 c0             	add    %rax,%rax
  400fa7:	48 01 d0             	add    %rdx,%rax
  400faa:	48 c1 e0 03          	shl    $0x3,%rax
  400fae:	48 89 c2             	mov    %rax,%rdx
  400fb1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400fb5:	48 01 d0             	add    %rdx,%rax
  400fb8:	c6 00 01             	movb   $0x1,(%rax)
  400fbb:	8b 55 dc             	mov    -0x24(%rbp),%edx
  400fbe:	48 89 d0             	mov    %rdx,%rax
  400fc1:	48 01 c0             	add    %rax,%rax
  400fc4:	48 01 d0             	add    %rdx,%rax
  400fc7:	48 c1 e0 03          	shl    $0x3,%rax
  400fcb:	48 89 c2             	mov    %rax,%rdx
  400fce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400fd2:	48 01 c2             	add    %rax,%rdx
  400fd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  400fd9:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400fdd:	8b 55 dc             	mov    -0x24(%rbp),%edx
  400fe0:	48 89 d0             	mov    %rdx,%rax
  400fe3:	48 01 c0             	add    %rax,%rax
  400fe6:	48 01 d0             	add    %rdx,%rax
  400fe9:	48 c1 e0 03          	shl    $0x3,%rax
  400fed:	48 89 c2             	mov    %rax,%rdx
  400ff0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400ff4:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  400ff8:	48 8b 05 c1 10 20 00 	mov    0x2010c1(%rip),%rax        # 6020c0 <lru_counter>
  400fff:	48 8d 50 01          	lea    0x1(%rax),%rdx
  401003:	48 89 15 b6 10 20 00 	mov    %rdx,0x2010b6(%rip)        # 6020c0 <lru_counter>
  40100a:	48 89 41 10          	mov    %rax,0x10(%rcx)
  40100e:	c9                   	leaveq 
  40100f:	c3                   	retq   

0000000000401010 <replayTrace>:
  401010:	55                   	push   %rbp
  401011:	48 89 e5             	mov    %rsp,%rbp
  401014:	48 81 ec 20 04 00 00 	sub    $0x420,%rsp
  40101b:	48 89 bd e8 fb ff ff 	mov    %rdi,-0x418(%rbp)
  401022:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401029:	00 00 
  40102b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40102f:	31 c0                	xor    %eax,%eax
  401031:	48 c7 85 00 fc ff ff 	movq   $0x0,-0x400(%rbp)
  401038:	00 00 00 00 
  40103c:	c7 85 fc fb ff ff 00 	movl   $0x0,-0x404(%rbp)
  401043:	00 00 00 
  401046:	48 8b 85 e8 fb ff ff 	mov    -0x418(%rbp),%rax
  40104d:	be 7d 15 40 00       	mov    $0x40157d,%esi
  401052:	48 89 c7             	mov    %rax,%rdi
  401055:	e8 d6 f9 ff ff       	callq  400a30 <fopen@plt>
  40105a:	48 89 85 08 fc ff ff 	mov    %rax,-0x3f8(%rbp)
  401061:	48 83 bd 08 fc ff ff 	cmpq   $0x0,-0x3f8(%rbp)
  401068:	00 
  401069:	0f 85 fa 00 00 00    	jne    401169 <replayTrace+0x159>
  40106f:	e8 fc f8 ff ff       	callq  400970 <__errno_location@plt>
  401074:	8b 00                	mov    (%rax),%eax
  401076:	89 c7                	mov    %eax,%edi
  401078:	e8 f3 f9 ff ff       	callq  400a70 <strerror@plt>
  40107d:	48 89 c1             	mov    %rax,%rcx
  401080:	48 8b 05 79 10 20 00 	mov    0x201079(%rip),%rax        # 602100 <stderr@@GLIBC_2.2.5>
  401087:	48 8b 95 e8 fb ff ff 	mov    -0x418(%rbp),%rdx
  40108e:	be 7f 15 40 00       	mov    $0x40157f,%esi
  401093:	48 89 c7             	mov    %rax,%rdi
  401096:	b8 00 00 00 00       	mov    $0x0,%eax
  40109b:	e8 60 f9 ff ff       	callq  400a00 <fprintf@plt>
  4010a0:	bf 01 00 00 00       	mov    $0x1,%edi
  4010a5:	e8 b6 f9 ff ff       	callq  400a60 <exit@plt>
  4010aa:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
  4010b1:	3c 53                	cmp    $0x53,%al
  4010b3:	74 1a                	je     4010cf <replayTrace+0xbf>
  4010b5:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
  4010bc:	3c 4c                	cmp    $0x4c,%al
  4010be:	74 0f                	je     4010cf <replayTrace+0xbf>
  4010c0:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
  4010c7:	3c 4d                	cmp    $0x4d,%al
  4010c9:	0f 85 9a 00 00 00    	jne    401169 <replayTrace+0x159>
  4010cf:	48 8d 85 10 fc ff ff 	lea    -0x3f0(%rbp),%rax
  4010d6:	48 83 c0 03          	add    $0x3,%rax
  4010da:	48 8d 8d fc fb ff ff 	lea    -0x404(%rbp),%rcx
  4010e1:	48 8d 95 00 fc ff ff 	lea    -0x400(%rbp),%rdx
  4010e8:	be 87 15 40 00       	mov    $0x401587,%esi
  4010ed:	48 89 c7             	mov    %rax,%rdi
  4010f0:	b8 00 00 00 00       	mov    $0x0,%eax
  4010f5:	e8 26 f9 ff ff       	callq  400a20 <__isoc99_sscanf@plt>
  4010fa:	8b 05 10 10 20 00    	mov    0x201010(%rip),%eax        # 602110 <verbosity>
  401100:	85 c0                	test   %eax,%eax
  401102:	74 28                	je     40112c <replayTrace+0x11c>
  401104:	8b 8d fc fb ff ff    	mov    -0x404(%rbp),%ecx
  40110a:	48 8b 95 00 fc ff ff 	mov    -0x400(%rbp),%rdx
  401111:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
  401118:	0f be c0             	movsbl %al,%eax
  40111b:	89 c6                	mov    %eax,%esi
  40111d:	bf 8f 15 40 00       	mov    $0x40158f,%edi
  401122:	b8 00 00 00 00       	mov    $0x0,%eax
  401127:	e8 84 f8 ff ff       	callq  4009b0 <printf@plt>
  40112c:	48 8b 85 00 fc ff ff 	mov    -0x400(%rbp),%rax
  401133:	48 89 c7             	mov    %rax,%rdi
  401136:	e8 4a fc ff ff       	callq  400d85 <accessData>
  40113b:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
  401142:	3c 4d                	cmp    $0x4d,%al
  401144:	75 0f                	jne    401155 <replayTrace+0x145>
  401146:	48 8b 85 00 fc ff ff 	mov    -0x400(%rbp),%rax
  40114d:	48 89 c7             	mov    %rax,%rdi
  401150:	e8 30 fc ff ff       	callq  400d85 <accessData>
  401155:	8b 05 b5 0f 20 00    	mov    0x200fb5(%rip),%eax        # 602110 <verbosity>
  40115b:	85 c0                	test   %eax,%eax
  40115d:	74 0a                	je     401169 <replayTrace+0x159>
  40115f:	bf 0a 00 00 00       	mov    $0xa,%edi
  401164:	e8 f7 f7 ff ff       	callq  400960 <putchar@plt>
  401169:	48 8b 95 08 fc ff ff 	mov    -0x3f8(%rbp),%rdx
  401170:	48 8d 85 10 fc ff ff 	lea    -0x3f0(%rbp),%rax
  401177:	be e8 03 00 00       	mov    $0x3e8,%esi
  40117c:	48 89 c7             	mov    %rax,%rdi
  40117f:	e8 6c f8 ff ff       	callq  4009f0 <fgets@plt>
  401184:	48 85 c0             	test   %rax,%rax
  401187:	0f 85 1d ff ff ff    	jne    4010aa <replayTrace+0x9a>
  40118d:	48 8b 85 08 fc ff ff 	mov    -0x3f8(%rbp),%rax
  401194:	48 89 c7             	mov    %rax,%rdi
  401197:	e8 f4 f7 ff ff       	callq  400990 <fclose@plt>
  40119c:	90                   	nop
  40119d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4011a1:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4011a8:	00 00 
  4011aa:	74 05                	je     4011b1 <replayTrace+0x1a1>
  4011ac:	e8 ef f7 ff ff       	callq  4009a0 <__stack_chk_fail@plt>
  4011b1:	c9                   	leaveq 
  4011b2:	c3                   	retq   

00000000004011b3 <printUsage>:
  4011b3:	55                   	push   %rbp
  4011b4:	48 89 e5             	mov    %rsp,%rbp
  4011b7:	48 83 ec 10          	sub    $0x10,%rsp
  4011bb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4011bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4011c3:	48 8b 00             	mov    (%rax),%rax
  4011c6:	48 89 c6             	mov    %rax,%rsi
  4011c9:	bf a0 15 40 00       	mov    $0x4015a0,%edi
  4011ce:	b8 00 00 00 00       	mov    $0x0,%eax
  4011d3:	e8 d8 f7 ff ff       	callq  4009b0 <printf@plt>
  4011d8:	bf d6 15 40 00       	mov    $0x4015d6,%edi
  4011dd:	e8 9e f7 ff ff       	callq  400980 <puts@plt>
  4011e2:	bf e0 15 40 00       	mov    $0x4015e0,%edi
  4011e7:	e8 94 f7 ff ff       	callq  400980 <puts@plt>
  4011ec:	bf 08 16 40 00       	mov    $0x401608,%edi
  4011f1:	e8 8a f7 ff ff       	callq  400980 <puts@plt>
  4011f6:	bf 30 16 40 00       	mov    $0x401630,%edi
  4011fb:	e8 80 f7 ff ff       	callq  400980 <puts@plt>
  401200:	bf 58 16 40 00       	mov    $0x401658,%edi
  401205:	e8 76 f7 ff ff       	callq  400980 <puts@plt>
  40120a:	bf 80 16 40 00       	mov    $0x401680,%edi
  40120f:	e8 6c f7 ff ff       	callq  400980 <puts@plt>
  401214:	bf aa 16 40 00       	mov    $0x4016aa,%edi
  401219:	e8 62 f7 ff ff       	callq  400980 <puts@plt>
  40121e:	bf c3 16 40 00       	mov    $0x4016c3,%edi
  401223:	e8 58 f7 ff ff       	callq  400980 <puts@plt>
  401228:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40122c:	48 8b 00             	mov    (%rax),%rax
  40122f:	48 89 c6             	mov    %rax,%rsi
  401232:	bf d0 16 40 00       	mov    $0x4016d0,%edi
  401237:	b8 00 00 00 00       	mov    $0x0,%eax
  40123c:	e8 6f f7 ff ff       	callq  4009b0 <printf@plt>
  401241:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401245:	48 8b 00             	mov    (%rax),%rax
  401248:	48 89 c6             	mov    %rax,%rsi
  40124b:	bf 00 17 40 00       	mov    $0x401700,%edi
  401250:	b8 00 00 00 00       	mov    $0x0,%eax
  401255:	e8 56 f7 ff ff       	callq  4009b0 <printf@plt>
  40125a:	bf 00 00 00 00       	mov    $0x0,%edi
  40125f:	e8 fc f7 ff ff       	callq  400a60 <exit@plt>

0000000000401264 <main>:
  401264:	55                   	push   %rbp
  401265:	48 89 e5             	mov    %rsp,%rbp
  401268:	48 83 ec 30          	sub    $0x30,%rsp
  40126c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  40126f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  401273:	e9 a9 00 00 00       	jmpq   401321 <main+0xbd>
  401278:	0f be 45 ff          	movsbl -0x1(%rbp),%eax
  40127c:	83 e8 45             	sub    $0x45,%eax
  40127f:	83 f8 31             	cmp    $0x31,%eax
  401282:	0f 87 83 00 00 00    	ja     40130b <main+0xa7>
  401288:	89 c0                	mov    %eax,%eax
  40128a:	48 8b 04 c5 70 17 40 	mov    0x401770(,%rax,8),%rax
  401291:	00 
  401292:	ff e0                	jmpq   *%rax
  401294:	48 8b 05 45 0e 20 00 	mov    0x200e45(%rip),%rax        # 6020e0 <optarg@@GLIBC_2.2.5>
  40129b:	48 89 c7             	mov    %rax,%rdi
  40129e:	e8 ad f7 ff ff       	callq  400a50 <atoi@plt>
  4012a3:	89 05 6b 0e 20 00    	mov    %eax,0x200e6b(%rip)        # 602114 <s>
  4012a9:	eb 76                	jmp    401321 <main+0xbd>
  4012ab:	48 8b 05 2e 0e 20 00 	mov    0x200e2e(%rip),%rax        # 6020e0 <optarg@@GLIBC_2.2.5>
  4012b2:	48 89 c7             	mov    %rax,%rdi
  4012b5:	e8 96 f7 ff ff       	callq  400a50 <atoi@plt>
  4012ba:	89 05 5c 0e 20 00    	mov    %eax,0x200e5c(%rip)        # 60211c <E>
  4012c0:	eb 5f                	jmp    401321 <main+0xbd>
  4012c2:	48 8b 05 17 0e 20 00 	mov    0x200e17(%rip),%rax        # 6020e0 <optarg@@GLIBC_2.2.5>
  4012c9:	48 89 c7             	mov    %rax,%rdi
  4012cc:	e8 7f f7 ff ff       	callq  400a50 <atoi@plt>
  4012d1:	89 05 41 0e 20 00    	mov    %eax,0x200e41(%rip)        # 602118 <b>
  4012d7:	eb 48                	jmp    401321 <main+0xbd>
  4012d9:	48 8b 05 00 0e 20 00 	mov    0x200e00(%rip),%rax        # 6020e0 <optarg@@GLIBC_2.2.5>
  4012e0:	48 89 05 39 0e 20 00 	mov    %rax,0x200e39(%rip)        # 602120 <trace_file>
  4012e7:	eb 38                	jmp    401321 <main+0xbd>
  4012e9:	c7 05 1d 0e 20 00 01 	movl   $0x1,0x200e1d(%rip)        # 602110 <verbosity>
  4012f0:	00 00 00 
  4012f3:	eb 2c                	jmp    401321 <main+0xbd>
  4012f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  4012f9:	48 89 c7             	mov    %rax,%rdi
  4012fc:	e8 b2 fe ff ff       	callq  4011b3 <printUsage>
  401301:	bf 00 00 00 00       	mov    $0x0,%edi
  401306:	e8 55 f7 ff ff       	callq  400a60 <exit@plt>
  40130b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  40130f:	48 89 c7             	mov    %rax,%rdi
  401312:	e8 9c fe ff ff       	callq  4011b3 <printUsage>
  401317:	bf 01 00 00 00       	mov    $0x1,%edi
  40131c:	e8 3f f7 ff ff       	callq  400a60 <exit@plt>
  401321:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  401325:	8b 45 ec             	mov    -0x14(%rbp),%eax
  401328:	ba 33 17 40 00       	mov    $0x401733,%edx
  40132d:	48 89 ce             	mov    %rcx,%rsi
  401330:	89 c7                	mov    %eax,%edi
  401332:	e8 09 f7 ff ff       	callq  400a40 <getopt@plt>
  401337:	88 45 ff             	mov    %al,-0x1(%rbp)
  40133a:	80 7d ff ff          	cmpb   $0xff,-0x1(%rbp)
  40133e:	0f 85 34 ff ff ff    	jne    401278 <main+0x14>
  401344:	8b 05 ca 0d 20 00    	mov    0x200dca(%rip),%eax        # 602114 <s>
  40134a:	85 c0                	test   %eax,%eax
  40134c:	74 20                	je     40136e <main+0x10a>
  40134e:	8b 05 c8 0d 20 00    	mov    0x200dc8(%rip),%eax        # 60211c <E>
  401354:	85 c0                	test   %eax,%eax
  401356:	74 16                	je     40136e <main+0x10a>
  401358:	8b 05 ba 0d 20 00    	mov    0x200dba(%rip),%eax        # 602118 <b>
  40135e:	85 c0                	test   %eax,%eax
  401360:	74 0c                	je     40136e <main+0x10a>
  401362:	48 8b 05 b7 0d 20 00 	mov    0x200db7(%rip),%rax        # 602120 <trace_file>
  401369:	48 85 c0             	test   %rax,%rax
  40136c:	75 2f                	jne    40139d <main+0x139>
  40136e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  401372:	48 8b 00             	mov    (%rax),%rax
  401375:	48 89 c6             	mov    %rax,%rsi
  401378:	bf 40 17 40 00       	mov    $0x401740,%edi
  40137d:	b8 00 00 00 00       	mov    $0x0,%eax
  401382:	e8 29 f6 ff ff       	callq  4009b0 <printf@plt>
  401387:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  40138b:	48 89 c7             	mov    %rax,%rdi
  40138e:	e8 20 fe ff ff       	callq  4011b3 <printUsage>
  401393:	bf 01 00 00 00       	mov    $0x1,%edi
  401398:	e8 c3 f6 ff ff       	callq  400a60 <exit@plt>
  40139d:	8b 05 71 0d 20 00    	mov    0x200d71(%rip),%eax        # 602114 <s>
  4013a3:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4013a7:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
  4013ab:	48 b8 00 00 00 00 00 	movabs $0x4000000000000000,%rax
  4013b2:	00 00 40 
  4013b5:	66 0f 28 c8          	movapd %xmm0,%xmm1
  4013b9:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  4013bd:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
  4013c2:	e8 09 f6 ff ff       	callq  4009d0 <pow@plt>
  4013c7:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
  4013cc:	89 05 76 0d 20 00    	mov    %eax,0x200d76(%rip)        # 602148 <S>
  4013d2:	8b 05 40 0d 20 00    	mov    0x200d40(%rip),%eax        # 602118 <b>
  4013d8:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4013dc:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
  4013e0:	48 b8 00 00 00 00 00 	movabs $0x4000000000000000,%rax
  4013e7:	00 00 40 
  4013ea:	66 0f 28 c8          	movapd %xmm0,%xmm1
  4013ee:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  4013f2:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
  4013f7:	e8 d4 f5 ff ff       	callq  4009d0 <pow@plt>
  4013fc:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
  401401:	89 05 31 0d 20 00    	mov    %eax,0x200d31(%rip)        # 602138 <B>
  401407:	b8 00 00 00 00       	mov    $0x0,%eax
  40140c:	e8 75 f7 ff ff       	callq  400b86 <initCache>
  401411:	48 8b 05 08 0d 20 00 	mov    0x200d08(%rip),%rax        # 602120 <trace_file>
  401418:	48 89 c7             	mov    %rax,%rdi
  40141b:	e8 f0 fb ff ff       	callq  401010 <replayTrace>
  401420:	b8 00 00 00 00       	mov    $0x0,%eax
  401425:	e8 0a f9 ff ff       	callq  400d34 <freeCache>
  40142a:	8b 15 00 0d 20 00    	mov    0x200d00(%rip),%edx        # 602130 <eviction_count>
  401430:	8b 0d f2 0c 20 00    	mov    0x200cf2(%rip),%ecx        # 602128 <miss_count>
  401436:	8b 05 f0 0c 20 00    	mov    0x200cf0(%rip),%eax        # 60212c <hit_count>
  40143c:	89 ce                	mov    %ecx,%esi
  40143e:	89 c7                	mov    %eax,%edi
  401440:	e8 07 00 00 00       	callq  40144c <printSummary>
  401445:	b8 00 00 00 00       	mov    $0x0,%eax
  40144a:	c9                   	leaveq 
  40144b:	c3                   	retq   

000000000040144c <printSummary>:
  40144c:	55                   	push   %rbp
  40144d:	48 89 e5             	mov    %rsp,%rbp
  401450:	48 83 ec 20          	sub    $0x20,%rsp
  401454:	89 7d ec             	mov    %edi,-0x14(%rbp)
  401457:	89 75 e8             	mov    %esi,-0x18(%rbp)
  40145a:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  40145d:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  401460:	8b 55 e8             	mov    -0x18(%rbp),%edx
  401463:	8b 45 ec             	mov    -0x14(%rbp),%eax
  401466:	89 c6                	mov    %eax,%esi
  401468:	bf 10 19 40 00       	mov    $0x401910,%edi
  40146d:	b8 00 00 00 00       	mov    $0x0,%eax
  401472:	e8 39 f5 ff ff       	callq  4009b0 <printf@plt>
  401477:	be 30 19 40 00       	mov    $0x401930,%esi
  40147c:	bf 32 19 40 00       	mov    $0x401932,%edi
  401481:	e8 aa f5 ff ff       	callq  400a30 <fopen@plt>
  401486:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40148a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  40148f:	75 19                	jne    4014aa <printSummary+0x5e>
  401491:	b9 60 19 40 00       	mov    $0x401960,%ecx
  401496:	ba 14 00 00 00       	mov    $0x14,%edx
  40149b:	be 40 19 40 00       	mov    $0x401940,%esi
  4014a0:	bf 4b 19 40 00       	mov    $0x40194b,%edi
  4014a5:	e8 16 f5 ff ff       	callq  4009c0 <__assert_fail@plt>
  4014aa:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  4014ad:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  4014b0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  4014b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4014b7:	41 89 f0             	mov    %esi,%r8d
  4014ba:	be 55 19 40 00       	mov    $0x401955,%esi
  4014bf:	48 89 c7             	mov    %rax,%rdi
  4014c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4014c7:	e8 34 f5 ff ff       	callq  400a00 <fprintf@plt>
  4014cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4014d0:	48 89 c7             	mov    %rax,%rdi
  4014d3:	e8 b8 f4 ff ff       	callq  400990 <fclose@plt>
  4014d8:	90                   	nop
  4014d9:	c9                   	leaveq 
  4014da:	c3                   	retq   
  4014db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004014e0 <__libc_csu_init>:
  4014e0:	41 57                	push   %r15
  4014e2:	41 56                	push   %r14
  4014e4:	41 89 ff             	mov    %edi,%r15d
  4014e7:	41 55                	push   %r13
  4014e9:	41 54                	push   %r12
  4014eb:	4c 8d 25 0e 09 20 00 	lea    0x20090e(%rip),%r12        # 601e00 <__frame_dummy_init_array_entry>
  4014f2:	55                   	push   %rbp
  4014f3:	48 8d 2d 0e 09 20 00 	lea    0x20090e(%rip),%rbp        # 601e08 <__init_array_end>
  4014fa:	53                   	push   %rbx
  4014fb:	49 89 f6             	mov    %rsi,%r14
  4014fe:	49 89 d5             	mov    %rdx,%r13
  401501:	4c 29 e5             	sub    %r12,%rbp
  401504:	48 83 ec 08          	sub    $0x8,%rsp
  401508:	48 c1 fd 03          	sar    $0x3,%rbp
  40150c:	e8 07 f4 ff ff       	callq  400918 <_init>
  401511:	48 85 ed             	test   %rbp,%rbp
  401514:	74 20                	je     401536 <__libc_csu_init+0x56>
  401516:	31 db                	xor    %ebx,%ebx
  401518:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40151f:	00 
  401520:	4c 89 ea             	mov    %r13,%rdx
  401523:	4c 89 f6             	mov    %r14,%rsi
  401526:	44 89 ff             	mov    %r15d,%edi
  401529:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40152d:	48 83 c3 01          	add    $0x1,%rbx
  401531:	48 39 eb             	cmp    %rbp,%rbx
  401534:	75 ea                	jne    401520 <__libc_csu_init+0x40>
  401536:	48 83 c4 08          	add    $0x8,%rsp
  40153a:	5b                   	pop    %rbx
  40153b:	5d                   	pop    %rbp
  40153c:	41 5c                	pop    %r12
  40153e:	41 5d                	pop    %r13
  401540:	41 5e                	pop    %r14
  401542:	41 5f                	pop    %r15
  401544:	c3                   	retq   
  401545:	90                   	nop
  401546:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40154d:	00 00 00 

0000000000401550 <__libc_csu_fini>:
  401550:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401554 <_fini>:
  401554:	48 83 ec 08          	sub    $0x8,%rsp
  401558:	48 83 c4 08          	add    $0x8,%rsp
  40155c:	c3                   	retq   
