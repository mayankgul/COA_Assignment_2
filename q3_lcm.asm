    .data
num1:       .word 36          # int num1 = 36;
num2:       .word 60          # int num2 = 60;
gcd_result: .word 0           # int gcd_result = 0;
lcm_result: .word 0           # int lcm_result = 0;

    .text
    .globl main

main:
    lw      $t0, num1         # int a = num1;
    lw      $t1, num2         # int b = num2;

    move    $t2, $t0          # int original_a = a;
    move    $t3, $t1          # int original_b = b;

gcd_loop:
    beq     $t1, $zero, gcd_done  # if (b == 0) goto gcd_done;
    div     $t0, $t1              # a / b;
    mfhi    $t4                   # int remainder = a % b;
    move    $t0, $t1              # a = b;
    move    $t1, $t4              # b = remainder;
    j       gcd_loop              # goto gcd_loop;

gcd_done:
    sw      $t0, gcd_result    # gcd_result = a;

    mul     $t5, $t2, $t3      # int product = original_a * original_b;
    div     $t5, $t0           # product / gcd_result;
    mflo    $t6                # int lcm = quotient;

    sw      $t6, lcm_result    # lcm_result = lcm;

    li      $v0, 10            # System exit call
    syscall                    # return 0;
