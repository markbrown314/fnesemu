all: nesinit.nes

nesinit.nes: prg.bin chr.bin ines_header.bin
	cat ines_header.bin prg.bin chr.bin > nesinit.nes

prg.bin: nesinit.asm
	dasm nesinit.asm -oprg.bin -v3 -f3
clean:
	-rm prg.bin nesinit.nes
