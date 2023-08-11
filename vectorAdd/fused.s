	.amdgcn_target "amdgcn-amd-amdhsa--gfx90a:xnack-"
	.text
	.p2align	2
	.type	_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv,@function
_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_or_saveexec_b64 s[4:5], -1
	buffer_store_dword v40, off, s[0:3], s32
	s_mov_b64 exec, s[4:5]
	v_writelane_b32 v40, s33, 31
	s_mov_b32 s33, s32
	v_writelane_b32 v40, s34, 0
	s_addk_i32 s32, 0x400
	v_writelane_b32 v40, s35, 1
	v_writelane_b32 v40, s36, 2
	v_writelane_b32 v40, s37, 3
	v_writelane_b32 v40, s38, 4
	v_writelane_b32 v40, s39, 5
	v_writelane_b32 v40, s40, 6
	v_writelane_b32 v40, s41, 7
	v_writelane_b32 v40, s42, 8
	v_writelane_b32 v40, s43, 9
	v_writelane_b32 v40, s44, 10
	v_writelane_b32 v40, s45, 11
	v_writelane_b32 v40, s46, 12
	v_writelane_b32 v40, s47, 13
	v_writelane_b32 v40, s48, 14
	v_writelane_b32 v40, s49, 15
	v_writelane_b32 v40, s50, 16
	v_writelane_b32 v40, s51, 17
	v_writelane_b32 v40, s52, 18
	v_writelane_b32 v40, s53, 19
	v_writelane_b32 v40, s54, 20
	v_writelane_b32 v40, s55, 21
	v_writelane_b32 v40, s56, 22
	v_writelane_b32 v40, s57, 23
	v_writelane_b32 v40, s58, 24
	v_writelane_b32 v40, s59, 25
	v_writelane_b32 v40, s60, 26
	v_writelane_b32 v40, s61, 27
	v_writelane_b32 v40, s62, 28
	v_writelane_b32 v40, s30, 29
	v_writelane_b32 v40, s31, 30
	v_mov_b32_e32 v0, 0
	ds_read_u8 v0, v0 offset:1479
	s_mov_b64 s[56:57], s[6:7]
	s_movk_i32 s62, 0x5c8
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_u16_e32 vcc, 3, v0
	s_and_b64 s[4:5], vcc, exec
	s_cselect_b32 s55, 0xf8, 56
	s_add_i32 s4, s55, 0x5c8
	s_cmpk_gt_u32 s4, 0x6c0
	s_cbranch_scc1 .LBB3_7
	v_mov_b32_e32 v196, v31
	v_and_b32_e32 v0, 0x3c0, v196
	v_lshrrev_b32_e32 v197, 6, v0
	s_getpc_b64 s[58:59]
	s_add_u32 s58, s58, _ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem@rel32@lo+4
	s_addc_u32 s59, s59, _ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem@rel32@hi+12
	s_branch .LBB3_3
.LBB3_2:
	s_or_b64 exec, exec, s[60:61]
	s_add_i32 s62, s62, s55
	s_add_i32 s4, s62, s55
	s_cmpk_gt_u32 s4, 0x6c0
	s_cselect_b64 s[4:5], -1, 0
	s_and_b64 vcc, exec, s[4:5]
	s_cbranch_vccnz .LBB3_7
.LBB3_3:
	v_mov_b32_e32 v0, s62
	ds_read_u8 v0, v0
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s4, v0
	v_and_b32_e32 v0, 1, v0
	v_cmp_eq_u16_e32 vcc, 0, v0
	s_cbranch_vccnz .LBB3_6
	s_and_b32 s4, 0xffff, s4
	s_lshr_b32 s4, s4, 3
	v_cmp_gt_u32_e32 vcc, s4, v197
	s_and_saveexec_b64 s[60:61], vcc
	s_cbranch_execz .LBB3_2
	s_cmp_lg_u32 s62, -1
	s_getreg_b32 s4, hwreg(HW_REG_SH_MEM_BASES, 16, 16)
	s_cselect_b64 vcc, -1, 0
	s_lshl_b32 s4, s4, 16
	v_mov_b32_e32 v0, s62
	v_mov_b32_e32 v1, s4
	v_cndmask_b32_e32 v0, 0, v0, vcc
	v_cndmask_b32_e32 v1, 0, v1, vcc
	s_mov_b64 s[6:7], s[56:57]
	v_mov_b32_e32 v31, v196
	s_swappc_b64 s[30:31], s[58:59]
	s_branch .LBB3_2
.LBB3_6:
	s_cbranch_execz .LBB3_3
.LBB3_7:
	v_readlane_b32 s30, v40, 29
	v_readlane_b32 s31, v40, 30
	v_readlane_b32 s62, v40, 28
	v_readlane_b32 s61, v40, 27
	v_readlane_b32 s60, v40, 26
	v_readlane_b32 s59, v40, 25
	v_readlane_b32 s58, v40, 24
	v_readlane_b32 s57, v40, 23
	v_readlane_b32 s56, v40, 22
	v_readlane_b32 s55, v40, 21
	v_readlane_b32 s54, v40, 20
	v_readlane_b32 s53, v40, 19
	v_readlane_b32 s52, v40, 18
	v_readlane_b32 s51, v40, 17
	v_readlane_b32 s50, v40, 16
	v_readlane_b32 s49, v40, 15
	v_readlane_b32 s48, v40, 14
	v_readlane_b32 s47, v40, 13
	v_readlane_b32 s46, v40, 12
	v_readlane_b32 s45, v40, 11
	v_readlane_b32 s44, v40, 10
	v_readlane_b32 s43, v40, 9
	v_readlane_b32 s42, v40, 8
	v_readlane_b32 s41, v40, 7
	v_readlane_b32 s40, v40, 6
	v_readlane_b32 s39, v40, 5
	v_readlane_b32 s38, v40, 4
	v_readlane_b32 s37, v40, 3
	v_readlane_b32 s36, v40, 2
	v_readlane_b32 s35, v40, 1
	v_readlane_b32 s34, v40, 0
	s_addk_i32 s32, 0xfc00
	v_readlane_b32 s33, v40, 31
	s_or_saveexec_b64 s[4:5], -1
	buffer_load_dword v40, off, s[0:3], s32
	s_mov_b64 exec, s[4:5]
	s_waitcnt vmcnt(0)
	s_setpc_b64 s[30:31]
.Lfunc_end2:
	.size	_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv, .Lfunc_end2-_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv

	.text
	.p2align	2
	.type	_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem,@function
_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
	s_or_saveexec_b64 s[4:5], -1
	buffer_store_dword v2, off, s[0:3], s32
	s_mov_b64 exec, s[4:5]
	v_writelane_b32 v2, s34, 0
	v_writelane_b32 v2, s35, 1
	v_writelane_b32 v2, s36, 2
	v_writelane_b32 v2, s37, 3
	v_writelane_b32 v2, s38, 4
	v_writelane_b32 v2, s39, 5
	v_writelane_b32 v2, s40, 6
	v_writelane_b32 v2, s41, 7
	v_writelane_b32 v2, s42, 8
	v_writelane_b32 v2, s43, 9
	v_writelane_b32 v2, s44, 10
	v_writelane_b32 v2, s45, 11
	v_writelane_b32 v2, s46, 12
	v_writelane_b32 v2, s47, 13
	v_writelane_b32 v2, s48, 14
	v_writelane_b32 v2, s49, 15
	v_writelane_b32 v2, s50, 16
	v_writelane_b32 v2, s51, 17
	v_writelane_b32 v2, s52, 18
	v_writelane_b32 v2, s53, 19
	v_writelane_b32 v2, s54, 20
	v_writelane_b32 v2, s30, 21
	v_writelane_b32 v2, s31, 22
	flat_load_ubyte v18, v[0:1]
	flat_load_ushort v19, v[0:1] offset:2
	flat_load_dwordx2 v[26:27], v[0:1] offset:24
	flat_load_dwordx2 v[16:17], v[0:1] offset:40
	flat_load_dwordx4 v[12:15], v[0:1] offset:8
	flat_load_dword v4, v[0:1] offset:4
	v_mov_b32_e32 v0, 0
	s_movk_i32 s4, 0x400
	v_add_u32_e64 v3, s4, 0
	ds_read_b32 v5, v0 offset:1336
	ds_read_b64 v[0:1], v0 offset:1320
	ds_read2_b32 v[8:9], v3 offset0:53 offset1:56
	v_and_b32_e32 v24, 0x3ff, v31
	s_mov_b64 s[8:9], 0
	v_and_b32_e32 v3, 7, v24
	s_waitcnt lgkmcnt(0)
	v_cmp_ne_u32_e64 s[4:5], -1, v0
	v_cmp_lt_u32_e32 vcc, 7, v24
	v_readfirstlane_b32 s16, v5
	v_cndmask_b32_e64 v6, 0, 1, s[4:5]
	v_readfirstlane_b32 s13, v9
	v_readfirstlane_b32 s25, v8
	s_waitcnt vmcnt(0)
	v_lshrrev_b16_e32 v0, 3, v18
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[6:7], exec, s[4:5]
	s_cbranch_execnz .LBB2_630
	s_andn2_saveexec_b64 s[4:5], s[6:7]
	s_cbranch_execnz .LBB2_639
.LBB2_2:
	s_or_b64 exec, exec, s[4:5]
	v_mov_b32_e32 v55, 0
	s_and_saveexec_b64 s[4:5], s[8:9]
.LBB2_3:
	v_mov_b32_e32 v55, v5
	v_mov_b32_e32 v20, v5
.LBB2_4:
	s_or_b64 exec, exec, s[4:5]
	v_and_b32_e32 v1, 36, v20
	v_cmp_ne_u32_e32 vcc, 0, v1
	v_mov_b32_e32 v1, 0
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_6
	v_lshlrev_b32_e32 v1, 2, v3
	ds_read_b32 v1, v1 offset:1320
.LBB2_6:
	s_or_b64 exec, exec, s[4:5]
	v_and_b32_e32 v5, 24, v20
	v_cmp_ne_u32_e64 s[4:5], 0, v5
	s_and_saveexec_b64 s[6:7], s[4:5]
	s_cbranch_execz .LBB2_8
	s_waitcnt lgkmcnt(0)
	v_lshlrev_b32_e32 v1, 2, v3
	ds_read_b32 v1, v1 offset:1324
.LBB2_8:
	s_or_b64 exec, exec, s[6:7]
	v_lshrrev_b32_e32 v22, 30, v4
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB2_14
	v_mov_b32_e32 v4, 0
	ds_read_b64 v[4:5], v4 offset:1312
	s_movk_i32 s8, 0x2a0
	s_movk_i32 s9, 0x70
	v_and_b32_e32 v8, 32, v20
	v_cmp_ne_u32_e32 vcc, 0, v8
	s_waitcnt lgkmcnt(0)
	v_mad_i64_i32 v[6:7], s[4:5], v1, s8, v[4:5]
	v_mad_u64_u32 v[6:7], s[4:5], v22, s9, v[6:7]
	flat_load_dwordx2 v[6:7], v[6:7] offset:416
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v6, s[4:5], 3, v6
	v_addc_co_u32_e64 v29, s[4:5], 0, v7, s[4:5]
	v_and_b32_e32 v28, -4, v6
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_11
	v_mad_i64_i32 v[6:7], s[10:11], v1, s8, v[4:5]
	v_mad_u64_u32 v[6:7], s[8:9], v22, s9, v[6:7]
	flat_load_dwordx2 v[6:7], v[6:7] offset:368
	v_mov_b32_e32 v20, v55
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
.LBB2_11:
	s_or_b64 exec, exec, s[4:5]
	v_and_b32_e32 v8, 4, v20
	v_cmp_ne_u32_e32 vcc, 0, v8
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_13
	s_movk_i32 s8, 0x2a0
	v_mad_i64_i32 v[4:5], s[8:9], v1, s8, v[4:5]
	s_movk_i32 s8, 0x70
	v_mad_u64_u32 v[8:9], s[8:9], v22, s8, v[4:5]
	v_add_co_u32_e32 v4, vcc, 0x150, v8
	v_addc_co_u32_e32 v5, vcc, 0, v9, vcc
	v_lshlrev_b32_e32 v6, 3, v3
	ds_write_b64 v6, v[4:5]
	flat_load_dwordx4 v[4:7], v[8:9] offset:352
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	flat_load_dwordx2 v[30:31], v[8:9] offset:408
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u64_e32 vcc, 0, v[30:31]
	v_cndmask_b32_e64 v8, 0, 1, vcc
	v_lshl_or_b32 v20, v8, 7, v55
	v_mov_b32_e32 v55, v20
.LBB2_13:
	s_or_b64 exec, exec, s[4:5]
.LBB2_14:
	s_or_b64 exec, exec, s[6:7]
	v_and_b32_e32 v8, 24, v20
	v_lshrrev_b16_e32 v21, 8, v19
	v_cmp_ne_u32_e32 vcc, 0, v8
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_22
	v_mov_b32_e32 v8, 0
	ds_read_b64 v[10:11], v8 offset:1312
	s_movk_i32 s8, 0x2a0
	s_movk_i32 s9, 0x70
	v_and_b32_e32 v23, 16, v20
	v_cmp_ne_u32_e32 vcc, 0, v23
	s_waitcnt lgkmcnt(0)
	v_mad_i64_i32 v[8:9], s[6:7], v1, s8, v[10:11]
	v_mad_u64_u32 v[8:9], s[6:7], v22, s9, v[8:9]
	flat_load_dwordx2 v[8:9], v[8:9] offset:80
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB2_17
	v_mad_i64_i32 v[6:7], s[10:11], v1, s8, v[10:11]
	v_mad_u64_u32 v[28:29], s[8:9], v22, s9, v[6:7]
	flat_load_dwordx2 v[6:7], v[28:29] offset:24
	flat_load_dwordx2 v[34:35], v[28:29] offset:96
