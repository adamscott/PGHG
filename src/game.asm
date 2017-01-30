SECTION "game_ram", WRAM0
;GAMESTATE                  EQU $C000
GAMESTATE:
    ds $01
GAMESTATE_TITLE             EQU 1

SECTION "game_code", ROM0
game_loop::
    ld a, [GAMESTATE]
    cp GAMESTATE_TITLE
    call Z, title_loop
ret
