#!/bin/bash

DEST="gem5"

if [ ! -d "$DEST" ]; then
  echo "Gem5 directory not found!"
  exit 1
fi

cd "$DEST"

./build/X86_TARDISTSO/gem5.opt configs/deprecated/example/se.py -c tests/test-progs/tardis_tso/x86/spinlock/bin/spinlock -n 5 --cpu-type X86TimingSimpleCPU --ruby