.LBB2_17:
	s_or_b64 exec, exec, s[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e32 v8, vcc, 3, v8
	v_addc_co_u32_e32 v29, vcc, 0, v9, vcc
	v_and_b32_e32 v28, -4, v8
	v_and_b32_e32 v8, 8, v20
	v_cmp_ne_u32_e32 vcc, 0, v8
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB2_21
	s_movk_i32 s8, 0x2a0
	v_mad_i64_i32 v[4:5], s[8:9], v1, s8, v[10:11]
	s_movk_i32 s8, 0x70
	v_mad_u64_u32 v[22:23], s[8:9], v22, s8, v[4:5]
	v_lshlrev_b32_e32 v1, 3, v3
	ds_write_b64 v1, v[22:23] offset:56
	flat_load_dwordx2 v[6:7], v[22:23] offset:32
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	flat_load_dwordx4 v[8:11], v[22:23] offset:64
	flat_load_dwordx2 v[4:5], v[22:23] offset:16
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u64_e32 vcc, 0, v[10:11]
	v_cndmask_b32_e64 v1, 0, 1, vcc
	v_lshl_or_b32 v20, v1, 7, v55
	v_and_b32_e32 v1, 0x80, v20
	v_cmp_eq_u32_e32 vcc, 0, v1
	v_cndmask_b32_e32 v31, v11, v31, vcc
	v_cndmask_b32_e32 v30, v10, v30, vcc
	v_cmp_ne_u64_e32 vcc, 0, v[8:9]
	s_and_saveexec_b64 s[8:9], vcc
	v_or_b32_e32 v20, 0x100, v20
	s_or_b64 exec, exec, s[8:9]
	v_mov_b32_e32 v55, v20
.LBB2_21:
	s_or_b64 exec, exec, s[6:7]
.LBB2_22:
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v1, 1, v20
	v_cmp_eq_u32_e32 vcc, 1, v1
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_24
	v_mov_b32_e32 v1, 0
	v_pk_mov_b32 v[4:5], v[12:13], v[12:13] op_sel:[0,1]
	ds_write_b64 v1, v[16:17] offset:1152
.LBB2_24:
	s_or_b64 exec, exec, s[4:5]
	v_lshlrev_b32_e32 v32, 6, v0
	s_mov_b64 s[20:21], 0
	v_cmp_lt_i64_e32 vcc, 0, v[26:27]
	s_and_saveexec_b64 s[18:19], vcc
	s_cbranch_execz .LBB2_641
	v_and_b32_e32 v1, 2, v20
	v_cmp_eq_u32_e32 vcc, 0, v1
	s_ashr_i32 s4, s13, 31
	v_mul_lo_u32 v48, s25, v21
	v_cndmask_b32_e32 v1, v15, v5, vcc
	v_cndmask_b32_e32 v38, v14, v4, vcc
	s_lshr_b32 s4, s4, 29
	v_ashrrev_i32_e32 v39, 31, v48
	v_add_co_u32_e32 v97, vcc, v26, v48
	s_add_i32 s13, s13, s4
	v_addc_co_u32_e32 v99, vcc, v27, v39, vcc
	v_lshlrev_b32_e32 v50, 7, v0
	s_ashr_i32 s4, s13, 3
	v_add_co_u32_e32 v101, vcc, -1, v50
	s_and_b32 s22, s4, -4
	v_addc_co_u32_e64 v118, s[4:5], 0, -1, vcc
	s_ashr_i32 s23, s22, 31
	s_ashr_i32 s24, s13, 5
	s_add_i32 s47, s25, s16
	s_not_b32 s4, s25
	s_cmp_gt_i32 s16, 0
	v_and_b32_e32 v4, 0xff, v19
	s_cselect_b32 s4, s4, -1
	s_add_i32 s4, s4, s47
	v_mul_lo_u32 v54, s25, v4
	s_ashr_i32 s5, s4, 31
	v_add_co_u32_e32 v119, vcc, s4, v54
	s_lshr_b32 s4, s24, 28
	s_add_i32 s4, s24, s4
	s_ashr_i32 s48, s4, 4
	s_ashr_i32 s13, s24, 31
	v_ashrrev_i32_e32 v49, 31, v54
	v_mov_b32_e32 v4, s5
	s_cmp_gt_i32 s25, 2
	v_addc_co_u32_e32 v128, vcc, v4, v49, vcc
	v_and_b32_e32 v4, 63, v24
	v_lshrrev_b32_e32 v5, 6, v24
	s_cselect_b64 s[26:27], -1, 0
	s_ashr_i32 s14, s16, 31
	v_cmp_eq_u32_e64 s[4:5], 0, v4
	v_lshl_or_b32 v66, v5, 8, v4
	v_lshl_or_b32 v132, v5, 9, v4
	v_lshl_or_b32 v68, v5, 7, v4
	v_mov_b32_e32 v4, s14
	v_add_co_u32_e64 v133, s[14:15], s16, v54
	s_add_i32 s16, s16, 1
	v_addc_co_u32_e64 v134, s[14:15], v49, v4, s[14:15]
	s_cmp_le_i32 s25, s16
	s_cselect_b32 s14, s25, 0
	s_sub_i32 s14, s16, s14
	s_ashr_i32 s15, s14, 31
	s_mov_b32 s17, 0
	s_movk_i32 s49, 0x100
	v_mov_b32_e32 v4, s15
	v_add_co_u32_e64 v135, s[14:15], s14, v54
	v_lshl_or_b32 v130, v5, 3, s49
	v_addc_co_u32_e64 v144, s[14:15], v4, v49, s[14:15]
	v_and_b32_e32 v4, 0xffff, v18
	v_mov_b32_e32 v5, s17
	v_mov_b32_e32 v53, 0
	v_cmp_ge_u32_e32 vcc, v24, v32
	v_lshlrev_b32_e32 v10, 3, v3
	v_lshrrev_b64 v[4:5], 3, v[4:5]
	s_movk_i32 s46, 0xff
	v_mov_b32_e32 v51, v53
	v_add_u32_e32 v129, 0xb0, v10
	v_lshlrev_b32_e32 v64, 8, v0
	v_mov_b32_e32 v67, v53
	v_mov_b32_e32 v65, v53
	v_mov_b32_e32 v25, v53
	v_mov_b32_e32 v33, v53
	v_lshlrev_b32_e32 v131, 9, v0
	v_cmp_eq_u32_e64 s[6:7], 0, v3
	v_cmp_eq_u64_e64 s[8:9], 0, v[34:35]
	v_cmp_ne_u64_e64 s[10:11], 0, v[34:35]
	v_mov_b32_e32 v69, v53
	v_add_u32_e32 v145, 0x70, v10
	s_add_i32 s50, s25, -2
	v_lshlrev_b64 v[70:71], 12, v[4:5]
	v_lshlrev_b64 v[80:81], 11, v[4:5]
	v_lshlrev_b32_e32 v82, 2, v68
	v_mov_b32_e32 v83, v53
	v_lshlrev_b64 v[84:85], 10, v[4:5]
	s_mov_b32 s51, 0x4f800000
	s_mov_b32 s52, 0xf4240
	s_xor_b64 s[28:29], vcc, -1
	v_mov_b32_e32 v146, 1
	v_mov_b32_e32 v147, 0x70
	v_mov_b32_e32 v148, 5
	v_mov_b32_e32 v149, 0xb0
	v_mov_b32_e32 v150, 0x78
	v_mov_b32_e32 v151, 0xb8
	v_mad_i64_i32 v[86:87], s[14:15], v48, s22, 0
	v_lshlrev_b32_e32 v96, 4, v66
	v_lshlrev_b32_e32 v98, 2, v132
	v_lshlrev_b32_e32 v100, 2, v24
	v_pk_mov_b32 v[102:103], 0, 0
	s_branch .LBB2_28
.LBB2_26:
	s_or_b64 exec, exec, s[30:31]
.LBB2_27:
	s_or_b64 exec, exec, s[16:17]
	v_add_co_u32_e32 v102, vcc, v102, v86
	v_addc_co_u32_e32 v103, vcc, v103, v87, vcc
	v_cmp_le_i64_e32 vcc, v[26:27], v[102:103]
	s_or_b64 s[20:21], vcc, s[20:21]
	s_andn2_b64 exec, exec, s[20:21]
	s_cbranch_execz .LBB2_640
.LBB2_28:
	v_not_b32_e32 v5, v102
	v_not_b32_e32 v4, v103
	v_add_co_u32_e32 v10, vcc, v97, v5
	v_addc_co_u32_e32 v11, vcc, v99, v4, vcc
	v_or_b32_e32 v5, v11, v39
	v_mov_b32_e32 v4, v53
	v_cmp_ne_u64_e32 vcc, 0, v[4:5]
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[16:17], exec, s[14:15]
	s_cbranch_execz .LBB2_30
	v_mov_b32_e32 v4, v39
	v_mov_b32_e32 v5, v39
	v_add_co_u32_e32 v12, vcc, v48, v4
	v_addc_co_u32_e32 v13, vcc, v39, v5, vcc
	v_xor_b32_e32 v20, v13, v5
	v_xor_b32_e32 v21, v12, v4
	v_cvt_f32_u32_e32 v12, v21
	v_cvt_f32_u32_e32 v13, v20
	v_sub_co_u32_e32 v17, vcc, 0, v21
	v_subb_co_u32_e32 v18, vcc, 0, v20, vcc
	v_mac_f32_e32 v12, 0x4f800000, v13
	v_rcp_f32_e32 v12, v12
	v_mul_f32_e32 v12, 0x5f7ffffc, v12
	v_mul_f32_e32 v13, 0x2f800000, v12
	v_trunc_f32_e32 v13, v13
	v_mac_f32_e32 v12, 0xcf800000, v13
	v_cvt_u32_f32_e32 v16, v12
	v_cvt_u32_f32_e32 v19, v13
	v_mul_lo_u32 v14, v18, v16
	v_mad_u64_u32 v[12:13], s[14:15], v17, v16, 0
	v_mul_lo_u32 v15, v17, v19
	v_add3_u32 v13, v13, v15, v14
	v_mad_u64_u32 v[14:15], s[14:15], v16, v13, 0
	v_mul_hi_u32 v22, v16, v12
	v_add_co_u32_e32 v22, vcc, v22, v14
	v_addc_co_u32_e32 v23, vcc, 0, v15, vcc
	v_mad_u64_u32 v[14:15], s[14:15], v19, v13, 0
	v_mad_u64_u32 v[12:13], s[14:15], v19, v12, 0
	v_add_co_u32_e32 v12, vcc, v22, v12
	v_addc_co_u32_e32 v12, vcc, v23, v13, vcc
	v_addc_co_u32_e32 v13, vcc, 0, v15, vcc
	v_add_co_u32_e32 v12, vcc, v12, v14
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	v_add_co_u32_e32 v22, vcc, v16, v12
	v_addc_co_u32_e32 v23, vcc, v19, v13, vcc
	v_mul_lo_u32 v14, v17, v23
	v_mul_lo_u32 v15, v18, v22
	v_mad_u64_u32 v[12:13], s[14:15], v17, v22, 0
	v_add3_u32 v13, v13, v14, v15
	v_mad_u64_u32 v[16:17], s[14:15], v23, v12, 0
	v_mad_u64_u32 v[18:19], s[14:15], v22, v13, 0
	v_mul_hi_u32 v12, v22, v12
	v_add_co_u32_e32 v12, vcc, v12, v18
	v_mad_u64_u32 v[14:15], s[14:15], v23, v13, 0
	v_addc_co_u32_e32 v13, vcc, 0, v19, vcc
	v_add_co_u32_e32 v12, vcc, v12, v16
	v_addc_co_u32_e32 v12, vcc, v13, v17, vcc
	v_addc_co_u32_e32 v13, vcc, 0, v15, vcc
	v_add_co_u32_e32 v12, vcc, v12, v14
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	v_add_co_u32_e32 v12, vcc, v22, v12
	v_addc_co_u32_e32 v13, vcc, v23, v13, vcc
	v_ashrrev_i32_e32 v14, 31, v11
	v_add_co_u32_e32 v10, vcc, v10, v14
	v_addc_co_u32_e32 v11, vcc, v11, v14, vcc
	v_xor_b32_e32 v16, v10, v14
	v_xor_b32_e32 v15, v11, v14
	v_mad_u64_u32 v[10:11], s[14:15], v16, v13, 0
	v_mul_hi_u32 v17, v16, v12
	v_add_co_u32_e32 v17, vcc, v17, v10
	v_addc_co_u32_e32 v18, vcc, 0, v11, vcc
	v_mad_u64_u32 v[10:11], s[14:15], v15, v13, 0
	v_mad_u64_u32 v[12:13], s[14:15], v15, v12, 0
	v_add_co_u32_e32 v12, vcc, v17, v12
	v_addc_co_u32_e32 v12, vcc, v18, v13, vcc
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	v_add_co_u32_e32 v12, vcc, v12, v10
	v_addc_co_u32_e32 v13, vcc, 0, v11, vcc
	v_mul_lo_u32 v17, v20, v12
	v_mul_lo_u32 v18, v21, v13
	v_mad_u64_u32 v[10:11], s[14:15], v21, v12, 0
	v_add3_u32 v11, v11, v18, v17
	v_sub_u32_e32 v17, v15, v11
	v_sub_co_u32_e32 v10, vcc, v16, v10
	v_subb_co_u32_e64 v16, s[14:15], v17, v20, vcc
	v_sub_co_u32_e64 v17, s[14:15], v10, v21
	v_subbrev_co_u32_e64 v16, s[14:15], 0, v16, s[14:15]
	v_cmp_ge_u32_e64 s[14:15], v16, v20
	v_cndmask_b32_e64 v18, 0, -1, s[14:15]
	v_cmp_ge_u32_e64 s[14:15], v17, v21
	v_cndmask_b32_e64 v17, 0, -1, s[14:15]
	v_cmp_eq_u32_e64 s[14:15], v16, v20
	v_cndmask_b32_e64 v16, v18, v17, s[14:15]
	v_add_co_u32_e64 v17, s[14:15], 2, v12
	v_subb_co_u32_e32 v11, vcc, v15, v11, vcc
	v_addc_co_u32_e64 v18, s[14:15], 0, v13, s[14:15]
	v_cmp_ge_u32_e32 vcc, v11, v20
	v_add_co_u32_e64 v19, s[14:15], 1, v12
	v_cndmask_b32_e64 v15, 0, -1, vcc
	v_cmp_ge_u32_e32 vcc, v10, v21
	v_addc_co_u32_e64 v22, s[14:15], 0, v13, s[14:15]
	v_cndmask_b32_e64 v10, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, v11, v20
	v_cmp_ne_u32_e64 s[14:15], 0, v16
	v_cndmask_b32_e32 v10, v15, v10, vcc
	v_cmp_ne_u32_e32 vcc, 0, v10
	v_cndmask_b32_e64 v11, v19, v17, s[14:15]
	v_cndmask_b32_e64 v16, v22, v18, s[14:15]
	v_cndmask_b32_e32 v11, v12, v11, vcc
	v_xor_b32_e32 v4, v14, v4
	v_cndmask_b32_e32 v10, v13, v16, vcc
	v_xor_b32_e32 v5, v14, v5
	v_xor_b32_e32 v11, v11, v4
	v_xor_b32_e32 v10, v10, v5
	v_sub_co_u32_e32 v4, vcc, v11, v4
	v_subb_co_u32_e32 v5, vcc, v10, v5, vcc
.LBB2_30:
	s_andn2_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_32
	v_cvt_f32_u32_e32 v4, v48
	v_sub_u32_e32 v5, 0, v48
	v_rcp_iflag_f32_e32 v4, v4
	v_mul_f32_e32 v4, 0x4f7ffffe, v4
	v_cvt_u32_f32_e32 v4, v4
	v_mul_lo_u32 v5, v5, v4
	v_mul_hi_u32 v5, v4, v5
	v_add_u32_e32 v4, v4, v5
	v_mul_hi_u32 v4, v10, v4
	v_mul_lo_u32 v5, v4, v48
	v_sub_u32_e32 v5, v10, v5
	v_add_u32_e32 v11, 1, v4
	v_sub_u32_e32 v10, v5, v48
	v_cmp_ge_u32_e32 vcc, v5, v48
	v_cndmask_b32_e32 v5, v5, v10, vcc
	v_cndmask_b32_e32 v4, v4, v11, vcc
	v_add_u32_e32 v10, 1, v4
	v_cmp_ge_u32_e32 vcc, v5, v48
	v_cndmask_b32_e32 v52, v4, v10, vcc
	v_pk_mov_b32 v[4:5], v[52:53], v[52:53] op_sel:[0,1]
.LBB2_32:
	s_or_b64 exec, exec, s[14:15]
	v_mov_b32_e32 v10, s23
	v_cmp_lt_i64_e32 vcc, s[22:23], v[4:5]
	v_cndmask_b32_e32 v5, v5, v10, vcc
	v_mov_b32_e32 v10, s22
	v_cndmask_b32_e32 v4, v4, v10, vcc
	v_add_co_u32_e32 v12, vcc, v101, v4
	v_addc_co_u32_e32 v5, vcc, v118, v5, vcc
	v_mov_b32_e32 v4, v53
	v_cmp_ne_u64_e32 vcc, 0, v[4:5]
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execz .LBB2_34
	v_cvt_f32_u32_e32 v4, v50
	v_sub_co_u32_e32 v16, vcc, 0, v50
	v_subb_co_u32_e64 v17, s[16:17], 0, 0, vcc
	v_mac_f32_e64 v4, 0, s51
	v_rcp_f32_e32 v4, v4
	v_mul_f32_e32 v4, 0x5f7ffffc, v4
	v_mul_f32_e32 v10, 0x2f800000, v4
	v_trunc_f32_e32 v10, v10
	v_mac_f32_e32 v4, 0xcf800000, v10
	v_cvt_u32_f32_e32 v13, v10
	v_cvt_u32_f32_e32 v4, v4
	v_mul_lo_u32 v14, v16, v13
	v_mul_lo_u32 v15, v17, v4
	v_mad_u64_u32 v[10:11], s[16:17], v16, v4, 0
	v_add3_u32 v11, v11, v14, v15
	v_mad_u64_u32 v[14:15], s[16:17], v4, v11, 0
	v_mul_hi_u32 v18, v4, v10
	v_add_co_u32_e32 v18, vcc, v18, v14
	v_addc_co_u32_e32 v19, vcc, 0, v15, vcc
	v_mad_u64_u32 v[14:15], s[16:17], v13, v11, 0
	v_mad_u64_u32 v[10:11], s[16:17], v13, v10, 0
	v_add_co_u32_e32 v10, vcc, v18, v10
	v_addc_co_u32_e32 v10, vcc, v19, v11, vcc
	v_addc_co_u32_e32 v11, vcc, 0, v15, vcc
	v_add_co_u32_e32 v10, vcc, v10, v14
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	v_add_co_u32_e32 v4, vcc, v4, v10
	v_addc_co_u32_e32 v13, vcc, v13, v11, vcc
	v_mul_lo_u32 v14, v16, v13
	v_mul_lo_u32 v15, v17, v4
	v_mad_u64_u32 v[10:11], s[16:17], v16, v4, 0
	v_add3_u32 v11, v11, v14, v15
	v_mad_u64_u32 v[16:17], s[16:17], v13, v10, 0
	v_mad_u64_u32 v[18:19], s[16:17], v4, v11, 0
	v_mul_hi_u32 v10, v4, v10
	v_add_co_u32_e32 v10, vcc, v10, v18
	v_mad_u64_u32 v[14:15], s[16:17], v13, v11, 0
	v_addc_co_u32_e32 v11, vcc, 0, v19, vcc
	v_add_co_u32_e32 v10, vcc, v10, v16
	v_addc_co_u32_e32 v10, vcc, v11, v17, vcc
	v_addc_co_u32_e32 v11, vcc, 0, v15, vcc
	v_add_co_u32_e32 v10, vcc, v10, v14
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	v_add_co_u32_e32 v4, vcc, v4, v10
	v_addc_co_u32_e32 v13, vcc, v13, v11, vcc
	v_mad_u64_u32 v[10:11], s[16:17], v12, v13, 0
	v_mul_hi_u32 v14, v12, v4
	v_add_co_u32_e32 v16, vcc, v14, v10
	v_addc_co_u32_e32 v17, vcc, 0, v11, vcc
	v_mad_u64_u32 v[14:15], s[16:17], v5, v4, 0
	v_add_co_u32_e32 v4, vcc, v16, v14
	v_mad_u64_u32 v[10:11], s[16:17], v5, v13, 0
	v_addc_co_u32_e32 v4, vcc, v17, v15, vcc
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	v_add_co_u32_e32 v4, vcc, v4, v10
	v_addc_co_u32_e32 v13, vcc, 0, v11, vcc
	v_mad_u64_u32 v[10:11], s[16:17], v50, v4, 0
	v_mov_b32_e32 v4, v11
	v_mad_u64_u32 v[14:15], s[16:17], v50, v13, v[4:5]
	v_sub_co_u32_e32 v4, vcc, v12, v10
	v_subb_co_u32_e32 v5, vcc, v5, v14, vcc
	v_sub_co_u32_e32 v10, vcc, v4, v50
	v_subbrev_co_u32_e32 v11, vcc, 0, v5, vcc
	v_sub_co_u32_e32 v13, vcc, v10, v50
	v_cmp_ge_u32_e32 vcc, v10, v50
	v_cndmask_b32_e64 v14, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, 0, v11
	v_cndmask_b32_e32 v11, -1, v14, vcc
	v_cmp_ge_u32_e32 vcc, v4, v50
	v_cndmask_b32_e64 v14, 0, -1, vcc
	v_cmp_eq_u32_e32 vcc, 0, v5
	v_cndmask_b32_e32 v5, -1, v14, vcc
	v_cmp_ne_u32_e32 vcc, 0, v11
	v_cndmask_b32_e32 v10, v10, v13, vcc
	v_cmp_ne_u32_e32 vcc, 0, v5
	v_cndmask_b32_e32 v10, v4, v10, vcc
.LBB2_34:
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_36
	v_cvt_f32_u32_e32 v4, v50
	v_sub_u32_e32 v5, 0, v50
	v_rcp_iflag_f32_e32 v4, v4
	v_mul_f32_e32 v4, 0x4f7ffffe, v4
	v_cvt_u32_f32_e32 v4, v4
	v_mul_lo_u32 v5, v5, v4
	v_mul_hi_u32 v5, v4, v5
	v_add_u32_e32 v4, v4, v5
	v_mul_hi_u32 v4, v12, v4
	v_mul_lo_u32 v4, v4, v50
	v_sub_u32_e32 v4, v12, v4
	v_sub_u32_e32 v5, v4, v50
	v_cmp_ge_u32_e32 vcc, v4, v50
	v_cndmask_b32_e32 v4, v4, v5, vcc
	v_sub_u32_e32 v5, v4, v50
	v_cmp_ge_u32_e32 vcc, v4, v50
	v_cndmask_b32_e32 v10, v4, v5, vcc
.LBB2_36:
	s_or_b64 exec, exec, s[14:15]
	v_sub_co_u32_e32 v112, vcc, v12, v10
	v_ashrrev_i32_e32 v113, 31, v112
	v_mul_lo_u32 v4, v113, v119
	v_mul_lo_u32 v5, v112, v128
	v_mad_u64_u32 v[10:11], s[14:15], v112, v119, v[102:103]
	v_add3_u32 v11, v4, v11, v5
	v_sub_co_u32_e32 v4, vcc, v26, v10
	v_subb_co_u32_e32 v5, vcc, v27, v11, vcc
	v_cmp_lt_i64_e32 vcc, v[112:113], v[4:5]
	v_cndmask_b32_e32 v4, v4, v112, vcc
	v_max_i32_e32 v18, 0, v4
	v_add_u32_e32 v5, 31, v18
	v_ashrrev_i32_e32 v12, 31, v5
	v_lshrrev_b32_e32 v12, 27, v12
	v_add_u32_e32 v5, v5, v12
	v_ashrrev_i32_e32 v5, 5, v5
	v_lshlrev_b32_e32 v5, 4, v5
	v_cmp_lt_i32_e32 vcc, 0, v4
	v_max_i32_e32 v19, s48, v5
	s_and_b64 s[14:15], s[28:29], vcc
	v_mov_b32_e32 v4, 0
	v_mov_b32_e32 v5, 0
	s_and_saveexec_b64 s[30:31], s[14:15]
	s_cbranch_execnz .LBB2_39
	s_or_b64 exec, exec, s[30:31]
	v_cmp_gt_i32_e32 vcc, 2, v5
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execnz .LBB2_116
.LBB2_38:
	s_or_b64 exec, exec, s[16:17]
	s_andn2_b64 vcc, exec, s[26:27]
	s_cbranch_vccz .LBB2_157
	s_branch .LBB2_279
.LBB2_39:
	v_lshlrev_b64 v[4:5], 2, v[10:11]
	v_add_co_u32_e32 v20, vcc, v38, v4
	v_addc_co_u32_e32 v21, vcc, v1, v5, vcc
	s_mov_b32 s44, 1
	s_mov_b64 s[36:37], -1
	s_mov_b64 s[34:35], 0
	v_mov_b32_e32 v4, 0
	s_branch .LBB2_42
.LBB2_40:
	s_or_b64 exec, exec, s[16:17]
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
.LBB2_41:
	s_or_b64 exec, exec, s[14:15]
	v_add_u32_e32 v4, v19, v4
	v_cmp_ge_i32_e32 vcc, v4, v18
	s_xor_b64 s[14:15], s[36:37], -1
	s_or_b64 s[14:15], s[14:15], vcc
	s_and_b64 s[14:15], exec, s[14:15]
	v_or_b32_e32 v55, 0x800, v55
	s_or_b64 s[34:35], s[14:15], s[34:35]
	s_mov_b64 s[36:37], 0
	v_mov_b32_e32 v5, s44
	s_mov_b32 s44, 2
	s_andn2_b64 exec, exec, s[34:35]
	s_cbranch_execz .LBB2_115
.LBB2_42:
	v_and_b32_e32 v5, 1, v55
	v_cmp_eq_u32_e32 vcc, 1, v5
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_44
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshlrev_b64 v[10:11], 2, v[4:5]
	v_add_co_u32_e32 v10, vcc, v20, v10
	v_addc_co_u32_e32 v11, vcc, v21, v11, vcc
	ds_write_b64 v53, v[10:11] offset:112
.LBB2_44:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v5, 8, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_mov_b64 s[14:15], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_56
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e32 v12, vcc, 8, v36
	v_addc_co_u32_e32 v13, vcc, 0, v37, vcc
	v_add_co_u32_e32 v10, vcc, 2, v28
	v_addc_co_u32_e32 v11, vcc, 0, v29, vcc
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]
	v_mov_b32_e32 v5, 1
	s_and_saveexec_b64 s[38:39], vcc
	s_cbranch_execz .LBB2_55
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v5, 0
	s_branch .LBB2_49
.LBB2_47:
	s_or_b64 exec, exec, s[42:43]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e32 v14, vcc, 8, v36
	v_addc_co_u32_e32 v15, vcc, 0, v37, vcc
	v_cmp_ge_u64_e32 vcc, v[14:15], v[10:11]
	s_orn2_b64 s[42:43], vcc, exec
.LBB2_48:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[14:15], exec, s[42:43]
	s_or_b64 s[40:41], s[14:15], s[40:41]
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execz .LBB2_54
.LBB2_49:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v5, 1, v5
	v_and_b32_e32 v14, 64, v55
	v_cmp_eq_u32_e32 vcc, 0, v14
	v_cmp_eq_u32_e64 s[14:15], s52, v5
	s_and_b64 vcc, vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_51
	ds_read_b64 v[14:15], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v5, v[14:15] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e32 vcc, 0, v5
	v_cndmask_b32_e64 v5, 0, 1, vcc
	v_lshl_or_b32 v55, v5, 6, v55
	v_and_b32_e32 v14, 64, v55
	v_mov_b32_e32 v5, 0
.LBB2_51:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_eq_u32_e32 vcc, 0, v14
	s_mov_b64 s[42:43], -1
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_48
	v_cmp_eq_u32_e32 vcc, 0, v5
	s_and_saveexec_b64 s[42:43], vcc
	s_cbranch_execz .LBB2_47
	ds_read_b64 v[14:15], v53 offset:1288
	v_mov_b32_e32 v52, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e32 v16, 8, v36
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v17, v[14:15], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[14:15], v53 offset:1280
	v_and_b32_e32 v17, 0x1fff, v17
	v_lshlrev_b32_e32 v17, 5, v17
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v22, vcc, v14, v17
	v_addc_co_u32_e32 v23, vcc, 0, v15, vcc
	flat_store_byte v[22:23], v52 offset:1
	s_memrealtime vcc
	v_ashrrev_i32_e32 v17, 31, v16
	flat_store_short v[22:23], v147 offset:2
	flat_store_dword v[22:23], v24 offset:4
	flat_store_dwordx2 v[22:23], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v14, vcc_lo
	v_mov_b32_e32 v15, vcc_hi
	flat_store_dwordx4 v[22:23], v[14:17] offset:8
	flat_store_byte v[22:23], v148
	s_branch .LBB2_47
.LBB2_54:
	s_or_b64 exec, exec, s[40:41]
	v_and_b32_e32 v5, 8, v55
.LBB2_55:
	s_or_b64 exec, exec, s[38:39]
	v_cmp_eq_u32_e32 vcc, 0, v5
	s_orn2_b64 s[14:15], vcc, exec
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_56:
	s_or_b64 exec, exec, s[16:17]
	v_sub_u32_e32 v5, v18, v4
	s_xor_b64 s[16:17], s[14:15], -1
	v_min_i32_e32 v19, v19, v5
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_66
	v_and_b32_e32 v5, 0x100, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_and_saveexec_b64 s[16:17], vcc
	s_xor_b64 s[16:17], exec, s[16:17]
	s_cbranch_execz .LBB2_59
	v_and_b32_e32 v52, 7, v28
	v_lshlrev_b64 v[10:11], 2, v[52:53]
	v_add_co_u32_e32 v10, vcc, v8, v10
	v_lshlrev_b32_e32 v5, 2, v19
	v_addc_co_u32_e32 v11, vcc, v9, v11, vcc
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[10:11], v5
.LBB2_59:
	s_andn2_saveexec_b64 s[16:17], s[16:17]
	v_and_b32_e32 v52, 7, v28
	s_or_b64 exec, exec, s[16:17]
	v_and_b32_e32 v5, 0x80, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_and_saveexec_b64 s[16:17], vcc
	s_xor_b64 s[16:17], exec, s[16:17]
	s_cbranch_execz .LBB2_63
	v_lshlrev_b64 v[10:11], 2, v[52:53]
	v_add_co_u32_e32 v10, vcc, v30, v10
	v_addc_co_u32_e32 v11, vcc, v31, v11, vcc
	flat_load_dwordx2 v[10:11], v[10:11] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshrrev_b64 v[10:11], 2, v[10:11]
.LBB2_63:
	s_andn2_saveexec_b64 s[16:17], s[16:17]
	v_mul_lo_u32 v5, v53, s24
	v_mul_lo_u32 v12, v52, s13
	v_mad_u64_u32 v[10:11], vcc, v52, s24, 0
	v_add3_u32 v11, v11, v12, v5
	s_or_b64 exec, exec, s[16:17]
	v_lshlrev_b64 v[10:11], 2, v[10:11]
	v_add_co_u32_e32 v10, vcc, v38, v10
	v_addc_co_u32_e32 v11, vcc, v1, v11, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v129, v[10:11]
.LBB2_66:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_69
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_72
.LBB2_68:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_73
	s_branch .LBB2_78
.LBB2_69:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_71
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_71:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_68
.LBB2_72:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_78
.LBB2_73:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_78
	ds_read_b64 v[10:11], v130
	v_mov_b32_e32 v12, 1
	v_mov_b32_e32 v13, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v10, vcc, v10, v0
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	ds_write_b64 v130, v[10:11]
	ds_add_u64 v53, v[12:13] offset:248
	ds_read_b64 v[12:13], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_77
	s_mov_b64 s[38:39], 0
.LBB2_76:
	s_sleep 1
	ds_read_b64 v[10:11], v53 offset:248
	ds_read_b64 v[12:13], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_76
.LBB2_77:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_78:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_lt_i32_e32 vcc, 0, v19
	s_and_saveexec_b64 s[38:39], vcc
	s_cbranch_execz .LBB2_98
	ds_read2_b64 v[10:13], v53 offset0:14 offset1:22
	v_mov_b32_e32 v15, 0
	s_mov_b64 s[16:17], -1
	v_mov_b32_e32 v16, v19
	s_waitcnt lgkmcnt(0)
	v_or_b32_e32 v5, v12, v10
	v_and_b32_e32 v14, 3, v5
	v_cmp_ne_u64_e32 vcc, 0, v[14:15]
	s_cbranch_vccz .LBB2_81
	s_and_b64 exec, exec, s[16:17]
	s_cbranch_execnz .LBB2_92
	s_branch .LBB2_98
.LBB2_81:
	v_lshrrev_b32_e32 v5, 2, v19
	v_and_b32_e32 v5, 0x3fffff00, v5
	v_cmp_lt_u32_e32 vcc, v66, v5
	s_and_saveexec_b64 s[40:41], vcc
	s_cbranch_execz .LBB2_84
	s_mov_b64 s[42:43], 0
	v_pk_mov_b32 v[14:15], v[12:13], v[12:13] op_sel:[0,1]
	v_pk_mov_b32 v[16:17], v[10:11], v[10:11] op_sel:[0,1]
	v_mov_b32_e32 v22, v66
.LBB2_83:
	v_add_co_u32_e32 v180, vcc, v16, v96
	v_addc_co_u32_e32 v181, vcc, 0, v17, vcc
	flat_load_dwordx4 v[114:117], v[180:181] glc slc
	flat_load_dwordx4 v[160:163], v[180:181] offset:1024 glc slc
	flat_load_dwordx4 v[164:167], v[180:181] offset:2048 glc slc
	flat_load_dwordx4 v[176:179], v[180:181] offset:3072 glc slc
	v_add_co_u32_e32 v180, vcc, v14, v96
	v_add_co_u32_e64 v16, s[14:15], v16, v70
	v_add_co_u32_e64 v14, s[16:17], v14, v70
	v_add_u32_e32 v22, v22, v64
	v_addc_co_u32_e32 v181, vcc, 0, v15, vcc
	v_addc_co_u32_e64 v17, vcc, v17, v71, s[14:15]
	v_addc_co_u32_e64 v15, vcc, v15, v71, s[16:17]
	v_cmp_ge_u32_e32 vcc, v22, v5
	s_or_b64 s[42:43], vcc, s[42:43]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx4 v[180:181], v[114:117] glc slc
	flat_store_dwordx4 v[180:181], v[160:163] offset:1024 glc slc
	flat_store_dwordx4 v[180:181], v[164:167] offset:2048 glc slc
	flat_store_dwordx4 v[180:181], v[176:179] offset:3072 glc slc
	s_andn2_b64 exec, exec, s[42:43]
	s_cbranch_execnz .LBB2_83
.LBB2_84:
	s_or_b64 exec, exec, s[40:41]
	v_lshlrev_b32_e32 v52, 2, v5
	v_cmp_ne_u32_e32 vcc, v19, v52
	s_mov_b64 s[16:17], 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v15, 0
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_91
	v_sub_u32_e32 v5, v19, v52
	v_ashrrev_i32_e32 v22, 2, v5
	v_cmp_lt_i32_e32 vcc, v24, v22
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_88
	v_lshlrev_b64 v[16:17], 2, v[52:53]
	v_add_co_u32_e32 v14, vcc, v12, v16
	v_addc_co_u32_e32 v15, vcc, v13, v17, vcc
	v_lshlrev_b64 v[114:115], 4, v[24:25]
	v_add_co_u32_e32 v14, vcc, v14, v114
	v_addc_co_u32_e32 v15, vcc, v15, v115, vcc
	v_add_co_u32_e32 v16, vcc, v10, v16
	v_addc_co_u32_e32 v17, vcc, v11, v17, vcc
	v_add_co_u32_e32 v16, vcc, v16, v114
	v_addc_co_u32_e32 v17, vcc, v17, v115, vcc
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v23, v24
.LBB2_87:
	flat_load_dwordx4 v[114:117], v[16:17] glc slc
	v_lshlrev_b64 v[160:161], 4, v[32:33]
	v_add_co_u32_e32 v16, vcc, v16, v160
	v_add_u32_e32 v23, v23, v32
	v_addc_co_u32_e32 v17, vcc, v17, v161, vcc
	v_cmp_ge_i32_e32 vcc, v23, v22
	s_or_b64 s[40:41], vcc, s[40:41]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx4 v[14:15], v[114:117] glc slc
	v_add_co_u32_e32 v14, vcc, v14, v160
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execnz .LBB2_87
.LBB2_88:
	s_or_b64 exec, exec, s[16:17]
	v_and_b32_e32 v14, 3, v5
	v_cmp_ne_u32_e32 vcc, 0, v14
	s_mov_b64 s[16:17], 0
	v_mov_b32_e32 v16, 0
	s_and_saveexec_b64 s[40:41], vcc
	v_and_b32_e32 v5, -4, v5
	s_mov_b64 s[16:17], exec
	v_add_u32_e32 v52, v5, v52
	v_mov_b32_e32 v16, v14
	s_or_b64 exec, exec, s[40:41]
	s_and_b64 s[16:17], s[16:17], exec
	v_mov_b32_e32 v15, v52
.LBB2_91:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 exec, exec, s[16:17]
	s_cbranch_execz .LBB2_98
.LBB2_92:
	v_and_b32_e32 v17, 0xfffffe00, v16
	v_cmp_lt_i32_e32 vcc, v132, v17
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_95
	v_ashrrev_i32_e32 v23, 31, v15
	v_mov_b32_e32 v22, v15
	v_lshlrev_b64 v[22:23], 2, v[22:23]
	v_add_co_u32_e32 v14, vcc, v98, v22
	v_addc_co_u32_e32 v5, vcc, 0, v23, vcc
	s_mov_b64 s[16:17], 0
	v_mov_b32_e32 v22, v132
