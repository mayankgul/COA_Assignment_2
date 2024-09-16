    .data
string:     .asciiz "hello coa"  # char string[] = "hello coa";
target:     .byte 'o'            # char target = 'o';
output:     .word 0              # int output = 0;
index:      .word 0              # int index = 0;

    .text
    .globl main

main:
    la      $t0, string            # char* ptr = string;
    lb      $t1, target            # char search_char = target;
    
    li      $t2, 0                 # int position = 0;
    li      $t3, 0                 # int found = 0;

search_loop:
    lb      $t4, 0($t0)            # char current_char = *ptr;
    beq     $t4, $zero, not_found  # if (current_char == '\0') goto not_found;
    beq     $t4, $t1, found        # if (current_char == search_char) goto found;

    addi    $t0, $t0, 1            # ptr++;
    addi    $t2, $t2, 1            # position++;
    j       search_loop            # goto search_loop;

found:
    li      $t3, 1                 # found = 1;
    sw      $t3, output            # output = found;
    
    sw      $t2, index             # index = position;
    
    li      $v0, 10                # System exit call
    syscall                        # return 0;

not_found:
    li      $t3, 2                 # found = 2;
    sw      $t3, output            # output = found;

    li      $v0, 10                # System exit call
    syscall                        # return 0;
