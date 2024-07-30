# This Makefile is specific for OSCS.
# The original Makefile has been renamed 'Makefile.original'.

TARGETS = papabench

CPPFLAGS += \
  -DUBX \
  -D__FAKE_FOR_IA32__ \
  -D_XOPEN_SOURCE=700 \
  -Isw/airborne/fly_by_wire \
  -Isw/var/include \
  -Isw/airborne/autopilot \
  -Iavr/include \
  -Isw/include

# Optimization flag needed for non-static 'inline' functions, to avoid
# "undefined reference to ..." errors. -O1 and -O2 are insufficient.
# See comment in https://stackoverflow.com/questions/19068705,
# or use 'static inline' if you want to disable this.
CFLAGS += -O3

all: $(TARGETS)

papabench: $(sort $(wildcard sw/airborne/autopilot/*.c)) sw/lib/c/pp_math.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(TARGETS)

.PHONY: clean
