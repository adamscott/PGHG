SECTION "title_screen_ram", WRAM0
TITLE_SCREEN_STATUS:
    ds $01
TITLE_SCREEN_STATUS_INIT    EQU %00000001

SECTION "title_screen", ROM0

title_loop::
    ld a, [TITLE_SCREEN_STATUS]
    and TITLE_SCREEN_STATUS_INIT
    call Z, init_title_screen
    ; Title is now initialized
ret

init_title_screen:
    call lcd_off
    call clear_nintendo_logo

    ld a, [TITLE_SCREEN_STATUS]
    or TITLE_SCREEN_STATUS_INIT
    ld [TITLE_SCREEN_STATUS], a
ret

clear_nintendo_logo:
    set_mem_begin   $00, $9904, 13
    set_mem_end     $00, $9924, 13
ret
