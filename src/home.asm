INCLUDE "src/header.asm"
INCLUDE "src/game.asm"

SECTION "main_code", ROM0
main::
    nop
    jr init

init::
    di

    ; sets the stack pointer
    ld sp, STACK_POINTER

    ; clears ram
CLEAR_START SET ((SPR_TBL << 8) + SPR_TBL_SIZE)
CLEAR_LENGTH SET (STACK_POINTER - STACK_POINTER_MAX_SIZE) - ((SPR_TBL << 8) + SPR_TBL_SIZE)
    set_mem 0, CLEAR_START, CLEAR_LENGTH

    ; Copy vblank routine to hram
    copy_mem rom_vblank, vblank, rom_vblank_end - rom_vblank
    
    ; sets IF to 0
    ld a, 0
    ld [IFL], a

    ; sets the vblank interrupt
    ld a, IE_VBlank
    ld [IE], a

    ; sets the timer overflow interrupt
    ld b, IE_TimerOverflow
    ld a, [IE]
    or b
    ld [IE], a

    ei

    ld a, GAMESTATE_TITLE
    ld [GAMESTATE], a

main_loop::
    halt
    nop
    
    ; vblank_check
    ld a, [GAMEBOY_STATUS]
    and GAMEBOY_STATUS_VBLANK
    jr Z, main_loop ; halt if not coming from a vblank
    xor GAMEBOY_STATUS_VBLANK
    ld [GAMEBOY_STATUS], a ; remove the vblank status
    ; vblank_check end

    ; starting the game loop
    call game_loop

    ; as the loop needs a vblank to start, let's turn of the LCD to be sure
    call lcd_on
    ; main_loop ends. Let's start again.
    jr main_loop
