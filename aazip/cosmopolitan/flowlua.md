# Flowlua

[Flowlua](https://github.com/eliotmuirgrid/flowlua) is a project I wrote using [Cosmopolitan](https://github.com/jart/cosmopolitan). There are some really cool features in here, especially with the build system.

## Why is it Cool?

- The make system I built for it is beautiful.
- Just add source files and compile—no hassle.

### Simple Build Example

Add your source files, then compile with this minimal `Makefile`:

```makefile
TARGET=flowlua.com

include ../make/makefile
```

*Check out the [`makefile`](https://github.com/eliotmuirgrid/flowlua/blob/master/make/makefile) yourself for all the details.*

---

### How Does the Make System Work?

The [makefile](https://github.com/eliotmuirgrid/flowlua/blob/master/make/makefile) dynamically discovers all `.c` and `.cpp` files in your source directories, sets up object and dependency rules, and makes the build process really tidy.

Here’s a preview:

```makefile
# Wildcard matching to figure out where sources are based on the DIRS variable
OBJEXT  := .o
LIBEXT  := a

# Safely expand search paths
DIRS    := $(wildcard ../*/)
SEARCH  := $(foreach dir, $(DIRS), $(dir)*.c $(dir)*.cpp) 
SOURCES := $(wildcard $(SEARCH))

# Use patsubst instead of subst to prevent corrupting folder names containing ".c"
OBJECTS := $(patsubst %.cpp, %$(OBJEXT), $(SOURCES))
OBJECTS := $(patsubst %.cpp, %$(OBJEXT), $(SOURCES))
OBJECTS := $(patsubst %.c, %$(OBJEXT), $(OBJECTS))
DEPENDS := $(patsubst %$(OBJEXT), %.o.d, $(OBJECTS))

OBJECTS := $(OBJECTS) $(OBJECTS_EXTRA)

# If a target is not defined, default to test.com
TARGET  ?= test.com

# Define our clean list
RMLIST  := $(foreach dir, $(DIRS), $(dir)*.o $(dir)*.d) *.d *.o *~ *.elf *.dbg 

.PHONY: all info clean

all: $(TARGET)

CC     := ccache $(FLOW_TOOL_COSMOPOLITAN)/bin/cosmocc
CXX    := ccache $(FLOW_TOOL_COSMOPOLITAN)/bin/cosmoc++

PCFLAGS := -Wno-pointer-to-int-cast -MMD -MP -I../ 
PCPPFLAGS := -MMD -MP -I../ 

$(TARGET): $(OBJECTS) 
\t$(CXX) $(OBJECTS) -o $@

%.o: %.c
\t$(CC) $(PCFLAGS) -c -o $@ $<

%.o: %.cpp
\t$(CXX) $(PCPPFLAGS) -c -o $@ $<

# Use double colon rule for clean so regular makefiles can perform additional cleaning. 
clean::
\t-$(RM) $(RMLIST)

-include $(DEPENDS)
```

---

Check out [the repository](https://github.com/eliotmuirgrid/flowlua) for more details and to see all the "cool shit" for yourself!
