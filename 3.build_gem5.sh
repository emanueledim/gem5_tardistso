#!/bin/bash

DEST="gem5"

if [ ! -d "$DEST" ]; then
  echo "Gem5 directory not found!"
  exit 1
fi

cd "$DEST"

echo "Building gem5 project..."

scons defconfig build/X86_TARDISTSO build_opts/X86
scons setconfig build/X86_TARDISTSO RUBY_PROTOCOL_TARDISTSO=y SLICC_HTML=y
scons build/X86_TARDISTSO/gem5.opt -j$(nproc)

echo "Done."