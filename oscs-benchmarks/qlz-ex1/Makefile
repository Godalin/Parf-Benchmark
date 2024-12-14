TARGETS = qlz-compress qlz-decompress qlz-stream-compress qlz-stream-decompress

all: $(TARGETS)

qlz-compress: quicklz.c compress_file.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

qlz-decompress: quicklz.c decompress_file.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

qlz-stream-compress: quicklz.c stream_compress.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

qlz-stream-compress: CPPFLAGS += -DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000

qlz-stream-decompress: quicklz.c stream_decompress.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

qlz-stream-decompress: CPPFLAGS += -DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000

clean:
	rm -f $(TARGETS)

.PHONY: clean
