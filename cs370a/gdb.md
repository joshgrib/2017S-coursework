# `gdb` - GNU  Debugger

```bash
me@machine:$ g++ prog.c -o prog
#compiles okay
me@machine:$ ./prog
#Segmentation fault (core dumped)
me@machine:$ gdb ./prog
(gdb) run
#enter inputs if needed to reproduce issue
(gdb) bt
#to see the stack and get info on what's up
(gdb) quit #to exit
```
