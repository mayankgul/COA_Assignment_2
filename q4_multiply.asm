    .data
num1:       .word 7          # int num1 = 7;
num2:       .word 5          # int num2 = 5;
result:     .word 0          # int result = 0;

    .text
    .globl main

main:
    lw      $t0, num1         # int a = num1;
    lw      $t1, num2         # int b = num2;

    li      $t2, 0            # int product = 0;
    li      $t3, 0            # int counter = 0;

multiplication_loop:
    beq     $t3, $t1, done      # if (counter == b) goto done;
    add     $t2, $t2, $t0       # product += a;
    addi    $t3, $t3, 1         # counter++;
    j       multiplication_loop # goto multiplication_loop;

done:
    sw      $t2, result       # result = product;

    li      $v0, 10           # System exit call
    syscall                   # return 0;
