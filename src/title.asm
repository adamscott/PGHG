SECTION "title_screen", ROM0

title_init::
    halt
    nop
    jr title_init
