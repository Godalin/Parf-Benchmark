# This Makefile is specific for OSCS and unrelated to the original Makefile.

TARGETS = safestringlib

all: $(TARGETS)

CPPFLAGS += -Iinclude

safestringlib: $(sort $(wildcard safeclib/*.c unittests/*.c))
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(TARGETS)

.PHONY: clean
