SOURCES := $(sort $(wildcard code/*.c)) code/harness/harness.c code/intel/linux/target.c

CPPFLAGS += -Icode/harness -Icode -Icode/intel/linux
CPPFLAGS += -DTRACE_HARNESS -DTRACE_TARGET

all: debie1

debie1: $(SOURCES)
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f debie1

.PHONY: clean
