    .data
numbers:    .word 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75  # int numbers[] = {5, 10, ..., 75};
sum:        .word 0                                                          # int sum = 0;
average:    .word 0                                                          # int average = 0;

    .text
    .globl main

main:
    la      $t0, numbers       # int* ptr = numbers;
    li      $t1, 0             # int sum = 0;
    li      $t2, 15            # int count = 15;
    li      $t3, 0             # int i = 0;

loop:
    lw      $t4, 0($t0)        # int current = *ptr;
    add     $t1, $t1, $t4      # sum += current;

    addi    $t0, $t0, 4        # ptr++;

    addi    $t3, $t3, 1        # i++;
    blt     $t3, $t2, loop     # if (i < count) goto loop;

    li      $t5, 15            # int divisor = 15;
    div     $t1, $t5           # sum / divisor;
    mflo    $t6                # int avg = result;

    sw      $t6, average       # average = avg;

    li      $v0, 10            # System exit call
    syscall                    # return 0;
