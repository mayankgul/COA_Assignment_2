    .data
num1:       .word 36
num2:       .word 60
gcd_result: .word 0
lcm_result: .word 0

    .text
    .globl main

main:

    lw      $t0, num1
    lw      $t1, num2


    move    $t2, $t0
    move    $t3, $t1


gcd_loop:
    beq     $t1, $zero, gcd_done
    div     $t0, $t1
    mfhi    $t4
    move    $t0, $t1
    move    $t1, $t4
    j       gcd_loop

gcd_done:

    sw      $t0, gcd_result


    mul     $t5, $t2, $t3
    div     $t5, $t0
    mflo    $t6


    sw      $t6, lcm_result


    li      $v0, 10
    syscall
