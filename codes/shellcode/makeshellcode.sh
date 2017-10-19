#!/bin/bash
ASMSOURCE=$1
nasm -felf64 $ASMSOURCE -o tmp.o
ld -o tmp tmp.o
for i in $(objdump -d tmp |grep "^ " |cut -f2); do echo -n '\x'$i;
done;
