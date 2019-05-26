#!/usr/bin/env bash
# Copyright 2013 The Go Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

cat /Users/rsc/pub/native_client/src/trusted/service_runtime/include/bits/nacl_syscalls.h |
	awk '
	BEGIN {
		printf("// Code generated by mknacl.sh; DO NOT EDIT.\n")
	}
	NF==3 && $1=="#define" && $2~/^NACL_sys_/ {
		name=$2
		sub(/^NACL_sys_/, "SYS_", name)
		printf("#define %s %s\n", name, $3)
	}' >syscall_nacl.h
