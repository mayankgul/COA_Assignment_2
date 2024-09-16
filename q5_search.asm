    .data
sorted_list:    .word 5, 10, 15, 20, 25, 30, 35, 40, 45, 50
X:              .word 35
output:         .word 0
iterations:     .word 0
index:          .word 0

    .text
    .globl main

main:
    lw      $t0, X
    
    li      $t1, 0
    li      $t2, 9
    li      $t3, 0
    
binary_search:
    beq     $t1, $t2, not_found

    add     $t4, $t1, $t2
    srl     $t4, $t4, 1
    
    la      $t5, sorted_list
    sll     $t6, $t4, 2
    add     $t5, $t5, $t6
    lw      $t7, 0($t5)
    
    beq     $t0, $t7, found
    blt     $t0, $t7, go_left
    
    addi    $t1, $t4, 1
    j       update_iterations
    
go_left:
    addi    $t2, $t4, -1
    j       update_iterations

update_iterations:
    addi    $t3, $t3, 1
    j       binary_search

found:
    li      $t8, 1
    sw      $t8, output
    
    sw      $t3, iterations
    
    sw      $t4, index
    
    li      $v0, 10
    syscall

not_found:
    li      $t8, 2
    sw      $t8, output
    
    li      $v0, 10
    syscall
