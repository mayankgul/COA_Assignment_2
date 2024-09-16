    .data
sorted_list:    .word 5, 10, 15, 20, 25, 30, 35, 40, 45, 50   # int sorted_list[] = {5, 10, ..., 50};
X:              .word 35                                      # int X = 35;
output:         .word 0                                       # int output = 0;
iterations:     .word 0                                       # int iterations = 0;
index:          .word 0                                       # int index = 0;

    .text
    .globl main

main:
    lw      $t0, X               # int target = X;
    
    li      $t1, 0               # int low = 0;
    li      $t2, 9               # int high = 9;
    li      $t3, 0               # int iterations = 0;
    
binary_search:
    beq     $t1, $t2, not_found  # if (low == high) goto not_found;

    add     $t4, $t1, $t2        # int mid = (low + high) / 2;
    srl     $t4, $t4, 1          # mid = mid / 2;
    
    la      $t5, sorted_list     # int* base = sorted_list;
    sll     $t6, $t4, 2          # mid_offset = mid * 4;
    add     $t5, $t5, $t6        # int* mid_ptr = base + mid_offset;
    lw      $t7, 0($t5)          # int mid_value = *mid_ptr;
    
    beq     $t0, $t7, found      # if (target == mid_value) goto found;
    blt     $t0, $t7, go_left    # if (target < mid_value) goto go_left;
    
    addi    $t1, $t4, 1          # low = mid + 1;
    j       update_iterations    # goto update_iterations;
    
go_left:
    addi    $t2, $t4, -1         # high = mid - 1;
    j       update_iterations    # goto update_iterations;

update_iterations:
    addi    $t3, $t3, 1          # iterations++;
    j       binary_search        # goto binary_search;

found:
    li      $t8, 1               # output = 1;
    sw      $t8, output          # Store output in memory
    
    sw      $t3, iterations      # Store the number of iterations in memory
    
    sw      $t4, index           # Store the index of the found element in memory
    
    li      $v0, 10              # System exit call
    syscall                      # return 0;

not_found:
    li      $t8, 2               # output = 2;
    sw      $t8, output          # Store output in memory
    
    li      $v0, 10              # System exit call
    syscall                      # return 0;
