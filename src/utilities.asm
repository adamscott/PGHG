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
    ld a, $28			; .wait loop cycles count
.wait\@
    dec a
    jr nz, .wait\@
    pop hl
    pop de
    pop bc
    pop af
reti
rom_vblank_end::

SECTION "vblank", HRAM
vblank::
    ds rom_vblank_end - rom_vblank
