

.section .text

write_msg:
    mov $1, %rax   # system call of write
    mov $1, %rdi   # stdout
    mov $msg_input, %rsi # adr of string
    mov $16,  %rdx # number of bytes to print
    syscall
    ret

write_yes:
    mov $1, %rax   # system call of write
    mov $1, %rdi   # stdout
    mov $msg_yes, %rsi # adr of string
    mov $5,  %rdx # number of bytes to print
    syscall
    ret

write_no:
    mov $1, %rax   # system call of write
    mov $1, %rdi   # stdout
    mov $msg_no, %rsi # adr of string
    mov $4,  %rdx # number of bytes to print
    syscall
    ret



game_over:
    mov $60, %rax  # exit syscall
    #xor %rdi, %rdi # return 0
    mov  sroot, %rdi
    syscall

.type input_number, @function
input_number:
    pushq    %rax               # keep stack aligned
    xorq  %rax, %rax            # clear AL (zero FP args in XMM registers)
    leaq fmt(%rip), %rdi        # load format string
    leaq x(%rip), %rsi          # set storage to address of x
    call scanf
    popq     %rax               # restore stack
    ret




.globl _start
_start:
   call write_msg          # this will write you to input number
get_number:
   call input_number       # this will use scanf and store the number in x variable
   call get_square_root    # this will calculate square root of x and store in sroot variable.
   # now you should write something like, if expressed in python
   # for i in range(3, int(num ** 0.5) + 1):
   #         if num % i == 0:
   #             return False
   #     return True
   # but instead of returning you do
   # call write_no  # i already wrote this function, noticed?
   # or
   # call write_yes
   call game_over

get_square_root:

  fildq x
  fsqrt
  fistpq sroot
  ret

.section .data
x:  .long 0
sroot: .long 0
.section .rodata
fmt:  .string "%d"
msg_input: .asciz "input a number: "
msg_yes:   .asciz "yes!\n"
msg_no:    .asciz "no!\n"