.LBB2_94:
	v_add_co_u32_e32 v114, vcc, v10, v14
	v_addc_co_u32_e32 v115, vcc, v11, v5, vcc
	flat_load_dword v23, v[114:115] glc slc
	flat_load_dword v52, v[114:115] offset:256 glc slc
	flat_load_dword v116, v[114:115] offset:512 glc slc
	flat_load_dword v117, v[114:115] offset:768 glc slc
	flat_load_dword v160, v[114:115] offset:1024 glc slc
	flat_load_dword v161, v[114:115] offset:1280 glc slc
	flat_load_dword v162, v[114:115] offset:1536 glc slc
	flat_load_dword v163, v[114:115] offset:1792 glc slc
	v_add_co_u32_e32 v114, vcc, v12, v14
	v_addc_co_u32_e32 v115, vcc, v13, v5, vcc
	v_add_co_u32_e32 v14, vcc, v14, v80
	v_add_u32_e32 v22, v22, v131
	v_addc_co_u32_e32 v5, vcc, v5, v81, vcc
	v_cmp_ge_i32_e32 vcc, v22, v17
	s_or_b64 s[16:17], vcc, s[16:17]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[114:115], v23 glc slc
	flat_store_dword v[114:115], v52 offset:256 glc slc
	flat_store_dword v[114:115], v116 offset:512 glc slc
	flat_store_dword v[114:115], v117 offset:768 glc slc
	flat_store_dword v[114:115], v160 offset:1024 glc slc
	flat_store_dword v[114:115], v161 offset:1280 glc slc
	flat_store_dword v[114:115], v162 offset:1536 glc slc
	flat_store_dword v[114:115], v163 offset:1792 glc slc
	s_andn2_b64 exec, exec, s[16:17]
	s_cbranch_execnz .LBB2_94
.LBB2_95:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v16, 0x1ff, v16
	v_cmp_ne_u32_e32 vcc, 0, v16
	v_cmp_lt_u32_e64 s[14:15], v24, v16
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB2_98
	v_add_u32_e32 v14, v17, v15
	v_ashrrev_i32_e32 v15, 31, v14
	v_lshlrev_b64 v[14:15], 2, v[14:15]
	v_add_co_u32_e32 v14, vcc, v100, v14
	v_addc_co_u32_e32 v5, vcc, 0, v15, vcc
	s_mov_b64 s[14:15], 0
	v_mov_b32_e32 v15, v24
.LBB2_97:
	v_add_co_u32_e32 v22, vcc, v10, v14
	v_addc_co_u32_e32 v23, vcc, v11, v5, vcc
	flat_load_dword v17, v[22:23] glc slc
	v_add_co_u32_e32 v22, vcc, v12, v14
	v_addc_co_u32_e32 v23, vcc, v13, v5, vcc
	v_add_co_u32_e32 v14, vcc, v14, v64
	v_add_u32_e32 v15, v15, v32
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	v_cmp_ge_u32_e32 vcc, v15, v16
	s_or_b64 s[14:15], vcc, s[14:15]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[22:23], v17 glc slc
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execnz .LBB2_97
.LBB2_98:
	s_or_b64 exec, exec, s[38:39]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_101
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_104
.LBB2_100:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_105
	s_branch .LBB2_110
.LBB2_101:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_103
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_103:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_100
.LBB2_104:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_110
.LBB2_105:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_110
	ds_read_b64 v[10:11], v130
	v_mov_b32_e32 v12, 1
	v_mov_b32_e32 v13, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v10, vcc, v10, v0
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	ds_write_b64 v130, v[10:11]
	ds_add_u64 v53, v[12:13] offset:248
	ds_read_b64 v[12:13], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_109
	s_mov_b64 s[38:39], 0
.LBB2_108:
	s_sleep 1
	ds_read_b64 v[10:11], v53 offset:248
	ds_read_b64 v[12:13], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_108
.LBB2_109:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_110:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v5, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_and_b64 s[16:17], vcc, s[6:7]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_112
	;;#ASMSTART
	s_waitcnt vmcnt(0) lgkmcnt(0); buffer_wbinvl1_vol
	;;#ASMEND
.LBB2_112:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v5, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_41
	s_and_saveexec_b64 s[16:17], s[10:11]
	s_cbranch_execz .LBB2_40
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[34:35], v[10:11]
	s_branch .LBB2_40
.LBB2_115:
	s_or_b64 exec, exec, s[34:35]
	s_or_b64 exec, exec, s[30:31]
	v_cmp_gt_i32_e32 vcc, 2, v5
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_38
.LBB2_116:
	s_mov_b64 s[30:31], 0
	s_branch .LBB2_119
.LBB2_117:
	s_or_b64 exec, exec, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
.LBB2_118:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_ne_u32_e32 vcc, 0, v5
	v_or_b32_e32 v55, 0x800, v55
	v_add_u32_e32 v4, v19, v4
	s_or_b64 s[30:31], vcc, s[30:31]
	v_mov_b32_e32 v5, 1
	s_andn2_b64 exec, exec, s[30:31]
	s_cbranch_execz .LBB2_156
.LBB2_119:
	v_and_b32_e32 v10, 8, v55
	v_cmp_ne_u32_e32 vcc, 0, v10
	s_mov_b64 s[14:15], -1
	s_and_saveexec_b64 s[34:35], vcc
	s_cbranch_execz .LBB2_131
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e32 v12, vcc, 8, v36
	v_addc_co_u32_e32 v13, vcc, 0, v37, vcc
	v_add_co_u32_e32 v10, vcc, 2, v28
	v_addc_co_u32_e32 v11, vcc, 0, v29, vcc
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]
	v_mov_b32_e32 v12, 1
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB2_130
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v14, 0
	s_branch .LBB2_124
.LBB2_122:
	s_or_b64 exec, exec, s[40:41]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e32 v16, vcc, 8, v36
	v_addc_co_u32_e32 v17, vcc, 0, v37, vcc
	v_cmp_ge_u64_e32 vcc, v[16:17], v[10:11]
	s_orn2_b64 s[40:41], vcc, exec
.LBB2_123:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[14:15], exec, s[40:41]
	s_or_b64 s[38:39], s[14:15], s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execz .LBB2_129
.LBB2_124:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v14, 1, v14
	v_and_b32_e32 v15, 64, v55
	v_cmp_eq_u32_e32 vcc, 0, v15
	v_cmp_eq_u32_e64 s[14:15], s52, v14
	s_and_b64 vcc, vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_126
	ds_read_b64 v[14:15], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v14, v[14:15] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e32 vcc, 0, v14
	v_cndmask_b32_e64 v14, 0, 1, vcc
	v_lshl_or_b32 v55, v14, 6, v55
	v_and_b32_e32 v15, 64, v55
	v_mov_b32_e32 v14, 0
.LBB2_126:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_eq_u32_e32 vcc, 0, v15
	s_mov_b64 s[40:41], -1
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_123
	v_cmp_eq_u32_e32 vcc, 0, v14
	s_and_saveexec_b64 s[40:41], vcc
	s_cbranch_execz .LBB2_122
	ds_read_b64 v[16:17], v53 offset:1288
	v_mov_b32_e32 v20, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e32 v22, 8, v36
	v_ashrrev_i32_e32 v23, 31, v22
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v15, v[16:17], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[16:17], v53 offset:1280
	v_and_b32_e32 v15, 0x1fff, v15
	v_lshlrev_b32_e32 v15, 5, v15
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v16, vcc, v16, v15
	v_addc_co_u32_e32 v17, vcc, 0, v17, vcc
	flat_store_byte v[16:17], v20 offset:1
	s_memrealtime vcc
	flat_store_short v[16:17], v147 offset:2
	flat_store_dword v[16:17], v24 offset:4
	flat_store_dwordx2 v[16:17], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v20, vcc_lo
	v_mov_b32_e32 v21, vcc_hi
	flat_store_dwordx4 v[16:17], v[20:23] offset:8
	flat_store_byte v[16:17], v148
	s_branch .LBB2_122
.LBB2_129:
	s_or_b64 exec, exec, s[38:39]
	v_and_b32_e32 v12, 8, v55
.LBB2_130:
	s_or_b64 exec, exec, s[36:37]
	v_cmp_eq_u32_e32 vcc, 0, v12
	s_orn2_b64 s[14:15], vcc, exec
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_131:
	s_or_b64 exec, exec, s[34:35]
	s_xor_b64 vcc, s[14:15], -1
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_139
	v_and_b32_e32 v10, 0x100, v55
	v_cmp_ne_u32_e32 vcc, 0, v10
	v_and_b32_e32 v52, 7, v28
	s_and_saveexec_b64 s[34:35], vcc
	s_cbranch_execz .LBB2_134
	v_lshlrev_b64 v[10:11], 2, v[52:53]
	v_add_co_u32_e32 v10, vcc, v8, v10
	v_addc_co_u32_e32 v11, vcc, v9, v11, vcc
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[10:11], v53
.LBB2_134:
	s_or_b64 exec, exec, s[34:35]
	v_and_b32_e32 v10, 0x80, v55
	v_cmp_ne_u32_e32 vcc, 0, v10
	s_and_saveexec_b64 s[34:35], vcc
	s_xor_b64 s[34:35], exec, s[34:35]
	s_cbranch_execz .LBB2_136
	v_lshlrev_b64 v[10:11], 2, v[52:53]
	v_add_co_u32_e32 v10, vcc, v30, v10
	v_addc_co_u32_e32 v11, vcc, v31, v11, vcc
	flat_load_dwordx2 v[10:11], v[10:11] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshrrev_b64 v[10:11], 2, v[10:11]
.LBB2_136:
	s_andn2_saveexec_b64 vcc, s[34:35]
	v_mad_i64_i32 v[10:11], s[34:35], v52, s24, 0
	s_or_b64 exec, exec, vcc
	v_lshlrev_b64 v[10:11], 2, v[10:11]
	v_add_co_u32_e32 v10, vcc, v38, v10
	v_addc_co_u32_e32 v11, vcc, v1, v11, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v129, v[10:11]
.LBB2_139:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[34:35], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_142
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_145
.LBB2_141:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[34:35]
	s_cbranch_execnz .LBB2_146
	s_branch .LBB2_151
.LBB2_142:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[36:37], -1
	s_and_saveexec_b64 s[34:35], vcc
	s_cbranch_execz .LBB2_144
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[36:37], exec, -1
.LBB2_144:
	s_or_b64 exec, exec, s[34:35]
	s_and_b64 s[34:35], s[36:37], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_141
.LBB2_145:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[34:35], s[34:35], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[34:35], s[34:35], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[34:35]
	s_cbranch_execz .LBB2_151
.LBB2_146:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_151
	ds_read_b64 v[10:11], v130
	v_mov_b32_e32 v12, 1
	v_mov_b32_e32 v13, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v10, vcc, v10, v0
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	ds_write_b64 v130, v[10:11]
	ds_add_u64 v53, v[12:13] offset:248
	ds_read_b64 v[12:13], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]
	s_and_saveexec_b64 s[34:35], vcc
	s_cbranch_execz .LBB2_150
	s_mov_b64 s[36:37], 0
.LBB2_149:
	s_sleep 1
	ds_read_b64 v[10:11], v53 offset:248
	ds_read_b64 v[12:13], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]
	s_or_b64 s[36:37], vcc, s[36:37]
	s_andn2_b64 exec, exec, s[36:37]
	s_cbranch_execnz .LBB2_149
.LBB2_150:
	s_or_b64 exec, exec, s[34:35]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_151:
	s_or_b64 exec, exec, s[14:15]
	v_sub_u32_e32 v10, v18, v4
	v_min_i32_e32 v19, v19, v10
	v_and_b32_e32 v10, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v10
	v_cmp_lt_i32_e64 s[14:15], 0, v19
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 vcc, s[14:15], s[6:7]
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_153
	;;#ASMSTART
	s_waitcnt vmcnt(0) lgkmcnt(0); buffer_wbinvl1_vol
	;;#ASMEND
.LBB2_153:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v10, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v10
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_118
	s_and_saveexec_b64 vcc, s[10:11]
	s_cbranch_execz .LBB2_117
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[34:35], v[10:11]
	s_branch .LBB2_117
.LBB2_156:
	s_or_b64 exec, exec, s[30:31]
	s_or_b64 exec, exec, s[16:17]
	s_andn2_b64 vcc, exec, s[26:27]
	s_cbranch_vccnz .LBB2_279
.LBB2_157:
	s_mov_b32 s53, 2
	s_branch .LBB2_160
.LBB2_158:
	s_or_b64 exec, exec, s[34:35]
.LBB2_159:
	s_or_b64 exec, exec, s[30:31]
	s_add_i32 s53, s53, 1
	s_cmp_eq_u32 s53, s25
	s_cbranch_scc1 .LBB2_279
.LBB2_160:
	s_sub_i32 s14, s47, s53
	s_cmp_le_i32 s25, s14
	s_cselect_b32 s15, s25, 0
	s_sub_i32 s14, s14, s15
	s_ashr_i32 s15, s14, 31
	v_mov_b32_e32 v4, s15
	v_add_co_u32_e32 v5, vcc, s14, v54
	v_addc_co_u32_e32 v4, vcc, v4, v49, vcc
	v_mul_lo_u32 v10, v5, v113
	v_mul_lo_u32 v11, v4, v112
	v_mad_u64_u32 v[4:5], s[14:15], v5, v112, v[102:103]
	v_add3_u32 v5, v11, v5, v10
	v_sub_co_u32_e32 v10, vcc, v26, v4
	v_subb_co_u32_e32 v11, vcc, v27, v5, vcc
	v_cmp_lt_i64_e32 vcc, v[112:113], v[10:11]
	v_cndmask_b32_e32 v10, v10, v112, vcc
	v_max_i32_e32 v114, 0, v10
	v_add_u32_e32 v11, 31, v114
	v_ashrrev_i32_e32 v12, 31, v11
	v_lshrrev_b32_e32 v12, 27, v12
	v_add_u32_e32 v11, v11, v12
	v_ashrrev_i32_e32 v11, 5, v11
	v_lshlrev_b32_e32 v11, 4, v11
	v_cmp_lt_i32_e32 vcc, 0, v10
	v_max_i32_e32 v115, s48, v11
	s_and_b64 s[14:15], s[28:29], vcc
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v14, 0
	s_and_saveexec_b64 s[30:31], s[14:15]
	s_cbranch_execnz .LBB2_162
	s_or_b64 exec, exec, s[30:31]
	v_cmp_gt_i32_e32 vcc, 2, v14
	s_and_saveexec_b64 s[30:31], vcc
	s_cbranch_execz .LBB2_159
	s_branch .LBB2_239
.LBB2_162:
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_add_co_u32_e32 v116, vcc, v38, v4
	v_addc_co_u32_e32 v117, vcc, v1, v5, vcc
	s_mov_b32 s54, 1
	s_mov_b64 s[36:37], -1
	s_mov_b64 s[34:35], 0
	v_mov_b32_e32 v16, 0
	s_branch .LBB2_164
.LBB2_163:
	s_or_b64 exec, exec, s[14:15]
	v_add_u32_e32 v16, v115, v16
	v_cmp_ge_i32_e32 vcc, v16, v114
	s_xor_b64 s[14:15], s[36:37], -1
	s_or_b64 s[14:15], s[14:15], vcc
	s_and_b64 s[14:15], exec, s[14:15]
	v_or_b32_e32 v55, 0x800, v55
	s_or_b64 s[34:35], s[14:15], s[34:35]
	s_mov_b64 s[36:37], 0
	v_mov_b32_e32 v14, s54
	s_mov_b32 s54, 2
	s_andn2_b64 exec, exec, s[34:35]
	s_cbranch_execz .LBB2_238
.LBB2_164:
	v_and_b32_e32 v4, 1, v55
	v_cmp_eq_u32_e32 vcc, 1, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_166
	v_ashrrev_i32_e32 v17, 31, v16
	v_lshlrev_b64 v[4:5], 2, v[16:17]
	v_add_co_u32_e32 v4, vcc, v116, v4
	v_addc_co_u32_e32 v5, vcc, v117, v5, vcc
	ds_write_b64 v53, v[4:5] offset:112
.LBB2_166:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 8, v55
	v_and_b32_e32 v5, 12, v55
	v_cmp_eq_u32_e32 vcc, 0, v4
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_cbranch_execz .LBB2_178
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v12, s[14:15], v36, v4
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]
	v_add_co_u32_e64 v10, s[14:15], 2, v28
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]
	s_and_saveexec_b64 s[40:41], s[14:15]
	s_cbranch_execz .LBB2_177
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[42:43], 0
	v_mov_b32_e32 v5, 0
	s_branch .LBB2_171
.LBB2_169:
	s_or_b64 exec, exec, s[44:45]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v14, s[14:15], v36, v4
	v_addc_co_u32_e64 v15, s[14:15], 0, v37, s[14:15]
	v_cmp_ge_u64_e64 s[14:15], v[14:15], v[10:11]
	s_orn2_b64 s[44:45], s[14:15], exec
.LBB2_170:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], exec, s[44:45]
	s_or_b64 s[42:43], s[14:15], s[42:43]
	s_andn2_b64 exec, exec, s[42:43]
	s_cbranch_execz .LBB2_176
.LBB2_171:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v5, 1, v5
	v_and_b32_e32 v14, 64, v55
	v_cmp_eq_u32_e64 s[14:15], 0, v14
	v_cmp_eq_u32_e64 s[16:17], s52, v5
	s_and_b64 s[14:15], s[14:15], s[16:17]
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_173
	ds_read_b64 v[14:15], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v5, v[14:15] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]
	v_lshl_or_b32 v55, v5, 6, v55
	v_and_b32_e32 v14, 64, v55
	v_mov_b32_e32 v5, 0
.LBB2_173:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_eq_u32_e64 s[14:15], 0, v14
	s_mov_b64 s[44:45], -1
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_170
	v_cmp_eq_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[44:45], s[14:15]
	s_cbranch_execz .LBB2_169
	ds_read_b64 v[14:15], v53 offset:1288
	v_mov_b32_e32 v18, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e32 v20, v4, v36
	v_ashrrev_i32_e32 v21, 31, v20
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v17, v[14:15], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[14:15], v53 offset:1280
	v_and_b32_e32 v17, 0x1fff, v17
	v_lshlrev_b32_e32 v17, 5, v17
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e64 v14, s[14:15], v14, v17
	v_addc_co_u32_e64 v15, s[14:15], 0, v15, s[14:15]
	flat_store_byte v[14:15], v18 offset:1
	s_memrealtime s[14:15]
	flat_store_short v[14:15], v147 offset:2
	flat_store_dword v[14:15], v24 offset:4
	flat_store_dwordx2 v[14:15], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v18, s14
	v_mov_b32_e32 v19, s15
	flat_store_dwordx4 v[14:15], v[18:21] offset:8
	flat_store_byte v[14:15], v148
	s_branch .LBB2_169
.LBB2_176:
	s_or_b64 exec, exec, s[42:43]
.LBB2_177:
	s_or_b64 exec, exec, s[40:41]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_178:
	s_or_b64 exec, exec, s[38:39]
	v_sub_u32_e32 v4, v114, v16
	v_min_i32_e32 v115, v115, v4
	v_and_b32_e32 v4, 12, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_188
	v_and_b32_e32 v4, 0x100, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_xor_b64 s[38:39], vcc, -1
	s_and_b64 s[14:15], s[38:39], s[14:15]
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_xor_b64 s[38:39], exec, s[38:39]
	s_cbranch_execz .LBB2_181
	v_and_b32_e32 v52, 7, v28
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v8, v4
	v_lshlrev_b32_e32 v10, 2, v115
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[4:5], v10
.LBB2_181:
	s_andn2_saveexec_b64 s[14:15], s[38:39]
	v_and_b32_e32 v52, 7, v28
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 0x80, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_xor_b64 s[38:39], exec, s[38:39]
	s_cbranch_execz .LBB2_185
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v30, v4
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]
	flat_load_dwordx2 v[4:5], v[4:5] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshrrev_b64 v[4:5], 2, v[4:5]
.LBB2_185:
	s_andn2_saveexec_b64 s[14:15], s[38:39]
	v_mul_lo_u32 v10, v53, s24
	v_mul_lo_u32 v11, v52, s13
	v_mad_u64_u32 v[4:5], s[38:39], v52, s24, 0
	v_add3_u32 v5, v5, v11, v10
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_cndmask_b32_e32 v10, v149, v150, vcc
	v_add_co_u32_e32 v4, vcc, v38, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_lshl_add_u32 v10, v3, 3, v10
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v10, v[4:5]
.LBB2_188:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_191
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_194
.LBB2_190:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_195
	s_branch .LBB2_200
.LBB2_191:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_193
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_193:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_190
.LBB2_194:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_200
.LBB2_195:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_200
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_199
	s_mov_b64 s[38:39], 0
.LBB2_198:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_198
.LBB2_199:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_200:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_lt_i32_e32 vcc, 0, v115
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_220
	ds_read_b128 v[10:13], v53 offset:112
	ds_read_b64 v[18:19], v53 offset:176
	v_mov_b32_e32 v21, 0
	s_mov_b64 s[38:39], -1
	v_mov_b32_e32 v17, v115
	s_waitcnt lgkmcnt(0)
	v_or_b32_e32 v4, v12, v10
	v_or_b32_e32 v4, v4, v18
	v_and_b32_e32 v20, 3, v4
	v_cmp_ne_u64_e32 vcc, 0, v[20:21]
	s_cbranch_vccz .LBB2_203
	s_and_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_214
	s_branch .LBB2_220
.LBB2_203:
	v_lshrrev_b32_e32 v4, 2, v115
	v_and_b32_e32 v17, 0x3fffff80, v4
	v_cmp_lt_u32_e32 vcc, v68, v17
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_206
	v_lshlrev_b64 v[14:15], 4, v[68:69]
	v_add_co_u32_e32 v4, vcc, v10, v14
	v_addc_co_u32_e32 v5, vcc, v11, v15, vcc
	v_add_co_u32_e32 v14, vcc, v12, v14
	v_addc_co_u32_e32 v15, vcc, v13, v15, vcc
	v_lshlrev_b64 v[20:21], 2, v[82:83]
	v_add_co_u32_e32 v20, vcc, v18, v20
	v_addc_co_u32_e32 v21, vcc, v19, v21, vcc
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v22, v68
.LBB2_205:
	flat_load_dwordx4 v[160:163], v[14:15] glc slc
	flat_load_dwordx4 v[164:167], v[4:5] glc slc
	flat_load_dwordx4 v[176:179], v[4:5] offset:1024 glc slc
	flat_load_dwordx4 v[180:183], v[14:15] offset:1024 glc slc
	v_lshlrev_b64 v[192:193], 4, v[50:51]
	v_add_co_u32_e32 v4, vcc, v4, v192
	v_addc_co_u32_e32 v5, vcc, v5, v193, vcc
	v_add_co_u32_e32 v14, vcc, v14, v192
	v_add_u32_e32 v22, v22, v50
	v_addc_co_u32_e32 v15, vcc, v15, v193, vcc
	v_cmp_ge_u32_e32 vcc, v22, v17
	s_or_b64 s[38:39], vcc, s[38:39]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_f32_e32 v160, v164, v160
	v_add_f32_e32 v161, v165, v161
	v_add_f32_e32 v162, v166, v162
	v_add_f32_e32 v163, v167, v163
	v_add_f32_e32 v164, v176, v180
	v_add_f32_e32 v165, v177, v181
	v_add_f32_e32 v166, v178, v182
	v_add_f32_e32 v167, v179, v183
	flat_store_dwordx4 v[20:21], v[160:163] glc slc
	flat_store_dwordx4 v[20:21], v[164:167] offset:1024 glc slc
	v_add_co_u32_e32 v20, vcc, v20, v80
	v_addc_co_u32_e32 v21, vcc, v21, v81, vcc
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_205
.LBB2_206:
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b32_e32 v52, 2, v17
	v_cmp_ne_u32_e32 vcc, v115, v52
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v17, 0
	v_mov_b32_e32 v21, 0
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_213
	v_sub_u32_e32 v22, v115, v52
	v_ashrrev_i32_e32 v17, 2, v22
	v_cmp_lt_i32_e32 vcc, v24, v17
	s_and_saveexec_b64 s[38:39], vcc
	s_cbranch_execz .LBB2_210
	v_lshlrev_b64 v[20:21], 2, v[52:53]
	v_add_co_u32_e32 v4, vcc, v10, v20
	v_addc_co_u32_e32 v5, vcc, v11, v21, vcc
	v_lshlrev_b64 v[160:161], 4, v[24:25]
	v_add_co_u32_e32 v4, vcc, v4, v160
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc
	v_add_co_u32_e32 v14, vcc, v12, v20
	v_addc_co_u32_e32 v15, vcc, v13, v21, vcc
	v_add_co_u32_e32 v14, vcc, v14, v160
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc
	v_add_co_u32_e32 v20, vcc, v18, v20
	v_addc_co_u32_e32 v21, vcc, v19, v21, vcc
	v_add_co_u32_e32 v20, vcc, v20, v160
	v_addc_co_u32_e32 v21, vcc, v21, v161, vcc
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v23, v24
.LBB2_209:
	flat_load_dwordx4 v[160:163], v[4:5] glc slc
	flat_load_dwordx4 v[164:167], v[14:15] glc slc
	v_lshlrev_b64 v[176:177], 4, v[32:33]
	v_add_co_u32_e32 v4, vcc, v4, v176
	v_addc_co_u32_e32 v5, vcc, v5, v177, vcc
	v_add_co_u32_e32 v14, vcc, v14, v176
	v_add_u32_e32 v23, v23, v32
	v_addc_co_u32_e32 v15, vcc, v15, v177, vcc
	v_cmp_ge_i32_e32 vcc, v23, v17
	s_or_b64 s[40:41], vcc, s[40:41]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_f32_e32 v160, v160, v164
	v_add_f32_e32 v161, v161, v165
	v_add_f32_e32 v162, v162, v166
	v_add_f32_e32 v163, v163, v167
	flat_store_dwordx4 v[20:21], v[160:163] glc slc
	v_add_co_u32_e32 v20, vcc, v20, v176
	v_addc_co_u32_e32 v21, vcc, v21, v177, vcc
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execnz .LBB2_209
.LBB2_210:
	s_or_b64 exec, exec, s[38:39]
	v_and_b32_e32 v4, 3, v22
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v17, 0
	s_and_saveexec_b64 s[40:41], vcc
	v_and_b32_e32 v5, -4, v22
	s_mov_b64 s[38:39], exec
	v_add_u32_e32 v52, v5, v52
	v_mov_b32_e32 v17, v4
	s_or_b64 exec, exec, s[40:41]
	s_and_b64 s[38:39], s[38:39], exec
	v_mov_b32_e32 v21, v52
