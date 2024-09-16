    .data
num1:   .half   0x1234
num2:   .half   0x5678
result: .half   0

    .text
    .globl main

main:
    lh      $t0, num1
    lh      $t1, num2

    nor     $t1, $t1, $zero
    addi    $t1, $t1, 1

    addu    $t2, $t0, $t1

    sh      $t2, result

    li      $v0, 10
    syscall
