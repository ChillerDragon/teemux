#!/bin/bash

# yikes z-series client nobody saw that hrhrhrh

gdb -ex='set confirm off' \
	-ex='set pagination off' \
	-ex='set disassembly-flavor intel' \
	-ex=run \
	-ex=bt \
	--args chillerbot-zx "$1"

# gdb -ex='set confirm off' \
# 	-ex='set pagination off' \
# 	-ex='set disassembly-flavor intel' \
# 	-ex=run \
# 	-ex=bt \
# 	-ex=quit \
# 	--args chillerbot-ux "$1"

