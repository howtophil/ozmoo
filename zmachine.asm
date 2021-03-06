z_extended_opcode 	!byte 0
z_operand_count		!byte 0
z_canonical_opcode	!byte 0
z_operand_type_arr  !byte 0, 0, 0, 0, 0, 0, 0, 0
z_operand_value_high_arr  !byte 0, 0, 0, 0, 0, 0, 0, 0
z_operand_value_low_arr   !byte 0, 0, 0, 0, 0, 0, 0, 0
z_local_var_count	!byte 0
z_temp				!byte 0, 0, 0, 0, 0
z_rnd_a				!byte 123
z_rnd_b				!byte 75
z_rnd_c				!byte 93
z_rnd_x				!byte 1
z_rnd_mode 			!byte 0
z_test				!byte 0
z_test_mode_print = 1
z_test_mode_print_and_store = 2
z_font				!byte 1, 1
z_window_lower = 0
z_window_upper = 1
z_window			!byte z_window_lower
z_interrupt_return_value !byte 0,0

; opcount0 = 0
; opcount1 = 16
; opcount2 = 32
; opcountvar = 64
; opcountext = 96

; =========================================== Highbytes of jump table

z_jump_high_arr
; 0OP
	!byte >z_ins_rtrue
	!byte >z_ins_rfalse
	!byte >z_ins_print
	!byte >z_ins_print_ret
	!byte >z_ins_nop
!ifndef Z5PLUS {
	!byte >z_ins_save
	!byte >z_not_implemented
} else {
	!byte >z_not_implemented
	!byte >z_not_implemented
}
	!byte >z_not_implemented
	!byte >z_ins_ret_popped
!ifndef Z5PLUS {
	!byte >stack_pull ; z_ins_pop
} else {
	!byte >z_ins_catch
}
	!byte >z_ins_quit
	!byte >z_ins_new_line
!ifdef Z3 {
	!byte >z_ins_show_status
} else {
	!byte >z_ins_nop ; should be nop according to show_status/spec 1.0
}
	!byte >make_branch_true ; z_ins_verify
!ifdef Z5PLUS {
	!byte >z_not_implemented
	!byte >make_branch_true ; z_ins_piracy
} else {
	!byte >z_not_implemented
	!byte >z_not_implemented
}

; 1OP

	!byte >z_ins_jz
	!byte >z_ins_get_sibling
	!byte >z_ins_get_child
	!byte >z_ins_get_parent
	!byte >z_ins_get_prop_len
	!byte >z_ins_inc
	!byte >z_ins_dec
	!byte >z_ins_print_addr
	!byte >z_ins_call_xs
	!byte >z_ins_remove_obj
	!byte >z_ins_print_obj
	!byte >z_ins_ret
	!byte >z_ins_jump
	!byte >z_ins_print_paddr
	!byte >z_ins_load
!ifndef Z5PLUS {
	!byte >z_ins_not
} else {
	!byte >z_ins_call_xn
}

; 2OP

	!byte >z_not_implemented
	!byte >z_ins_je
	!byte >z_ins_jl
	!byte >z_ins_jg
	!byte >z_ins_dec_chk
	!byte >z_ins_inc_chk
	!byte >z_ins_jin
	!byte >z_ins_test
	!byte >z_ins_or
	!byte >z_ins_and
	!byte >z_ins_test_attr
	!byte >z_ins_set_attr
	!byte >z_ins_clear_attr
	!byte >z_ins_store
	!byte >z_ins_insert_obj
	!byte >z_ins_loadw_and_storew
	!byte >z_ins_loadb
	!byte >z_ins_get_prop
	!byte >z_ins_get_prop_addr
	!byte >z_ins_get_next_prop
	!byte >z_ins_add
	!byte >z_ins_sub
	!byte >z_ins_mul
	!byte >z_ins_div
	!byte >z_ins_mod
!ifndef Z4PLUS {
	!byte >z_not_implemented
} else {
	!byte >z_ins_call_xs
}
!ifndef Z5PLUS {
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
} else {
	!byte >z_ins_call_xn
	!byte >z_not_implemented
	!byte >z_ins_throw
}
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented

	!byte >z_ins_call_xs
	!byte >z_ins_loadw_and_storew
	!byte >z_ins_storeb
	!byte >z_ins_put_prop
!ifndef Z5PLUS {
	!byte >z_ins_sread
} else {
	!byte >z_ins_aread
}
	!byte >z_ins_print_char
	!byte >z_ins_print_num
	!byte >z_ins_random
	!byte >z_ins_push
	!byte >z_ins_pull
	!byte >z_ins_split_window
	!byte >z_ins_set_window
	!byte >z_ins_call_xs
!ifdef Z4PLUS {
	!byte >z_ins_erase_window
	!byte >z_ins_erase_line
	!byte >z_ins_set_cursor
	!byte >z_ins_get_cursor
	!byte >z_ins_set_text_style
	!byte >z_ins_buffer_mode
} else {
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
}
	!byte >z_ins_output_stream
	!byte >z_not_implemented
	!byte >z_ins_sound_effect
!ifdef Z4PLUS {
	!byte >z_ins_read_char
	!byte >z_ins_scan_table
} else {
	!byte >z_not_implemented
	!byte >z_not_implemented
}
!ifdef Z5PLUS {
	!byte >z_ins_not
	!byte >z_ins_call_xn
	!byte >z_ins_call_xn
	!byte >z_ins_tokenise_text
	!byte >z_ins_encode_text
	!byte >z_not_implemented
	!byte >z_ins_print_table
	!byte >z_ins_check_arg_count
} else {
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
}

; EXT

z_opcount_ext_jump_high_arr
!ifdef Z5PLUS {
	!byte >z_ins_save
	!byte >z_not_implemented
	!byte >z_ins_log_shift
	!byte >z_ins_art_shift
	!byte >z_ins_set_font
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_ins_save_restore_undo
	!byte >z_ins_save_restore_undo
	!byte >z_not_implemented
	!byte >z_not_implemented
	!byte >z_ins_set_true_colour
}


; =========================================== Lowbytes of jump table
	
z_jump_low_arr
	!byte <z_ins_rtrue
	!byte <z_ins_rfalse
	!byte <z_ins_print
	!byte <z_ins_print_ret
	!byte <z_ins_nop
!ifndef Z5PLUS {
	!byte <z_ins_save
	!byte <z_not_implemented
} else {
	!byte <z_not_implemented
	!byte <z_not_implemented
}
	!byte <z_not_implemented
	!byte <z_ins_ret_popped
!ifndef Z5PLUS {
	!byte <stack_pull ; z_ins_pop
} else {
	!byte <z_ins_catch
}
	!byte <z_ins_quit
	!byte <z_ins_new_line
