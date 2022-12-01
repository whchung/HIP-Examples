	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx900"
	.protected	_Z15vectorset_floatPKfS0_Pf ; -- Begin function _Z15vectorset_floatPKfS0_Pf
	.globl	_Z15vectorset_floatPKfS0_Pf
	.p2align	8
	.type	_Z15vectorset_floatPKfS0_Pf,@function
_Z15vectorset_floatPKfS0_Pf:            ; @_Z15vectorset_floatPKfS0_Pf
; %bb.0:
	s_load_dwordx2 s[0:1], s[4:5], 0x0
	s_load_dwordx2 s[2:3], s[4:5], 0x8
	s_load_dwordx2 s[6:7], s[4:5], 0x10
	v_lshl_add_u32 v0, v1, 6, v0
	v_lshlrev_b32_e32 v1, 2, v0
	v_cmp_gt_u32_e32 vcc, 32, v0
	s_waitcnt lgkmcnt(0)

        ; mask is a 64-bit value on VCC
        ; save EXEC mask to s[4:5], set EXEC mask from VCC
        s_and_saveexec_b64 s[4:5], vcc

        ; EXEC mask is set, do masked operations
        ; workitems with EXEC mask bit set to 0 will become no-op
	global_load_dword v2, v1, s[0:1]
	global_load_dword v3, v1, s[2:3]
	s_waitcnt vmcnt(0)
	v_add_f32_e32 v2, v2, v3
	v_add_f32_e32 v3, v2, v2
	v_cndmask_b32_e32 v0, v3, v2, vcc

        ; restore EXEC mask from s[4:5], save EXEC mask to s[4:5]
        s_or_saveexec_b64 s[4:5], s[4:5]

	global_store_dword v1, v0, s[6:7]
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z15vectorset_floatPKfS0_Pf
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 80
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 1
		.amdhsa_next_free_vgpr 4
		.amdhsa_next_free_sgpr 8
		.amdhsa_reserve_flat_scratch 0
		.amdhsa_reserve_xnack_mask 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
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
	.size	_Z15vectorset_floatPKfS0_Pf, .Lfunc_end0-_Z15vectorset_floatPKfS0_Pf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 88
; NumSgprs: 10
; NumVgprs: 4
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 10
; NumVGPRsForWavesPerEU: 4
; Occupancy: 10
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 1
	.ident	"AMD clang version 14.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.0.0 22051 235b6880e2e515507478181ec11a20c1ec87945b)"
	.section	".note.GNU-stack"
	.addrsig
	.amdgpu_metadata
---
amdhsa.kernels:
  - .args:
      - .access:         read_only
        .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .access:         read_only
        .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         16
        .size:           8
        .value_kind:     global_buffer
      - .offset:         24
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         32
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         40
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .address_space:  global
        .offset:         48
        .size:           8
        .value_kind:     hidden_none
      - .address_space:  global
        .offset:         56
        .size:           8
        .value_kind:     hidden_none
      - .address_space:  global
        .offset:         64
        .size:           8
        .value_kind:     hidden_none
      - .address_space:  global
        .offset:         72
        .size:           8
        .value_kind:     hidden_multigrid_sync_arg
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 80
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z15vectorset_floatPKfS0_Pf
    .private_segment_fixed_size: 0
    .sgpr_count:     10
    .sgpr_spill_count: 0
    .symbol:         _Z15vectorset_floatPKfS0_Pf.kd
    .vgpr_count:     4
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx900
amdhsa.version:
  - 1
  - 1
...

	.end_amdgpu_metadata