.LBB2_213:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 exec, exec, s[38:39]
	s_cbranch_execz .LBB2_220
.LBB2_214:
	v_and_b32_e32 v20, 0xffffff00, v17
	v_cmp_lt_i32_e32 vcc, v66, v20
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_217
	v_lshlrev_b64 v[22:23], 2, v[66:67]
	v_ashrrev_i32_e32 v5, 31, v21
	v_mov_b32_e32 v4, v21
	v_add_co_u32_e32 v14, vcc, v10, v22
	v_addc_co_u32_e32 v15, vcc, v11, v23, vcc
	v_lshlrev_b64 v[160:161], 2, v[4:5]
	v_add_co_u32_e32 v4, vcc, v14, v160
	v_addc_co_u32_e32 v5, vcc, v15, v161, vcc
	v_add_co_u32_e32 v14, vcc, v12, v22
	v_addc_co_u32_e32 v15, vcc, v13, v23, vcc
	v_add_co_u32_e32 v14, vcc, v14, v160
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc
	v_add_co_u32_e32 v22, vcc, v18, v22
	v_addc_co_u32_e32 v23, vcc, v19, v23, vcc
	v_add_co_u32_e32 v22, vcc, v22, v160
	v_addc_co_u32_e32 v23, vcc, v23, v161, vcc
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v52, v66
.LBB2_216:
	flat_load_dword v162, v[4:5] glc slc
	flat_load_dword v163, v[4:5] offset:256 glc slc
	flat_load_dword v164, v[4:5] offset:512 glc slc
	flat_load_dword v165, v[4:5] offset:768 glc slc
	flat_load_dword v166, v[14:15] glc slc
	flat_load_dword v167, v[14:15] offset:256 glc slc
	flat_load_dword v176, v[14:15] offset:512 glc slc
	flat_load_dword v177, v[14:15] offset:768 glc slc
	v_lshlrev_b64 v[160:161], 2, v[64:65]
	v_add_co_u32_e32 v4, vcc, v4, v160
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc
	v_add_co_u32_e32 v14, vcc, v14, v160
	v_add_u32_e32 v52, v52, v64
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc
	v_cmp_ge_i32_e32 vcc, v52, v20
	s_or_b64 s[38:39], vcc, s[38:39]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_f32_e32 v160, v162, v166
	v_add_f32_e32 v161, v163, v167
	v_add_f32_e32 v162, v164, v176
	v_add_f32_e32 v163, v165, v177
	flat_store_dword v[22:23], v160 glc slc
	flat_store_dword v[22:23], v161 offset:256 glc slc
	flat_store_dword v[22:23], v162 offset:512 glc slc
	flat_store_dword v[22:23], v163 offset:768 glc slc
	v_add_co_u32_e32 v22, vcc, v22, v84
	v_addc_co_u32_e32 v23, vcc, v23, v85, vcc
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_216
.LBB2_217:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v14, 0xff, v17
	v_cmp_ne_u32_e32 vcc, 0, v14
	v_cmp_lt_u32_e64 s[14:15], v24, v14
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB2_220
	v_add_u32_e32 v4, v20, v21
	v_lshlrev_b64 v[20:21], 2, v[24:25]
	v_ashrrev_i32_e32 v5, 31, v4
	v_add_co_u32_e32 v10, vcc, v10, v20
	v_addc_co_u32_e32 v11, vcc, v11, v21, vcc
	v_lshlrev_b64 v[22:23], 2, v[4:5]
	v_add_co_u32_e32 v4, vcc, v10, v22
	v_addc_co_u32_e32 v5, vcc, v11, v23, vcc
	v_add_co_u32_e32 v10, vcc, v12, v20
	v_addc_co_u32_e32 v11, vcc, v13, v21, vcc
	v_add_co_u32_e32 v10, vcc, v10, v22
	v_addc_co_u32_e32 v11, vcc, v11, v23, vcc
	v_add_co_u32_e32 v12, vcc, v18, v20
	v_addc_co_u32_e32 v13, vcc, v19, v21, vcc
	v_add_co_u32_e32 v12, vcc, v12, v22
	v_addc_co_u32_e32 v13, vcc, v13, v23, vcc
	s_mov_b64 s[14:15], 0
	v_mov_b32_e32 v15, v24
.LBB2_219:
	flat_load_dword v17, v[4:5] glc slc
	flat_load_dword v20, v[10:11] glc slc
	v_lshlrev_b64 v[18:19], 2, v[32:33]
	v_add_co_u32_e32 v4, vcc, v4, v18
	v_addc_co_u32_e32 v5, vcc, v5, v19, vcc
	v_add_co_u32_e32 v10, vcc, v10, v18
	v_add_u32_e32 v15, v15, v32
	v_addc_co_u32_e32 v11, vcc, v11, v19, vcc
	v_cmp_ge_u32_e32 vcc, v15, v14
	s_or_b64 s[14:15], vcc, s[14:15]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_f32_e32 v17, v17, v20
	flat_store_dword v[12:13], v17 glc slc
	v_add_co_u32_e32 v12, vcc, v12, v64
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execnz .LBB2_219
.LBB2_220:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_223
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_226
.LBB2_222:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_227
	s_branch .LBB2_232
.LBB2_223:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_225
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_225:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_222
.LBB2_226:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_232
.LBB2_227:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_232
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_231
	s_mov_b64 s[38:39], 0
.LBB2_230:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_230
.LBB2_231:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_232:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_b64 s[16:17], vcc, s[6:7]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_234
	;;#ASMSTART
	s_waitcnt vmcnt(0) lgkmcnt(0); buffer_wbinvl1_vol
	;;#ASMEND
.LBB2_234:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_xor_b64 s[14:15], s[8:9], -1
	s_and_b64 s[16:17], vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_236
	v_mov_b32_e32 v4, 1
	v_mov_b32_e32 v5, 0
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[34:35], v[4:5]
.LBB2_236:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 48, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_163
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
	s_branch .LBB2_163
.LBB2_238:
	s_or_b64 exec, exec, s[34:35]
	s_or_b64 exec, exec, s[30:31]
	v_cmp_gt_i32_e32 vcc, 2, v14
	s_and_saveexec_b64 s[30:31], vcc
	s_cbranch_execz .LBB2_159
.LBB2_239:
	s_mov_b64 s[34:35], 0
	s_branch .LBB2_241
.LBB2_240:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_ne_u32_e32 vcc, 0, v14
	v_or_b32_e32 v55, 0x800, v55
	v_add_u32_e32 v16, v115, v16
	s_or_b64 s[34:35], vcc, s[34:35]
	v_mov_b32_e32 v14, 1
	s_andn2_b64 exec, exec, s[34:35]
	s_cbranch_execz .LBB2_158
.LBB2_241:
	v_and_b32_e32 v4, 8, v55
	v_and_b32_e32 v5, 12, v55
	v_cmp_eq_u32_e32 vcc, 0, v4
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_cbranch_execz .LBB2_253
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v12, s[14:15], v36, v4
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]
	v_add_co_u32_e64 v10, s[14:15], 2, v28
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_cbranch_execz .LBB2_252
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v5, 0
	s_branch .LBB2_246
.LBB2_244:
	s_or_b64 exec, exec, s[42:43]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v18, s[14:15], v36, v4
	v_addc_co_u32_e64 v19, s[14:15], 0, v37, s[14:15]
	v_cmp_ge_u64_e64 s[14:15], v[18:19], v[10:11]
	s_orn2_b64 s[42:43], s[14:15], exec
.LBB2_245:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], exec, s[42:43]
	s_or_b64 s[40:41], s[14:15], s[40:41]
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execz .LBB2_251
.LBB2_246:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v5, 1, v5
	v_and_b32_e32 v15, 64, v55
	v_cmp_eq_u32_e64 s[14:15], 0, v15
	v_cmp_eq_u32_e64 s[16:17], s52, v5
	s_and_b64 s[14:15], s[14:15], s[16:17]
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_248
	ds_read_b64 v[18:19], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v5, v[18:19] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]
	v_lshl_or_b32 v55, v5, 6, v55
	v_and_b32_e32 v15, 64, v55
	v_mov_b32_e32 v5, 0
.LBB2_248:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_eq_u32_e64 s[14:15], 0, v15
	s_mov_b64 s[42:43], -1
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_245
	v_cmp_eq_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[42:43], s[14:15]
	s_cbranch_execz .LBB2_244
	ds_read_b64 v[18:19], v53 offset:1288
	v_mov_b32_e32 v17, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e32 v20, v4, v36
	v_ashrrev_i32_e32 v21, 31, v20
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v15, v[18:19], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[18:19], v53 offset:1280
	v_and_b32_e32 v15, 0x1fff, v15
	v_lshlrev_b32_e32 v15, 5, v15
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e64 v22, s[14:15], v18, v15
	v_addc_co_u32_e64 v23, s[14:15], 0, v19, s[14:15]
	flat_store_byte v[22:23], v17 offset:1
	s_memrealtime s[14:15]
	flat_store_short v[22:23], v147 offset:2
	flat_store_dword v[22:23], v24 offset:4
	flat_store_dwordx2 v[22:23], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v18, s14
	v_mov_b32_e32 v19, s15
	flat_store_dwordx4 v[22:23], v[18:21] offset:8
	flat_store_byte v[22:23], v148
	s_branch .LBB2_244
.LBB2_251:
	s_or_b64 exec, exec, s[40:41]
.LBB2_252:
	s_or_b64 exec, exec, s[38:39]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_253:
	s_or_b64 exec, exec, s[36:37]
	v_and_b32_e32 v4, 12, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_261
	v_and_b32_e32 v4, 0x100, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_xor_b64 s[36:37], vcc, -1
	s_and_b64 s[14:15], s[36:37], s[14:15]
	v_and_b32_e32 v52, 7, v28
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_cbranch_execz .LBB2_256
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v8, v4
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[4:5], v53
.LBB2_256:
	s_or_b64 exec, exec, s[36:37]
	v_and_b32_e32 v4, 0x80, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_xor_b64 s[36:37], exec, s[36:37]
	s_cbranch_execz .LBB2_258
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v30, v4
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]
	flat_load_dwordx2 v[4:5], v[4:5] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshrrev_b64 v[4:5], 2, v[4:5]
.LBB2_258:
	s_andn2_saveexec_b64 s[14:15], s[36:37]
	v_mad_i64_i32 v[4:5], s[36:37], v52, s24, 0
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_cndmask_b32_e32 v10, v149, v150, vcc
	v_add_co_u32_e32 v4, vcc, v38, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_lshl_add_u32 v10, v3, 3, v10
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v10, v[4:5]
.LBB2_261:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_264
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_267
.LBB2_263:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_268
	s_branch .LBB2_273
.LBB2_264:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[36:37], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_266
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[36:37], exec, -1
.LBB2_266:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[36:37], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_263
.LBB2_267:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_273
.LBB2_268:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_273
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_272
	s_mov_b64 s[36:37], 0
.LBB2_271:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[36:37], vcc, s[36:37]
	s_andn2_b64 exec, exec, s[36:37]
	s_cbranch_execnz .LBB2_271
.LBB2_272:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_273:
	s_or_b64 exec, exec, s[14:15]
	v_sub_u32_e32 v4, v114, v16
	v_min_i32_e32 v115, v115, v4
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	v_cmp_lt_i32_e64 s[14:15], 0, v115
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 s[16:17], s[14:15], s[6:7]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_275
	;;#ASMSTART
	s_waitcnt vmcnt(0) lgkmcnt(0); buffer_wbinvl1_vol
	;;#ASMEND
.LBB2_275:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_xor_b64 s[14:15], s[8:9], -1
	s_and_b64 s[16:17], vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_277
	v_mov_b32_e32 v4, 1
	v_mov_b32_e32 v5, 0
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[34:35], v[4:5]
.LBB2_277:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 48, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_240
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
	s_branch .LBB2_240
.LBB2_279:
	v_mad_u64_u32 v[4:5], s[14:15], v112, v133, v[102:103]
	v_mul_lo_u32 v10, v112, v134
	v_mul_lo_u32 v11, v113, v133
	v_add3_u32 v5, v11, v5, v10
	v_sub_co_u32_e32 v10, vcc, v26, v4
	v_subb_co_u32_e32 v11, vcc, v27, v5, vcc
	v_cmp_lt_i64_e32 vcc, v[112:113], v[10:11]
	v_cndmask_b32_e32 v10, v10, v112, vcc
	v_max_i32_e32 v160, 0, v10
	v_add_u32_e32 v11, 31, v160
	v_ashrrev_i32_e32 v12, 31, v11
	v_lshrrev_b32_e32 v12, 27, v12
	v_add_u32_e32 v11, v11, v12
	v_ashrrev_i32_e32 v11, 5, v11
	v_lshlrev_b32_e32 v11, 4, v11
	v_cmp_lt_i32_e32 vcc, 0, v10
	v_max_i32_e32 v161, s48, v11
	s_and_b64 s[14:15], s[28:29], vcc
	v_mov_b32_e32 v114, 0
	v_mov_b32_e32 v14, 0
	s_and_saveexec_b64 s[30:31], s[14:15]
	s_cbranch_execnz .LBB2_282
	s_or_b64 exec, exec, s[30:31]
	v_cmp_gt_i32_e32 vcc, 2, v14
	s_and_saveexec_b64 s[30:31], vcc
	s_cbranch_execnz .LBB2_361
.LBB2_281:
	s_or_b64 exec, exec, s[30:31]
	s_andn2_b64 vcc, exec, s[26:27]
	s_cbranch_vccz .LBB2_402
	s_branch .LBB2_525
.LBB2_282:
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_add_co_u32_e32 v162, vcc, v38, v4
	v_addc_co_u32_e32 v163, vcc, v1, v5, vcc
	s_mov_b32 s53, 1
	s_mov_b64 s[36:37], -1
	s_mov_b64 s[34:35], 0
	v_mov_b32_e32 v114, 0
	s_branch .LBB2_284
.LBB2_283:
	s_or_b64 exec, exec, s[14:15]
	v_add_u32_e32 v114, v161, v114
	v_cmp_ge_i32_e32 vcc, v114, v160
	s_xor_b64 s[14:15], s[36:37], -1
	s_or_b64 s[14:15], s[14:15], vcc
	s_and_b64 s[14:15], exec, s[14:15]
	v_or_b32_e32 v55, 0x800, v55
	s_or_b64 s[34:35], s[14:15], s[34:35]
	s_mov_b64 s[36:37], 0
	v_mov_b32_e32 v14, s53
	s_mov_b32 s53, 2
	s_andn2_b64 exec, exec, s[34:35]
	s_cbranch_execz .LBB2_360
.LBB2_284:
	v_and_b32_e32 v4, 1, v55
	v_ashrrev_i32_e32 v115, 31, v114
	v_cmp_eq_u32_e32 vcc, 1, v4
	v_lshlrev_b64 v[4:5], 2, v[114:115]
	v_add_co_u32_e64 v4, s[14:15], v162, v4
	v_addc_co_u32_e64 v5, s[14:15], v163, v5, s[14:15]
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_286
	ds_write_b64 v53, v[4:5] offset:112
.LBB2_286:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v10, 2, v55
	v_cmp_ne_u32_e32 vcc, 0, v10
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_288
	ds_write_b64 v53, v[4:5] offset:176
.LBB2_288:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 8, v55
	v_and_b32_e32 v5, 12, v55
	v_cmp_eq_u32_e32 vcc, 0, v4
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_cbranch_execz .LBB2_300
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v12, s[14:15], v36, v4
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]
	v_add_co_u32_e64 v10, s[14:15], 2, v28
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]
	s_and_saveexec_b64 s[40:41], s[14:15]
	s_cbranch_execz .LBB2_299
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[42:43], 0
	v_mov_b32_e32 v5, 0
	s_branch .LBB2_293
.LBB2_291:
	s_or_b64 exec, exec, s[44:45]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v14, s[14:15], v36, v4
	v_addc_co_u32_e64 v15, s[14:15], 0, v37, s[14:15]
	v_cmp_ge_u64_e64 s[14:15], v[14:15], v[10:11]
	s_orn2_b64 s[44:45], s[14:15], exec
.LBB2_292:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], exec, s[44:45]
	s_or_b64 s[42:43], s[14:15], s[42:43]
	s_andn2_b64 exec, exec, s[42:43]
	s_cbranch_execz .LBB2_298
.LBB2_293:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v5, 1, v5
	v_and_b32_e32 v14, 64, v55
	v_cmp_eq_u32_e64 s[14:15], 0, v14
	v_cmp_eq_u32_e64 s[16:17], s52, v5
	s_and_b64 s[14:15], s[14:15], s[16:17]
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_295
	ds_read_b64 v[14:15], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v5, v[14:15] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]
	v_lshl_or_b32 v55, v5, 6, v55
	v_and_b32_e32 v14, 64, v55
	v_mov_b32_e32 v5, 0
.LBB2_295:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_eq_u32_e64 s[14:15], 0, v14
	s_mov_b64 s[44:45], -1
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_292
	v_cmp_eq_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[44:45], s[14:15]
	s_cbranch_execz .LBB2_291
	ds_read_b64 v[14:15], v53 offset:1288
	v_mov_b32_e32 v20, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e32 v16, v4, v36
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v17, v[14:15], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[14:15], v53 offset:1280
	v_and_b32_e32 v17, 0x1fff, v17
	v_lshlrev_b32_e32 v17, 5, v17
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e64 v18, s[14:15], v14, v17
	v_addc_co_u32_e64 v19, s[14:15], 0, v15, s[14:15]
	flat_store_byte v[18:19], v20 offset:1
	s_memrealtime s[14:15]
	v_ashrrev_i32_e32 v17, 31, v16
	flat_store_short v[18:19], v147 offset:2
	flat_store_dword v[18:19], v24 offset:4
	flat_store_dwordx2 v[18:19], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v14, s14
	v_mov_b32_e32 v15, s15
	flat_store_dwordx4 v[18:19], v[14:17] offset:8
	flat_store_byte v[18:19], v148
	s_branch .LBB2_291
.LBB2_298:
	s_or_b64 exec, exec, s[42:43]
.LBB2_299:
	s_or_b64 exec, exec, s[40:41]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_300:
	s_or_b64 exec, exec, s[38:39]
	v_sub_u32_e32 v4, v160, v114
	v_min_i32_e32 v161, v161, v4
	v_and_b32_e32 v4, 12, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_310
	v_and_b32_e32 v4, 0x100, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_xor_b64 s[38:39], vcc, -1
	s_and_b64 s[14:15], s[38:39], s[14:15]
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_xor_b64 s[38:39], exec, s[38:39]
	s_cbranch_execz .LBB2_303
	v_and_b32_e32 v52, 7, v28
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v8, v4
	v_lshlrev_b32_e32 v10, 2, v161
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[4:5], v10
.LBB2_303:
	s_andn2_saveexec_b64 s[14:15], s[38:39]
	v_and_b32_e32 v52, 7, v28
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 0x80, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_xor_b64 s[38:39], exec, s[38:39]
	s_cbranch_execz .LBB2_307
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v30, v4
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]
	flat_load_dwordx2 v[4:5], v[4:5] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshrrev_b64 v[4:5], 2, v[4:5]
.LBB2_307:
	s_andn2_saveexec_b64 s[14:15], s[38:39]
	v_mul_lo_u32 v10, v53, s24
	v_mul_lo_u32 v11, v52, s13
	v_mad_u64_u32 v[4:5], s[38:39], v52, s24, 0
	v_add3_u32 v5, v5, v11, v10
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_cndmask_b32_e32 v10, v149, v147, vcc
	v_add_co_u32_e32 v4, vcc, v38, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_lshl_add_u32 v10, v3, 3, v10
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v10, v[4:5] offset:8
.LBB2_310:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_313
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_316
.LBB2_312:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_317
	s_branch .LBB2_322
.LBB2_313:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_315
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_315:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_312
.LBB2_316:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_322
.LBB2_317:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_322
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_321
	s_mov_b64 s[38:39], 0
.LBB2_320:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_320
.LBB2_321:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_322:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_lt_i32_e32 vcc, 0, v161
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_342
	ds_read_b128 v[10:13], v53 offset:112
	ds_read_b128 v[14:17], v53 offset:176
	v_mov_b32_e32 v117, 0
	s_mov_b64 s[38:39], -1
	v_mov_b32_e32 v115, v161
	s_waitcnt lgkmcnt(0)
	v_or_b32_e32 v4, v12, v10
	v_or_b32_e32 v4, v4, v14
	v_or_b32_e32 v4, v4, v16
	v_and_b32_e32 v116, 3, v4
	v_cmp_ne_u64_e32 vcc, 0, v[116:117]
	s_cbranch_vccz .LBB2_325
	s_and_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_336
	s_branch .LBB2_342
.LBB2_325:
	v_lshrrev_b32_e32 v4, 2, v161
	v_and_b32_e32 v52, 0x3fffff80, v4
	v_cmp_lt_u32_e32 vcc, v68, v52
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_328
	v_lshlrev_b64 v[22:23], 4, v[68:69]
	v_add_co_u32_e32 v4, vcc, v14, v22
	v_addc_co_u32_e32 v5, vcc, v15, v23, vcc
	v_add_co_u32_e32 v18, vcc, v16, v22
	v_addc_co_u32_e32 v19, vcc, v17, v23, vcc
	v_add_co_u32_e32 v20, vcc, v10, v22
	v_addc_co_u32_e32 v21, vcc, v11, v23, vcc
	v_add_co_u32_e32 v22, vcc, v12, v22
	v_addc_co_u32_e32 v23, vcc, v13, v23, vcc
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v115, v68
.LBB2_327:
	flat_load_dwordx4 v[164:167], v[22:23] glc slc
	flat_load_dwordx4 v[176:179], v[20:21] glc slc
	flat_load_dwordx4 v[180:183], v[20:21] offset:1024 glc slc
	flat_load_dwordx4 v[192:195], v[22:23] offset:1024 glc slc
	v_lshlrev_b64 v[116:117], 4, v[50:51]
	v_add_co_u32_e32 v20, vcc, v20, v116
	v_addc_co_u32_e32 v21, vcc, v21, v117, vcc
	v_add_co_u32_e32 v22, vcc, v22, v116
	v_add_u32_e32 v115, v115, v50
	v_addc_co_u32_e32 v23, vcc, v23, v117, vcc
	v_cmp_ge_u32_e32 vcc, v115, v52
	s_or_b64 s[38:39], vcc, s[38:39]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_f32_e32 v164, v176, v164
	v_add_f32_e32 v165, v177, v165
	v_add_f32_e32 v166, v178, v166
	v_add_f32_e32 v167, v179, v167
	v_add_f32_e32 v176, v180, v192
	v_add_f32_e32 v177, v181, v193
	v_add_f32_e32 v178, v182, v194
	v_add_f32_e32 v179, v183, v195
	flat_store_dwordx4 v[4:5], v[164:167] glc slc
	flat_store_dwordx4 v[4:5], v[176:179] offset:1024 glc slc
	flat_store_dwordx4 v[18:19], v[164:167] glc slc
	flat_store_dwordx4 v[18:19], v[176:179] offset:1024 glc slc
	v_add_co_u32_e32 v4, vcc, v4, v116
	v_addc_co_u32_e32 v5, vcc, v5, v117, vcc
	v_add_co_u32_e32 v18, vcc, v18, v116
	v_addc_co_u32_e32 v19, vcc, v19, v117, vcc
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_327
.LBB2_328:
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b32_e32 v52, 2, v52
	v_cmp_ne_u32_e32 vcc, v161, v52
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v115, 0
	v_mov_b32_e32 v117, 0
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_335
	v_sub_u32_e32 v116, v161, v52
	v_ashrrev_i32_e32 v115, 2, v116
	v_cmp_lt_i32_e32 vcc, v24, v115
	s_and_saveexec_b64 s[38:39], vcc
	s_cbranch_execz .LBB2_332
	v_lshlrev_b64 v[22:23], 2, v[52:53]
	v_add_co_u32_e32 v4, vcc, v14, v22
	v_addc_co_u32_e32 v5, vcc, v15, v23, vcc
	v_lshlrev_b64 v[164:165], 4, v[24:25]
	v_add_co_u32_e32 v4, vcc, v4, v164
	v_addc_co_u32_e32 v5, vcc, v5, v165, vcc
	v_add_co_u32_e32 v18, vcc, v16, v22
	v_addc_co_u32_e32 v19, vcc, v17, v23, vcc
	v_add_co_u32_e32 v18, vcc, v18, v164
	v_addc_co_u32_e32 v19, vcc, v19, v165, vcc
	v_add_co_u32_e32 v20, vcc, v10, v22
	v_addc_co_u32_e32 v21, vcc, v11, v23, vcc
	v_add_co_u32_e32 v20, vcc, v20, v164
	v_addc_co_u32_e32 v21, vcc, v21, v165, vcc
	v_add_co_u32_e32 v22, vcc, v12, v22
	v_addc_co_u32_e32 v23, vcc, v13, v23, vcc
	v_add_co_u32_e32 v22, vcc, v22, v164
	v_addc_co_u32_e32 v23, vcc, v23, v165, vcc
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v117, v24
.LBB2_331:
	flat_load_dwordx4 v[164:167], v[20:21] glc slc
	flat_load_dwordx4 v[176:179], v[22:23] glc slc
	v_lshlrev_b64 v[180:181], 4, v[32:33]
	v_add_co_u32_e32 v20, vcc, v20, v180
	v_addc_co_u32_e32 v21, vcc, v21, v181, vcc
	v_add_co_u32_e32 v22, vcc, v22, v180
	v_add_u32_e32 v117, v117, v32
	v_addc_co_u32_e32 v23, vcc, v23, v181, vcc
	v_cmp_ge_i32_e32 vcc, v117, v115
	s_or_b64 s[40:41], vcc, s[40:41]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_f32_e32 v164, v164, v176
	v_add_f32_e32 v165, v165, v177
	v_add_f32_e32 v166, v166, v178
	v_add_f32_e32 v167, v167, v179
	flat_store_dwordx4 v[4:5], v[164:167] glc slc
	flat_store_dwordx4 v[18:19], v[164:167] glc slc
	v_add_co_u32_e32 v4, vcc, v4, v180
	v_addc_co_u32_e32 v5, vcc, v5, v181, vcc
	v_add_co_u32_e32 v18, vcc, v18, v180
	v_addc_co_u32_e32 v19, vcc, v19, v181, vcc
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execnz .LBB2_331
.LBB2_332:
	s_or_b64 exec, exec, s[38:39]
	v_and_b32_e32 v4, 3, v116
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v115, 0
	s_and_saveexec_b64 s[40:41], vcc
	v_and_b32_e32 v5, -4, v116
	s_mov_b64 s[38:39], exec
	v_add_u32_e32 v52, v5, v52
	v_mov_b32_e32 v115, v4
	s_or_b64 exec, exec, s[40:41]
	s_and_b64 s[38:39], s[38:39], exec
	v_mov_b32_e32 v117, v52
