TARGETS = example1 example2 example3 example4 example5 example6

all: $(TARGETS)

CPPFLAGS += -I.

example1: examples/example1.c miniz.c miniz_tdef.c miniz_tinfl.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

example2: examples/example2.c miniz.c miniz_tdef.c miniz_tinfl.c miniz_zip.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

example3: examples/example3.c miniz.c miniz_tdef.c miniz_tinfl.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

example4: examples/example4.c miniz.c miniz_tdef.c miniz_tinfl.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

example5: examples/example5.c miniz.c miniz_tdef.c miniz_tinfl.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

example6: examples/example6.c miniz.c miniz_tdef.c miniz_tinfl.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

example6: LDFLAGS += -lm

clean:
	rm -f $(TARGETS)

.PHONY: clean
