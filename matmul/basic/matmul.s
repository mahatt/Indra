.LCPI0_0:
  .quad 0x3ff0000000000000
init():
  lea rax, [rip + A+480]
  lea rcx, [rip + B+480]
  xor edx, edx
  vbroadcastsd ymm0, qword ptr [rip + .LCPI0_0]
.LBB0_1:
  xor esi, esi
.LBB0_2:
  vmovups ymmword ptr [rax + 8*rsi - 480], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 448], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 416], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 384], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 480], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 448], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 416], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 384], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 352], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 320], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 288], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 256], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 352], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 320], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 288], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 256], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 224], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 192], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 160], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 128], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 224], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 192], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 160], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 128], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 96], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 64], ymm0
  vmovups ymmword ptr [rax + 8*rsi - 32], ymm0
  vmovups ymmword ptr [rax + 8*rsi], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 96], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 64], ymm0
  vmovups ymmword ptr [rcx + 8*rsi - 32], ymm0
  vmovups ymmword ptr [rcx + 8*rsi], ymm0
  add rsi, 64
  cmp rsi, 4096
  jne .LBB0_2
  inc rdx
  add rax, 32768
  add rcx, 32768
  cmp rdx, 4096
  jne .LBB0_1
  vzeroupper
  ret

matmul():
  push rbx
  lea rax, [rip + A+56]
  xor ecx, ecx
  lea rdx, [rip + B+229376]
  lea rsi, [rip + C]
.LBB1_1:
  mov rdi, rcx
  shl rdi, 15
  add rdi, rsi
  mov r8, rdx
  xor r9d, r9d
.LBB1_2:
  lea r10, [rdi + 8*r9]
  vmovsd xmm0, qword ptr [rdi + 8*r9]
  mov r11, r8
  xor ebx, ebx
.LBB1_3:
  vmovsd xmm1, qword ptr [rax + 8*rbx - 56]
  vfmadd132sd xmm1, xmm0, qword ptr [r11 - 229376]
  vmovsd xmm0, qword ptr [rax + 8*rbx - 48]
  vfmadd231sd xmm1, xmm0, qword ptr [r11 - 196608]
  vmovsd xmm0, qword ptr [rax + 8*rbx - 40]
  vfmadd132sd xmm0, xmm1, qword ptr [r11 - 163840]
  vmovsd xmm1, qword ptr [rax + 8*rbx - 32]
  vfmadd132sd xmm1, xmm0, qword ptr [r11 - 131072]
  vmovsd xmm0, qword ptr [rax + 8*rbx - 24]
  vfmadd132sd xmm0, xmm1, qword ptr [r11 - 98304]
  vmovsd xmm1, qword ptr [rax + 8*rbx - 16]
  vfmadd132sd xmm1, xmm0, qword ptr [r11 - 65536]
  vmovsd xmm2, qword ptr [rax + 8*rbx - 8]
  vfmadd132sd xmm2, xmm1, qword ptr [r11 - 32768]
  vmovsd xmm0, qword ptr [rax + 8*rbx]
  vfmadd132sd xmm0, xmm2, qword ptr [r11]
  add rbx, 8
  add r11, 262144
  cmp rbx, 4096
  jne .LBB1_3
  vmovsd qword ptr [r10], xmm0
  inc r9
  add r8, 8
  cmp r9, 4096
  jne .LBB1_2
  inc rcx
  add rax, 32768
  cmp rcx, 4096
  jne .LBB1_1
  pop rbx
  ret

.LCPI2_0:
  .quad 0x3ff0000000000000
.LCPI2_1:
  .quad 0x412e848000000000
main:
  push r15
  push r14
  push rbx
  xor ebx, ebx
  xor edi, edi
  call std::ios_base::sync_with_stdio(bool)@PLT
  lea rax, [rip + A+480]
  lea rcx, [rip + B+480]
  vbroadcastsd ymm0, qword ptr [rip + .LCPI2_0]
.LBB2_1:
  xor edx, edx