.LBB2_335:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 exec, exec, s[38:39]
	s_cbranch_execz .LBB2_342
.LBB2_336:
	v_and_b32_e32 v52, 0xffffff00, v115
	v_cmp_lt_i32_e32 vcc, v66, v52
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_339
	v_lshlrev_b64 v[22:23], 2, v[66:67]
	v_ashrrev_i32_e32 v5, 31, v117
	v_mov_b32_e32 v4, v117
	v_add_co_u32_e32 v18, vcc, v14, v22
	v_addc_co_u32_e32 v19, vcc, v15, v23, vcc
	v_lshlrev_b64 v[164:165], 2, v[4:5]
	v_add_co_u32_e32 v4, vcc, v18, v164
	v_addc_co_u32_e32 v5, vcc, v19, v165, vcc
	v_add_co_u32_e32 v18, vcc, v16, v22
	v_addc_co_u32_e32 v19, vcc, v17, v23, vcc
	v_add_co_u32_e32 v18, vcc, v18, v164
	v_addc_co_u32_e32 v19, vcc, v19, v165, vcc
	v_add_co_u32_e32 v20, vcc, v10, v22
	v_addc_co_u32_e32 v21, vcc, v11, v23, vcc
	v_add_co_u32_e32 v20, vcc, v20, v164
	v_addc_co_u32_e32 v21, vcc, v21, v165, vcc
	v_add_co_u32_e32 v22, vcc, v12, v22
	v_addc_co_u32_e32 v23, vcc, v13, v23, vcc
	v_add_co_u32_e32 v22, vcc, v22, v164
	v_addc_co_u32_e32 v23, vcc, v23, v165, vcc
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v116, v66
.LBB2_338:
	flat_load_dword v166, v[20:21] glc slc
	flat_load_dword v167, v[20:21] offset:256 glc slc
	flat_load_dword v176, v[20:21] offset:512 glc slc
	flat_load_dword v177, v[20:21] offset:768 glc slc
	flat_load_dword v178, v[22:23] glc slc
	flat_load_dword v179, v[22:23] offset:256 glc slc
	flat_load_dword v180, v[22:23] offset:512 glc slc
	flat_load_dword v181, v[22:23] offset:768 glc slc
	v_lshlrev_b64 v[164:165], 2, v[64:65]
	v_add_co_u32_e32 v20, vcc, v20, v164
	v_addc_co_u32_e32 v21, vcc, v21, v165, vcc
	v_add_co_u32_e32 v22, vcc, v22, v164
	v_add_u32_e32 v116, v116, v64
	v_addc_co_u32_e32 v23, vcc, v23, v165, vcc
	v_cmp_ge_i32_e32 vcc, v116, v52
	s_or_b64 s[38:39], vcc, s[38:39]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_f32_e32 v166, v166, v178
	v_add_f32_e32 v167, v167, v179
	v_add_f32_e32 v176, v176, v180
	v_add_f32_e32 v177, v177, v181
	flat_store_dword v[4:5], v166 glc slc
	flat_store_dword v[4:5], v167 offset:256 glc slc
	flat_store_dword v[4:5], v176 offset:512 glc slc
	flat_store_dword v[4:5], v177 offset:768 glc slc
	flat_store_dword v[18:19], v166 glc slc
	flat_store_dword v[18:19], v167 offset:256 glc slc
	flat_store_dword v[18:19], v176 offset:512 glc slc
	flat_store_dword v[18:19], v177 offset:768 glc slc
	v_add_co_u32_e32 v4, vcc, v4, v164
	v_addc_co_u32_e32 v5, vcc, v5, v165, vcc
	v_add_co_u32_e32 v18, vcc, v18, v164
	v_addc_co_u32_e32 v19, vcc, v19, v165, vcc
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_338
.LBB2_339:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v18, 0xff, v115
	v_cmp_ne_u32_e32 vcc, 0, v18
	v_cmp_lt_u32_e64 s[14:15], v24, v18
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB2_342
	v_add_u32_e32 v4, v52, v117
	v_lshlrev_b64 v[20:21], 2, v[24:25]
	v_ashrrev_i32_e32 v5, 31, v4
	v_add_co_u32_e32 v14, vcc, v14, v20
	v_addc_co_u32_e32 v15, vcc, v15, v21, vcc
	v_lshlrev_b64 v[22:23], 2, v[4:5]
	v_add_co_u32_e32 v4, vcc, v14, v22
	v_addc_co_u32_e32 v5, vcc, v15, v23, vcc
	v_add_co_u32_e32 v14, vcc, v16, v20
	v_addc_co_u32_e32 v15, vcc, v17, v21, vcc
	v_add_co_u32_e32 v14, vcc, v14, v22
	v_addc_co_u32_e32 v15, vcc, v15, v23, vcc
	v_add_co_u32_e32 v10, vcc, v10, v20
	v_addc_co_u32_e32 v11, vcc, v11, v21, vcc
	v_add_co_u32_e32 v10, vcc, v10, v22
	v_addc_co_u32_e32 v11, vcc, v11, v23, vcc
	v_add_co_u32_e32 v12, vcc, v12, v20
	v_addc_co_u32_e32 v13, vcc, v13, v21, vcc
	v_add_co_u32_e32 v12, vcc, v12, v22
	v_addc_co_u32_e32 v13, vcc, v13, v23, vcc
	s_mov_b64 s[14:15], 0
	v_mov_b32_e32 v16, v24
.LBB2_341:
	flat_load_dword v17, v[10:11] glc slc
	flat_load_dword v19, v[12:13] glc slc
	v_lshlrev_b64 v[20:21], 2, v[32:33]
	v_add_co_u32_e32 v10, vcc, v10, v20
	v_addc_co_u32_e32 v11, vcc, v11, v21, vcc
	v_add_co_u32_e32 v12, vcc, v12, v20
	v_add_u32_e32 v16, v16, v32
	v_addc_co_u32_e32 v13, vcc, v13, v21, vcc
	v_cmp_ge_u32_e32 vcc, v16, v18
	s_or_b64 s[14:15], vcc, s[14:15]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_f32_e32 v17, v17, v19
	flat_store_dword v[4:5], v17 glc slc
	flat_store_dword v[14:15], v17 glc slc
	v_add_co_u32_e32 v4, vcc, v4, v20
	v_addc_co_u32_e32 v5, vcc, v5, v21, vcc
	v_add_co_u32_e32 v14, vcc, v14, v20
	v_addc_co_u32_e32 v15, vcc, v15, v21, vcc
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execnz .LBB2_341
.LBB2_342:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_345
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_348
.LBB2_344:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_349
	s_branch .LBB2_354
.LBB2_345:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_347
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_347:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_344
.LBB2_348:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_354
.LBB2_349:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_354
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_353
	s_mov_b64 s[38:39], 0
.LBB2_352:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_352
.LBB2_353:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_354:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_b64 s[16:17], vcc, s[6:7]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_356
	;;#ASMSTART
	s_waitcnt vmcnt(0) lgkmcnt(0); buffer_wbinvl1_vol
	;;#ASMEND
.LBB2_356:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_xor_b64 s[14:15], s[8:9], -1
	s_and_b64 s[16:17], vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_358
	v_mov_b32_e32 v4, 1
	v_mov_b32_e32 v5, 0
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[34:35], v[4:5]
.LBB2_358:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 48, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_283
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
	s_branch .LBB2_283
.LBB2_360:
	s_or_b64 exec, exec, s[34:35]
	s_or_b64 exec, exec, s[30:31]
	v_cmp_gt_i32_e32 vcc, 2, v14
	s_and_saveexec_b64 s[30:31], vcc
	s_cbranch_execz .LBB2_281
.LBB2_361:
	s_mov_b64 s[34:35], 0
	s_branch .LBB2_363
.LBB2_362:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_ne_u32_e32 vcc, 0, v14
	v_or_b32_e32 v55, 0x800, v55
	v_add_u32_e32 v114, v161, v114
	s_or_b64 s[34:35], vcc, s[34:35]
	v_mov_b32_e32 v14, 1
	s_andn2_b64 exec, exec, s[34:35]
	s_cbranch_execz .LBB2_401
.LBB2_363:
	v_and_b32_e32 v4, 8, v55
	v_and_b32_e32 v5, 12, v55
	v_cmp_eq_u32_e32 vcc, 0, v4
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_cbranch_execz .LBB2_375
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v12, s[14:15], v36, v4
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]
	v_add_co_u32_e64 v10, s[14:15], 2, v28
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_cbranch_execz .LBB2_374
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v5, 0
	s_branch .LBB2_368
.LBB2_366:
	s_or_b64 exec, exec, s[42:43]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v16, s[14:15], v36, v4
	v_addc_co_u32_e64 v17, s[14:15], 0, v37, s[14:15]
	v_cmp_ge_u64_e64 s[14:15], v[16:17], v[10:11]
	s_orn2_b64 s[42:43], s[14:15], exec
.LBB2_367:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], exec, s[42:43]
	s_or_b64 s[40:41], s[14:15], s[40:41]
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execz .LBB2_373
.LBB2_368:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v5, 1, v5
	v_and_b32_e32 v15, 64, v55
	v_cmp_eq_u32_e64 s[14:15], 0, v15
	v_cmp_eq_u32_e64 s[16:17], s52, v5
	s_and_b64 s[14:15], s[14:15], s[16:17]
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_370
	ds_read_b64 v[16:17], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v5, v[16:17] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]
	v_lshl_or_b32 v55, v5, 6, v55
	v_and_b32_e32 v15, 64, v55
	v_mov_b32_e32 v5, 0
.LBB2_370:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_eq_u32_e64 s[14:15], 0, v15
	s_mov_b64 s[42:43], -1
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_367
	v_cmp_eq_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[42:43], s[14:15]
	s_cbranch_execz .LBB2_366
	ds_read_b64 v[16:17], v53 offset:1288
	v_mov_b32_e32 v19, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e32 v18, v4, v36
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v15, v[16:17], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[16:17], v53 offset:1280
	v_and_b32_e32 v15, 0x1fff, v15
	v_lshlrev_b32_e32 v15, 5, v15
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e64 v20, s[14:15], v16, v15
	v_addc_co_u32_e64 v21, s[14:15], 0, v17, s[14:15]
	flat_store_byte v[20:21], v19 offset:1
	s_memrealtime s[14:15]
	v_ashrrev_i32_e32 v19, 31, v18
	flat_store_short v[20:21], v147 offset:2
	flat_store_dword v[20:21], v24 offset:4
	flat_store_dwordx2 v[20:21], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v16, s14
	v_mov_b32_e32 v17, s15
	flat_store_dwordx4 v[20:21], v[16:19] offset:8
	flat_store_byte v[20:21], v148
	s_branch .LBB2_366
.LBB2_373:
	s_or_b64 exec, exec, s[40:41]
.LBB2_374:
	s_or_b64 exec, exec, s[38:39]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_375:
	s_or_b64 exec, exec, s[36:37]
	v_and_b32_e32 v4, 12, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_383
	v_and_b32_e32 v4, 0x100, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_xor_b64 s[36:37], vcc, -1
	s_and_b64 s[14:15], s[36:37], s[14:15]
	v_and_b32_e32 v52, 7, v28
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_cbranch_execz .LBB2_378
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v8, v4
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[4:5], v53
.LBB2_378:
	s_or_b64 exec, exec, s[36:37]
	v_and_b32_e32 v4, 0x80, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_xor_b64 s[36:37], exec, s[36:37]
	s_cbranch_execz .LBB2_380
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v30, v4
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]
	flat_load_dwordx2 v[4:5], v[4:5] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshrrev_b64 v[4:5], 2, v[4:5]
.LBB2_380:
	s_andn2_saveexec_b64 s[14:15], s[36:37]
	v_mad_i64_i32 v[4:5], s[36:37], v52, s24, 0
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_cndmask_b32_e32 v10, v149, v147, vcc
	v_add_co_u32_e32 v4, vcc, v38, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_lshl_add_u32 v10, v3, 3, v10
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v10, v[4:5] offset:8
.LBB2_383:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_386
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_389
.LBB2_385:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_390
	s_branch .LBB2_395
.LBB2_386:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[36:37], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_388
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[36:37], exec, -1
.LBB2_388:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[36:37], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_385
.LBB2_389:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_395
.LBB2_390:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_395
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_394
	s_mov_b64 s[36:37], 0
.LBB2_393:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[36:37], vcc, s[36:37]
	s_andn2_b64 exec, exec, s[36:37]
	s_cbranch_execnz .LBB2_393
.LBB2_394:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_395:
	s_or_b64 exec, exec, s[14:15]
	v_sub_u32_e32 v4, v160, v114
	v_min_i32_e32 v161, v161, v4
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	v_cmp_lt_i32_e64 s[14:15], 0, v161
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 s[16:17], s[14:15], s[6:7]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_397
	;;#ASMSTART
	s_waitcnt vmcnt(0) lgkmcnt(0); buffer_wbinvl1_vol
	;;#ASMEND
.LBB2_397:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_xor_b64 s[14:15], s[8:9], -1
	s_and_b64 s[16:17], vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_399
	v_mov_b32_e32 v4, 1
	v_mov_b32_e32 v5, 0
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[34:35], v[4:5]
.LBB2_399:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 48, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_362
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
	s_branch .LBB2_362
.LBB2_401:
	s_or_b64 exec, exec, s[34:35]
	s_or_b64 exec, exec, s[30:31]
	s_andn2_b64 vcc, exec, s[26:27]
	s_cbranch_vccnz .LBB2_525
.LBB2_402:
	s_mov_b32 s53, 1
.LBB2_403:
	s_sub_i32 s14, s47, s53
	s_cmp_le_i32 s25, s14
	s_cselect_b32 s15, s25, 0
	s_sub_i32 s14, s14, s15
	s_ashr_i32 s15, s14, 31
	v_mov_b32_e32 v4, s15
	v_add_co_u32_e32 v5, vcc, s14, v54
	v_addc_co_u32_e32 v4, vcc, v4, v49, vcc
	v_mul_lo_u32 v10, v5, v113
	v_mul_lo_u32 v11, v4, v112
	v_mad_u64_u32 v[4:5], s[14:15], v5, v112, v[102:103]
	v_add3_u32 v5, v11, v5, v10
	v_sub_co_u32_e32 v10, vcc, v26, v4
	v_subb_co_u32_e32 v11, vcc, v27, v5, vcc
	v_cmp_lt_i64_e32 vcc, v[112:113], v[10:11]
	v_cndmask_b32_e32 v10, v10, v112, vcc
	v_max_i32_e32 v114, 0, v10
	v_add_u32_e32 v11, 31, v114
	v_ashrrev_i32_e32 v12, 31, v11
	v_lshrrev_b32_e32 v12, 27, v12
	v_add_u32_e32 v11, v11, v12
	v_ashrrev_i32_e32 v11, 5, v11
	v_lshlrev_b32_e32 v11, 4, v11
	v_cmp_lt_i32_e32 vcc, 0, v10
	v_max_i32_e32 v115, s48, v11
	s_and_b64 s[14:15], s[28:29], vcc
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v14, 0
	s_and_saveexec_b64 s[30:31], s[14:15]
	s_cbranch_execnz .LBB2_406
	s_or_b64 exec, exec, s[30:31]
	v_cmp_gt_i32_e32 vcc, 2, v14
	s_and_saveexec_b64 s[30:31], vcc
	s_cbranch_execnz .LBB2_483
.LBB2_405:
	s_or_b64 exec, exec, s[30:31]
	s_add_i32 s14, s53, 1
	s_cmp_eq_u32 s53, s50
	s_cbranch_scc0 .LBB2_524
	s_branch .LBB2_525
.LBB2_406:
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_add_co_u32_e32 v116, vcc, v38, v4
	v_addc_co_u32_e32 v117, vcc, v1, v5, vcc
	s_mov_b32 s54, 1
	s_mov_b64 s[36:37], -1
	s_mov_b64 s[34:35], 0
	v_mov_b32_e32 v16, 0
	s_branch .LBB2_408
.LBB2_407:
	s_or_b64 exec, exec, s[14:15]
	v_add_u32_e32 v16, v115, v16
	v_cmp_ge_i32_e32 vcc, v16, v114
	s_xor_b64 s[14:15], s[36:37], -1
	s_or_b64 s[14:15], s[14:15], vcc
	s_and_b64 s[14:15], exec, s[14:15]
	v_or_b32_e32 v55, 0x800, v55
	s_or_b64 s[34:35], s[14:15], s[34:35]
	s_mov_b64 s[36:37], 0
	v_mov_b32_e32 v14, s54
	s_mov_b32 s54, 2
	s_andn2_b64 exec, exec, s[34:35]
	s_cbranch_execz .LBB2_482
.LBB2_408:
	v_and_b32_e32 v4, 2, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_410
	v_ashrrev_i32_e32 v17, 31, v16
	v_lshlrev_b64 v[4:5], 2, v[16:17]
	v_add_co_u32_e32 v4, vcc, v116, v4
	v_addc_co_u32_e32 v5, vcc, v117, v5, vcc
	ds_write_b64 v53, v[4:5] offset:176
.LBB2_410:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 8, v55
	v_and_b32_e32 v5, 12, v55
	v_cmp_eq_u32_e32 vcc, 0, v4
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_cbranch_execz .LBB2_422
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v12, s[14:15], v36, v4
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]
	v_add_co_u32_e64 v10, s[14:15], 2, v28
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]
	s_and_saveexec_b64 s[40:41], s[14:15]
	s_cbranch_execz .LBB2_421
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[42:43], 0
	v_mov_b32_e32 v5, 0
	s_branch .LBB2_415
.LBB2_413:
	s_or_b64 exec, exec, s[44:45]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v14, s[14:15], v36, v4
	v_addc_co_u32_e64 v15, s[14:15], 0, v37, s[14:15]
	v_cmp_ge_u64_e64 s[14:15], v[14:15], v[10:11]
	s_orn2_b64 s[44:45], s[14:15], exec
.LBB2_414:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], exec, s[44:45]
	s_or_b64 s[42:43], s[14:15], s[42:43]
	s_andn2_b64 exec, exec, s[42:43]
	s_cbranch_execz .LBB2_420
.LBB2_415:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v5, 1, v5
	v_and_b32_e32 v14, 64, v55
	v_cmp_eq_u32_e64 s[14:15], 0, v14
	v_cmp_eq_u32_e64 s[16:17], s52, v5
	s_and_b64 s[14:15], s[14:15], s[16:17]
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_417
	ds_read_b64 v[14:15], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v5, v[14:15] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]
	v_lshl_or_b32 v55, v5, 6, v55
	v_and_b32_e32 v14, 64, v55
	v_mov_b32_e32 v5, 0
.LBB2_417:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_eq_u32_e64 s[14:15], 0, v14
	s_mov_b64 s[44:45], -1
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_414
	v_cmp_eq_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[44:45], s[14:15]
	s_cbranch_execz .LBB2_413
	ds_read_b64 v[14:15], v53 offset:1288
	v_mov_b32_e32 v18, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e32 v20, v4, v36
	v_ashrrev_i32_e32 v21, 31, v20
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v17, v[14:15], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[14:15], v53 offset:1280
	v_and_b32_e32 v17, 0x1fff, v17
	v_lshlrev_b32_e32 v17, 5, v17
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e64 v14, s[14:15], v14, v17
	v_addc_co_u32_e64 v15, s[14:15], 0, v15, s[14:15]
	flat_store_byte v[14:15], v18 offset:1
	s_memrealtime s[14:15]
	flat_store_short v[14:15], v147 offset:2
	flat_store_dword v[14:15], v24 offset:4
	flat_store_dwordx2 v[14:15], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v18, s14
	v_mov_b32_e32 v19, s15
	flat_store_dwordx4 v[14:15], v[18:21] offset:8
	flat_store_byte v[14:15], v148
	s_branch .LBB2_413
.LBB2_420:
	s_or_b64 exec, exec, s[42:43]
.LBB2_421:
	s_or_b64 exec, exec, s[40:41]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_422:
	s_or_b64 exec, exec, s[38:39]
	v_sub_u32_e32 v4, v114, v16
	v_min_i32_e32 v115, v115, v4
	v_and_b32_e32 v4, 12, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_432
	v_and_b32_e32 v4, 0x100, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_xor_b64 s[38:39], vcc, -1
	s_and_b64 s[14:15], s[38:39], s[14:15]
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_xor_b64 s[38:39], exec, s[38:39]
	s_cbranch_execz .LBB2_425
	v_and_b32_e32 v52, 7, v28
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v8, v4
	v_lshlrev_b32_e32 v10, 2, v115
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[4:5], v10
.LBB2_425:
	s_andn2_saveexec_b64 s[14:15], s[38:39]
	v_and_b32_e32 v52, 7, v28
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 0x80, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_xor_b64 s[38:39], exec, s[38:39]
	s_cbranch_execz .LBB2_429
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v30, v4
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]
	flat_load_dwordx2 v[4:5], v[4:5] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshrrev_b64 v[4:5], 2, v[4:5]
.LBB2_429:
	s_andn2_saveexec_b64 s[14:15], s[38:39]
	v_mul_lo_u32 v10, v53, s24
	v_mul_lo_u32 v11, v52, s13
	v_mad_u64_u32 v[4:5], s[38:39], v52, s24, 0
	v_add3_u32 v5, v5, v11, v10
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_cndmask_b32_e32 v10, v151, v147, vcc
	v_add_co_u32_e32 v4, vcc, v38, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_lshl_add_u32 v10, v3, 3, v10
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v10, v[4:5]
.LBB2_432:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_435
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_438
.LBB2_434:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_439
	s_branch .LBB2_444
.LBB2_435:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_437
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_437:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_434
.LBB2_438:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_444
.LBB2_439:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_444
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_443
	s_mov_b64 s[38:39], 0
.LBB2_442:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_442
.LBB2_443:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_444:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_lt_i32_e32 vcc, 0, v115
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_464
	ds_read_b64 v[18:19], v53 offset:112
	ds_read_b128 v[10:13], v53 offset:176
	v_mov_b32_e32 v21, 0
	s_mov_b64 s[38:39], -1
	v_mov_b32_e32 v17, v115
	s_waitcnt lgkmcnt(0)
	v_or_b32_e32 v4, v10, v18
	v_or_b32_e32 v4, v4, v12
	v_and_b32_e32 v20, 3, v4
	v_cmp_ne_u64_e32 vcc, 0, v[20:21]
	s_cbranch_vccz .LBB2_447
	s_and_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_458
	s_branch .LBB2_464
