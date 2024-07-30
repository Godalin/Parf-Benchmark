/*
 *  Copyright (C) 2019 - This file is part of x509-parser project
 *
 *  Author:
 *      Arnaud EBALARD <arnaud.ebalard@ssi.gouv.fr>
 *
 *  This software is licensed under a dual GPLv2/BSD license. See
 *  LICENSE file at the root folder of the project.
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "x509-parser.h"
#include <unistd.h>

static void usage(char *argv0)
{
	printf("Usage: %s file.der\n", argv0);
}

int main(int argc, char *argv[])
{
  // To illustrate E-ACSL on this code, we deliberately change the buffer
  // declaration to introduce errors during execution
#ifndef __FC_EACSL__
	// Original (bug-free) declaration
	u8 buf[ASN1_MAX_BUFFER_SIZE];
#else
# ifdef EACSL_STACK_OVERFLOW
	// Buffer size too small: a stack overflow will happen
	u8 buf[ASN1_MAX_BUFFER_SIZE/64];
# endif
# ifdef EACSL_HEAP_OVERFLOW
	// Buffer size too small: a heap overflow will happen
	u8 *buf = malloc(sizeof(u8) * ASN1_MAX_BUFFER_SIZE/64);
# endif
#endif
	off_t pos, offset = 0;
	char *path = argv[1];
	u16 rem, copied, eaten;
	int ret, eof = 0;
	int fd, num_certs, num_certs_ok;

	if (argc != 2) {
		usage(argv[0]);
		ret = -1;
		goto out;
	}

	fd = open(path, O_RDONLY);
	if (fd == -1) {
		printf("Unable to open input file %s\n", path);
		return -1;
	}

	num_certs = 0;
	num_certs_ok = 0;
	while (1) {
		pos = lseek(fd, offset, SEEK_SET);
		if (pos == (off_t)-1) {
			printf("lseek failed %s\n", path);
			ret = -1;
			goto out;
		}
		rem = ASN1_MAX_BUFFER_SIZE;
		copied = 0;
		while (rem) {
			ret = (int)read(fd, buf + copied, rem);
			if (ret <= 0) {
				if (copied == 0) {
					eof = 1;
				}
				break;
			} else {
				rem -= (u16)ret;
				copied += (u16)ret;
			}
		}

		if (eof) {
			break;
		}

		num_certs += 1;
		eaten = 0;
		ret = parse_x509_cert_relaxed(buf, copied, &eaten);
#ifdef ERROR_TRACE_ENABLE
		printf("%05d %ld %d %s\n", -ret, offset, eaten, path);
#endif
		if (ret == 1) {
			eaten = 1;
			printf("not a sequence %ld %d\n", offset, num_certs);
		}
		if (ret == 0) {
			num_certs_ok += 1;
		}

		offset += eaten;
	}
	close(fd);

	ret = 0;

	printf("num_certs OK %d/%d\n", num_certs_ok, num_certs);

out:
	return ret;
}
