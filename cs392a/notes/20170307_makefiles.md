General format:
```makefile
<target>:<prerequisites...>
    <commands>
```

Basic example:
```makefile
source:source.c
    gcc source.c -o source
```

**Special variables**
* `$@` - the target of the current line
* `$<` - the input file
* `$^` - The list of all input files
* `$?` - All inputs newer than the target
* `$$` - The $ literal
* `$(wildcard patterns...)` - Wildcard patterns
* `$(shell cmd)` - Evaluate cmd in shell

## Implicit rules
```makefile
foo: foo.o bar.o
    $(cc) -o $@ $^ $(FLAGS) $(LDFLAGS)
```
