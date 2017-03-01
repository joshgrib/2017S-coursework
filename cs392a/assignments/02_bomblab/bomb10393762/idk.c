function main {
    rsi = arg1;
    rdi = arg0;
    stack[2047] = rbx;
    rsp = rsp - 0x8;
    if (rdi == 0x1) {
            *infile = *stdin@@GLIBC_2.2.5;
            initialize_bomb();
            puts("Welcome to my fiendish little bomb. You have 6 phases with");
            puts("which to blow yourself up. Have a nice day!");
            rax = read_line();
            phase_1(rax);
            phase_defused();
            puts("Phase 1 defused. How about the next one?");
            read_line();
            phase_2();
            phase_defused();
            puts("That's number 2.  Keep going!");
            read_line();
            phase_3();
            phase_defused();
            puts("Halfway there!");
            read_line();
            phase_4();
            phase_defused();
            puts("So you got that one.  Try this one.");
            rax = read_line();
            phase_5(rax);
            phase_defused();
            puts("Good work!  On to the next...");
            read_line();
            phase_6();
            phase_defused();
    }
    else {
            rbx = rsi;
            if (rdi == 0x2) {
                    rax = fopen(*(rsi + 0x8), 0x402334);
                    *infile = rax;
                    if (rax == 0x0) {
                            __printf_chk(0x1, 0x402336, *rbx, *(rbx + 0x8));
                            exit(0x8);
                    }
                    else {
                            initialize_bomb();
                            puts("Welcome to my fiendish little bomb. You have 6 phases with");
                            puts("which to blow yourself up. Have a nice day!");
                            rax = read_line();
                            phase_1(rax);
                            phase_defused();
                            puts("Phase 1 defused. How about the next one?");
                            read_line();
                            phase_2();
                            phase_defused();
                            puts("That's number 2.  Keep going!");
                            read_line();
                            phase_3();
                            phase_defused();
                            puts("Halfway there!");
                            read_line();
                            phase_4();
                            phase_defused();
                            puts("So you got that one.  Try this one.");
                            rax = read_line();
                            phase_5(rax);
                            phase_defused();
                            puts("Good work!  On to the next...");
                            read_line();
                            phase_6();
                            phase_defused();
                    }
            }
            else {
                    __printf_chk(0x1, "Usage: %s [<input_file>]\n", *rsi);
                    exit(0x8);
            }
    }
    return;
}
function initialize_bomb {
    signal(0x2, 0x40135b);
    return;
}
function phase_1 {
    rsp = rsp - 0x8;
    if (strings_not_equal(arg0, "I am not part of the problem. I am a Republican.") != 0x0) {
            explode_bomb();
    }
    return;
}
function phase_2 {
    stack[2046] = rbx; //store stack frame base
    rsp = rsp - 32;
    read_six_numbers();
    if (var_0 != 0x1){
        rax = explode_bomb();
        return rax;
    }
    rbx = rsp; //rbx is base index of stack frame
    rbp = arg_-1; //rbp is next arg
    do-while(rbx != rbp){//
        rax = *(int32_t *)rbx;//rax is value at stack base
        if (*(int32_t *)(rbx + 0x4) != rax + rax){ //check if the next element is twice the value of this one
            rax = explode_bomb();
            return rax;
        }
        rbx = rbx + 0x4; //increase stack base index
    }
    rax = stack[2041] ^ *0x28;
    COND = rax == 0x0;
    if (!COND) {
            rax = __stack_chk_fail();
    }
    return rax;
}

function phase_3 {
    rsp = rsp - 32;
    stack[2046] = *0x28;
    rax = 0x0;
    r8 = arg_-1;
    rcx = arg_-1;
    rdx = arg_1;
    rsi = "%d %c %d";
    if (__isoc99_sscanf() <= 0x2) {
            rax = explode_bomb();
    }
    else {
            if (arg_1 <= 0x7) {
                    rax = (*(stack[2043] * 0x8 + 0x4024f0))();
            }
            else {
                    rax = explode_bomb();
            }
    }
    return rax;
}
function sub_400f5a {
    if (arg_C != 0x2cc) {
            rax = explode_bomb();
    }
    else {
            if (0x6c != arg_7) {
                    rax = explode_bomb();
            }
            else {
                    rax = stack[2048] ^ *0x28;
                    COND = rax == 0x0;
                    if (!COND) {
                            rax = __stack_chk_fail();
                    }
            }
    }
    return rax;
}
function sub_400f7c {
    rax = explode_bomb();
    return rax;
}
function sub_400f9e {
    rax = explode_bomb();
    return rax;
}
function sub_400fc0 {
    rax = explode_bomb();
    return rax;
}
function sub_400fdf {
    rax = explode_bomb();
    return rax;
}
function sub_400ffa {
    rax = explode_bomb();
    return rax;
}
function sub_401015 {
    rax = explode_bomb();
    return rax;
}
function sub_401030 {
    rax = explode_bomb();
    return rax;
}

function func4 {
    /*
    arg0 < 0 --> 0
    arg0 = 1 --> arg1
    else{
        fibonaccoi
    }

    */
    if (arg0 > 0x0) {
            rax = arg1;
            if (arg0 != 0x1) {
                    stack[2047] = r12;
                    stack[2046] = rbp;
                    stack[2045] = rbx;
                    rsp = rsp - 0x8 - 0x8 - 0x8;
                    r12 = arg1 + func4(arg0 + 0xffffffffffffffff, arg1);
                    rax = func4(arg0 + 0xfffffffffffffffe, arg1);
                    rax = rax + r12;
            }
    }
    else {
            rax = 0x0;
    }
    return rax;
}