!ifdef Z3 {
	!byte <z_ins_show_status
} else {
	!byte <z_ins_nop ; should be nop according to show_status/spec 1.0
}
	!byte <make_branch_true ; z_ins_verify
!ifdef Z5PLUS {
	!byte <z_not_implemented
	!byte <make_branch_true ; z_ins_piracy
} else {
	!byte <z_not_implemented
	!byte <z_not_implemented
}

; 1OP

	!byte <z_ins_jz
	!byte <z_ins_get_sibling
	!byte <z_ins_get_child
	!byte <z_ins_get_parent
	!byte <z_ins_get_prop_len
	!byte <z_ins_inc
	!byte <z_ins_dec
	!byte <z_ins_print_addr
	!byte <z_ins_call_xs
	!byte <z_ins_remove_obj
	!byte <z_ins_print_obj
	!byte <z_ins_ret
	!byte <z_ins_jump
	!byte <z_ins_print_paddr
	!byte <z_ins_load
!ifndef Z5PLUS {
	!byte <z_ins_not
} else {
	!byte <z_ins_call_xn
}
	
; 2OP

	!byte <z_not_implemented
	!byte <z_ins_je
	!byte <z_ins_jl
	!byte <z_ins_jg
	!byte <z_ins_dec_chk
	!byte <z_ins_inc_chk
	!byte <z_ins_jin
	!byte <z_ins_test
	!byte <z_ins_or
	!byte <z_ins_and
	!byte <z_ins_test_attr
	!byte <z_ins_set_attr
	!byte <z_ins_clear_attr
	!byte <z_ins_store
	!byte <z_ins_insert_obj
	!byte <z_ins_loadw_and_storew
	!byte <z_ins_loadb
	!byte <z_ins_get_prop
	!byte <z_ins_get_prop_addr
	!byte <z_ins_get_next_prop
	!byte <z_ins_add
	!byte <z_ins_sub
	!byte <z_ins_mul
	!byte <z_ins_div
	!byte <z_ins_mod
!ifndef Z4PLUS {
	!byte <z_not_implemented
} else {
	!byte <z_ins_call_xs
}
!ifndef Z5PLUS {
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
} else {
	!byte <z_ins_call_xn
	!byte <z_not_implemented
	!byte <z_ins_throw
}
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented

; VAR	

	!byte <z_ins_call_xs
	!byte <z_ins_loadw_and_storew
	!byte <z_ins_storeb
	!byte <z_ins_put_prop
!ifndef Z5PLUS {
	!byte <z_ins_sread
} else {
	!byte <z_ins_aread
}
	!byte <z_ins_print_char
	!byte <z_ins_print_num
	!byte <z_ins_random
	!byte <z_ins_push
	!byte <z_ins_pull
	!byte <z_ins_split_window
	!byte <z_ins_set_window
	!byte <z_ins_call_xs
!ifdef Z4PLUS {
	!byte <z_ins_erase_window
	!byte <z_ins_erase_line
	!byte <z_ins_set_cursor
	!byte <z_ins_get_cursor
	!byte <z_ins_set_text_style
	!byte <z_ins_buffer_mode
} else {
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
}
	!byte <z_ins_output_stream
	!byte <z_not_implemented
	!byte <z_ins_sound_effect
!ifdef Z4PLUS {
	!byte <z_ins_read_char
	!byte <z_ins_scan_table
} else {
	!byte <z_not_implemented
	!byte <z_not_implemented
}
!ifdef Z5PLUS {
	!byte <z_ins_not
	!byte <z_ins_call_xn
	!byte <z_ins_call_xn
	!byte <z_ins_tokenise_text
	!byte <z_ins_encode_text
	!byte <z_not_implemented
	!byte <z_ins_print_table
	!byte <z_ins_check_arg_count
} else {
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
}

; EXT

z_opcount_ext_jump_low_arr
!ifdef Z5PLUS {
	!byte <z_ins_save
	!byte <z_not_implemented
	!byte <z_ins_log_shift
	!byte <z_ins_art_shift
	!byte <z_ins_set_font
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_ins_save_restore_undo
	!byte <z_ins_save_restore_undo
	!byte <z_not_implemented
	!byte <z_not_implemented
	!byte <z_ins_set_true_colour
}

z_number_of_ext_opcodes_implemented = * - z_opcount_ext_jump_low_arr

z_number_of_opcodes_implemented = * - z_jump_low_arr

; These get zeropage addresses in constants.asm:
; z_opcode 
; z_opcode_number
; z_opcode_opcount ; 0 = 0OP, 1=1OP, 2=2OP, 3=VAR

z_opcode_extended = 190
z_opcode_call_vs2 = 236
z_opcode_call_vn2 = 250

z_opcode_opcount_0op = 0
z_opcode_opcount_1op = 16
z_opcode_opcount_2op = 32
z_opcode_opcount_var = 64
z_opcode_opcount_ext = 96

z_exe_mode_normal = $0
z_exe_mode_return_from_read_interrupt = $80