.LBB2_447:
	v_lshrrev_b32_e32 v4, 2, v115
	v_and_b32_e32 v17, 0x3fffff80, v4
	v_cmp_lt_u32_e32 vcc, v68, v17
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_450
	v_lshlrev_b64 v[14:15], 4, v[68:69]
	v_add_co_u32_e32 v4, vcc, v10, v14
	v_addc_co_u32_e32 v5, vcc, v11, v15, vcc
	v_add_co_u32_e32 v14, vcc, v12, v14
	v_addc_co_u32_e32 v15, vcc, v13, v15, vcc
	v_lshlrev_b64 v[20:21], 2, v[82:83]
	v_add_co_u32_e32 v20, vcc, v18, v20
	v_addc_co_u32_e32 v21, vcc, v19, v21, vcc
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v22, v68
.LBB2_449:
	flat_load_dwordx4 v[160:163], v[20:21] glc slc
	flat_load_dwordx4 v[164:167], v[20:21] offset:1024 glc slc
	v_add_co_u32_e32 v20, vcc, v20, v80
	v_add_u32_e32 v22, v22, v50
	v_addc_co_u32_e32 v21, vcc, v21, v81, vcc
	v_lshlrev_b64 v[176:177], 4, v[50:51]
	v_cmp_ge_u32_e32 vcc, v22, v17
	s_or_b64 s[38:39], vcc, s[38:39]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx4 v[4:5], v[160:163] glc slc
	flat_store_dwordx4 v[4:5], v[164:167] offset:1024 glc slc
	flat_store_dwordx4 v[14:15], v[160:163] glc slc
	flat_store_dwordx4 v[14:15], v[164:167] offset:1024 glc slc
	v_add_co_u32_e32 v4, vcc, v4, v176
	v_addc_co_u32_e32 v5, vcc, v5, v177, vcc
	v_add_co_u32_e32 v14, vcc, v14, v176
	v_addc_co_u32_e32 v15, vcc, v15, v177, vcc
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_449
.LBB2_450:
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b32_e32 v52, 2, v17
	v_cmp_ne_u32_e32 vcc, v115, v52
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v17, 0
	v_mov_b32_e32 v21, 0
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_457
	v_sub_u32_e32 v22, v115, v52
	v_ashrrev_i32_e32 v17, 2, v22
	v_cmp_lt_i32_e32 vcc, v24, v17
	s_and_saveexec_b64 s[38:39], vcc
	s_cbranch_execz .LBB2_454
	v_lshlrev_b64 v[14:15], 2, v[52:53]
	v_add_co_u32_e32 v4, vcc, v18, v14
	v_addc_co_u32_e32 v5, vcc, v19, v15, vcc
	v_lshlrev_b64 v[160:161], 4, v[24:25]
	v_add_co_u32_e32 v20, vcc, v4, v160
	v_addc_co_u32_e32 v21, vcc, v5, v161, vcc
	v_add_co_u32_e32 v4, vcc, v10, v14
	v_addc_co_u32_e32 v5, vcc, v11, v15, vcc
	v_add_co_u32_e32 v4, vcc, v4, v160
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc
	v_add_co_u32_e32 v14, vcc, v12, v14
	v_addc_co_u32_e32 v15, vcc, v13, v15, vcc
	v_add_co_u32_e32 v14, vcc, v14, v160
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v23, v24
.LBB2_453:
	flat_load_dwordx4 v[160:163], v[20:21] glc slc
	v_lshlrev_b64 v[164:165], 4, v[32:33]
	v_add_co_u32_e32 v20, vcc, v20, v164
	v_add_u32_e32 v23, v23, v32
	v_addc_co_u32_e32 v21, vcc, v21, v165, vcc
	v_cmp_ge_i32_e32 vcc, v23, v17
	s_or_b64 s[40:41], vcc, s[40:41]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx4 v[4:5], v[160:163] glc slc
	flat_store_dwordx4 v[14:15], v[160:163] glc slc
	v_add_co_u32_e32 v4, vcc, v4, v164
	v_addc_co_u32_e32 v5, vcc, v5, v165, vcc
	v_add_co_u32_e32 v14, vcc, v14, v164
	v_addc_co_u32_e32 v15, vcc, v15, v165, vcc
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execnz .LBB2_453
.LBB2_454:
	s_or_b64 exec, exec, s[38:39]
	v_and_b32_e32 v4, 3, v22
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v17, 0
	s_and_saveexec_b64 s[40:41], vcc
	v_and_b32_e32 v5, -4, v22
	s_mov_b64 s[38:39], exec
	v_add_u32_e32 v52, v5, v52
	v_mov_b32_e32 v17, v4
	s_or_b64 exec, exec, s[40:41]
	s_and_b64 s[38:39], s[38:39], exec
	v_mov_b32_e32 v21, v52
.LBB2_457:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 exec, exec, s[38:39]
	s_cbranch_execz .LBB2_464
.LBB2_458:
	v_and_b32_e32 v20, 0xffffff00, v17
	v_cmp_lt_i32_e32 vcc, v66, v20
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_461
	v_lshlrev_b64 v[14:15], 2, v[66:67]
	v_ashrrev_i32_e32 v5, 31, v21
	v_mov_b32_e32 v4, v21
	v_add_co_u32_e32 v22, vcc, v18, v14
	v_addc_co_u32_e32 v23, vcc, v19, v15, vcc
	v_lshlrev_b64 v[160:161], 2, v[4:5]
	v_add_co_u32_e32 v22, vcc, v22, v160
	v_addc_co_u32_e32 v23, vcc, v23, v161, vcc
	v_add_co_u32_e32 v4, vcc, v10, v14
	v_addc_co_u32_e32 v5, vcc, v11, v15, vcc
	v_add_co_u32_e32 v4, vcc, v4, v160
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc
	v_add_co_u32_e32 v14, vcc, v12, v14
	v_addc_co_u32_e32 v15, vcc, v13, v15, vcc
	v_add_co_u32_e32 v14, vcc, v14, v160
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v52, v66
.LBB2_460:
	flat_load_dword v162, v[22:23] glc slc
	flat_load_dword v163, v[22:23] offset:256 glc slc
	flat_load_dword v164, v[22:23] offset:512 glc slc
	flat_load_dword v165, v[22:23] offset:768 glc slc
	v_add_co_u32_e32 v22, vcc, v22, v84
	v_add_u32_e32 v52, v52, v64
	v_addc_co_u32_e32 v23, vcc, v23, v85, vcc
	v_lshlrev_b64 v[160:161], 2, v[64:65]
	v_cmp_ge_i32_e32 vcc, v52, v20
	s_or_b64 s[38:39], vcc, s[38:39]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[4:5], v162 glc slc
	flat_store_dword v[4:5], v163 offset:256 glc slc
	flat_store_dword v[4:5], v164 offset:512 glc slc
	flat_store_dword v[4:5], v165 offset:768 glc slc
	flat_store_dword v[14:15], v162 glc slc
	flat_store_dword v[14:15], v163 offset:256 glc slc
	flat_store_dword v[14:15], v164 offset:512 glc slc
	flat_store_dword v[14:15], v165 offset:768 glc slc
	v_add_co_u32_e32 v4, vcc, v4, v160
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc
	v_add_co_u32_e32 v14, vcc, v14, v160
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_460
.LBB2_461:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v17, 0xff, v17
	v_cmp_ne_u32_e32 vcc, 0, v17
	v_cmp_lt_u32_e64 s[14:15], v24, v17
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB2_464
	v_add_u32_e32 v4, v20, v21
	v_lshlrev_b64 v[20:21], 2, v[24:25]
	v_ashrrev_i32_e32 v5, 31, v4
	v_add_co_u32_e32 v14, vcc, v18, v20
	v_addc_co_u32_e32 v15, vcc, v19, v21, vcc
	v_lshlrev_b64 v[18:19], 2, v[4:5]
	v_add_co_u32_e32 v14, vcc, v14, v18
	v_addc_co_u32_e32 v15, vcc, v15, v19, vcc
	v_add_co_u32_e32 v4, vcc, v10, v20
	v_addc_co_u32_e32 v5, vcc, v11, v21, vcc
	v_add_co_u32_e32 v4, vcc, v4, v18
	v_addc_co_u32_e32 v5, vcc, v5, v19, vcc
	v_add_co_u32_e32 v10, vcc, v12, v20
	v_addc_co_u32_e32 v11, vcc, v13, v21, vcc
	v_add_co_u32_e32 v10, vcc, v10, v18
	v_addc_co_u32_e32 v11, vcc, v11, v19, vcc
	s_mov_b64 s[14:15], 0
	v_mov_b32_e32 v12, v24
.LBB2_463:
	flat_load_dword v13, v[14:15] glc slc
	v_add_co_u32_e32 v14, vcc, v14, v64
	v_add_u32_e32 v12, v12, v32
	v_addc_co_u32_e32 v15, vcc, 0, v15, vcc
	v_lshlrev_b64 v[18:19], 2, v[32:33]
	v_cmp_ge_u32_e32 vcc, v12, v17
	s_or_b64 s[14:15], vcc, s[14:15]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[4:5], v13 glc slc
	flat_store_dword v[10:11], v13 glc slc
	v_add_co_u32_e32 v4, vcc, v4, v18
	v_addc_co_u32_e32 v5, vcc, v5, v19, vcc
	v_add_co_u32_e32 v10, vcc, v10, v18
	v_addc_co_u32_e32 v11, vcc, v11, v19, vcc
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execnz .LBB2_463
.LBB2_464:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_467
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_470
.LBB2_466:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_471
	s_branch .LBB2_476
.LBB2_467:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_469
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_469:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_466
.LBB2_470:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_476
.LBB2_471:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_476
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_475
	s_mov_b64 s[38:39], 0
.LBB2_474:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_474
.LBB2_475:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_476:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_b64 s[16:17], vcc, s[6:7]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_478
	;;#ASMSTART
	s_waitcnt vmcnt(0) lgkmcnt(0); buffer_wbinvl1_vol
	;;#ASMEND
.LBB2_478:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_xor_b64 s[14:15], s[8:9], -1
	s_and_b64 s[16:17], vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_480
	v_mov_b32_e32 v4, 1
	v_mov_b32_e32 v5, 0
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[34:35], v[4:5]
.LBB2_480:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 48, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_407
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
	s_branch .LBB2_407
.LBB2_482:
	s_or_b64 exec, exec, s[34:35]
	s_or_b64 exec, exec, s[30:31]
	v_cmp_gt_i32_e32 vcc, 2, v14
	s_and_saveexec_b64 s[30:31], vcc
	s_cbranch_execz .LBB2_405
.LBB2_483:
	s_mov_b64 s[34:35], 0
	s_branch .LBB2_485
.LBB2_484:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_ne_u32_e32 vcc, 0, v14
	v_or_b32_e32 v55, 0x800, v55
	v_add_u32_e32 v16, v115, v16
	s_or_b64 s[34:35], vcc, s[34:35]
	v_mov_b32_e32 v14, 1
	s_andn2_b64 exec, exec, s[34:35]
	s_cbranch_execz .LBB2_523
.LBB2_485:
	v_and_b32_e32 v4, 8, v55
	v_and_b32_e32 v5, 12, v55
	v_cmp_eq_u32_e32 vcc, 0, v4
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_cbranch_execz .LBB2_497
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v12, s[14:15], v36, v4
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]
	v_add_co_u32_e64 v10, s[14:15], 2, v28
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]
	s_and_saveexec_b64 s[38:39], s[14:15]
	s_cbranch_execz .LBB2_496
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v5, 0
	s_branch .LBB2_490
.LBB2_488:
	s_or_b64 exec, exec, s[42:43]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_co_u32_e64 v18, s[14:15], v36, v4
	v_addc_co_u32_e64 v19, s[14:15], 0, v37, s[14:15]
	v_cmp_ge_u64_e64 s[14:15], v[18:19], v[10:11]
	s_orn2_b64 s[42:43], s[14:15], exec
.LBB2_489:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[14:15], exec, s[42:43]
	s_or_b64 s[40:41], s[14:15], s[40:41]
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execz .LBB2_495
.LBB2_490:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v5, 1, v5
	v_and_b32_e32 v15, 64, v55
	v_cmp_eq_u32_e64 s[14:15], 0, v15
	v_cmp_eq_u32_e64 s[16:17], s52, v5
	s_and_b64 s[14:15], s[14:15], s[16:17]
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_492
	ds_read_b64 v[18:19], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v5, v[18:19] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e64 s[14:15], 0, v5
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]
	v_lshl_or_b32 v55, v5, 6, v55
	v_and_b32_e32 v15, 64, v55
	v_mov_b32_e32 v5, 0
.LBB2_492:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_eq_u32_e64 s[14:15], 0, v15
	s_mov_b64 s[42:43], -1
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_489
	v_cmp_eq_u32_e64 s[14:15], 0, v5
	s_and_saveexec_b64 s[42:43], s[14:15]
	s_cbranch_execz .LBB2_488
	ds_read_b64 v[18:19], v53 offset:1288
	v_mov_b32_e32 v17, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_add_u32_e32 v20, v4, v36
	v_ashrrev_i32_e32 v21, 31, v20
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v15, v[18:19], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[18:19], v53 offset:1280
	v_and_b32_e32 v15, 0x1fff, v15
	v_lshlrev_b32_e32 v15, 5, v15
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e64 v22, s[14:15], v18, v15
	v_addc_co_u32_e64 v23, s[14:15], 0, v19, s[14:15]
	flat_store_byte v[22:23], v17 offset:1
	s_memrealtime s[14:15]
	flat_store_short v[22:23], v147 offset:2
	flat_store_dword v[22:23], v24 offset:4
	flat_store_dwordx2 v[22:23], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v18, s14
	v_mov_b32_e32 v19, s15
	flat_store_dwordx4 v[22:23], v[18:21] offset:8
	flat_store_byte v[22:23], v148
	s_branch .LBB2_488
.LBB2_495:
	s_or_b64 exec, exec, s[40:41]
.LBB2_496:
	s_or_b64 exec, exec, s[38:39]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_497:
	s_or_b64 exec, exec, s[36:37]
	v_and_b32_e32 v4, 12, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_505
	v_and_b32_e32 v4, 0x100, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_xor_b64 s[36:37], vcc, -1
	s_and_b64 s[14:15], s[36:37], s[14:15]
	v_and_b32_e32 v52, 7, v28
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_cbranch_execz .LBB2_500
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v8, v4
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[4:5], v53
.LBB2_500:
	s_or_b64 exec, exec, s[36:37]
	v_and_b32_e32 v4, 0x80, v55
	v_cmp_ne_u32_e64 s[14:15], 0, v4
	s_and_saveexec_b64 s[36:37], s[14:15]
	s_xor_b64 s[36:37], exec, s[36:37]
	s_cbranch_execz .LBB2_502
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e64 v4, s[14:15], v30, v4
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]
	flat_load_dwordx2 v[4:5], v[4:5] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshrrev_b64 v[4:5], 2, v[4:5]
.LBB2_502:
	s_andn2_saveexec_b64 s[14:15], s[36:37]
	v_mad_i64_i32 v[4:5], s[36:37], v52, s24, 0
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_cndmask_b32_e32 v10, v151, v147, vcc
	v_add_co_u32_e32 v4, vcc, v38, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_lshl_add_u32 v10, v3, 3, v10
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v10, v[4:5]
.LBB2_505:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[16:17], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_508
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_511
.LBB2_507:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execnz .LBB2_512
	s_branch .LBB2_517
.LBB2_508:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[36:37], -1
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_510
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[36:37], exec, -1
.LBB2_510:
	s_or_b64 exec, exec, s[16:17]
	s_and_b64 s[16:17], s[36:37], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_507
.LBB2_511:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[16:17], s[16:17], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[16:17], s[16:17], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_517
.LBB2_512:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_517
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_516
	s_mov_b64 s[36:37], 0
.LBB2_515:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[36:37], vcc, s[36:37]
	s_andn2_b64 exec, exec, s[36:37]
	s_cbranch_execnz .LBB2_515
.LBB2_516:
	s_or_b64 exec, exec, s[16:17]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_517:
	s_or_b64 exec, exec, s[14:15]
	v_sub_u32_e32 v4, v114, v16
	v_min_i32_e32 v115, v115, v4
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	v_cmp_lt_i32_e64 s[14:15], 0, v115
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 s[16:17], s[14:15], s[6:7]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_519
	;;#ASMSTART
	s_waitcnt vmcnt(0) lgkmcnt(0); buffer_wbinvl1_vol
	;;#ASMEND
.LBB2_519:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 16, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_xor_b64 s[14:15], s[8:9], -1
	s_and_b64 s[16:17], vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], s[16:17]
	s_cbranch_execz .LBB2_521
	v_mov_b32_e32 v4, 1
	v_mov_b32_e32 v5, 0
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[34:35], v[4:5]
.LBB2_521:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 48, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_484
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
	s_branch .LBB2_484
.LBB2_523:
	s_or_b64 exec, exec, s[34:35]
	s_or_b64 exec, exec, s[30:31]
	s_add_i32 s14, s53, 1
	s_cmp_eq_u32 s53, s50
	s_cbranch_scc1 .LBB2_525
.LBB2_524:
	s_mov_b32 s53, s14
	s_branch .LBB2_403
.LBB2_525:
	v_mad_u64_u32 v[4:5], s[14:15], v112, v135, v[102:103]
	v_mul_lo_u32 v10, v112, v144
	v_mul_lo_u32 v11, v113, v135
	v_add3_u32 v5, v11, v5, v10
	v_sub_co_u32_e32 v10, vcc, v26, v4
	v_subb_co_u32_e32 v11, vcc, v27, v5, vcc
	v_cmp_lt_i64_e32 vcc, v[112:113], v[10:11]
	v_cndmask_b32_e32 v10, v10, v112, vcc
	v_cmp_lt_i32_e32 vcc, 0, v10
	s_and_b64 s[14:15], s[28:29], vcc
	v_mov_b32_e32 v12, 0
	s_and_saveexec_b64 s[16:17], s[14:15]
	s_cbranch_execz .LBB2_595
	v_max_i32_e32 v18, 0, v10
	v_add_u32_e32 v10, 31, v18
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshrrev_b32_e32 v11, 27, v11
	v_add_u32_e32 v10, v10, v11
	v_ashrrev_i32_e32 v10, 5, v10
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_lshlrev_b32_e32 v10, 4, v10
	v_add_co_u32_e32 v20, vcc, v38, v4
	v_max_i32_e32 v19, s48, v10
	v_addc_co_u32_e32 v21, vcc, v1, v5, vcc
	s_mov_b32 s44, 1
	s_mov_b64 s[34:35], -1
	s_mov_b64 s[30:31], 0
	v_mov_b32_e32 v4, 0
	s_branch .LBB2_528
.LBB2_527:
	s_or_b64 exec, exec, s[14:15]
	v_add_u32_e32 v4, v19, v4
	v_cmp_ge_i32_e32 vcc, v4, v18
	s_xor_b64 s[14:15], s[34:35], -1
	s_or_b64 s[14:15], s[14:15], vcc
	s_and_b64 s[14:15], exec, s[14:15]
	v_or_b32_e32 v55, 0x800, v55
	s_or_b64 s[30:31], s[14:15], s[30:31]
	s_mov_b64 s[34:35], 0
	v_mov_b32_e32 v12, s44
	s_mov_b32 s44, 2
	s_andn2_b64 exec, exec, s[30:31]
	s_cbranch_execz .LBB2_594
.LBB2_528:
	v_and_b32_e32 v5, 2, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_530
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshlrev_b64 v[10:11], 2, v[4:5]
	v_add_co_u32_e32 v10, vcc, v20, v10
	v_addc_co_u32_e32 v11, vcc, v21, v11, vcc
	ds_write_b64 v53, v[10:11] offset:176
.LBB2_530:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v5, 4, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_mov_b64 s[14:15], -1
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB2_542
	v_add_co_u32_e32 v10, vcc, 2, v28
	v_addc_co_u32_e32 v11, vcc, 0, v29, vcc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[36:37], v[10:11]
	v_mov_b32_e32 v5, 1
	s_and_saveexec_b64 s[38:39], vcc
	s_cbranch_execz .LBB2_541
	v_add_u32_e32 v12, 2, v28
	v_ashrrev_i32_e32 v13, 31, v12
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v5, 0
	s_branch .LBB2_535
.LBB2_533:
	s_or_b64 exec, exec, s[42:43]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[36:37], v[10:11]
	s_orn2_b64 s[42:43], vcc, exec
.LBB2_534:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[14:15], exec, s[42:43]
	s_or_b64 s[40:41], s[14:15], s[40:41]
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execz .LBB2_540
.LBB2_535:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v5, 1, v5
	v_and_b32_e32 v14, 64, v55
	v_cmp_eq_u32_e32 vcc, 0, v14
	v_cmp_eq_u32_e64 s[14:15], s52, v5
	s_and_b64 vcc, vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_537
	ds_read_b64 v[14:15], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v5, v[14:15] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e32 vcc, 0, v5
	v_cndmask_b32_e64 v5, 0, 1, vcc
	v_lshl_or_b32 v55, v5, 6, v55
	v_and_b32_e32 v14, 64, v55
	v_mov_b32_e32 v5, 0
.LBB2_537:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_eq_u32_e32 vcc, 0, v14
	s_mov_b64 s[42:43], -1
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_534
	v_cmp_eq_u32_e32 vcc, 0, v5
	s_and_saveexec_b64 s[42:43], vcc
	s_cbranch_execz .LBB2_533
	ds_read_b64 v[14:15], v53 offset:1288
	v_mov_b32_e32 v52, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v17, 31, v36
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v16, v[14:15], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[14:15], v53 offset:1280
	v_and_b32_e32 v16, 0x1fff, v16
	v_lshlrev_b32_e32 v16, 5, v16
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v22, vcc, v14, v16
	v_addc_co_u32_e32 v23, vcc, 0, v15, vcc
	flat_store_byte v[22:23], v52 offset:1
	s_memrealtime vcc
	v_mov_b32_e32 v16, v36
	flat_store_short v[22:23], v147 offset:2
	flat_store_dword v[22:23], v24 offset:4
	flat_store_dwordx2 v[22:23], v[12:13] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v14, vcc_lo
	v_mov_b32_e32 v15, vcc_hi
	flat_store_dwordx4 v[22:23], v[14:17] offset:8
	flat_store_byte v[22:23], v148
	s_branch .LBB2_533
.LBB2_540:
	s_or_b64 exec, exec, s[40:41]
	v_and_b32_e32 v5, 4, v55
.LBB2_541:
	s_or_b64 exec, exec, s[38:39]
	v_cmp_eq_u32_e32 vcc, 0, v5
	s_orn2_b64 s[14:15], vcc, exec
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_542:
	s_or_b64 exec, exec, s[36:37]
	s_xor_b64 vcc, s[14:15], -1
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_548
	v_and_b32_e32 v5, 0x80, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	v_and_b32_e32 v52, 7, v28
	s_and_saveexec_b64 s[36:37], vcc
	s_xor_b64 s[36:37], exec, s[36:37]
	s_cbranch_execz .LBB2_545
	v_lshlrev_b64 v[10:11], 2, v[52:53]
	v_add_co_u32_e32 v10, vcc, v30, v10
	v_addc_co_u32_e32 v11, vcc, v31, v11, vcc
	flat_load_dwordx2 v[10:11], v[10:11] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v11, 31, v10
	v_lshrrev_b64 v[10:11], 2, v[10:11]
.LBB2_545:
	s_andn2_saveexec_b64 vcc, s[36:37]
	v_mad_i64_i32 v[10:11], s[36:37], v52, s24, 0
	s_or_b64 exec, exec, vcc
	v_lshlrev_b64 v[10:11], 2, v[10:11]
	v_add_co_u32_e32 v10, vcc, v38, v10
	v_addc_co_u32_e32 v11, vcc, v1, v11, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v145, v[10:11]
.LBB2_548:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[36:37], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_551
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_554
.LBB2_550:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[36:37]
	s_cbranch_execnz .LBB2_555
	s_branch .LBB2_560
.LBB2_551:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB2_553
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_553:
	s_or_b64 exec, exec, s[36:37]
	s_and_b64 s[36:37], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_550
.LBB2_554:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[36:37], s[36:37], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[36:37], s[36:37], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[36:37]
	s_cbranch_execz .LBB2_560
.LBB2_555:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_560
	ds_read_b64 v[10:11], v130
	v_mov_b32_e32 v12, 1
	v_mov_b32_e32 v13, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v10, vcc, v10, v0
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	ds_write_b64 v130, v[10:11]
	ds_add_u64 v53, v[12:13] offset:248
	ds_read_b64 v[12:13], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB2_559
	s_mov_b64 s[38:39], 0
.LBB2_558:
	s_sleep 1
	ds_read_b64 v[10:11], v53 offset:248
	ds_read_b64 v[12:13], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_558
.LBB2_559:
	s_or_b64 exec, exec, s[36:37]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_560:
	s_or_b64 exec, exec, s[14:15]
	v_sub_u32_e32 v5, v18, v4
	v_min_i32_e32 v19, v19, v5
	v_cmp_lt_i32_e32 vcc, 0, v19
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB2_580
	ds_read2_b64 v[10:13], v53 offset0:14 offset1:22
	v_mov_b32_e32 v15, 0
	s_mov_b64 s[38:39], -1
	v_mov_b32_e32 v16, v19
	s_waitcnt lgkmcnt(0)
	v_or_b32_e32 v5, v12, v10
	v_and_b32_e32 v14, 3, v5
	v_cmp_ne_u64_e32 vcc, 0, v[14:15]
	s_cbranch_vccz .LBB2_563
	s_and_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_574
	s_branch .LBB2_580
.LBB2_563:
	v_lshrrev_b32_e32 v5, 2, v19
	v_and_b32_e32 v5, 0x3fffff00, v5
	v_cmp_lt_u32_e32 vcc, v66, v5
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_566
	s_mov_b64 s[38:39], 0
	v_pk_mov_b32 v[14:15], v[12:13], v[12:13] op_sel:[0,1]
	v_pk_mov_b32 v[16:17], v[10:11], v[10:11] op_sel:[0,1]
	v_mov_b32_e32 v22, v66
