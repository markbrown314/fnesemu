  processor  6502
  ; PRG start location
  .org 0,$ea
  .rorg $8000

; registers
PPUCTRL = $2000
PPUMASK = $2001
PPUSTATUS = $2002
OAMADDR = $2003
OAMDATA = $2004
PPUSCROLL = $2005
PPUADDR = $2006
PPUDATA = $2007
OAMDMA = $4014
APUSTATUS = $4015
JOYPAD1 = $4016
JOYPAD2 = $4017

reset:
  sei
  cld

  ldx #$ff
  txs                     ; setup stack pointer

  ldx #$00
  stx PPUCTRL             ; PPUCTRL = 0
  stx PPUMASK             ; PPUMASK = 0
  stx APUSTATUS           ; APUSTATUS = 0

  txa
zero:
  sta $000,x
  sta $100,x
  sta $200,x
  sta $300,x
  sta $400,x
  sta $500,x
  sta $600,x
  sta $700,x
  inx
  bne zero

;; Play audio forever.
  lda #$01                ; enable pulse 1
  sta APUSTATUS
  lda #$08                ; period
  sta $4002
  lda #$02
  sta $4003
  lda #$bf                ; volume
  sta $4000

loop:
  jmp loop

nmi:
  rti
irq:
  rti

  ; vectors 
  .org $3ffa
  .word nmi
  .word reset
  .word irq

   

