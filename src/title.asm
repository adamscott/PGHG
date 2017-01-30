SECTION "title_screen_ram", WRAM0
TITLE_SCREEN_STATUS:
    ds $01
TITLE_SCREEN_STATUS_INIT    EQU %00000001

SECTION "title_screen", ROM0

title_init::
    ld a, [TITLE_SCREEN_STATUS]
    or TITLE_SCREEN_STATUS_INIT
    call NZ, init_title_screen
ret

init_title_screen:
    call clear_nintendo_logo
ret

clear_nintendo_logo:
    set_mem_begin   $00, $9904, 13
    set_mem_end     $00, $9924, 13
ret
