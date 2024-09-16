    .data
string:     .asciiz "hello world"
target:     .byte 'o'
output:     .word 0
index:      .word 0

    .text
    .globl main

main:
    la      $t0, string
    lb      $t1, target
    
    li      $t2, 0
    li      $t3, 0

search_loop:
    lb      $t4, 0($t0)
    beq     $t4, $zero, not_found
    beq     $t4, $t1, found

    addi    $t0, $t0, 1
    addi    $t2, $t2, 1
    j       search_loop

found:
    li      $t3, 1
    sw      $t3, output
    
    sw      $t2, index

    li      $v0, 10
    syscall

not_found:
    li      $t3, 2
    sw      $t3, output

    li      $v0, 10
    syscall
