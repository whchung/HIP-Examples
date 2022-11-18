	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
	.protected	_Z15vectoradd_floatPKfS0_Pf ; -- Begin function _Z15vectoradd_floatPKfS0_Pf
	.globl	_Z15vectoradd_floatPKfS0_Pf
	.p2align	8
	.type	_Z15vectoradd_floatPKfS0_Pf,@function
_Z15vectoradd_floatPKfS0_Pf:            ; @_Z15vectoradd_floatPKfS0_Pf
; %bb.0:                                ; %entry
	v_bfe_u32 v1, v0, 10, 10
	s_lshl_b32 s0, s12, 8
	v_add_lshl_u32 v1, s13, v1, 10
	v_and_b32_e32 v0, 0x3ff, v0
	v_add3_u32 v0, s0, v0, v1
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[0:1], 2, v[0:1]
	v_mov_b32_e32 v3, s5
	v_add_co_u32_e32 v2, vcc, s4, v0
	v_addc_co_u32_e32 v3, vcc, v3, v1, vcc
	global_load_dword v4, v[2:3], off
	v_mov_b32_e32 v3, s7
	v_add_co_u32_e32 v2, vcc, s6, v0
	v_addc_co_u32_e32 v3, vcc, v3, v1, vcc
	global_load_dword v2, v[2:3], off
	v_mov_b32_e32 v3, s9
	v_add_co_u32_e32 v0, vcc, s8, v0
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc
	s_waitcnt vmcnt(0)
	v_add_f32_e32 v2, v4, v2
	global_store_dword v[0:1], v2, off
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6, 0x0
	.amdhsa_kernel _Z15vectoradd_floatPKfS0_Pf
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 24
		.amdhsa_user_sgpr_count 12
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 1
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 1
		.amdhsa_next_free_vgpr 5
		.amdhsa_next_free_sgpr 14
		.amdhsa_accum_offset 8
		.amdhsa_reserve_flat_scratch 0
		.amdhsa_reserve_xnack_mask 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end0:
	.size	_Z15vectoradd_floatPKfS0_Pf, .Lfunc_end0-_Z15vectoradd_floatPKfS0_Pf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 120
; NumSgprs: 16
; NumVgprs: 5
; NumAgprs: 0
; TotalNumVgprs: 5
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 16
; NumVGPRsForWavesPerEU: 5
; AccumOffset: 8
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 12
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 1
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 1
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.ident	"clang version 16.0.0 (git@github.com:whchung/llvm-project e56da57604341f40d4fd30459d34dc60ca001c27)"
	.ident	"AMD clang version 14.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.2.0 22204 50d6d5d5b608d2abd6af44314abc6ad20036af3b)"
	.section	".note.GNU-stack"
	.addrsig
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .access:         read_only
        .address_space:  global
        .name:           a.coerce
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .access:         read_only
        .address_space:  global
        .name:           b.coerce
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .name:           c.coerce
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 24
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z15vectoradd_floatPKfS0_Pf
    .private_segment_fixed_size: 0
    .sgpr_count:     16
    .sgpr_spill_count: 0
    .symbol:         _Z15vectoradd_floatPKfS0_Pf.kd
    .vgpr_count:     5
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx90a
amdhsa.version:
  - 1
  - 1
...

	.end_amdgpu_metadata
