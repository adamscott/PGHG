SECTION "utilities", ROM0

lcd_off::
INCLUDE "gb-lib/utilities/lcd_off.asm"

lcd_on::
INCLUDE "gb-lib/utilities/lcd_on.asm"

memcpy::
INCLUDE "gb-lib/utilities/memcpy.asm"

memset::
INCLUDE "gb-lib/utilities/memset.asm"

rom_vblank
    push af
    ld a, SPR_TBL
    ld [DMA], a
    ld a, $28			; .wait loop cycles count
.wait\@
    dec a
    jr nz, .wait\@
    pop af
reti
rom_vblank_end

SECTION "vblank", HRAM
vblank::
    ds rom_vblank_end - rom_vblank