function phase_4 {
    rsp = rsp - 0x18;
    stack[2046] = *0x28;
    rax = 0x0;
    rcx = rsp;
    rdx = var_4;
    rsi = "%d %d";
    if ((__isoc99_sscanf() == 0x2) && (stack[2045] <= 0x4)) {
            if (func4(0x5, stack[2045]) != var_4) {
                    rax = explode_bomb();
            }
            else {
                    rax = stack[2045] ^ *0x28;
                    COND = rax == 0x0;
                    if (!COND) {
                            rax = __stack_chk_fail();
                    }
                    else {
                            rsp = rsp + 0x18;
                    }
            }
    }
    else {
            rax = explode_bomb();
    }
    return rax;
}

function phase_5 {
    stack[2047] = rbx;
    rsp = rsp - 0x8 - 0x10;
    rbx = arg0;
    stack[2046] = *0x28;
    rax = 0x0;
    if (string_length(arg0) != 0x6) {
            rax = explode_bomb();
    }
    else {
            rax = 0x0;
            do {
                    *(int8_t *)(rsp + rax) = *(int8_t *)((*(int8_t *)(rbx + rax) & 0xff & 0xf) + 0x402530) & 0xff;
                    rax = rax + 0x1;
            } while (rax != 0x6);
            stack[2046] = 0x0;
            if (strings_not_equal(rsp, "bruins") != 0x0) {
                    rax = explode_bomb();
            }
            else {
                    rax = stack[2045] ^ *0x28;
                    COND = rax == 0x0;
                    if (!COND) {
                            rax = __stack_chk_fail();
                    }
                    else {
                            rsp = rsp + 0x18;
                            rbx = stack[2047];
                    }
            }
    }
    return rax;
}

function phase_6 {
    stack[2047] = 0x0;
    stack[2046] = r13;
    stack[2045] = r12;
    stack[2044] = rbp;
    stack[2043] = rbx;
    rsp = rsp - 0x8 - 0x8 - 0x8 - 0x8 - 0x8 - 0x60;
    stack[2042] = *0x28;
    rax = 0x0;
    rsi = rsp;
    rax = read_six_numbers();
    r12 = rsp;
    r13 = rsp;
    r14 = 0x0;
    goto loc_4011cf;

loc_4011cf:
    rbp = r13;
    if (*(int32_t *)r13 <= 0x6) goto loc_4011e3;

loc_4011de:
    rax = explode_bomb();
    return rax;

loc_4011e3:
    r14 = r14 + 0x1;
    if (r14 == 0x6) goto loc_40120e;

loc_4011ed:
    rbx = r14;
    goto loc_4011f0;

loc_4011f0:
    if (*(int32_t *)rbp != *(int32_t *)(rsp + sign_extend_64(rbx) * 0x4)) goto loc_401200;

loc_4011fb:
    rax = explode_bomb();
    return rax;

loc_401200:
    rbx = rbx + 0x1;
    if (rbx <= 0x5) goto loc_4011f0;

loc_401208:
    r13 = r13 + 0x4;
    goto loc_4011cf;

loc_40120e:
    rcx = arg_2;
    rdx = 0x7;
    do {
            *(int32_t *)r12 = 0x7 - *(int32_t *)r12;
            r12 = r12 + 0x4;
    } while (rcx != r12);
    rsi = 0x0;
    do {
            rcx = *(int32_t *)(rsp + rsi);
            rax = 0x1;
            rdx = 0x6042f0;
            if (rcx > 0x1) {
                    do {
                            rdx = *(rdx + 0x8);
                            rax = rax + 0x1;
                    } while (rax != rcx);
            }
            *(rsp + rsi * 0x2 + 0x20) = rdx;
            rsi = rsi + 0x4;
            if (rsi == 0x18) {
                break;
            }
            else {
                continue;
            }
    } while (true);
    rbx = stack[2031];
    rax = arg_3;
    rsi = arg_8;
    rcx = rbx;
    do {
            rdx = *(rax + 0x8);
            *(rcx + 0x8) = rdx;
            rax = rax + 0x8;
            rcx = rdx;
    } while (rsi != rax);
    *(rdx + 0x8) = 0x0;
    rbp = 0x5;
    goto loc_401293;

loc_401293:
    if (*(int32_t *)rbx >= *(int32_t *)*(rbx + 0x8)) goto loc_4012a2;

loc_40129d:
    rax = explode_bomb();
    return rax;

loc_4012a2:
    rbx = *(rbx + 0x8);
    rbp = rbp - 0x1;
    COND = rbp != 0x0;
    if (COND) goto loc_401293;

loc_4012ab:
    rax = stack[2031] ^ *0x28;
    COND = rax == 0x0;
    if (!COND) {
            rax = __stack_chk_fail();
    }
    else {
            rbx = stack[2043];
            rbp = stack[2044];
            r12 = stack[2045];
            r13 = stack[2046];
            rsp = rsp + 0x88;
            r14 = stack[2047];
    }
    return rax;
}