.LBB2_2:
  vmovupd ymmword ptr [rax + 8*rdx - 480], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 448], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 416], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 384], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 480], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 448], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 416], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 384], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 352], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 320], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 288], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 256], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 352], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 320], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 288], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 256], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 224], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 192], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 160], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 128], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 224], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 192], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 160], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 128], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 96], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 64], ymm0
  vmovupd ymmword ptr [rax + 8*rdx - 32], ymm0
  vmovupd ymmword ptr [rax + 8*rdx], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 96], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 64], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx - 32], ymm0
  vmovupd ymmword ptr [rcx + 8*rdx], ymm0
  add rdx, 64
  cmp rdx, 4096
  jne .LBB2_2
  inc rbx
  add rax, 32768
  add rcx, 32768
  cmp rbx, 4096
  jne .LBB2_1
  lea r14, [rip + A+56]
  xor r15d, r15d
  vzeroupper
  call std::chrono::_V2::steady_clock::now()@PLT
  mov rbx, rax
  lea rax, [rip + B+229376]
  lea rcx, [rip + C]
.LBB2_5:
  mov rdx, r15
  shl rdx, 15
  add rdx, rcx
  mov rsi, rax
  xor edi, edi
.LBB2_6:
  lea r8, [rdx + 8*rdi]
  vmovsd xmm0, qword ptr [rdx + 8*rdi]
  mov r9, rsi
  xor r10d, r10d
.LBB2_7:
  vmovsd xmm1, qword ptr [r14 + 8*r10 - 56]
  vfmadd132sd xmm1, xmm0, qword ptr [r9 - 229376]
  vmovsd xmm0, qword ptr [r14 + 8*r10 - 48]
  vfmadd231sd xmm1, xmm0, qword ptr [r9 - 196608]
  vmovsd xmm0, qword ptr [r14 + 8*r10 - 40]
  vfmadd132sd xmm0, xmm1, qword ptr [r9 - 163840]
  vmovsd xmm1, qword ptr [r14 + 8*r10 - 32]
  vfmadd132sd xmm1, xmm0, qword ptr [r9 - 131072]
  vmovsd xmm0, qword ptr [r14 + 8*r10 - 24]
  vfmadd132sd xmm0, xmm1, qword ptr [r9 - 98304]
  vmovsd xmm1, qword ptr [r14 + 8*r10 - 16]
  vfmadd132sd xmm1, xmm0, qword ptr [r9 - 65536]
  vmovsd xmm2, qword ptr [r14 + 8*r10 - 8]
  vfmadd132sd xmm2, xmm1, qword ptr [r9 - 32768]
  vmovsd xmm0, qword ptr [r14 + 8*r10]
  vfmadd132sd xmm0, xmm2, qword ptr [r9]
  add r10, 8
  add r9, 262144
  cmp r10, 4096
  jne .LBB2_7
  vmovsd qword ptr [r8], xmm0
  inc rdi
  add rsi, 8
  cmp rdi, 4096
  jne .LBB2_6
  inc r15
  add r14, 32768
  cmp r15, 4096
  jne .LBB2_5
  call std::chrono::_V2::steady_clock::now()@PLT
  sub rax, rbx
  vcvtsi2sd xmm0, xmm3, rax
  vdivsd xmm0, xmm0, qword ptr [rip + .LCPI2_1]
  mov rdi, qword ptr [rip + std::cout@GOTPCREL]
  call std::ostream& std::ostream::_M_insert<double>(double)@PLT
  mov rbx, rax
  lea rsi, [rip + .L.str]
  mov edx, 3
  mov rdi, rax
  call std::basic_ostream<char, std::char_traits<char>>& std::__ostream_insert<char, std::char_traits<char>>(std::basic_ostream<char, std::char_traits<char>>&, char const*, long)@PLT
  mov rax, qword ptr [rbx]
  mov rax, qword ptr [rax - 24]
  mov r14, qword ptr [rbx + rax + 240]
  test r14, r14
  je .LBB2_15
  cmp byte ptr [r14 + 56], 0
  je .LBB2_13
  movzx eax, byte ptr [r14 + 67]
  jmp .LBB2_14
.LBB2_13:
  mov rdi, r14
  call std::ctype<char>::_M_widen_init() const@PLT
  mov rax, qword ptr [r14]
  mov rdi, r14
  mov esi, 10
  call qword ptr [rax + 48]
.LBB2_14:
  movsx esi, al
  mov rdi, rbx
  call std::ostream::put(char)@PLT
  mov rdi, rax
  call std::ostream::flush()@PLT
  xor eax, eax
  pop rbx
  pop r14
  pop r15
  ret
.LBB2_15:
  call std::__throw_bad_cast()@PLT

A:
  .zero 134217728

B:
  .zero 134217728

C:
  .zero 134217728

.L.str:
  .asciz " ms"
