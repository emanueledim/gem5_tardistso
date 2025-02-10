#!/bin/bash

DEST="gem5"
ARCH=""
PROTOCOL=""

VALID_ARCH=("X86" "ARM" "RISCV")
VALID_PROTOCOL=("TARDISTSO" "MI" "MSI")

usage() {
    echo "Usage: $0 -a ARCH -p PROTOCOL"
    echo "Valid ARCH values: ${VALID_ARCH[*]}"
    echo "Valid PROTOCOL values: ${VALID_PROTOCOL[*]}"
    exit 1
}

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -a|--arch)
            ARCH="$2"
            shift 2
            ;;
        -p|--protocol)
            PROTOCOL="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

if [[ ! " ${VALID_ARCH[@]} " =~ " $ARCH " ]]; then
    echo "Error: Invalid ARCH value. Must be one of: ${VALID_ARCH[*]}"
    usage
fi

if [[ ! " ${VALID_PROTOCOL[@]} " =~ " $PROTOCOL " ]]; then
    echo "Error: Invalid PROTOCOL value. Must be one of: ${VALID_PROTOCOL[*]}"
    usage
fi

if [ ! -d "$DEST" ]; then
  echo "Gem5 directory not found!"
  exit 1
fi

cd "$DEST"

echo "Building gem5 project with $PROTOCOL on $ARCH..."

scons defconfig build/${ARCH}_${PROTOCOL} build_opts/${ARCH}
scons setconfig build/${ARCH}_${PROTOCOL} RUBY_PROTOCOL_${PROTOCOL}=y SLICC_HTML=y
scons build/${ARCH}_${PROTOCOL}/gem5.opt -j$(nproc)

echo "Done."