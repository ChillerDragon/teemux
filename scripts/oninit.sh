#!/bin/bash

gdb -ex='set confirm off' \
	-ex='set pagination off' \
	-ex='set disassembly-flavor intel' \
	-ex=run \
	-ex=bt \
	-ex=quit \
	--args chillerbot-ux "$1"

