    .data
numbers:    .word 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75
sum:        .word 0
average:    .word 0

    .text
    .globl main

main:
    la      $t0, numbers
    li      $t1, 0
    li      $t2, 15
    li      $t3, 0

loop:
    lw      $t4, 0($t0)
    add     $t1, $t1, $t4

    addi    $t0, $t0, 4

    addi    $t3, $t3, 1
    blt     $t3, $t2, loop

    li      $t5, 15
    div     $t1, $t5
    mflo    $t6

    sw      $t6, average

    li      $v0, 10
    syscall
