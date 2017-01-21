SECTION "utilities", ROM0[$200]
include "gb-lib/utilities/lcd_off.asm"
include "gb-lib/utilities/lcd_on.asm"
include "gb-lib/utilities/memcpy.asm"
include "gb-lib/utilities/memset.asm"

include "gb-lib/utilities/vblank.asm"
ROM_VBlank_END:

SECTION "vblank", HRAM[$FF80]
VBlank::
	ds ROM_VBlank_END - ROM_VBlank