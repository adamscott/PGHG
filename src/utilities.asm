SECTION "utilities", ROM0

lcd_off::
INCLUDE "gb-lib/utilities/lcd_off.asm"

lcd_on::
INCLUDE "gb-lib/utilities/lcd_on.asm"

memcpy::
INCLUDE "gb-lib/utilities/memcpy.asm"

memset::
INCLUDE "gb-lib/utilities/memset.asm"

rom_vblank::
    ld b, GAMEBOY_STATUS_VBLANK
    ld a, [GAMEBOY_STATUS]
    or b
    ld [GAMEBOY_STATUS], a

    ld a, SPR_TBL
    ld [DMA], a
    ld a, 40			; .wait loop cycles count (40)
.wait\@
    dec a
    jr NZ, .wait\@
    pop hl
    pop de
    pop bc
    pop af
reti
rom_vblank_end::

SECTION "vblank", HRAM
vblank::
    ds rom_vblank_end - rom_vblank

RND_SEED_0::
    ds $01

RND_SEED_1::
    ds $01

RND_SEED_2::
    ds $01

RND_SEED_3::
    ds $01
