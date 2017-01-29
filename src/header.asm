SECTION "restart_$00", ROM0[$0000]
rst $38
ds $07
SECTION "restart_$08", ROM0[$0008]
rst $38
ds $07
SECTION "restart_$10", ROM0[$0010]
rst $38
ds $07
SECTION "restart_$18", ROM0[$0018]
rst $38
ds $07
SECTION "restart_$20", ROM0[$0020]
rst $38
ds $07
SECTION "restart_$28", ROM0[$0028]
rst $38
ds $07
SECTION "restart_$30", ROM0[$0030]
rst $38
ds $07
SECTION "restart_$38", ROM0[$0038]
rst $38
ds $07

SECTION "vblank_interrupt", ROM0[$0040]
push af
push bc
push de
push hl
jp vblank

SECTION "LCDC_stat_interrupt", ROM0[$0048]
reti
ds $07

SECTION "timer_interrupt", ROM0[$0050]
reti
ds $07

SECTION "serial_interrupt", ROM0[$0058]
reti
ds $07

SECTION "hi2lo_interrupt", ROM0[$0060]
reti
ds $07

SECTION "startup", ROM0[$0100]
nop
jp main

SECTION "logo", ROM0[$0104]
ds $30

SECTION "title", ROM0[$0134]
ds $0B

SECTION "gamecode", ROM0[$013F]
ds $04

SECTION "cgb_support", ROM0[$0143]
ds $01

SECTION "maker_code", ROM0[$0144]
ds $02

SECTION "sgb_support",  ROM0[$0146]
ds $01

SECTION "cassette_type",  ROM0[$0147]
ds $01

SECTION "rom_size",  ROM0[$0148]
ds $01

SECTION "ram_size",  ROM0[$0149]
ds $01

SECTION "destination_code",  ROM0[$014A]
ds $01
db $33

SECTION "mask_rom_version", ROM0[$014C]
ds $01

SECTION "complement_check", ROM0[$014D]
ds $01

SECTION "checksum", ROM0[$014E]
ds $02
