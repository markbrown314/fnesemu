#!/usr/bin/bash 
dasm nesinit.asm -oprg.bin -v3 -f3
if [ "$?" != "0" ]; then
  echo "error: cannot build nesinit"
  exit 1
fi

cat ines_header.bin prg.bin chr.bin > nesinit.nes 
