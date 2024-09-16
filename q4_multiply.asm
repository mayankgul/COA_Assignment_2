    .data
num1:       .word 7
num2:       .word 5
result:     .word 0

    .text
    .globl main

main:
    lw      $t0, num1
    lw      $t1, num2

    li      $t2, 0
    li      $t3, 0

multiplication_loop:
    beq     $t3, $t1, done
    add     $t2, $t2, $t0
    addi    $t3, $t3, 1
    j       multiplication_loop

done:
    sw      $t2, result

    li      $v0, 10
    syscall