.LBB2_565:
	v_add_co_u32_e32 v116, vcc, v16, v96
	v_addc_co_u32_e32 v117, vcc, 0, v17, vcc
	flat_load_dwordx4 v[112:115], v[116:117] glc slc
	flat_load_dwordx4 v[160:163], v[116:117] offset:1024 glc slc
	flat_load_dwordx4 v[164:167], v[116:117] offset:2048 glc slc
	flat_load_dwordx4 v[176:179], v[116:117] offset:3072 glc slc
	v_add_co_u32_e32 v116, vcc, v14, v96
	v_addc_co_u32_e32 v117, vcc, 0, v15, vcc
	v_add_co_u32_e32 v16, vcc, v16, v70
	v_addc_co_u32_e32 v17, vcc, v17, v71, vcc
	v_add_co_u32_e32 v14, vcc, v14, v70
	v_add_u32_e32 v22, v22, v64
	v_addc_co_u32_e32 v15, vcc, v15, v71, vcc
	v_cmp_ge_u32_e32 vcc, v22, v5
	s_or_b64 s[38:39], vcc, s[38:39]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx4 v[116:117], v[112:115] glc slc
	flat_store_dwordx4 v[116:117], v[160:163] offset:1024 glc slc
	flat_store_dwordx4 v[116:117], v[164:167] offset:2048 glc slc
	flat_store_dwordx4 v[116:117], v[176:179] offset:3072 glc slc
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_565
.LBB2_566:
	s_or_b64 exec, exec, s[14:15]
	v_lshlrev_b32_e32 v52, 2, v5
	v_cmp_ne_u32_e32 vcc, v19, v52
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v16, 0
	v_mov_b32_e32 v15, 0
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_573
	v_sub_u32_e32 v5, v19, v52
	v_ashrrev_i32_e32 v22, 2, v5
	v_cmp_lt_i32_e32 vcc, v24, v22
	s_and_saveexec_b64 s[38:39], vcc
	s_cbranch_execz .LBB2_570
	v_lshlrev_b64 v[16:17], 2, v[52:53]
	v_add_co_u32_e32 v14, vcc, v12, v16
	v_addc_co_u32_e32 v15, vcc, v13, v17, vcc
	v_lshlrev_b64 v[112:113], 4, v[24:25]
	v_add_co_u32_e32 v14, vcc, v14, v112
	v_addc_co_u32_e32 v15, vcc, v15, v113, vcc
	v_add_co_u32_e32 v16, vcc, v10, v16
	v_addc_co_u32_e32 v17, vcc, v11, v17, vcc
	v_add_co_u32_e32 v16, vcc, v16, v112
	v_addc_co_u32_e32 v17, vcc, v17, v113, vcc
	s_mov_b64 s[40:41], 0
	v_mov_b32_e32 v23, v24
.LBB2_569:
	flat_load_dwordx4 v[112:115], v[16:17] glc slc
	v_lshlrev_b64 v[116:117], 4, v[32:33]
	v_add_co_u32_e32 v16, vcc, v16, v116
	v_add_u32_e32 v23, v23, v32
	v_addc_co_u32_e32 v17, vcc, v17, v117, vcc
	v_cmp_ge_i32_e32 vcc, v23, v22
	s_or_b64 s[40:41], vcc, s[40:41]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx4 v[14:15], v[112:115] glc slc
	v_add_co_u32_e32 v14, vcc, v14, v116
	v_addc_co_u32_e32 v15, vcc, v15, v117, vcc
	s_andn2_b64 exec, exec, s[40:41]
	s_cbranch_execnz .LBB2_569
.LBB2_570:
	s_or_b64 exec, exec, s[38:39]
	v_and_b32_e32 v14, 3, v5
	v_cmp_ne_u32_e32 vcc, 0, v14
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v16, 0
	s_and_saveexec_b64 s[40:41], vcc
	v_and_b32_e32 v5, -4, v5
	s_mov_b64 s[38:39], exec
	v_add_u32_e32 v52, v5, v52
	v_mov_b32_e32 v16, v14
	s_or_b64 exec, exec, s[40:41]
	s_and_b64 s[38:39], s[38:39], exec
	v_mov_b32_e32 v15, v52
.LBB2_573:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 exec, exec, s[38:39]
	s_cbranch_execz .LBB2_580
.LBB2_574:
	v_and_b32_e32 v17, 0xfffffe00, v16
	v_cmp_lt_i32_e32 vcc, v132, v17
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_577
	v_ashrrev_i32_e32 v23, 31, v15
	v_mov_b32_e32 v22, v15
	v_lshlrev_b64 v[22:23], 2, v[22:23]
	v_add_co_u32_e32 v14, vcc, v98, v22
	v_addc_co_u32_e32 v5, vcc, 0, v23, vcc
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v22, v132
.LBB2_576:
	v_add_co_u32_e32 v112, vcc, v10, v14
	v_addc_co_u32_e32 v113, vcc, v11, v5, vcc
	flat_load_dword v23, v[112:113] glc slc
	flat_load_dword v52, v[112:113] offset:256 glc slc
	flat_load_dword v114, v[112:113] offset:512 glc slc
	flat_load_dword v115, v[112:113] offset:768 glc slc
	flat_load_dword v116, v[112:113] offset:1024 glc slc
	flat_load_dword v117, v[112:113] offset:1280 glc slc
	flat_load_dword v160, v[112:113] offset:1536 glc slc
	flat_load_dword v161, v[112:113] offset:1792 glc slc
	v_add_co_u32_e32 v112, vcc, v12, v14
	v_addc_co_u32_e32 v113, vcc, v13, v5, vcc
	v_add_co_u32_e32 v14, vcc, v14, v80
	v_add_u32_e32 v22, v22, v131
	v_addc_co_u32_e32 v5, vcc, v5, v81, vcc
	v_cmp_ge_i32_e32 vcc, v22, v17
	s_or_b64 s[38:39], vcc, s[38:39]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[112:113], v23 glc slc
	flat_store_dword v[112:113], v52 offset:256 glc slc
	flat_store_dword v[112:113], v114 offset:512 glc slc
	flat_store_dword v[112:113], v115 offset:768 glc slc
	flat_store_dword v[112:113], v116 offset:1024 glc slc
	flat_store_dword v[112:113], v117 offset:1280 glc slc
	flat_store_dword v[112:113], v160 offset:1536 glc slc
	flat_store_dword v[112:113], v161 offset:1792 glc slc
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_576
.LBB2_577:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v16, 0x1ff, v16
	v_cmp_ne_u32_e32 vcc, 0, v16
	v_cmp_lt_u32_e64 s[14:15], v24, v16
	s_and_b64 s[14:15], vcc, s[14:15]
	s_and_b64 exec, exec, s[14:15]
	s_cbranch_execz .LBB2_580
	v_add_u32_e32 v14, v17, v15
	v_ashrrev_i32_e32 v15, 31, v14
	v_lshlrev_b64 v[14:15], 2, v[14:15]
	v_add_co_u32_e32 v14, vcc, v100, v14
	v_addc_co_u32_e32 v5, vcc, 0, v15, vcc
	s_mov_b64 s[14:15], 0
	v_mov_b32_e32 v15, v24
.LBB2_579:
	v_add_co_u32_e32 v22, vcc, v10, v14
	v_addc_co_u32_e32 v23, vcc, v11, v5, vcc
	flat_load_dword v17, v[22:23] glc slc
	v_add_co_u32_e32 v22, vcc, v12, v14
	v_addc_co_u32_e32 v23, vcc, v13, v5, vcc
	v_add_co_u32_e32 v14, vcc, v14, v64
	v_add_u32_e32 v15, v15, v32
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	v_cmp_ge_u32_e32 vcc, v15, v16
	s_or_b64 s[14:15], vcc, s[14:15]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dword v[22:23], v17 glc slc
	s_andn2_b64 exec, exec, s[14:15]
	s_cbranch_execnz .LBB2_579
.LBB2_580:
	s_or_b64 exec, exec, s[36:37]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[36:37], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_583
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_586
.LBB2_582:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[36:37]
	s_cbranch_execnz .LBB2_587
	s_branch .LBB2_592
.LBB2_583:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[38:39], -1
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB2_585
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[38:39], exec, -1
.LBB2_585:
	s_or_b64 exec, exec, s[36:37]
	s_and_b64 s[36:37], s[38:39], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_582
.LBB2_586:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[36:37], s[36:37], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[36:37], s[36:37], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[36:37]
	s_cbranch_execz .LBB2_592
.LBB2_587:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_592
	ds_read_b64 v[10:11], v130
	v_mov_b32_e32 v12, 1
	v_mov_b32_e32 v13, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v10, vcc, v10, v0
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc
	ds_write_b64 v130, v[10:11]
	ds_add_u64 v53, v[12:13] offset:248
	ds_read_b64 v[12:13], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB2_591
	s_mov_b64 s[38:39], 0
.LBB2_590:
	s_sleep 1
	ds_read_b64 v[10:11], v53 offset:248
	ds_read_b64 v[12:13], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]
	s_or_b64 s[38:39], vcc, s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execnz .LBB2_590
.LBB2_591:
	s_or_b64 exec, exec, s[36:37]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_592:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v5, 32, v55
	v_cmp_ne_u32_e32 vcc, 0, v5
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_527
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
	s_branch .LBB2_527
.LBB2_594:
	s_or_b64 exec, exec, s[30:31]
.LBB2_595:
	s_or_b64 exec, exec, s[16:17]
	v_cmp_gt_i32_e32 vcc, 2, v12
	s_and_saveexec_b64 s[16:17], vcc
	s_cbranch_execz .LBB2_27
	s_mov_b64 s[30:31], 0
	s_branch .LBB2_598
.LBB2_597:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_ne_u32_e32 vcc, 0, v12
	v_or_b32_e32 v55, 0x800, v55
	s_or_b64 s[30:31], vcc, s[30:31]
	v_mov_b32_e32 v12, 1
	s_andn2_b64 exec, exec, s[30:31]
	s_cbranch_execz .LBB2_26
.LBB2_598:
	v_and_b32_e32 v4, 4, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_mov_b64 s[14:15], -1
	s_and_saveexec_b64 s[34:35], vcc
	s_cbranch_execz .LBB2_610
	v_add_co_u32_e32 v4, vcc, 2, v28
	v_addc_co_u32_e32 v5, vcc, 0, v29, vcc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[36:37], v[4:5]
	v_mov_b32_e32 v10, 1
	s_and_saveexec_b64 s[36:37], vcc
	s_cbranch_execz .LBB2_609
	v_add_u32_e32 v10, 2, v28
	v_ashrrev_i32_e32 v11, 31, v10
	s_mov_b64 s[38:39], 0
	v_mov_b32_e32 v13, 0
	s_branch .LBB2_603
.LBB2_601:
	s_or_b64 exec, exec, s[40:41]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[36:37], v[4:5]
	s_orn2_b64 s[40:41], vcc, exec
.LBB2_602:
	s_or_b64 exec, exec, s[14:15]
	s_and_b64 s[14:15], exec, s[40:41]
	s_or_b64 s[38:39], s[14:15], s[38:39]
	s_andn2_b64 exec, exec, s[38:39]
	s_cbranch_execz .LBB2_608
.LBB2_603:
	s_sleep 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_load_dwordx2 v[36:37], v[6:7] glc
	v_add_u32_e32 v13, 1, v13
	v_and_b32_e32 v14, 64, v55
	v_cmp_eq_u32_e32 vcc, 0, v14
	v_cmp_eq_u32_e64 s[14:15], s52, v13
	s_and_b64 vcc, vcc, s[14:15]
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_605
	ds_read_b64 v[14:15], v53 offset:1264
	s_waitcnt lgkmcnt(0)
	flat_load_dword v13, v[14:15] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_cmp_ne_u32_e32 vcc, 0, v13
	v_cndmask_b32_e64 v13, 0, 1, vcc
	v_lshl_or_b32 v55, v13, 6, v55
	v_and_b32_e32 v14, 64, v55
	v_mov_b32_e32 v13, 0
.LBB2_605:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_eq_u32_e32 vcc, 0, v14
	s_mov_b64 s[40:41], -1
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_602
	v_cmp_eq_u32_e32 vcc, 0, v13
	s_and_saveexec_b64 s[40:41], vcc
	s_cbranch_execz .LBB2_601
	ds_read_b64 v[14:15], v53 offset:1288
	v_mov_b32_e32 v20, s12
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v17, 31, v36
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v16, v[14:15], v146 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[14:15], v53 offset:1280
	v_and_b32_e32 v16, 0x1fff, v16
	v_lshlrev_b32_e32 v16, 5, v16
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v18, vcc, v14, v16
	v_addc_co_u32_e32 v19, vcc, 0, v15, vcc
	flat_store_byte v[18:19], v20 offset:1
	s_memrealtime vcc
	v_mov_b32_e32 v16, v36
	flat_store_short v[18:19], v147 offset:2
	flat_store_dword v[18:19], v24 offset:4
	flat_store_dwordx2 v[18:19], v[10:11] offset:24
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v14, vcc_lo
	v_mov_b32_e32 v15, vcc_hi
	flat_store_dwordx4 v[18:19], v[14:17] offset:8
	flat_store_byte v[18:19], v148
	s_branch .LBB2_601
.LBB2_608:
	s_or_b64 exec, exec, s[38:39]
	v_and_b32_e32 v10, 4, v55
.LBB2_609:
	s_or_b64 exec, exec, s[36:37]
	v_cmp_eq_u32_e32 vcc, 0, v10
	s_orn2_b64 s[14:15], vcc, exec
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_610:
	s_or_b64 exec, exec, s[34:35]
	s_xor_b64 vcc, s[14:15], -1
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_616
	v_and_b32_e32 v4, 0x80, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	v_and_b32_e32 v52, 7, v28
	s_and_saveexec_b64 s[34:35], vcc
	s_xor_b64 s[34:35], exec, s[34:35]
	s_cbranch_execz .LBB2_613
	v_lshlrev_b64 v[4:5], 2, v[52:53]
	v_add_co_u32_e32 v4, vcc, v30, v4
	v_addc_co_u32_e32 v5, vcc, v31, v5, vcc
	flat_load_dwordx2 v[4:5], v[4:5] glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_ashrrev_i32_e32 v5, 31, v4
	v_lshrrev_b64 v[4:5], 2, v[4:5]
.LBB2_613:
	s_andn2_saveexec_b64 vcc, s[34:35]
	v_mad_i64_i32 v[4:5], s[34:35], v52, s24, 0
	s_or_b64 exec, exec, vcc
	v_lshlrev_b64 v[4:5], 2, v[4:5]
	v_add_co_u32_e32 v4, vcc, v38, v4
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	ds_write_b64 v145, v[4:5]
.LBB2_616:
	s_or_b64 exec, exec, s[14:15]
	v_cmp_lt_i32_e32 vcc, s46, v32
	s_mov_b64 s[34:35], 0
	s_and_saveexec_b64 s[14:15], vcc
	s_xor_b64 s[14:15], exec, s[14:15]
	s_cbranch_execnz .LBB2_619
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execnz .LBB2_622
.LBB2_618:
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[34:35]
	s_cbranch_execnz .LBB2_623
	s_branch .LBB2_628
.LBB2_619:
	v_cmp_eq_u32_e32 vcc, s49, v32
	s_mov_b64 s[36:37], -1
	s_and_saveexec_b64 s[34:35], vcc
	s_cbranch_execz .LBB2_621
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[36:37], exec, -1
.LBB2_621:
	s_or_b64 exec, exec, s[34:35]
	s_and_b64 s[34:35], s[36:37], exec
	s_andn2_saveexec_b64 s[14:15], s[14:15]
	s_cbranch_execz .LBB2_618
.LBB2_622:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[34:35], s[34:35], exec
	s_and_b64 vcc, vcc, exec
	s_or_b64 s[34:35], s[34:35], vcc
	s_or_b64 exec, exec, s[14:15]
	s_and_saveexec_b64 s[14:15], s[34:35]
	s_cbranch_execz .LBB2_628
.LBB2_623:
	s_and_b64 exec, exec, s[4:5]
	s_cbranch_execz .LBB2_628
	ds_read_b64 v[4:5], v130
	v_mov_b32_e32 v10, 1
	v_mov_b32_e32 v11, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v130, v[4:5]
	ds_add_u64 v53, v[10:11] offset:248
	ds_read_b64 v[10:11], v53 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]
	s_and_saveexec_b64 s[34:35], vcc
	s_cbranch_execz .LBB2_627
	s_mov_b64 s[36:37], 0
.LBB2_626:
	s_sleep 1
	ds_read_b64 v[4:5], v53 offset:248
	ds_read_b64 v[10:11], v130
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]
	s_or_b64 s[36:37], vcc, s[36:37]
	s_andn2_b64 exec, exec, s[36:37]
	s_cbranch_execnz .LBB2_626
.LBB2_627:
	s_or_b64 exec, exec, s[34:35]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_628:
	s_or_b64 exec, exec, s[14:15]
	v_and_b32_e32 v4, 32, v55
	v_cmp_ne_u32_e32 vcc, 0, v4
	s_and_saveexec_b64 s[14:15], vcc
	s_cbranch_execz .LBB2_597
	v_add_co_u32_e32 v28, vcc, 2, v28
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[6:7], v[28:29]
	s_branch .LBB2_597
.LBB2_630:
	v_cmp_ne_u32_e32 vcc, -1, v1
	v_and_b32_e32 v5, 0x3f8, v24
	v_cndmask_b32_e64 v1, 0, 1, vcc
	v_cmp_ne_u32_e32 vcc, 8, v5
	s_mov_b64 s[4:5], 0
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
	s_cbranch_execz .LBB2_636
	v_lshlrev_b32_e32 v7, 3, v0
	v_lshrrev_b32_e32 v5, 3, v24
	v_add_u32_e32 v8, -2, v7
	v_cmp_ne_u32_e32 vcc, v5, v8
	s_mov_b64 s[4:5], 0
	s_and_saveexec_b64 s[10:11], vcc
	s_xor_b64 s[10:11], exec, s[10:11]
	v_add_u32_e32 v6, -1, v7
	v_cmp_eq_u32_e32 vcc, v5, v6
	v_cmp_lt_u32_e64 s[4:5], v3, v1
	s_and_b64 s[4:5], vcc, s[4:5]
	s_and_b64 s[4:5], s[4:5], exec
	s_or_saveexec_b64 s[10:11], s[10:11]
	v_mov_b32_e32 v5, 16
	s_xor_b64 exec, exec, s[10:11]
	v_cmp_lt_u32_e32 vcc, v3, v6
	s_andn2_b64 s[4:5], s[4:5], exec
	s_and_b64 s[14:15], vcc, exec
	v_mov_b32_e32 v5, 32
	s_or_b64 s[4:5], s[4:5], s[14:15]
	s_or_b64 exec, exec, s[10:11]
	s_and_b64 s[4:5], s[4:5], exec
.LBB2_636:
	s_or_saveexec_b64 s[8:9], s[8:9]
	v_mov_b32_e32 v20, 0
	s_xor_b64 exec, exec, s[8:9]
	v_cmp_lt_u32_e32 vcc, v3, v1
	v_cndmask_b32_e64 v5, 0, 1, vcc
	v_lshlrev_b32_e32 v5, 3, v5
	v_or_b32_e32 v6, 2, v5
	v_cmp_eq_u32_e32 vcc, v3, v1
	v_cndmask_b32_e32 v5, v5, v6, vcc
	v_cmp_le_u32_e32 vcc, v3, v1
	s_andn2_b64 s[4:5], s[4:5], exec
	s_and_b64 s[10:11], vcc, exec
	s_or_b64 s[4:5], s[4:5], s[10:11]
	v_mov_b32_e32 v20, v5
	s_or_b64 exec, exec, s[8:9]
	s_and_b64 s[8:9], s[4:5], exec
	s_andn2_saveexec_b64 s[4:5], s[6:7]
	s_cbranch_execz .LBB2_2
.LBB2_639:
	v_cmp_eq_u32_e32 vcc, v3, v6
	v_cndmask_b32_e64 v1, 0, 1, vcc
	v_cmp_lt_u32_e32 vcc, v3, v6
	v_cndmask_b32_e64 v5, 0, 1, vcc
	v_cmp_le_u32_e32 vcc, v3, v6
	v_lshl_or_b32 v5, v5, 2, v1
	s_andn2_b64 s[6:7], s[8:9], exec
	s_and_b64 s[8:9], vcc, exec
	s_or_b64 s[8:9], s[6:7], s[8:9]
	v_mov_b32_e32 v20, v5
	s_or_b64 exec, exec, s[4:5]
	v_mov_b32_e32 v55, 0
	s_and_saveexec_b64 s[4:5], s[8:9]
	s_cbranch_execnz .LBB2_3
	s_branch .LBB2_4
.LBB2_640:
	s_or_b64 exec, exec, s[20:21]
.LBB2_641:
	s_or_b64 exec, exec, s[18:19]
	v_and_b32_e32 v1, 0x800, v55
	v_cmp_eq_u32_e32 vcc, 0, v1
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_656
	s_movk_i32 s6, 0xff
	v_cmp_lt_i32_e32 vcc, s6, v32
	s_mov_b64 s[8:9], 0
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execnz .LBB2_646
	s_andn2_saveexec_b64 s[6:7], s[6:7]
	s_cbranch_execnz .LBB2_649
.LBB2_645:
	s_or_b64 exec, exec, s[6:7]
	s_and_saveexec_b64 s[6:7], s[8:9]
	s_cbranch_execnz .LBB2_650
	s_branch .LBB2_655
.LBB2_646:
	s_movk_i32 s8, 0x100
	v_cmp_eq_u32_e32 vcc, s8, v32
	s_mov_b64 s[10:11], -1
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB2_648
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[10:11], exec, -1
.LBB2_648:
	s_or_b64 exec, exec, s[8:9]
	s_and_b64 s[8:9], s[10:11], exec
	s_andn2_saveexec_b64 s[6:7], s[6:7]
	s_cbranch_execz .LBB2_645
.LBB2_649:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[8:9], s[8:9], exec
	s_and_b64 s[10:11], vcc, exec
	s_or_b64 s[8:9], s[8:9], s[10:11]
	s_or_b64 exec, exec, s[6:7]
	s_and_saveexec_b64 s[6:7], s[8:9]
	s_cbranch_execz .LBB2_655
.LBB2_650:
	v_and_b32_e32 v1, 63, v24
	v_cmp_eq_u32_e32 vcc, 0, v1
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_655
	v_lshrrev_b32_e32 v1, 3, v24
	v_and_b32_e32 v1, 0x78, v1
	ds_read_b64 v[4:5], v1 offset:256
	v_mov_b32_e32 v6, 1
	v_mov_b32_e32 v8, 0
	v_mov_b32_e32 v7, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v1, v[4:5] offset:256
	ds_add_u64 v8, v[6:7] offset:248
	ds_read_b64 v[6:7], v8 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[6:7], v[4:5]
	s_and_saveexec_b64 s[8:9], vcc
	s_cbranch_execz .LBB2_654
	v_or_b32_e32 v1, 0x100, v1
	s_mov_b64 s[10:11], 0
	v_mov_b32_e32 v4, 0
.LBB2_653:
	s_sleep 1
	ds_read_b64 v[6:7], v4 offset:248
	ds_read_b64 v[8:9], v1
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[6:7], v[8:9]
	s_or_b64 s[10:11], vcc, s[10:11]
	s_andn2_b64 exec, exec, s[10:11]
	s_cbranch_execnz .LBB2_653
.LBB2_654:
	s_or_b64 exec, exec, s[8:9]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_655:
	s_or_b64 exec, exec, s[6:7]
	v_or_b32_e32 v55, 0x800, v55
.LBB2_656:
	s_or_b64 exec, exec, s[4:5]
	v_and_b32_e32 v1, 48, v55
	v_cmp_ne_u32_e32 vcc, 0, v1
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB2_658
	v_bfe_i32 v1, v55, 4, 1
	v_and_b32_e32 v1, 56, v1
	v_lshl_add_u32 v1, v3, 3, v1
	ds_read_b64 v[4:5], v1
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx2 v[4:5], v[28:29] offset:80
.LBB2_658:
	s_or_b64 exec, exec, s[4:5]
	s_movk_i32 s4, 0xff
	v_cmp_lt_i32_e32 vcc, s4, v32
	s_mov_b64 s[6:7], 0
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execnz .LBB2_661
	s_andn2_saveexec_b64 s[4:5], s[4:5]
	s_cbranch_execnz .LBB2_664
.LBB2_660:
	s_or_b64 exec, exec, s[4:5]
	s_and_saveexec_b64 s[4:5], s[6:7]
	s_cbranch_execnz .LBB2_665
	s_branch .LBB2_670
.LBB2_661:
	s_movk_i32 s6, 0x100
	v_cmp_eq_u32_e32 vcc, s6, v32
	s_mov_b64 s[8:9], -1
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB2_663
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_barrier 
	s_waitcnt lgkmcnt(0)
	s_xor_b64 s[8:9], exec, -1
.LBB2_663:
	s_or_b64 exec, exec, s[6:7]
	s_and_b64 s[6:7], s[8:9], exec
	s_andn2_saveexec_b64 s[4:5], s[4:5]
	s_cbranch_execz .LBB2_660
.LBB2_664:
	v_cmp_ne_u32_e32 vcc, 64, v32
	s_andn2_b64 s[6:7], s[6:7], exec
	s_and_b64 s[8:9], vcc, exec
	s_or_b64 s[6:7], s[6:7], s[8:9]
	s_or_b64 exec, exec, s[4:5]
	s_and_saveexec_b64 s[4:5], s[6:7]
	s_cbranch_execz .LBB2_670
.LBB2_665:
	v_and_b32_e32 v1, 63, v24
	v_cmp_eq_u32_e32 vcc, 0, v1
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB2_670
	v_lshrrev_b32_e32 v1, 3, v24
	v_and_b32_e32 v1, 0x78, v1
	ds_read_b64 v[4:5], v1 offset:256
	v_mov_b32_e32 v6, 1
	v_mov_b32_e32 v3, 0
	v_mov_b32_e32 v7, 0
	s_waitcnt lgkmcnt(0)
	v_add_co_u32_e32 v4, vcc, v4, v0
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc
	ds_write_b64 v1, v[4:5] offset:256
	ds_add_u64 v3, v[6:7] offset:248
	ds_read_b64 v[6:7], v3 offset:248
	s_waitcnt lgkmcnt(0)
	v_cmp_lt_u64_e32 vcc, v[6:7], v[4:5]
	s_and_saveexec_b64 s[6:7], vcc
	s_cbranch_execz .LBB2_669
	v_or_b32_e32 v0, 0x100, v1
	s_mov_b64 s[8:9], 0
	v_mov_b32_e32 v1, 0