z_init
!zone {

!ifdef DEBUG {
!ifdef VMEM_OPTIMIZE {
	jsr print_following_string
	!pet "*** vmem optimization mode ***",13,13,0
}	
}


	ldy #1
	sty z_pc_mempointer_is_unsafe
	dey
	sty z_exe_mode ; 0 = Normal
	
!ifdef TRACE {
	; Setup trace
	lda #0
	sta z_trace_index
	tay
-	sta z_trace_page,y
	iny
	bne -
}
	
	; Modify header to tell game about terp capabilities
!ifdef Z3 {
	lda story_start + 1
	and #(255 - 16 - 32 - 64) ; Screen-splitting not available, variable-pitch font is not default
	sta story_start + 1
} else {
!ifdef Z4 {
	lda story_start + 1
	and #(255 - 4 - 8) ; bold font, italic font, timed input not available
	ora #(16 + 128) ; Fixed-space style, timed input available
	sta story_start + 1
} else { ; Z5PLUS
	lda story_start + 1
	and #(255 - 1 - 4 - 8) ; colours, bold font, italic font
	ora #(16 + 128) ; Fixed-space style, timed input available
	sta story_start + 1
	lda story_start + $11
	and #(255 - 8 - 16 - 32 - 128) ; pictures, undo, mouse, sound effect not available
	sta story_start + $11
}
}
!ifdef Z4PLUS {
	lda #8
	sta story_start + $1e ; Interpreter number (8 = C64)
	lda #64
	sta story_start + $1f ; Interpreter number. Usually ASCII code for a capital letter (We use @ until the terp is ready for release)
	lda #25
	sta story_start + $20 ; Screen lines
	lda #40
	sta story_start + $21 ; Screen columns
}
!ifdef Z5PLUS {
	lda #>320
	sta story_start + $22 ; Screen width in units
	lda #<320
	sta story_start + $23 ; Screen width in units
	lda #>200
	sta story_start + $24 ; Screen height in units
	lda #<200
	sta story_start + $25 ; Screen height in units
	lda #8
	sta story_start + $26 ; Font width in units
	sta story_start + $27 ; Font height in units
	; TODO: Store default background and foreground color in 2c, 2d (or comply to game's wish?)
}
	lda #0
	sta story_start + $32 ; major standard revision number which this terp complies to
	sta story_start + $33 ; minor standard revision number which this terp complies to
	; Copy z_pc from header
	sta z_pc
	lda story_start + header_initial_pc
	sta z_pc + 1
	lda story_start + header_initial_pc + 1
	sta z_pc + 2

	; Setup globals pointer
	lda story_start + header_globals + 1
	clc
	adc #<(story_start - 32)
	sta z_global_vars_start
	lda story_start + header_globals
	adc #>(story_start - 32)
	sta z_global_vars_start + 1

	; Init sound
	lda #0
	ldx #$18
-	sta $d400,x
	dex
	bpl -
	lda #$f
	sta $d418
	lda #$00
	sta $d405
	lda #$f2
	sta $d406
	
	; Init randomization
	lda #$ff
	sta $d40e
	sta $d40f
	ldx #$80
	stx $d412
!ifdef BENCHMARK {
	ldy #1
	jmp z_rnd_init
} else {
	jmp z_rnd_init_random
}
}



!zone z_execute {

!ifdef Z4PLUS {
.return_from_interrupt
	lda #z_exe_mode_normal
	sta z_exe_mode
	; jsr read_routine_callback
	rts
}

z_execute

!ifdef DEBUG {
; Play high-pitched beep
;	lda #1
;	sta z_operand_value_low_arr
;	jsr z_ins_sound_effect
}

.main_loop

!ifdef Z4PLUS {
	lda z_exe_mode
	bne .return_from_interrupt
}

!ifdef TRACE {
	; Store z_pc to trace page 
	ldx #0
	ldy z_trace_index
-	lda z_pc,x
	sta z_trace_page,y
	iny
	inx
	cpx #3
	bne -
	sty z_trace_index
}

	+read_next_byte_at_z_pc
	sta z_opcode
	
!ifdef DEBUG {	
	;jsr print_following_string
	;!pet "opcode: ",0
	;ldx z_opcode
	;jsr printx
	;jsr print_following_string
	;!pet " @ ",0
	;ldx z_pc + 2
	;lda z_pc + 1
	;jsr printinteger
	;jsr newline
	;lda z_opcode
}
	lda #z_opcode_opcount_2op
	sta z_opcode_opcount ; This is the most common case. Adjust value when other case is found.
	lda z_opcode
	bit z_opcode
	bpl .top_bits_are_0x
	bvc .top_bits_are_10

	; Top bits are 11. Form = Variable
	tax
	and #%00011111
	sta z_opcode_number
	txa
	and #%00100000
	beq + ; This is a 2OP instruction, with up to 4 operands
	asl z_opcode_opcount ; Set to VAR
+	jmp .get_4_ops ; Always branch

.top_bits_are_10
!ifdef Z5PLUS {
	cmp #z_opcode_extended
	bne .short_form
	; Form = Extended
	lda #z_opcode_opcount_ext
	sta z_opcode_opcount ; Set to EXT
	+read_next_byte_at_z_pc
	sta z_extended_opcode
	sta z_opcode_number
	jmp .get_4_ops
}
.short_form
	; Form = Short
	and #%00001111
	sta z_opcode_number
	ldx #0
	stx z_operand_type_arr
	inx
	lda z_opcode
	asl
	asl
	asl
	rol z_operand_type_arr
	asl
	rol z_operand_type_arr
	lsr z_opcode_opcount ; Set to 1OP
	lda z_operand_type_arr
	cmp #%11
	bne +
	dex
	lda #z_opcode_opcount_0op 
	sta z_opcode_opcount ; Set to 0OP
+
	stx z_operand_count
	jmp .read_operands
	
.top_bits_are_0x
	; Form = Long
	asl
	sta zp_temp
	ldx #0
-	asl zp_temp
	lda #%10
	bcs +
	lda #%01
+	sta z_operand_type_arr,x
	inx
	cpx #2
	bne -
	stx z_operand_count
	dex
	lda z_opcode
	and #%00011111
	sta z_opcode_number
	jmp .read_operands

	; Get another byte of operand types
.get_4_more_ops
	ldy #8
	sty z_operand_count
	ldy #4
	ldx #4
	jsr z_get_op_types
	jmp .read_operands
	
.get_4_ops
	ldy #4
	sty z_operand_count
	ldx #0
	jsr z_get_op_types
	lda z_opcode
	cmp #z_opcode_call_vs2
	beq .get_4_more_ops
	cmp #z_opcode_call_vn2
	beq .get_4_more_ops

.read_operands
	ldy z_operand_count
	beq .op_is_omitted
	ldy #0
.read_next_operand
	lda z_operand_type_arr,y
	bne .operand_is_not_large_constant
	sty z_temp
	+read_next_byte_at_z_pc
	pha
	+read_next_byte_at_z_pc
	ldy z_temp
	tax
	pla
	jmp .store_operand
.operand_is_not_large_constant
;	cmp #%11
;	beq .op_is_omitted  ; Should no longer be needed!
	tax
	sty z_temp
	+read_next_byte_at_z_pc
	ldy z_temp
	cpx #%10
	beq .operand_is_var
	tax
	lda #0
	beq .store_operand ; Always branch
.operand_is_var
	tax
	jsr z_get_variable_value
.store_operand
	sta z_operand_value_high_arr,y
	txa
	sta z_operand_value_low_arr,y
	iny
	cpy z_operand_count
	bcc .read_next_operand
.op_is_omitted
	sty z_operand_count
	
.perform_instruction
	lda z_opcode_opcount
	clc
	adc z_opcode_number
	sta z_canonical_opcode
!ifdef TRACE {
	ldy z_trace_index
	sta z_trace_page,y
	inc z_trace_index
}
	cmp #z_number_of_opcodes_implemented
	bcs z_not_implemented
;.have_stored_canonical	

	tax 
	lda z_jump_low_arr,x
	sta .jsr_perform + 1
	lda z_jump_high_arr,x
	sta .jsr_perform + 2
.jsr_perform
	jsr $8000
	jmp .main_loop

z_not_implemented
!ifdef DEBUG {
	jsr print_following_string
	!pet "opcode: ",0
	ldx z_opcode
	jsr printx
	jsr print_following_string
	!pet " @ ",0
	ldx z_pc + 2
	lda z_pc + 1
	jsr printinteger
	jsr newline
}
    lda #ERROR_OPCODE_NOT_IMPLEMENTED
	jsr fatalerror
}

z_get_op_types
	; x = index of first operand (0 or 4), y = number of operands (1-4) 
!zone {
	sty z_temp
	+read_next_byte_at_z_pc
	sta z_temp + 1
	ldy z_temp
.get_next_op_type
	lda #0
	asl z_temp + 1
	rol
	asl z_temp + 1
	rol
	cmp #%11
	beq .done
	sta z_operand_type_arr,x
	inx
	dey
	bne .get_next_op_type
.done
	stx z_operand_count
	rts
}

; These instructions use variable references: inc,  dec,  inc_chk,  dec_chk,  store,  pull,  load

!zone {
z_get_variable_reference
	; input: Variable in x
	; output: Address is returned in a,x
	; affects registers: p
	sty zp_temp + 3
	cpx #0
	bne +
	; Find on stack
	jsr stack_get_ref_to_top_value
	ldy zp_temp + 3
	rts
+	txa
	cmp #16
	bcs .find_global_var
	; Local variable
	tay
	dey
	cpy z_local_var_count
	bcs .nonexistent_local
	asl
	clc
	adc z_local_vars_ptr
	tax
	lda z_local_vars_ptr + 1
	adc #0
	ldy zp_temp + 3
	rts
.find_global_var
	ldx #0
	stx zp_temp + 1
	asl
	rol zp_temp + 1
	clc
	adc z_global_vars_start
	tax
	lda zp_temp + 1
	adc z_global_vars_start + 1
	ldy zp_temp + 3
	rts

.nonexistent_local
    lda #ERROR_USED_NONEXISTENT_LOCAL_VAR
	jsr fatalerror
	
z_get_variable_value
	; Variable in x
	; Returns value in a,x
	sty zp_temp + 3
	cpx #0
	beq .read_from_stack
	txa
	cmp #16
	bcs .read_global_var
	; Local variable
	tay
	dey
	cpy z_local_var_count
	bcs .nonexistent_local
	asl
	tay
	iny
	lda (z_local_vars_ptr),y
	tax
	dey
	lda (z_local_vars_ptr),y
	ldy zp_temp + 3
	rts
.read_from_stack
	jsr stack_pull
	ldy zp_temp + 3
	rts
.read_global_var
	cmp #128
	bcs .read_high_global_var
z_get_low_global_variable_value
	; Read global var 0-111
	; input: a = variable# + 16 (16-127)
	asl
	tay
	iny
	lda (z_global_vars_start),y
	tax
	dey
	lda (z_global_vars_start),y
	ldy zp_temp + 3
	rts
.read_high_global_var
	inc z_global_vars_start + 1
	and #$7f ; Change variable# 128->0, 129->1 ... 255 -> 127
	asl
	tay
	iny
	lda (z_global_vars_start),y
	tax
	dey
	lda (z_global_vars_start),y
	dec z_global_vars_start + 1
	ldy zp_temp + 3
	rts
	
z_set_variable
	; Value in a,x
	; Variable in y
	; affects: a, x, y
	cpy #0
	beq .write_to_stack
	sta zp_temp + 2
	stx zp_temp + 3
	tya
	cmp #16
	bcs .write_global_var
	; Local variable
	tay
	dey
	cpy z_local_var_count
	bcs .nonexistent_local
	asl
	tay
	lda zp_temp + 2
	sta (z_local_vars_ptr),y
	iny
	lda zp_temp + 3
	sta (z_local_vars_ptr),y
	rts
.write_to_stack
	jsr stack_push
	rts
.write_global_var
	cmp #128
	bcs .write_high_global_var
	asl
	tay
	lda zp_temp + 2
	sta (z_global_vars_start),y
	iny
	lda zp_temp + 3
	sta (z_global_vars_start),y
	rts
.write_high_global_var
	inc z_global_vars_start + 1
	and #$7f ; Change variable# 128->0, 129->1 ... 255 -> 127
	asl
	tay
	lda zp_temp + 2
	sta (z_global_vars_start),y
	iny
	lda zp_temp + 3
	sta (z_global_vars_start),y
	dec z_global_vars_start + 1
	rts
}

!zone {
check_for_routine_0
	; If value in argument 0 is 0, set status flag Z to 1 and return 
	lda z_operand_value_high_arr
	ora z_operand_value_low_arr
	rts
check_for_routine_0_and_store
	; If value in argument 0 is 0, store 0 in the variable in byte at Z_PC, then set status flag Z to 1 and return 
	jsr check_for_routine_0
	bne .not_0
	lda #0
	tax
	jsr z_store_result
	lda #0
.not_0
	rts
}

!zone {
}

!zone {
z_store_result
	; input: a,x hold result
	; affected: a,x,y
+	pha
	+read_next_byte_at_z_pc
	tay
	pla
	jmp z_set_variable
}

!zone z_division {
z_divide
	; input: Dividend in arg 0, divisor in arg 1, y = signed? 0 = unsigned, $ff = signed
	; output: result in division_result (low byte, high byte)
	cpy #0
	beq .div_unsigned
	lda z_operand_value_high_arr
	eor z_operand_value_high_arr + 1
	sta zp_temp + 2 ; Top bit: 1 = Result is negative, other bits must be ignored
	; Get 2-complement of dividend, if negative
	lda z_operand_value_low_arr
	bit z_operand_value_high_arr
	bpl +
	; It's negative!
	eor #$ff
	clc
	adc #1
	tax
	lda z_operand_value_high_arr
	eor #$ff
	adc #0
	jmp ++
.div_unsigned
	sty zp_temp + 2 ; Top bit: 1 = Result is negative, other bits must be ignored
	lda z_operand_value_low_arr
+	tax
	lda z_operand_value_high_arr
++	stx dividend
	sta dividend + 1
	; Get 2-complement of divisor, if negative
	lda z_operand_value_low_arr + 1
	cpy #0
	beq + ; Unsigned div, no sign inveversion
	bit z_operand_value_high_arr + 1
	bpl +
	; It's negative!
	eor #$ff
	clc
	adc #1
	tax
	lda z_operand_value_high_arr + 1
	eor #$ff
	adc #0
	jmp ++
+	tax
	lda z_operand_value_high_arr + 1
++	stx divisor
	sta divisor + 1
	; Perform the division
	jsr divide16
	; Reverse sign if applicable. 
	bit zp_temp + 2
	bpl +
	; Inverse sign of result
	lda division_result
	eor #$ff
	clc
	adc #1
	sta division_result
	lda division_result + 1
	eor #$ff
	adc #0
	sta division_result + 1
+	rts
}

!zone {
calc_address_in_byte_array
	; output: If address is in dynmem, y = 0 and address is in (zp_temp). Otherwise, y = 1 and address is in .addr
	; y value is loaded last, so beq/bne can be used to check y value
	lda z_operand_value_low_arr
	clc
	adc z_operand_value_low_arr + 1
	tax
	lda z_operand_value_high_arr
	adc z_operand_value_high_arr + 1
	tay
	cpx story_start + header_static_mem + 1
	sbc story_start + header_static_mem
	tya
	bcc .is_in_dynmem
	jsr set_z_address
	ldy #1
	rts
.is_in_dynmem	
	stx zp_temp
	adc #>story_start ; Carry is already clear
	sta zp_temp + 1
	ldy #0
	rts
}

!zone rnd {
z_rnd_init_random
	; in: Nothing
	lda $dc04
	eor #%10101010
	eor z_rnd_a
	tay
	lda $dc05
	eor #%01010101
	eor z_rnd_b
	tax
	lda $d41b
	eor $d012
	eor z_rnd_c
z_rnd_init
	; in: a,x,y as seed
	sta z_rnd_a
	stx z_rnd_b
	sty z_rnd_c
	eor #$ff
	sta z_rnd_x
z_rnd_number
	inc z_rnd_x
	lda z_rnd_x
	eor z_rnd_c
	eor z_rnd_a
	sta z_rnd_a
	clc
	adc z_rnd_b
	sta z_rnd_b
	lsr
	eor z_rnd_a
	clc
	adc z_rnd_c
	sta z_rnd_c
	rts
}

!zone z_instructions {
; 0OP instructions
z_ins_rtrue
	lda #0
	ldx #1
	jmp stack_return_from_routine

z_ins_rfalse
	lda #0
	tax
	jmp stack_return_from_routine

; z_ins_print (moved to text.asm)

; z_ins_print_ret (moved to text.asm)

; z_ins_nop is part of 1OP z_ins_inc

; z_ins_catch (moved to stack.asm)

z_ins_quit
	jmp kernel_reset

z_ins_ret_popped
	jsr stack_pull
	jmp stack_return_from_routine
	
;z_ins_pop
;	jmp stack_pull
	
; z_ins_new_line (moved to text.asm)

; z_ins_show_status (moved to screen.asm)

; z_ins_verify has no implementation, jump table points to make_branch_true instead.

; z_ins_extended needs no implementation

; z_ins_piracy jumps directly to make_branch_true

; 1OP instructions

; z_ins_jz placed later to allow relative jumps

; z_ins_get_sibling (moved to objecttable.asm)

; z_ins_get_child (moved to objecttable.asm)

; z_ins_get_parent (moved to objecttable.asm)

; z_ins_get_prop_len (moved to objecttable.asm)

z_ins_inc
	ldx z_operand_value_low_arr
	jsr z_get_variable_reference
.inc_store_ref	
	stx .ins_inc + 1
	sta .ins_inc + 2
	ldx #1
.ins_inc
	inc $0400,x
	bne +
	dex
	bpl .ins_inc
z_ins_nop
+	rts	
	
z_ins_dec
	ldx z_operand_value_low_arr
	jsr z_get_variable_reference
.dec_store_ref
	stx .ins_dec + 1
	sta .ins_dec + 2
	stx .ins_dec + 4
	sta .ins_dec + 5
	ldx #1
.ins_dec
	dec $0400,x
	lda $0400,x
	cmp #$ff
	bne +
	dex
	bpl .ins_dec
+	rts
	
; z_ins_print_addr (moved to text.asm)
	
; z_ins_remove_obj (moved to objecttable.asm)

; z_ins_print_obj (moved to objecttable.asm)

z_ins_ret
	lda z_operand_value_high_arr
	ldx z_operand_value_low_arr
	jmp stack_return_from_routine

z_ins_jump
	lda #0
	bit z_operand_value_high_arr
	bpl +
	lda #$ff
+	sta zp_temp
	lda z_operand_value_high_arr
	sta zp_temp + 1
	lda z_operand_value_low_arr
	sta zp_temp + 2
	jmp z_jump_to_offset_in_zp_temp

; z_ins_print_paddr (moved to text.asm)

z_ins_load
	ldx z_operand_value_low_arr
	jsr z_get_variable_reference
	stx zp_temp
	sta zp_temp + 1
	ldy #1
	lda (zp_temp),y
	tax
	dey
	lda (zp_temp),y
	jmp z_store_result

z_ins_not
	lda z_operand_value_low_arr
	eor #$ff
	tax
	lda z_operand_value_high_arr
	eor #$ff
	jmp z_store_result

; z_ins_jz moved to after z_ins_jl to allow relative branching	

; 2OP instructions
	
z_ins_jl
	lda z_operand_value_low_arr
.jl_comp
	cmp z_operand_value_low_arr + 1
	lda z_operand_value_high_arr
	sbc z_operand_value_high_arr + 1
	bvc +
	eor #$80
+	bpl make_branch_false
	jmp make_branch_true

z_ins_jz
	lda z_operand_value_low_arr
	ora z_operand_value_high_arr
	bne make_branch_false
	jmp make_branch_true
	
z_ins_inc_chk
	ldx z_operand_value_low_arr
	jsr z_get_variable_reference
	stx zp_temp
	sta zp_temp + 1
	jsr .inc_store_ref
	ldy #0
	lda (zp_temp),y
	sta z_operand_value_high_arr
	iny
	lda (zp_temp),y
	sta z_operand_value_low_arr
z_ins_jg
	lda z_operand_value_low_arr + 1
	cmp z_operand_value_low_arr
	lda z_operand_value_high_arr + 1
	sbc z_operand_value_high_arr
	bvc +
	eor #$80
+	bmi make_branch_true
	bpl make_branch_false ; Always branch

z_ins_dec_chk
	ldx z_operand_value_low_arr
	jsr z_get_variable_reference
	stx zp_temp
	sta zp_temp + 1
	jsr .dec_store_ref
	ldy #0
	lda (zp_temp),y
	sta z_operand_value_high_arr
	iny
	lda (zp_temp),y
	jmp .jl_comp

z_ins_je
	ldx z_operand_count
	dex
-	lda z_operand_value_low_arr
	cmp z_operand_value_low_arr,x
	bne .je_try_next
	lda z_operand_value_high_arr
	cmp z_operand_value_high_arr,x
	beq make_branch_true
.je_try_next
	dex
	bne -
make_branch_false
	+read_next_byte_at_z_pc
	sta zp_temp + 1
	bit zp_temp + 1
	bvs +
	+read_next_byte_at_z_pc
	sta zp_temp + 2
	bit zp_temp + 1
+	bpl .choose_jumptype
-	rts
make_branch_true
	+read_next_byte_at_z_pc
	sta zp_temp + 1
	bit zp_temp + 1
	bvs +
	+read_next_byte_at_z_pc
	sta zp_temp + 2
	bit zp_temp + 1
+	bpl -
.choose_jumptype
	; We have decided to jump
	bvc .two_byte_jump
	; This is a single byte jump
	lda zp_temp + 1
	and #%00111111
	sta zp_temp + 2
	cmp #2
	bcs .jump_to_single_byte_offset
	; Return value (true or false)
	tax
.return_x
	lda #0
	jmp stack_return_from_routine
.jump_to_single_byte_offset
	lda z_pc + 2
	clc
	adc zp_temp + 2
	tax
	ldy z_pc + 1
	lda z_pc
	bcc +
	inc z_pc_mempointer_is_unsafe
	iny
	bne +
	clc
	adc #1
	; Subtract 2
+	pha
	txa
	sec
	sbc #2
	sta z_pc + 2
	tya
	sbc #0
	sta z_pc + 1
	pla
	sbc #0
	sta z_pc
.done
	rts
.two_byte_jump
	lda zp_temp + 1
	and #%00111111
	tax
	and #%00100000
	beq +
	; Propagate minus bit
	txa
	ora #%11000000
	sta zp_temp + 1
	lda #$ff
	sta zp_temp
	bne .two_byte_check_return ; Always branch
+	txa
	sta zp_temp + 1
	lda #0
	sta zp_temp
.two_byte_check_return
	ldx zp_temp + 2
	cpx #2
	bcs z_jump_to_offset_in_zp_temp
	lda zp_temp
	ora zp_temp + 1
	beq .return_x
z_jump_to_offset_in_zp_temp
	lda z_pc + 2
	clc
	adc zp_temp + 2
	tax
	lda z_pc + 1
	adc zp_temp + 1
	tay
	lda z_pc
	adc zp_temp
	pha
	txa
	sec
	sbc #2
	sta z_pc + 2
	tya
	sbc #0
	tay
	pla
	sbc #0
	sta z_pc
	cpy z_pc + 1
	beq +
	inc z_pc_mempointer_is_unsafe
+	sty z_pc + 1
	rts

; z_ins_jin (moved to objecttable.asm)

z_ins_test
	lda z_operand_value_low_arr
	and z_operand_value_low_arr + 1
	cmp z_operand_value_low_arr + 1
	bne .test_branch_false
	lda z_operand_value_high_arr
	and z_operand_value_high_arr + 1
	cmp z_operand_value_high_arr + 1
	bne .test_branch_false
	jmp make_branch_true
.test_branch_false
	jmp make_branch_false
	
z_ins_or
	lda z_operand_value_low_arr
	ora z_operand_value_low_arr + 1
	tax
	lda z_operand_value_high_arr
	ora z_operand_value_high_arr + 1
	jmp z_store_result

z_ins_and
	lda z_operand_value_low_arr
	and z_operand_value_low_arr + 1
	tax
	lda z_operand_value_high_arr
	and z_operand_value_high_arr + 1
	jmp z_store_result

; z_ins_test_attr (moved to objecttable.asm)

; z_ins_set_attr (moved to objecttable.asm)
	
; z_ins_clear_attr (moved to objecttable.asm)
	
z_ins_store
	ldx z_operand_value_low_arr
	jsr z_get_variable_reference
	stx zp_temp
	sta zp_temp + 1
	ldy #0
	lda z_operand_value_high_arr + 1
	sta (zp_temp),y
	iny
	lda z_operand_value_low_arr + 1
	sta (zp_temp),y
	rts

; z_ins_insert_obj (moved to objecttable.asm)
	
z_ins_loadw_and_storew
	asl z_operand_value_low_arr + 1 
	rol z_operand_value_high_arr + 1
	lda z_operand_value_low_arr
	clc
	adc z_operand_value_low_arr + 1
	sta zp_temp
	tax
	lda z_operand_value_high_arr
	adc z_operand_value_high_arr + 1
	sta zp_temp + 1
	ldy #1
	lda z_opcode_number
	cmp #15 ; Code for loadw
	bne .storew
	; Check if address is in dynamic memory
	cpx story_start + header_static_mem + 1
	lda zp_temp + 1
	sbc story_start + header_static_mem
	bcc .word_read_in_dynmem
; !ifdef DEBUG {
	; ; Check that address is in z-machine memory
	; ; THIS CHECK IS ALL WRONG! Need to compute end of file address to compare to!
	; cpx story_start + header_high_mem + 1
	; lda zp_temp + 1
	; sbc story_start + header_high_mem
	; bcs .read_above_statmem
; }
	; Address is in static memory
	lda zp_temp + 1
	jsr set_z_address
	jsr read_next_byte
	pha
	jsr read_next_byte
	tax
	pla
	jmp z_store_result
.word_read_in_dynmem
	lda zp_temp +1
	adc #>story_start
	sta zp_temp + 1
	lda (zp_temp),y
	tax
	dey
	lda (zp_temp),y
	jmp z_store_result
.storew
!ifdef DEBUG {
	; Check that address is in dynamic memory
	cpx story_start + header_static_mem + 1
	lda zp_temp + 1
	sbc story_start + header_static_mem
	bcs .write_outside_dynmem
}
	; Ok, write is within dynmem
	lda zp_temp + 1
	adc #>story_start ; Carry is already clear
	sta zp_temp + 1
	lda z_operand_value_low_arr + 2
	sta (zp_temp),y
	dey
	lda z_operand_value_high_arr + 2
	sta (zp_temp),y
	rts
!ifdef DEBUG {
.write_outside_dynmem
	lda #ERROR_WRITE_ABOVE_DYNMEM
	jsr fatalerror
; .read_above_statmem
	; lda #ERROR_READ_ABOVE_STATMEM
	; jsr fatalerror
}
	
z_ins_loadb
	jsr calc_address_in_byte_array
	bne + ; Z = 0 if address is in statmem
	lda (zp_temp),y
	tax
	tya
	jmp z_store_result
+	jsr read_next_byte
	tax
	lda #0
	jmp z_store_result

; VAR instruction, moved here to allow relative jump to error	
z_ins_storeb
	jsr calc_address_in_byte_array
!ifdef DEBUG {
	bne .write_outside_dynmem
}
	lda z_operand_value_low_arr + 2
	sta (zp_temp),y
	rts

; z_ins_get_prop (moved to objecttable.asm)
	
; z_ins_get_prop_addr (moved to objecttable.asm)

; z_ins_get_next_prop (moved to objecttable.asm)

z_ins_add
	lda z_operand_value_low_arr
	clc
	adc z_operand_value_low_arr + 1
	tax
	lda z_operand_value_high_arr
	adc z_operand_value_high_arr + 1
	jmp z_store_result

z_ins_sub
	lda z_operand_value_low_arr
	sec
	sbc z_operand_value_low_arr + 1
	tax
	lda z_operand_value_high_arr
	sbc z_operand_value_high_arr + 1
	jmp z_store_result

.mul_product = memory_buffer ; 5 bytes (4 for product + 1 for last bit)
.mul_inv_multiplicand = memory_buffer + 5 ; 2 bytes

z_ins_mul
	lda #0
	ldy #16
	sta .mul_product
	sta .mul_product + 1
	sta .mul_product + 4
	lda z_operand_value_high_arr
	sta .mul_product + 2
	lda z_operand_value_low_arr
	sta .mul_product + 3
	lda z_operand_value_low_arr + 1
	eor #$ff
	clc
	adc #1
	sta .mul_inv_multiplicand + 1
	lda z_operand_value_high_arr + 1
	eor #$ff
	adc #0
	sta .mul_inv_multiplicand
	; Perform multiplication
.mul_next_iteration
	lda .mul_product + 3
	and #1
	beq .mul_bottom_is_0
	; Bottom bit is 1
	bit .mul_product + 4
	bmi .mul_do_nothing
	; Subtract
	lda .mul_product + 1
	clc
	adc .mul_inv_multiplicand + 1
	sta .mul_product + 1
	lda .mul_product
	adc .mul_inv_multiplicand
	sta .mul_product
	jmp .mul_do_nothing
.mul_bottom_is_0
	; Bottom bit is 0
	bit .mul_product + 4
	bpl .mul_do_nothing
	; Add
	lda .mul_product + 1
	clc
	adc z_operand_value_low_arr + 1
	sta .mul_product + 1
	lda .mul_product
	adc z_operand_value_high_arr + 1
	sta .mul_product
.mul_do_nothing
	clc
	bit .mul_product
	bpl +
	sec
+	ror .mul_product
	ror .mul_product + 1
	ror .mul_product + 2
	ror .mul_product + 3
	ror .mul_product + 4
	dey
	bne .mul_next_iteration
	lda .mul_product + 2
	ldx .mul_product + 3
	jmp z_store_result

z_ins_div
	ldy #$ff
	jsr z_divide
	lda division_result + 1
	ldx division_result
	jmp z_store_result
	
z_ins_mod
	ldy #$ff
	jsr z_divide
	lda remainder
	bit z_operand_value_high_arr
	bmi +
	tax
	lda remainder  + 1
	jmp z_store_result
+	eor #$ff
	clc
	adc #1
	tax
	lda remainder + 1
	eor #$ff
	adc #0
	jmp z_store_result
	
z_ins_call_xn
	jsr check_for_routine_0
	bne +
	rts
+	ldx z_operand_count
	dex
	ldy #0 ; Don't store result
	tya ; Normal call mode
	jmp stack_call_routine

; z_ins_throw (moved to stack.asm)

	
; VAR instructions
	
z_ins_call_xs
	jsr check_for_routine_0_and_store
	bne +
	rts
+	ldx z_operand_count
	dex
	ldy #1 ; Store result = 1
	lda #z_exe_mode_normal
	jmp stack_call_routine

; VAR storew is implemented in z_ins_loadw_and_storew, under 2OP	

; VAR storeb was moved to 2OP area, to allow for relative jump for error.
	
; z_ins_put_prop (moved to objecttable.asm)
	
; z_ins_sread / z_ins_aread (moved to text.asm)

; z_ins_print_char (moved to text.asm)

z_ins_print_num
	lda z_operand_value_high_arr
	bpl print_num_unsigned 
	ldx z_operand_value_low_arr
	tay
	lda #$2d
	jsr streams_print_output
	txa
	eor #$ff
	clc
	adc #1
	sta z_operand_value_low_arr
	tya
	eor #$ff
	adc #0
	sta z_operand_value_high_arr
print_num_unsigned
	; Sign has been printed, if any. Now print number (0 to 32768)
	lda #10
	sta z_operand_value_low_arr + 1
	lda #0
	sta z_operand_value_high_arr + 1
	; Divide by 10 up to four times
	ldy #0
	sty zp_temp
-	lda z_operand_value_low_arr
	cmp #10
	bcs +
	tax
	lda z_operand_value_high_arr
	beq .done_dividing
+	ldy #0
	jsr z_divide
	lda remainder
	ldy zp_temp
	sta z_temp,y
	inc zp_temp
	lda division_result
	sta z_operand_value_low_arr
	lda division_result + 1
	sta z_operand_value_high_arr
	jmp -
.done_dividing
	ldy zp_temp
	txa
	sta z_temp,y
-	lda z_temp,y
	clc
	adc #$30
	jsr streams_print_output
	dey
	bpl -
z_ins_set_true_colour
	rts

z_ins_random	
	lda z_operand_value_high_arr
	beq .random_highbyte_empty
	bpl .random_wordsize
	jmp .random_seed
.random_highbyte_empty
+	lda z_operand_value_low_arr
	bne .random_wordsize
	jmp	.random_seed_0
.random_bytesize
	ldy #1
	sty zp_temp + 2 ; mask
-	lda zp_temp + 2
	cmp z_operand_value_low_arr
	bcs .random_bytesize_found_mask
	sec
	rol zp_temp + 2
	bcc - ; Branch unless the mask is now > $ff (which can't happen)
.random_bytesize_found_mask
-	jsr z_rnd_number
	and zp_temp + 2
	cmp z_operand_value_low_arr
	bcs -
	tax
	inx

!ifdef DEBUG {
	ldy z_test
	beq .rnd_store_bytesize
	stx z_temp + 1
	lda #0
	jsr printinteger
	jsr space
	ldx z_temp + 1
	ldy z_test
	cpy #z_test_mode_print
	bne .rnd_store_bytesize
	rts
.rnd_store_bytesize
}

	jmp z_store_result

.random_wordsize	
	ldy #1
	sty zp_temp + 2 ; lowbyte of mask
	dey
	sty zp_temp + 3 ; highbyte of mask
-	lda zp_temp + 2
	cmp z_operand_value_low_arr
	lda zp_temp + 3
	sbc z_operand_value_high_arr
	bcs .random_found_mask
	sec
	rol zp_temp + 2
	rol zp_temp + 3
	bcc - ; Branch unless the mask is now > $ffff (which can't happen)
.random_found_mask
-	jsr z_rnd_number
	and zp_temp + 3
	tay
	jsr z_rnd_number
	and zp_temp + 2
	tax
	cmp z_operand_value_low_arr
	tya
	sbc z_operand_value_high_arr
	bcs -
; .rnd_store_good_rnd_number
	tya
	inx
	bne +
	adc #1 ; Carry is always clear here, no need for clc
+

!ifdef DEBUG {
	ldy z_test
	beq .rnd_store
	sta z_temp
	stx z_temp + 1
	jsr printinteger
	jsr space
	lda z_temp
	ldx z_temp + 1
	ldy z_test
	cpy #z_test_mode_print
	bne .rnd_store
	rts
.rnd_store
}

	jmp z_store_result

.random_seed_0
!ifndef BENCHMARK {
!ifdef DEBUG {
	ldy z_test
	beq +
	jsr print_following_string
	!pet "seed 0!",13,0
+	
}
	jsr z_rnd_init_random
	lda #0
	sta z_rnd_mode
	beq .rnd_tax_and_return ; Always branch
}
.random_seed

!ifdef DEBUG {
	ldy z_test
	beq +
	tax
	jsr print_following_string
	!pet "seed -1!",13,0
	txa
+
}	

	tay
	ldx z_operand_value_low_arr
	clc
	adc #%10101010
	jsr z_rnd_init
	lda #1 ; Predictable sequence
	sta z_rnd_mode
	lda #0
.rnd_tax_and_return
	tax

!ifdef DEBUG {
	ldy z_test
	cpy #z_test_mode_print
	bne .rnd_store_seed
	rts
.rnd_store_seed
}

	jmp z_store_result

; z_ins_push moved to stack.asm
	
; z_ins_pull moved to stack.asm

; z_ins_split_window moved to screen.asm

; z_ins_set_window moved to screen.asm

; z_ins_erase_window moved to screen.asm

; z_ins_erase_line moved to screen.asm

; z_ins_set_cursor moved to screen.asm

; z_ins_get_cursor moved to screen.asm

; z_ins_buffer_mode moved to screen.asm

; z_ins_set_text_style moved to screen.asm
	
; z_ins_output_stream jumps directly to streams_output_stream.

z_ins_sound_effect
	lda #$08
	ldx z_operand_value_low_arr
	dex
	beq .sound_high_pitched_beep
	dex
	beq .sound_low_pitched_beep
	rts
.sound_high_pitched_beep
	lda #$40
.sound_low_pitched_beep
	sta $d401
	lda #$21
	sta $d404
	ldy #40
--	ldx #0
-	dex
	bne -
	dey
	bne --
	lda #$20
	sta $d404
	rts

!ifdef Z4PLUS {
z_ins_scan_table
	lda z_operand_count
	cmp #4
	bcs +
	lda #$82
	bne ++
+	lda z_operand_value_low_arr + 3
++	sta zp_temp ; form (bit 7 = 1 means words, 0 means bytes)
	and #$7f
	sta zp_temp + 1 ; entry length (1-127)
	lda z_operand_value_low_arr + 1
	sta zp_temp + 2 ; Lowbyte of table address
	lda z_operand_value_high_arr + 1
	sta zp_temp + 3 ; Highbyte of table address
.scan_next	
	lda z_operand_value_high_arr + 2
	ora z_operand_value_low_arr + 2
	beq .scan_table_false
	ldy #0
	lda (zp_temp + 2),y
	bit zp_temp
	bmi .scan_word_compare
	; Byte compare
	cmp z_operand_value_low_arr
	bne .scan_not_a_match
	lda z_operand_value_high_arr
	bne .scan_not_a_match
	beq .scan_is_a_match ; Always branch
.scan_word_compare
	cmp z_operand_value_high_arr
	bne .scan_not_a_match
	iny
	lda (zp_temp + 2),y
	cmp z_operand_value_low_arr
	bne .scan_not_a_match
	beq .scan_is_a_match ; Always branch
.scan_not_a_match
	; Move to next address in table
	lda zp_temp + 2
	clc
	adc zp_temp + 1
	sta zp_temp + 2
	lda zp_temp + 3
	adc #0
	sta zp_temp + 3
	; Decrease number of entries left
	dec z_operand_value_low_arr + 2
	ldy z_operand_value_low_arr + 2
	cpy #$ff
	bne .scan_next
	dec z_operand_value_high_arr + 2
	jmp .scan_next
.scan_table_false
	lda #0
	tax
	jsr z_store_result
	jmp make_branch_false
.scan_is_a_match
	lda zp_temp + 2
	ldx zp_temp + 3
	jsr z_store_result
	jmp make_branch_true
}

; z_ins_read_char moved to text.asm	

; z_ins_tokenise_text moved to text.asm

; z_ins_encode_text moved to text.asm

; z_ins_print_table moved to screen.asm

; z_ins_check_arg_count moved to stack.asm	
	
; EXT instructions

!ifdef Z5PLUS {
z_ins_log_shift
	lda z_operand_value_high_arr + 1
	ora z_operand_value_low_arr + 1
	beq .shift_store
	bit z_operand_value_high_arr + 1
	bpl .left_shift
-	lsr z_operand_value_high_arr
	ror z_operand_value_low_arr
	inc z_operand_value_low_arr + 1
	bne -
	beq .shift_store ; Always branch
.left_shift
	asl z_operand_value_low_arr
	rol z_operand_value_high_arr
	dec z_operand_value_low_arr + 1
	bne .left_shift
.shift_store
	ldx z_operand_value_low_arr
	lda z_operand_value_high_arr
	jmp z_store_result

z_ins_art_shift
	lda z_operand_value_high_arr + 1
	ora z_operand_value_low_arr + 1
	beq .shift_store
	bit z_operand_value_high_arr + 1
	bpl .left_shift
-	clc
	bit z_operand_value_high_arr
	bpl +
	sec
+	ror z_operand_value_high_arr
	ror z_operand_value_low_arr
	inc z_operand_value_low_arr + 1
	bne -
	beq .shift_store ; Always branch

z_ins_set_font
	ldy z_window
	lda z_operand_value_low_arr
	beq .set_font_check_status
	cmp #1
	beq .set_font_do
	cmp #4
	beq .set_font_do
	; Font is unavailable
	lda #0
	tax
	jmp z_store_result
.set_font_do
	ldx z_font,y
	sta z_font,y
	lda #0
	jmp z_store_result
.set_font_check_status	
	ldx z_font,y ; a is already 0
	jmp z_store_result

z_ins_save_restore_undo
	; Return -1 to indicate that this is not supported
	ldx #$ff
	txa
	jmp z_store_result
}

; z_ins_set_true_colour placed at end of VAR z_ins_print_num
	
	
}


	
	
