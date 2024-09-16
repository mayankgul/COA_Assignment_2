    .data
num1:   .half   0x1234      # short num1 = 0x1234;
num2:   .half   0x5678      # short num2 = 0x5678;
result: .half   0           # short result = 0;

    .text
    .globl main

main:
    lh      $t0, num1       # t0 = num1;
    lh      $t1, num2       # t1 = num2;

    nor     $t1, $t1, $zero # t1 = ~t1;
    addi    $t1, $t1, 1     # t1 = t1 + 1;

    addu    $t2, $t0, $t1   # t2 = t0 + t1;

    sh      $t2, result     # result = t2;

    li      $v0, 10         # System exit call
    syscall                 # return 0;