.LBB2_668:
	s_sleep 1
	ds_read_b64 v[4:5], v1 offset:248
	ds_read_b64 v[6:7], v0
	s_waitcnt lgkmcnt(0)
	v_cmp_ge_u64_e32 vcc, v[4:5], v[6:7]
	s_or_b64 s[8:9], vcc, s[8:9]
	s_andn2_b64 exec, exec, s[8:9]
	s_cbranch_execnz .LBB2_668
.LBB2_669:
	s_or_b64 exec, exec, s[6:7]
	;;#ASMSTART
	s_wakeup
	;;#ASMEND
.LBB2_670:
	s_or_b64 exec, exec, s[4:5]
	v_readlane_b32 s30, v2, 21
	v_readlane_b32 s31, v2, 22
	v_readlane_b32 s54, v2, 20
	v_readlane_b32 s53, v2, 19
	v_readlane_b32 s52, v2, 18
	v_readlane_b32 s51, v2, 17
	v_readlane_b32 s50, v2, 16
	v_readlane_b32 s49, v2, 15
	v_readlane_b32 s48, v2, 14
	v_readlane_b32 s47, v2, 13
	v_readlane_b32 s46, v2, 12
	v_readlane_b32 s45, v2, 11
	v_readlane_b32 s44, v2, 10
	v_readlane_b32 s43, v2, 9
	v_readlane_b32 s42, v2, 8
	v_readlane_b32 s41, v2, 7
	v_readlane_b32 s40, v2, 6
	v_readlane_b32 s39, v2, 5
	v_readlane_b32 s38, v2, 4
	v_readlane_b32 s37, v2, 3
	v_readlane_b32 s36, v2, 2
	v_readlane_b32 s35, v2, 1
	v_readlane_b32 s34, v2, 0
	s_or_saveexec_b64 s[4:5], -1
	buffer_load_dword v2, off, s[0:3], s32
	s_mov_b64 exec, s[4:5]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	s_setpc_b64 s[30:31]
.Lfunc_end3:
	.size	_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem, .Lfunc_end3-_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem

	.text
	.protected	_Z7kernel1PKfS0_Pf      ; -- Begin function _Z7kernel1PKfS0_Pf
	.globl	_Z7kernel1PKfS0_Pf
	.p2align	8
	.type	_Z7kernel1PKfS0_Pf,@function
_Z7kernel1PKfS0_Pf:                     ; @_Z7kernel1PKfS0_Pf
; context save logic
	; save workitem ID x
	v_mov_b32_e32 v5, v0
	; save queue_ptr SGPR
	s_mov_b32_e32 s12, s4
	s_mov_b32_e32 s13, s5
	; save kernarg_segment_ptr SGPR
	s_mov_b32_e32 s14, s6
	s_mov_b32_e32 s15, s7
	; save flat_scratch_init SGPR
	s_mov_b32_e32 s16, s8
	s_mov_b32_e32 s17, s9
; begin of host kernel before context save
; context adjust logic
	; adjust kernarg_segment_ptr SGPR
	s_mov_b32_e32 s4, s6
	s_mov_b32_e32 s5, s7
	; adjust workgroup_id_x SGPR
	s_mov_b32_e32 s6, s10
; begin of host kernel before context adjust
; %bb.0:
	s_load_dwordx2 s[0:1], s[4:5], 0x0
	s_load_dwordx2 s[2:3], s[4:5], 0x8
	s_load_dwordx2 s[8:9], s[4:5], 0x10
	v_lshl_add_u32 v1, s6, 8, v0
	v_mov_b32_e32 v0, 0
	v_ashrrev_i64 v[0:1], 30, v[0:1]
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v3, s1
	v_add_co_u32_e32 v2, vcc, s0, v0
	v_addc_co_u32_e32 v3, vcc, v3, v1, vcc
	global_load_dword v4, v[2:3], off
	v_mov_b32_e32 v3, s3
	v_add_co_u32_e32 v2, vcc, s2, v0
	v_addc_co_u32_e32 v3, vcc, v3, v1, vcc
	global_load_dword v2, v[2:3], off
	v_mov_b32_e32 v3, s9
	v_add_co_u32_e32 v0, vcc, s8, v0
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc
	s_waitcnt vmcnt(0)
	v_add_f32_e32 v2, v4, v2
	global_store_dword v[0:1], v2, off
	;s_endpgm
; context restore logic
	; restore workitem ID x
	v_mov_b32_e32 v0, v5
	; restore queue_ptr SGPR
	s_mov_b32_e32 s4, s12
	s_mov_b32_e32 s5, s13
	; restore kernarg_segment_ptr SGPR
	s_mov_b32_e32 s6, s14
	s_mov_b32_e32 s7, s15
	; restore flat_scratch_init SGPR
	s_mov_b32_e32 s8, s16
	s_mov_b32_e32 s9, s17
	; modify kernarg segment ptr to match guest kernel
	s_addc_u32_e32 s6, s6, 0x18
; begin of guest kernel
	s_load_dwordx4 s[72:75], s[6:7], 0x0
	s_load_dwordx2 s[76:77], s[6:7], 0x10
	s_add_u32 flat_scratch_lo, s8, s11
	s_addc_u32 flat_scratch_hi, s9, 0
	s_add_u32 s0, s0, s11
	v_mov_b32_e32 v41, v0
	s_addc_u32 s1, s1, 0
	s_mov_b32 s64, s10
	s_mov_b64 s[66:67], s[4:5]
	s_mov_b32 s4, 0
	v_cmp_eq_u32_e64 s[68:69], 0, v41
	s_mov_b32 s32, 0
	s_and_saveexec_b64 s[6:7], s[68:69]
	s_cbranch_execz .LBB4_2
	s_mov_b32 s5, s4
	s_mov_b32 s10, s4
	s_mov_b32 s11, s4
	v_mov_b32_e32 v6, 0
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]
	v_pk_mov_b32 v[2:3], s[10:11], s[10:11] op_sel:[0,1]
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:31 offset1:32
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:33 offset1:34
	v_pk_mov_b32 v[4:5], s[4:5], s[4:5] op_sel:[0,1]
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:67 offset1:68
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:69 offset1:70
	ds_write2_b64 v6, v[4:5], v[4:5] offset0:35 offset1:71
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:103 offset1:104
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:105 offset1:106
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:139 offset1:140
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:141 offset1:142
	ds_write2_b64 v6, v[4:5], v[4:5] offset0:107 offset1:143
	v_mov_b32_e32 v0, -1
	ds_write_b32 v6, v0 offset:1216
.LBB4_2:
	s_or_b64 exec, exec, s[6:7]
	v_cmp_gt_u32_e32 vcc, 64, v41
	;;#ASMSTART
	s_waitcnt lgkmcnt(0) 
 s_barrier
	;;#ASMEND
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB4_6
	v_lshlrev_b64 v[0:1], v41, 1
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v3, s75, v1
	v_and_b32_e32 v2, s74, v0
	v_cmp_ne_u64_e32 vcc, 0, v[2:3]
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB4_6
	v_add_co_u32_e32 v0, vcc, -1, v0
	v_addc_co_u32_e32 v1, vcc, -1, v1, vcc
	v_and_b32_e32 v0, s74, v0
	v_and_b32_e32 v1, s75, v1
	v_bcnt_u32_b32 v0, v0, 0
	v_bcnt_u32_b32 v0, v1, v0
	v_cmp_eq_u32_e32 vcc, s64, v0
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB4_6
	v_mov_b32_e32 v0, 0
	ds_write_b32 v0, v41 offset:1216
.LBB4_6:
	s_or_b64 exec, exec, s[4:5]
	v_mov_b32_e32 v0, 0
	;;#ASMSTART
	s_waitcnt lgkmcnt(0) 
 s_barrier
	;;#ASMEND
	ds_read_b32 v0, v0 offset:1216
	s_waitcnt lgkmcnt(0)
	v_cmp_eq_u32_e32 vcc, -1, v0
	v_readfirstlane_b32 s12, v0
	s_cbranch_vccnz .LBB4_69
	v_lshrrev_b32_e32 v5, 6, v41
	v_cmp_lt_i32_e32 vcc, 0, v5
	s_and_saveexec_b64 s[4:5], vcc
	s_xor_b64 s[4:5], exec, s[4:5]
	s_cbranch_execz .LBB4_15
	v_cmp_lt_i32_e32 vcc, 1, v5
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
	s_cbranch_execz .LBB4_12
	v_cmp_eq_u32_e32 vcc, 2, v5
	v_mov_b32_e32 v4, 0
	s_and_saveexec_b64 s[10:11], vcc
	s_mov_b32 s65, 0
	s_lshl_b64 s[6:7], s[64:65], 8
	s_add_u32 s6, s76, s6
	s_addc_u32 s7, s77, s7
	v_mov_b32_e32 v4, 0x100
	s_or_b64 exec, exec, s[10:11]
.LBB4_12:
	s_or_saveexec_b64 s[8:9], s[8:9]
	s_getreg_b32 s10, hwreg(HW_REG_SH_MEM_BASES, 16, 16)
	s_lshl_b32 s11, s10, 16
	s_movk_i32 s10, 0x5c0
	v_pk_mov_b32 v[0:1], s[10:11], s[10:11] op_sel:[0,1]
	v_pk_mov_b32 v[2:3], s[6:7], s[6:7] op_sel:[0,1]
	s_xor_b64 exec, exec, s[8:9]
	s_cbranch_execz .LBB4_14
	s_mul_hi_i32 s6, s12, 0xa0
	s_mulk_i32 s12, 0xa0
	s_add_u32 s7, s72, s12
	s_addc_u32 s10, s73, s6
	s_add_u32 s6, s7, 0x50
	s_addc_u32 s7, s10, 0
	s_getreg_b32 s10, hwreg(HW_REG_SH_MEM_BASES, 16, 16)
	s_lshl_b32 s11, s10, 16
	s_movk_i32 s10, 0x520
	v_pk_mov_b32 v[0:1], s[10:11], s[10:11] op_sel:[0,1]
	v_pk_mov_b32 v[2:3], s[6:7], s[6:7] op_sel:[0,1]
	v_mov_b32_e32 v4, 0xa0
.LBB4_14:
	s_or_b64 exec, exec, s[8:9]
.LBB4_15:
	s_andn2_saveexec_b64 s[4:5], s[4:5]
	s_getreg_b32 s6, hwreg(HW_REG_SH_MEM_BASES, 16, 16)
	s_lshl_b32 s7, s6, 16
	s_movk_i32 s6, 0x4d0
	v_mov_b32_e32 v4, 0x48
	v_pk_mov_b32 v[2:3], s[72:73], s[72:73] op_sel:[0,1]
	v_pk_mov_b32 v[0:1], s[6:7], s[6:7] op_sel:[0,1]
	s_or_b64 exec, exec, s[4:5]
	v_lshlrev_b32_e32 v42, 4, v41
	v_and_b32_e32 v5, 0x3f0, v42
	v_cmp_lt_u32_e32 vcc, v5, v4
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB4_19
	v_add_co_u32_e32 v2, vcc, v2, v5
	v_addc_co_u32_e32 v3, vcc, 0, v3, vcc
	flat_load_dwordx2 v[6:7], v[2:3]
	v_add_co_u32_e32 v0, vcc, v0, v5
	v_addc_co_u32_e32 v1, vcc, 0, v1, vcc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx2 v[0:1], v[6:7]
	flat_load_dwordx2 v[2:3], v[2:3] offset:8
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_store_dwordx2 v[0:1], v[2:3] offset:8
.LBB4_19:
	s_or_b64 exec, exec, s[4:5]
	s_movk_i32 s4, 0xf8
	v_mov_b32_e32 v0, 0x5c8
	v_mad_u32_u24 v43, v41, s4, v0
	v_mov_b32_e32 v0, 0x5f0
	v_mad_u32_u24 v46, v41, s4, v0
	v_mul_i32_i24_e32 v0, 0xffffff40, v41
	v_mul_i32_i24_e32 v1, 0xffffffe8, v41
	v_lshl_add_u32 v47, v1, 3, v46
	v_cmp_gt_u32_e64 s[70:71], 16, v41
	v_mov_b32_e32 v45, 0
	s_mov_b32 s63, 0
	v_add_u32_e32 v56, v43, v0
	;;#ASMSTART
	s_waitcnt lgkmcnt(0) 
 s_barrier
	;;#ASMEND
	s_getpc_b64 s[74:75]
	s_add_u32 s74, s74, _Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv@rel32@lo+4
	s_addc_u32 s75, s75, _Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv@rel32@hi+12
	s_branch .LBB4_22
.LBB4_20:
	s_or_b64 exec, exec, s[4:5]
	s_waitcnt lgkmcnt(0)
	;;#ASMSTART
	; ockl ballot hoisting hack v0
	;;#ASMEND
	v_cmp_ne_u32_e32 vcc, 0, v0
	s_cmp_lg_u64 vcc, 0
	s_mov_b64 s[4:5], 0
	s_cselect_b64 s[6:7], -1, 0
.LBB4_21:
	s_and_b64 vcc, exec, s[6:7]
	s_cbranch_vccnz .LBB4_67
.LBB4_22:
	s_and_saveexec_b64 s[4:5], s[68:69]
	s_cbranch_execz .LBB4_25
	ds_read_u8 v0, v45 offset:1478
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v0, 3, v0
	v_cmp_ne_u16_e32 vcc, 3, v0
	s_cbranch_vccnz .LBB4_25
	ds_read_b64 v[0:1], v45 offset:1464
	ds_read_b32 v2, v45 offset:1472
	s_waitcnt lgkmcnt(0)
	flat_store_dword v[0:1], v2
.LBB4_25:
	s_or_b64 exec, exec, s[4:5]
	ds_read_u8 v0, v45 offset:1479
	s_mov_b64 s[4:5], -1
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s12, v0
	v_cmp_lt_i16_e64 s[6:7], s12, 3
	s_and_b64 vcc, exec, s[6:7]
	s_cbranch_vccnz .LBB4_44
	v_cmp_eq_u16_e64 s[4:5], s12, 3
	s_and_b64 vcc, exec, s[4:5]
	s_cbranch_vccz .LBB4_43
	s_and_saveexec_b64 s[4:5], s[68:69]
	s_cbranch_execz .LBB4_42
	ds_read_u8 v0, v43
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v0, 3, v0
	v_cmp_eq_u16_e32 vcc, 3, v0
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB4_42
	ds_read_b64 v[2:3], v46
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v0, 1, v2
	v_cmp_eq_u32_e32 vcc, 1, v0
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz .LBB4_31
	flat_load_ubyte v0, v[2:3]
	v_mov_b32_e32 v1, s63
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_and_b32_e32 v0, 0xffff, v0
.LBB4_31:
	s_andn2_saveexec_b64 s[6:7], s[6:7]
	s_cbranch_execz .LBB4_41
	v_and_b32_e32 v44, 3, v2
	v_cmp_ne_u64_e32 vcc, 0, v[44:45]
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
	s_cbranch_execz .LBB4_34
	flat_load_ushort v0, v[2:3]
	v_mov_b32_e32 v1, s63
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_and_b32_e32 v0, 0xffff, v0
.LBB4_34:
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execz .LBB4_40
	v_and_b32_e32 v44, 7, v2
	v_cmp_ne_u64_e32 vcc, 0, v[44:45]
	s_and_saveexec_b64 s[10:11], vcc
	s_xor_b64 s[10:11], exec, s[10:11]
	s_cbranch_execz .LBB4_37
	flat_load_dword v44, v[2:3]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_pk_mov_b32 v[0:1], v[44:45], v[44:45] op_sel:[0,1]
.LBB4_37:
	s_andn2_saveexec_b64 s[10:11], s[10:11]
	s_cbranch_execz .LBB4_39
	flat_load_dwordx2 v[0:1], v[2:3]
.LBB4_39:
	s_or_b64 exec, exec, s[10:11]
.LBB4_40:
	s_or_b64 exec, exec, s[8:9]
.LBB4_41:
	s_or_b64 exec, exec, s[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	ds_write_b64 v46, v[0:1]
.LBB4_42:
	s_or_b64 exec, exec, s[4:5]
.LBB4_43:
	s_mov_b64 s[4:5], 0
.LBB4_44:
	s_andn2_b64 vcc, exec, s[4:5]
	s_cbranch_vccnz .LBB4_62
	v_cmp_ne_u16_e64 s[4:5], s12, 1
	s_and_b64 vcc, exec, s[4:5]
	s_cbranch_vccnz .LBB4_62
	s_and_saveexec_b64 s[4:5], s[68:69]
	s_cbranch_execz .LBB4_61
	ds_read_u8 v0, v56
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v0, 3, v0
	v_cmp_eq_u16_e32 vcc, 3, v0
	s_and_b64 exec, exec, vcc
	s_cbranch_execz .LBB4_61
	ds_read_b64 v[2:3], v47
	s_waitcnt lgkmcnt(0)
	v_and_b32_e32 v0, 1, v2
	v_cmp_eq_u32_e32 vcc, 1, v0
	s_and_saveexec_b64 s[6:7], vcc
	s_xor_b64 s[6:7], exec, s[6:7]
	s_cbranch_execz .LBB4_50
	flat_load_ubyte v0, v[2:3]
	v_mov_b32_e32 v1, s63
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_and_b32_e32 v0, 0xffff, v0
.LBB4_50:
	s_andn2_saveexec_b64 s[6:7], s[6:7]
	s_cbranch_execz .LBB4_60
	v_and_b32_e32 v44, 3, v2
	v_cmp_ne_u64_e32 vcc, 0, v[44:45]
	s_and_saveexec_b64 s[8:9], vcc
	s_xor_b64 s[8:9], exec, s[8:9]
	s_cbranch_execz .LBB4_53
	flat_load_ushort v0, v[2:3]
	v_mov_b32_e32 v1, s63
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_and_b32_e32 v0, 0xffff, v0
.LBB4_53:
	s_andn2_saveexec_b64 s[8:9], s[8:9]
	s_cbranch_execz .LBB4_59
	v_and_b32_e32 v44, 7, v2
	v_cmp_ne_u64_e32 vcc, 0, v[44:45]
	s_and_saveexec_b64 s[10:11], vcc
	s_xor_b64 s[10:11], exec, s[10:11]
	s_cbranch_execz .LBB4_56
	flat_load_dword v44, v[2:3]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_pk_mov_b32 v[0:1], v[44:45], v[44:45] op_sel:[0,1]
.LBB4_56:
	s_andn2_saveexec_b64 s[10:11], s[10:11]
	s_cbranch_execz .LBB4_58
	flat_load_dwordx2 v[0:1], v[2:3]
.LBB4_58:
	s_or_b64 exec, exec, s[10:11]
.LBB4_59:
	s_or_b64 exec, exec, s[8:9]
.LBB4_60:
	s_or_b64 exec, exec, s[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)
	ds_write_b64 v47, v[0:1]
.LBB4_61:
	s_or_b64 exec, exec, s[4:5]
.LBB4_62:
	s_mov_b64 s[6:7], s[66:67]
	s_mov_b32 s12, s64
	v_mov_b32_e32 v31, v41
	;;#ASMSTART
	s_waitcnt lgkmcnt(0) 
 s_barrier
	;;#ASMEND
	s_swappc_b64 s[30:31], s[74:75]
	ds_read_b32 v0, v45 offset:1472
	;;#ASMSTART
	s_waitcnt lgkmcnt(0) 
 s_barrier
	;;#ASMEND
	ds_read_u8 v1, v45 offset:1478
	s_mov_b64 s[4:5], -1
	s_waitcnt lgkmcnt(0)
	v_readfirstlane_b32 s6, v1
	s_bitcmp1_b32 s6, 0
	s_cselect_b64 s[6:7], -1, 0
	s_and_b64 vcc, exec, s[6:7]
	s_mov_b64 s[6:7], -1
	s_cbranch_vccnz .LBB4_21
	s_and_saveexec_b64 s[4:5], s[70:71]
	s_cbranch_execz .LBB4_65
	v_ashrrev_i32_e32 v1, 31, v0
	v_lshlrev_b64 v[0:1], 8, v[0:1]
	v_mov_b32_e32 v2, s77
	v_add_co_u32_e32 v0, vcc, s76, v0
	v_addc_co_u32_e32 v1, vcc, v2, v1, vcc
	v_add_co_u32_e32 v0, vcc, v0, v42
	v_addc_co_u32_e32 v1, vcc, 0, v1, vcc
	global_load_dwordx4 v[0:3], v[0:1], off
	s_waitcnt vmcnt(0)
	ds_write_b128 v42, v[0:3] offset:1472
.LBB4_65:
	s_or_b64 exec, exec, s[4:5]
	v_mov_b32_e32 v0, 0
	s_and_saveexec_b64 s[4:5], s[68:69]
	s_cbranch_execz .LBB4_20
	global_load_dwordx2 v[0:1], v45, s[72:73] offset:32
	s_waitcnt vmcnt(0)
	flat_load_dword v0, v[0:1] glc
	s_waitcnt vmcnt(0)
	s_branch .LBB4_20
.LBB4_67:
	s_andn2_b64 vcc, exec, s[4:5]
	s_cbranch_vccz .LBB4_69
	v_mov_b32_e32 v2, 0
	ds_read_b64 v[0:1], v2 offset:1288
	v_mov_b32_e32 v3, 1
	buffer_wbl2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	flat_atomic_add v4, v[0:1], v3 glc
	s_waitcnt vmcnt(0) lgkmcnt(0)
	buffer_invl2
	buffer_wbinvl1_vol
	ds_read_b64 v[0:1], v2 offset:1280
	s_memrealtime s[4:5]
	v_lshlrev_b16_e64 v2, 8, s64
	v_or_b32_e32 v5, 4, v2
	s_waitcnt lgkmcnt(0)
	v_pk_mov_b32 v[2:3], s[4:5], s[4:5] op_sel:[0,1]
	v_and_b32_e32 v4, 0x1fff, v4
	v_lshlrev_b32_e32 v4, 5, v4
	v_add_co_u32_e32 v0, vcc, v0, v4
	v_addc_co_u32_e32 v1, vcc, 0, v1, vcc
	flat_store_dwordx2 v[0:1], v[2:3] offset:8
	flat_store_short v[0:1], v5
.LBB4_69:
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z7kernel1PKfS0_Pf
		.amdhsa_group_segment_fixed_size 1728
		.amdhsa_private_segment_fixed_size 24
		.amdhsa_kernarg_size 48
		.amdhsa_user_sgpr_count 10
		.amdhsa_user_sgpr_private_segment_buffer 1
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 1
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_flat_scratch_init 1
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_system_sgpr_private_segment_wavefront_offset 1
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 198
		.amdhsa_next_free_sgpr 78
		.amdhsa_accum_offset 200
		.amdhsa_reserve_xnack_mask 0
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
	.size	_Z7kernel1PKfS0_Pf, .Lfunc_end0-_Z7kernel1PKfS0_Pf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 120
; NumSgprs: 12
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
; NumSGPRsForWavesPerEU: 12
; NumVGPRsForWavesPerEU: 5
; AccumOffset: 8
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 1
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.protected	_Z7kernel2PKfPf         ; -- Begin function _Z7kernel2PKfPf
	.globl	_Z7kernel2PKfPf
	.p2align	8
	.type	_Z7kernel2PKfPf,@function
_Z7kernel2PKfPf:                        ; @_Z7kernel2PKfPf
; %bb.0:
	s_load_dwordx2 s[0:1], s[4:5], 0x0
	s_load_dwordx2 s[2:3], s[4:5], 0x8
	v_lshl_add_u32 v1, s6, 8, v0
	v_mov_b32_e32 v0, 0
	v_ashrrev_i64 v[0:1], 30, v[0:1]
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v3, s1
	v_add_co_u32_e32 v2, vcc, s0, v0
	v_addc_co_u32_e32 v3, vcc, v3, v1, vcc
	global_load_dword v2, v[2:3], off
	v_mov_b32_e32 v3, s3
	v_add_co_u32_e32 v0, vcc, s2, v0
	v_addc_co_u32_e32 v1, vcc, v3, v1, vcc
	s_waitcnt vmcnt(0)
	v_mul_f32_e32 v2, 0x40400000, v2
	global_store_dword v[0:1], v2, off
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6
	.amdhsa_kernel _Z7kernel2PKfPf
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 16
		.amdhsa_user_sgpr_count 6
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
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 4
		.amdhsa_next_free_sgpr 7
		.amdhsa_accum_offset 4
		.amdhsa_reserve_xnack_mask 0
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
.Lfunc_end1:
	.size	_Z7kernel2PKfPf, .Lfunc_end1-_Z7kernel2PKfPf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 96
; NumSgprs: 9
; NumVgprs: 4
; NumAgprs: 0
; TotalNumVgprs: 4
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 9
; NumVGPRsForWavesPerEU: 4
; AccumOffset: 4
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 0
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.ident	"AMD clang version 15.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-5.4.0 22465 d6f0fe8b22e3d8ce0f2cbd657ea14b16043018a5)"
	.section	".note.GNU-stack"
	.addrsig
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
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
    .group_segment_fixed_size: 1728
    .kernarg_segment_align: 8
    .kernarg_segment_size: 24
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 256
    .name:           _Z7kernel1PKfS0_Pf
    .private_segment_fixed_size: 24
    .sgpr_count:     84
    .sgpr_spill_count: 0
    .symbol:         _Z7kernel1PKfS0_Pf.kd
    .vgpr_count:     198
    .vgpr_spill_count: 0
    .wavefront_size: 64
  - .agpr_count:     0
    .args:
      - .access:         read_only
        .address_space:  global
        .offset:         0
        .size:           8
        .value_kind:     global_buffer
      - .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 16
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z7kernel2PKfPf
    .private_segment_fixed_size: 0
    .sgpr_count:     9
    .sgpr_spill_count: 0
    .symbol:         _Z7kernel2PKfPf.kd
    .vgpr_count:     4
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx90a:xnack-
amdhsa.version:
  - 1
  - 1
...

	.end_amdgpu_metadata
