
/******************************************/
/* Begin Kernel                           */
/******************************************/
// disabled due to fusion
//.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
// to be added  after fusion with allreduce
.amdgcn_target "amdgcn-amd-amdhsa--gfx90a:xnack-"
.text
.protected Cijk_Ailk_Bljk_HHS_BH_MT64x16x64_MI16x16x16x1_SN_1LDSB0_AFC0_AF0EM8_GRVW2_GSU1_GSUAMB_K1_LBSPP128_LPA0_LPB16_LRVW8_MIWT1_1_MO40_NEPBS0_NLCA1_NLCB1_PLR5_SIA3_SS0_SU0_SUS0_SPO1_SRVW0_SVW4_TLDS1_USFGROn1_VSn1_VW2_WSGRA0_WSGRB0_WG64_4_1_WGM1
.globl Cijk_Ailk_Bljk_HHS_BH_MT64x16x64_MI16x16x16x1_SN_1LDSB0_AFC0_AF0EM8_GRVW2_GSU1_GSUAMB_K1_LBSPP128_LPA0_LPB16_LRVW8_MIWT1_1_MO40_NEPBS0_NLCA1_NLCB1_PLR5_SIA3_SS0_SU0_SUS0_SPO1_SRVW0_SVW4_TLDS1_USFGROn1_VSn1_VW2_WSGRA0_WSGRB0_WG64_4_1_WGM1
.p2align 8
.type Cijk_Ailk_Bljk_HHS_BH_MT64x16x64_MI16x16x16x1_SN_1LDSB0_AFC0_AF0EM8_GRVW2_GSU1_GSUAMB_K1_LBSPP128_LPA0_LPB16_LRVW8_MIWT1_1_MO40_NEPBS0_NLCA1_NLCB1_PLR5_SIA3_SS0_SU0_SUS0_SPO1_SRVW0_SVW4_TLDS1_USFGROn1_VSn1_VW2_WSGRA0_WSGRB0_WG64_4_1_WGM1,@function
.section .rodata,#alloc
.p2align 6
.amdhsa_kernel Cijk_Ailk_Bljk_HHS_BH_MT64x16x64_MI16x16x16x1_SN_1LDSB0_AFC0_AF0EM8_GRVW2_GSU1_GSUAMB_K1_LBSPP128_LPA0_LPB16_LRVW8_MIWT1_1_MO40_NEPBS0_NLCA1_NLCB1_PLR5_SIA3_SS0_SU0_SUS0_SPO1_SRVW0_SVW4_TLDS1_USFGROn1_VSn1_VW2_WSGRA0_WSGRB0_WG64_4_1_WGM1
  .amdhsa_user_sgpr_kernarg_segment_ptr 1
  .amdhsa_accum_offset 256 // accvgpr offset
  .amdhsa_next_free_vgpr 260 // vgprs
  // disabled due to fusion
  //.amdhsa_next_free_sgpr 68 // sgprs
  .amdhsa_group_segment_fixed_size 27136 // lds bytes
  // disabled due to fusion
  //.amdhsa_private_segment_fixed_size 0
  .amdhsa_system_sgpr_workgroup_id_x 1
  .amdhsa_system_sgpr_workgroup_id_y 1
  .amdhsa_system_sgpr_workgroup_id_z 1
  .amdhsa_system_vgpr_workitem_id 0
  .amdhsa_float_denorm_mode_32 3
  .amdhsa_float_denorm_mode_16_64 3
  // to be added  after fusion with allreduce
  .amdhsa_private_segment_fixed_size 24
  .amdhsa_kernarg_size 128 // 104 + 24
  .amdhsa_user_sgpr_count 10 // private segment buffer (4) + queue ptr (2) + kernarg segment ptr (2) + flat scratch init (2)
  .amdhsa_user_sgpr_private_segment_buffer 1
  .amdhsa_user_sgpr_dispatch_ptr 0
  .amdhsa_user_sgpr_queue_ptr 1
  .amdhsa_user_sgpr_dispatch_id 0
  .amdhsa_user_sgpr_flat_scratch_init 1
  .amdhsa_user_sgpr_private_segment_size 0
  .amdhsa_system_sgpr_private_segment_wavefront_offset 1
  .amdhsa_system_sgpr_workgroup_info 0
  .amdhsa_next_free_sgpr 96
  .amdhsa_reserve_xnack_mask 0
.end_amdhsa_kernel
.text
/* Num VGPR   =252 */
/* Num AccVGPR=4 */
/* Num SGPR   =68 */

/******************************************/
/* Optimizations and Config:              */
/******************************************/
/* ThreadTile= 4 x 1 */
/* SubGroup= 16 x 16 */
/* VectorWidth=2 */
/* GlobalLoadVectorWidthA=2, GlobalLoadVectorWidthB=2 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=1 */
.amdgpu_metadata
---
amdhsa.version:
  - 1
  - 0
amdhsa.kernels:
  - .name: Cijk_Ailk_Bljk_HHS_BH_MT64x16x64_MI16x16x16x1_SN_1LDSB0_AFC0_AF0EM8_GRVW2_GSU1_GSUAMB_K1_LBSPP128_LPA0_LPB16_LRVW8_MIWT1_1_MO40_NEPBS0_NLCA1_NLCB1_PLR5_SIA3_SS0_SU0_SUS0_SPO1_SRVW0_SVW4_TLDS1_USFGROn1_VSn1_VW2_WSGRA0_WSGRB0_WG64_4_1_WGM1
    .symbol: 'Cijk_Ailk_Bljk_HHS_BH_MT64x16x64_MI16x16x16x1_SN_1LDSB0_AFC0_AF0EM8_GRVW2_GSU1_GSUAMB_K1_LBSPP128_LPA0_LPB16_LRVW8_MIWT1_1_MO40_NEPBS0_NLCA1_NLCB1_PLR5_SIA3_SS0_SU0_SUS0_SPO1_SRVW0_SVW4_TLDS1_USFGROn1_VSn1_VW2_WSGRA0_WSGRB0_WG64_4_1_WGM1.kd'
    .language:                   OpenCL C
    .language_version:
      - 2
      - 0
    .args:
      - .name:            D
        .size:            8
        .offset:          0
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            C
        .size:            8
        .offset:          8
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            A
        .size:            8
        .offset:          16
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            B
        .size:            8
        .offset:          24
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            alpha
        .size:            4
        .offset:          32
        .value_kind:      by_value
        .value_type:      f32
      - .name:            beta
        .size:            4
        .offset:          36
        .value_kind:      by_value
        .value_type:      f32
      - .name:            strideD0
        .size:            4
        .offset:          40
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideD1
        .size:            4
        .offset:          44
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideC0
        .size:            4
        .offset:          48
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideC1
        .size:            4
        .offset:          52
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideA0
        .size:            4
        .offset:          56
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideA1
        .size:            4
        .offset:          60
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideB0
        .size:            4
        .offset:          64
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideB1
        .size:            4
        .offset:          68
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree0
        .size:            4
        .offset:          72
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree1
        .size:            4
        .offset:          76
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree2
        .size:            4
        .offset:          80
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesSum0
        .size:            4
        .offset:          84
        .value_kind:      by_value
        .value_type:      u32
      - .name:            OrigStaggerUIter
        .size:            4
        .offset:          88
        .value_kind:      by_value
        .value_type:      i32
      - .name:            NumWorkGroups0
        .size:            4
        .offset:          92
        .value_kind:      by_value
        .value_type:      u32
      - .name:            NumWorkGroups1
        .size:            4
        .offset:          96
        .value_kind:      by_value
        .value_type:      u32
      - .name:            padding
        .size:            4
        .offset:          100
        .value_kind:      by_value
        .value_type:      u32
    .group_segment_fixed_size:   27136
    .kernarg_segment_align:      8
    .kernarg_segment_size:       104
    .max_flat_workgroup_size:    256
    .private_segment_fixed_size: 0
    .sgpr_count:                 68
    .sgpr_spill_count:           0
    .vgpr_count:                 252
    .vgpr_spill_count:           0
    .wavefront_size:             64
...
.end_amdgpu_metadata
Cijk_Ailk_Bljk_HHS_BH_MT64x16x64_MI16x16x16x1_SN_1LDSB0_AFC0_AF0EM8_GRVW2_GSU1_GSUAMB_K1_LBSPP128_LPA0_LPB16_LRVW8_MIWT1_1_MO40_NEPBS0_NLCA1_NLCB1_PLR5_SIA3_SS0_SU0_SUS0_SPO1_SRVW0_SVW4_TLDS1_USFGROn1_VSn1_VW2_WSGRA0_WSGRB0_WG64_4_1_WGM1:

/* Magic div and mod functions */
.macro V_MAGIC_DIV dstIdx:req dividend:req magicNumber:req magicShift:req magicA:req
    v_mul_hi_u32 v[\dstIdx+1] \dividend \magicNumber
    v_mul_lo_u32 v[\dstIdx+0] \dividend \magicA
    v_add_u32 v[\dstIdx+0] v[\dstIdx+0] v[\dstIdx+1]
    v_lshrrev_b32 v[\dstIdx+0] \magicShift v[\dstIdx+0]
.endm

/******************************************/
/* VGPR Assignments                       */
/******************************************/
/* ValuC range: [0-0), serializedStore enabled */
.set vgprValuC, 0
/* ValuA/B   Xn=PLR buffer idx,  In=InnerUnroll idx */
.set vgprValuA_X0_I0, 0
.set vgprValuA_X1_I0, 2
.set vgprValuA_X2_I0, 4
.set vgprValuA_X3_I0, 6
.set vgprG2LA, 20
.set vgprValuB_X0_I0, 8
.set vgprValuB_X1_I0, 10
.set vgprValuB_X2_I0, 12
.set vgprValuB_X3_I0, 14
.set vgprG2LB, 28
.set vgprLocalWriteAddrA, 16
.set vgprLocalWriteAddrB, 17
.set vgprGlobalReadOffsetA, 18
.set vgprGlobalReadOffsetB, 19
.set vgprLocalReadAddrA, 30
.set vgprLocalReadAddrB, 31
.set vgprSerial, 32

/******************************************/
/* SGPR Assignments                       */
/******************************************/
.set sgprKernArgAddress, 0
.set sgprWorkGroup0, 2
.set sgprWorkGroup1, 3
.set sgprWorkGroup2, 4
.set sgprLoopCounterL, 5
.set sgprOrigLoopCounter, 6
.set sgprSrdD, 8
.set sgprSrdC, 12
.set sgprAddressD, 16
.set sgprAddressC, 18
.set sgprAddressA, 20
.set sgprAddressB, 22
.set sgprAlpha, 24
.set sgprBeta, 25
.set sgprStridesD, 26
.set sgprStridesC, 28
.set sgprStridesA, 30
.set sgprStridesB, 32
.set sgprSizesFree, 34
.set sgprSizesSum, 37
.set sgprOrigStaggerUIter, 38
.set sgprNumWorkGroups0, 39
.set sgprNumWorkGroups1, 40
.set sgprSrdA, 44
.set sgprSrdB, 48
.set sgprShadowLimitA, 42
.set sgprShadowLimitB, 52
.set sgprGlobalReadIncsA, 7
.set sgprGlobalReadIncsB, 38
.set sgprScalarGlobalReadOffsetA, 54
.set sgprScalarGlobalReadOffsetB, 41

/* Size Assignments */
.set sgprSizeI, sgprSizesFree+0
.set sgprSizeJ, sgprSizesFree+1
.set sgprSizeK, sgprSizesFree+2
.set sgprSizeL, sgprSizesSum+0

/* Stride Assignments */
.set constStrideD0I, 1
.set sgprStrideD1J, sgprStridesD+0
.set sgprStrideDK, sgprStridesD+1
.set constStrideC0I, 1
.set sgprStrideC1J, sgprStridesC+0
.set sgprStrideCK, sgprStridesC+1
.set constStrideA0I, 1
.set sgprStrideAL, sgprStridesA+0
.set sgprStrideAK, sgprStridesA+1
.set constStrideBL, 1
.set sgprStrideB1J, sgprStridesB+0
.set sgprStrideBK, sgprStridesB+1

.set MT0, 64
.set MT1, 16
.set DepthU, 64
.set GSU, 1
.set BpeA, 2
.set BpeALog2, 1
.set BpeB, 2
.set BpeBLog2, 1
/* Number of elements to shift-left SRD */
.set SrdShiftLeftA, 2
.set SrdShiftLeftB, 2
/* 2GB limit - set offsets to -1 to exceed this and clamp */
.set BufferLimit, 0xffffffff
.set BufferOOB, 0x80000000

/******************************************/
/* Bits 127:96 of SRD.                    */
/* hex: 0x00020000                        */
/* dst_sel_x (3b): 0                      */
/* dst_sel_y (3b): 0                      */
/* dst_sel_z (3b): 0                      */
/* dst_sel_w (3b): 0                      */
/* num_format (3b): 0                     */
/* data_format (4b): 4                    */
/* user_vm_enable (1b): 0                 */
/* user_vm_mode (1b): 0                   */
/* index_stride (2b): 0                   */
/* add_tid_enable (1b): 0                 */
/* _unusedA (3b): 0                       */
/* nv (1b): 0                             */
/* _unusedB (2b): 0                       */
/* type (2b): 0                           */
/******************************************/
.set Srd127_96, 0x00020000

/* Global Offset A */
.macro GLOBAL_OFFSET_A vgprAddr:req vgprOffset0I:req vgprOffsetL:req vgprTmp:req
    v_mul_lo_u32 v[\vgprTmp+0] s[sgprStrideAL] v[\vgprOffsetL] // mul d1 lower
    v_add_co_u32 v[\vgprAddr+0] vcc v[\vgprOffset0I] v[\vgprTmp+0] // accumulate K lower
    v_add_u32 v[\vgprAddr+0] 0x2 v[\vgprAddr+0]      // add prepad for pointer shift
    v_lshlrev_b32 v[\vgprAddr+0] 0x1 v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr:req vgprOffsetL:req vgprOffset1J:req vgprTmp:req
    v_mul_lo_u32 v[\vgprTmp+0] s[sgprStrideB1J] v[\vgprOffset1J] // mul d1 lower
    v_add_co_u32 v[\vgprAddr+0] vcc v[\vgprOffsetL] v[\vgprTmp+0] // accumulate K lower
    v_add_u32 v[\vgprAddr+0] 0x2 v[\vgprAddr+0]      // add prepad for pointer shift
    v_lshlrev_b32 v[\vgprAddr+0] 0x1 v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Dynamic Scalar Divide: vQuotient=vDividend/vDivisor; vRemainder=vDividend%vDivisor; */
.macro DYNAMIC_VECTOR_DIVIDE vQuotient vRemainder vDividend vDivisor vTmp0 vTmp1 sTmp
    v_cvt_f32_u32 v[\vQuotient] v[\vDivisor]
    v_rcp_f32 v[\vQuotient] v[\vQuotient]
    v_mul_f32 v[\vQuotient] 0x4f800000 v[\vQuotient]
    v_cvt_u32_f32 v[\vQuotient] v[\vQuotient]
    v_mul_lo_u32 v[\vRemainder] v[\vDivisor] v[\vQuotient]
    v_mul_hi_u32 v[\vTmp0] v[\vDivisor] v[\vQuotient]
    v_sub_co_u32 v[\vTmp1] vcc 0x0 v[\vRemainder]
    v_cmp_ne_i32 s[\sTmp:\sTmp+1] 0x0 v[\vTmp0]
    v_cndmask_b32 v[\vRemainder] v[\vTmp1] v[\vRemainder] s[\sTmp:\sTmp+1]
    v_mul_hi_u32 v[\vRemainder] v[\vRemainder] v[\vQuotient]
    v_sub_co_u32 v[\vTmp0] vcc v[\vQuotient] v[\vRemainder]
    v_add_co_u32 v[\vQuotient] vcc v[\vQuotient] v[\vRemainder]
    v_cndmask_b32 v[\vQuotient] v[\vQuotient] v[\vTmp0] s[\sTmp:\sTmp+1]
    v_mul_hi_u32 v[\vQuotient] v[\vQuotient] v[\vDividend]
    v_mul_lo_u32 v[\vRemainder] v[\vQuotient] v[\vDivisor]
    v_sub_co_u32 v[\vTmp0] vcc v[\vDividend] v[\vRemainder]
    v_cmp_ge_u32 s[\sTmp:\sTmp+1] v[\vDividend] v[\vRemainder]
    v_add_co_u32 v[\vRemainder] vcc 0x1 v[\vQuotient]
    v_add_co_u32 v[\vTmp1] vcc -1 v[\vQuotient]
    v_cmp_le_u32 vcc v[\vDivisor] v[\vTmp0]
    s_and_b64 vcc s[\sTmp:\sTmp+1] vcc
    v_cndmask_b32 v[\vQuotient] v[\vQuotient] v[\vRemainder] vcc
    v_cndmask_b32 v[\vQuotient] v[\vTmp1] v[\vQuotient] s[\sTmp:\sTmp+1]
    v_cmp_ne_i32 vcc 0x0 v[\vDivisor]
    v_cndmask_b32 v[\vQuotient] -1 v[\vQuotient] vcc // final result
    v_mul_lo_u32 v[\vRemainder] v[\vQuotient] v[\vDivisor]
    v_sub_co_u32 v[\vRemainder] vcc v[\vDividend] v[\vRemainder] // final result
.endm

CONTEXT_SAVE_LOGIC:
; context save logic
    ; save workitem ID x
    v_mov_b32_e32 v200, v0
    ; save queue_ptr SGPR
    s_mov_b32_e32 s68, s4
    s_mov_b32_e32 s69, s5
    ; save kernarg_segment_ptr SGPR
    s_mov_b32_e32 s70, s6
    s_mov_b32_e32 s71, s7
    ; save flat_scratch_init SGPR
    s_mov_b32_e32 s72, s8
    s_mov_b32_e32 s73, s9
    ; save workgroup_id_x SGPR
    s_mov_b32_e32 s74, s10
    ; save private segment wavefront offset SGPR
    s_mov_b32_e32 s75, s13 
; begin of host kernel before context save
CONTEXT_ADJUST_LOGIC:
; context adjust logic
    ; adjust kernarg_segment_ptr SGPR
    s_mov_b32_e32 s0, s6
    s_mov_b32_e32 s1, s7
    ; adjust workgroup_id_x SGPR
    s_mov_b32_e32 s2, s10
    ; adjust workgroup_id_y SGPR
    s_mov_b32_e32 s3, s11
    ; adjust workgroup_id_z SGPR
    s_mov_b32_e32 s4, s12
; begin of host kernel before context adjust
HOST_KERNEL_ENTRY:
/******************************************/
/* Allocate Resources                     */
/******************************************/
s_setprio 3                                        // optimization store
s_mov_b32 m0, 0x6a00                               // LDS clamp at 27136 bytes
v_mov_b32 v[vgprSerial], v0                        // thread serial id

/* Load Kernel Args */
s_load_dwordx16 s[16:31], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x0
s_load_dwordx8 s[32:39], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x40
s_load_dwordx2 s[40:41], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x60

/******************************************/
/* Local Read Addresses                   */
/******************************************/

/* local read addresses: tile assignments a/b */
/* lr0I */
v_and_b32 v2, 63, v[vgprSerial]                    // 0. thread id in wave: wtid = tid % wavelength(64)
v_and_b32 v1, 15, v2                               // 1. N offset: nIdx = wtid % MI_N(16)
                                                   // 1. N offset: nOffset = nIdx * nStride(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v0, 4, v2                            // 2. block offset: bnIdx = wtid / dividedForBlkId(16)
v_and_b32 v0, 0, v0                                // 2. block offset: bnIdx = bnIdx % num1DBlocks(1)
v_lshlrev_b32 v0, 0x4, v0                          // 2. block offset: bnOffset = bnIdx * strideBlock(16)
v_add_u32 v1, v0, v1                               // 3. add N and block offset: bnOffset = block and N offset
                                                   // 3. apply VectorWidth: bnOffset = bnOffset * vw(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v2, 4, v2                            // 4. K offset: kIdx = wtid / (MIN(16) * MIBB(1))
v_lshlrev_b32 v2, 0x9, v2                          // 4. K offset: lrKOffset = kIdx * mStride(512)
v_add_u32 v1, v2, v1                               // 5. offset in wave: lrOffset = bnOffset + lrKOffset
v_lshrrev_b32 v0, 6, v[vgprSerial]                 // 6. wave offset in N dimen: wtid = tid / dividedForWaveId(64)
v_and_b32 v0, 3, v0                                // 6. wave offset in M dimen: wtid0 = wtid / num1DWaves(4)
v_lshlrev_b32 v0, 0x4, v0                          // 6. wave offset in M dimen: wOffset = wtid0 * W0Stride(16)
v_add_u32 v1, v0, v1                               // 7. final local read offset: flrOffset = lrOffset + WOffset
/* lr1J */
v_and_b32 v3, 63, v[vgprSerial]                    // 0. thread id in wave: wtid = tid % wavelength(64)
v_and_b32 v2, 15, v3                               // 1. N offset: nIdx = wtid % MI_N(16)
v_lshlrev_b32 v2, 0x6, v2                          // 1. N offset: nOffset = nIdx * nStride(64)
v_lshrrev_b32 v0, 4, v3                            // 2. block offset: bnIdx = wtid / dividedForBlkId(16)
v_and_b32 v0, 0, v0                                // 2. block offset: bnIdx = bnIdx % num1DBlocks(1)
v_lshlrev_b32 v0, 0xa, v0                          // 2. block offset: bnOffset = bnIdx * strideBlock(1024)
v_add_u32 v2, v0, v2                               // 3. add N and block offset: bnOffset = block and N offset
                                                   // 3. apply VectorWidth: bnOffset = bnOffset * vw(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v3, 4, v3                            // 4. K offset: kIdx = wtid / (MIN(16) * MIBB(1))
v_lshlrev_b32 v3, 0x3, v3                          // 4. K offset: lrKOffset = kIdx * mStride(8)
v_add_u32 v2, v3, v2                               // 5. offset in wave: lrOffset = bnOffset + lrKOffset

/* local read addresses: final offsets a */
v_lshrrev_b32 v0, 8, v[vgprSerial]                 // LSU offset: sgid = Serial / subGroup(256)
s_mov_b32 s7, 64                                   // LSU offset: stride = MT0(64) + PAD0(0)
v_mul_lo_u32 v0, s7, v0                            // LSU offset: lsuoffset = sgid*(MT0+PAD)
v_add_lshl_u32 v[vgprLocalReadAddrA], v0, v1, 0x1  // Final Offset: offset = (lro0*VW+lsuoffset)*bpe

/* local read addresses: final offsets b */
v_lshrrev_b32 v0, 8, v[vgprSerial]                 // LSU offset: sgid = Serial / subGroup(256)
s_mov_b32 s7, 16                                   // LSU offset: stride = MT1(16) + PAD1(0)
v_mul_lo_u32 v0, s7, v0                            // LSU offset: lsuoffset = sgid*(MT1+PAD)
v_add_lshl_u32 v[vgprLocalReadAddrB], v0, v2, 0x1  // Final Offset: offset = (lro1*VW+lsuoffset)*bpe
v_lshrrev_b32 v1, 7, v[vgprLocalReadAddrB]         // Final Offset: padding 16 per block 128
v_lshlrev_b32 v1, 0x5, v1                          // Final Offset: padding 16 per block 128
v_add_u32 v[vgprLocalReadAddrB], v1, v[vgprLocalReadAddrB] // Final Offset: add padding 16 per block 128

/* local read addresses: declare addresses a */
/* N/A */

/* local read addresses: declare addresses b */
v_add_co_u32 v[vgprLocalReadAddrB+0], vcc, 0x2000, v[vgprLocalReadAddrB+0] //  += LdsOffsetB (lower)

/******************************************/
/* Local Write Addresses                  */
/******************************************/
/* LVCA = 32 */
/* v1 = A-unroll = serial/LVCA */
v_lshrrev_b32 v1, 5, v[vgprSerial]                 // v1 = v[vgprSerial] / 32
v_and_b32 v0, 31, v[vgprSerial]                    // v0 = v[vgprSerial] % 32
/* tile *= glvw */
v_lshlrev_b32 v0, 0x1, v0                          // v0 = v0 * 2
/* LVCB = 32 */
/* v3 = B-unroll = serial%LVCB */
v_lshrrev_b32 v2, 5, v[vgprSerial]                 // v2 = v[vgprSerial] / 32
v_and_b32 v3, 31, v[vgprSerial]                    // v3 = v[vgprSerial] % 32
/* unroll *= glvw */
v_lshlrev_b32 v3, 0x1, v3                          // v3 = v3 * 2
/* lwaUnrollAssignmentA = v1 */
/* lwaUnrollAssignmentB = v3 */

/* local write addresses: first offset a */
v_mul_u32_u24 v[vgprLocalWriteAddrA], 0x40, v1     // lwAL**(MTA + PAD)
v_add_lshl_u32 v[vgprLocalWriteAddrA], v0, v[vgprLocalWriteAddrA], 0x1 // lwFOA = (lwAA + lwAL*(MT0I+PAD))*bpe

/* local write addresses: first offset b */
v_mul_u32_u24 v[vgprLocalWriteAddrB], 0x40, v2     // lwBL**(DepthU_Compute + PAD)
v_add_lshl_u32 v[vgprLocalWriteAddrB], v3, v[vgprLocalWriteAddrB], 0x1 // lwFOB = (lwBB + lwBL*(DepthU+PAD))*bpe
v_lshrrev_b32 v4, 7, v[vgprLocalWriteAddrB]        // padding 16 per block 128
v_lshlrev_b32 v4, 0x5, v4                          // padding 16 per block 128
v_add_u32 v[vgprLocalWriteAddrB], v4, v[vgprLocalWriteAddrB] // add padding 16 per block 128
v_add_co_u32 v[vgprLocalWriteAddrB], vcc, 0x2000, v[vgprLocalWriteAddrB] // lwFOB = lwB1J + lwBL*MT1J + LDS_OFFSET_B=4096*2
s_waitcnt lgkmcnt(0)                               // wait for 104 bytes of kern args
s_sub_u32 s[sgprAddressA+0], s[sgprAddressA+0], 4  // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprAddressA+1], s[sgprAddressA+1], 0 // pre-pad to make room for possible pointer shift
s_sub_u32 s[sgprAddressB+0], s[sgprAddressB+0], 4  // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprAddressB+1], s[sgprAddressB+1], 0 // pre-pad to make room for possible pointer shift

/* Short circuit condition if Alpha == 0, then sumDims=0 */
v_cmp_eq_f32 vcc, s[sgprAlpha], 0.0                // s[Alpha] == 0.0f ?
s_cbranch_vccz label_AlphaNonZero                  // branch if s[Alpha] != 0
s_mov_b32 s[sgprSizesSum+0], 0x0                   // Set summation dim=0 if Alpha == 0
label_AlphaNonZero:

/******************************************/
/* Begin setupNewTile                     */
/******************************************/

/* global read addresses: work-group */
/* graWorkGroup mapping */

/* global read addresses: tile offset assignment a */
/* graTileAssignmentA = v0 */

/* global read addresses: tile offset assignment b */
/* graTileAssignmentB = v2 */

/* global read addresses: unroll assignment a */
/* v1 */

/* global read addresses: unroll assignment b */
/* v3 */

/* global read addresses: other free assignments */
/* s[sgprWorkGroup2] */

/* global read addresses: tile offsets a */

/* global read addresses: tile offsets b */

/* global read addresses: unroll offsets a */

/* global read addresses: unroll offsets b */

/* global read addresses: final offsets a */
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+0,  0,  1, 4 // gROA_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetA+0], s[sgprStrideAL], 8 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+0], s[sgprScalarGlobalReadOffsetA+0], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+1], s[sgprStrideAL], 16 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+1], s[sgprScalarGlobalReadOffsetA+1], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+2], s[sgprStrideAL], 24 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+2], s[sgprScalarGlobalReadOffsetA+2], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+3], s[sgprStrideAL], 32 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+3], s[sgprScalarGlobalReadOffsetA+3], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+4], s[sgprStrideAL], 40 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+4], s[sgprScalarGlobalReadOffsetA+4], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+5], s[sgprStrideAL], 48 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+5], s[sgprScalarGlobalReadOffsetA+5], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+6], s[sgprStrideAL], 56 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+6], s[sgprScalarGlobalReadOffsetA+6], 0x1 // scalar offset *= bytes/element

/* global read addresses: final offsets b */
GLOBAL_OFFSET_B vgprGlobalReadOffsetB+0,  3,  2, 4 // gROB_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetB+0], s[sgprStrideB1J], 8 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+0], s[sgprScalarGlobalReadOffsetB+0], 0x1 // scalar offset *= bytes/element

/* global read addresses: addresses a */
/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s65, s[sgprWorkGroup0], 64            // WorkGroup[01] * MT
s_mul_i32 s64, s[sgprWorkGroup0], 64               // WorkGroup[01] * MT
s_mov_b32 s66, 1                                   // Init tensor size
s_mov_b32 s67, 0                                   // init tensor size
s_sub_u32 s62, s[sgprSizeI], 1                     // (size-1)
s_mul_hi_u32 s63, constStrideA0I, s62              // stride x (size-1)
s_mul_i32 s62, constStrideA0I, s62                 // stride x (size-1)
s_add_u32 s66, s66, s62                            // sum tensor size
s_addc_u32 s67, s67, s63                           // sum tensor size
s_sub_u32 s62, s[sgprSizeL], 1                     // (size-1)
s_mul_hi_u32 s63, s[sgprStrideAL], s62             // stride x (size-1)
s_mul_i32 s62, s[sgprStrideAL], s62                // stride x (size-1)
s_add_u32 s66, s66, s62                            // sum tensor size
s_addc_u32 s67, s67, s63                           // sum tensor size
s_sub_u32 s[sgprShadowLimitA+0], s66, s64          // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s67, s65         // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s63, s[sgprStrideAK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s62, s[sgprStrideAK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s64, s64, s62                            // accum wg term to tilestart
s_addc_u32 s65, s65, s63                           // accum wg term to tilestart
s_lshl_b64 s[64:65], s[64:65], 0x1                 // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s64    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s65   // SRD base = Address+ tileStart1
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD

/* global read addresses: addresses b */
/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s65, s[sgprWorkGroup1], 16            // WorkGroup[01] * MT
s_mul_i32 s64, s[sgprWorkGroup1], 16               // WorkGroup[01] * MT
s_mul_hi_u32 s65, s64, s[sgprStrideB1J]            // tlu=0, scaled tile-offset by stride
s_mul_i32 s64, s64, s[sgprStrideB1J]               // tlu=0, scaled tile-offset by stride
s_mov_b32 s66, 1                                   // Init tensor size
s_mov_b32 s67, 0                                   // init tensor size
s_sub_u32 s62, s[sgprSizeL], 1                     // (size-1)
s_mul_hi_u32 s63, constStrideBL, s62               // stride x (size-1)
s_mul_i32 s62, constStrideBL, s62                  // stride x (size-1)
s_add_u32 s66, s66, s62                            // sum tensor size
s_addc_u32 s67, s67, s63                           // sum tensor size
s_sub_u32 s62, s[sgprSizeJ], 1                     // (size-1)
s_mul_hi_u32 s63, s[sgprStrideB1J], s62            // stride x (size-1)
s_mul_i32 s62, s[sgprStrideB1J], s62               // stride x (size-1)
s_add_u32 s66, s66, s62                            // sum tensor size
s_addc_u32 s67, s67, s63                           // sum tensor size
s_sub_u32 s[sgprShadowLimitB+0], s66, s64          // sub tileStart
s_subb_u32 s[sgprShadowLimitB+1], s67, s65         // sub tileStart
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s63, s[sgprStrideBK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s62, s[sgprStrideBK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s64, s64, s62                            // accum wg term to tilestart
s_addc_u32 s65, s65, s63                           // accum wg term to tilestart
s_lshl_b64 s[64:65], s[64:65], 0x1                 // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s64    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s65   // SRD base = Address+ tileStart1
s_mov_b32 s[sgprSrdB+3], Srd127_96                 // Set bits 127_96 in SRD

/* global read addresses: increments a */
s_mul_i32 s[sgprGlobalReadIncsA+0], DepthU*BpeA, s[sgprStrideAL] // incrA unrollIdx)

/* global read addresses: increments b */
s_mov_b32 s[sgprGlobalReadIncsB+0], DepthU*BpeB    // incrB (unrollIdx)
/* declare loop num iterations */
s_lshr_b32 s[sgprLoopCounterL], s[sgprSizesSum+0], 6 // s[sgprLoopCounterL] = s[sgprSizesSum+0] / 64
s_mov_b32 s[sgprOrigLoopCounter], s[sgprLoopCounterL] // copy loop counter
/* local read addresses: init pointers a */

/* localReadInitPointers */
/* local read addresses: init pointers b */

/* localReadInitPointers */

/* prefetch: global -> local */
s_cmp_eq_u32 s[sgprLoopCounterL], 0                // at last iteration?
s_setprio 0                                        // optimization store
s_cbranch_scc1 label_ShadowInitStart               // skip to ShadowInitStart iter b/c numIter==0
buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:0 // G -> Reg 0_0_3_0
buffer_load_dword v[vgprG2LA+4], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+3] offen offset:0 // G -> Reg 0_0_4_0
buffer_load_dword v[vgprG2LA+5], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+4] offen offset:0 // G -> Reg 0_0_5_0
buffer_load_dword v[vgprG2LA+6], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+5] offen offset:0 // G -> Reg 0_0_6_0
buffer_load_dword v[vgprG2LA+7], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+6] offen offset:0 // G -> Reg 0_0_7_0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:0 // G -> Reg 0_0_1_0

/* global read inc A loopL */
s_add_u32 s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* global read inc B loopL */
s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

/******************************************/
/* End setupNewTile                       */
/******************************************/
label_ShadowInitStart:
s_mov_b32 s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdD+1], s[sgprAddressD+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdD+2], 0x80000000
s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

s_mov_b32 s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdC+2], 0x80000000
s_mov_b32 s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in post-loop SRD


s_mul_i32 s64, MT1, s[sgprWorkGroup1]              // <- wg1*MT1
s_mul_hi_u32 s63, s64, s[sgprStrideC1J]            // CScale s64 by Stride
s_mul_i32 s62, s64, s[sgprStrideC1J]               // CScale s64 by Stride
s_lshl_b64 s[62:63], s[62:63], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprAddressC+0], s62    // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprAddressC+1], s63   // add hi to SRD
s_mul_hi_u32 s63, s64, s[sgprStrideD1J]            // Scale s64 by Stride
s_mul_i32 s62, s64, s[sgprStrideD1J]               // Scale s64 by Stride
s_lshl_b64 s[62:63], s[62:63], 1                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprAddressD+0], s62    // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprAddressD+1], s63   // add hi to SRD

s_mul_hi_u32 s63, s[sgprWorkGroup2], s[sgprStrideCK] // CScale s[sgprWorkGroup2] by Stride
s_mul_i32 s62, s[sgprWorkGroup2], s[sgprStrideCK]  // CScale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[62:63], s[62:63], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s62        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s63       // add hi to SRD
s_mul_hi_u32 s63, s[sgprWorkGroup2], s[sgprStrideDK] // Scale s[sgprWorkGroup2] by Stride
s_mul_i32 s62, s[sgprWorkGroup2], s[sgprStrideDK]  // Scale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[62:63], s[62:63], 1                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s62        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s63       // add hi to SRD


/* initC: remove C-tile 0-0 from pool */

/* initC: remove AB-tile 0-16 from pool */
v_accvgpr_write acc0, 0x0                          // initC
v_accvgpr_write acc1, 0x0                          // initC
v_accvgpr_write acc2, 0x0                          // initC
v_accvgpr_write acc3, 0x0                          // initC
s_cmp_eq_u32 s[sgprLoopCounterL], 0                // at last iteration?

/* after InitC, skip to end of prefetch last iter if numIter==0 */
s_cbranch_scc0 label_NoBranch_DR419N07SW6CNQR2_0   // Only branch on scc1
s_getpc_b64 s[62:63]                               // addr of next instr
s_add_i32 s64, label_PrefetchGlobalLastIterEnd, 0x4 // target branch offset
s_add_u32 s62, s62, s64                            // add target branch offset
s_addc_u32 s63, s63, 0                             // add high and carry
s_setpc_b64 s[62:63]                               // branch to label_PrefetchGlobalLastIterEnd
label_NoBranch_DR419N07SW6CNQR2_0:
s_waitcnt vmcnt(0)                                 // 8wait for global read

/* local write a */
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:1024 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 1024
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:2048 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 2048
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:3072 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 3072
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+4] offset:4096 // lwoA_0_0_4_0 = (0*LSCA) + (4*LSPA)(*MT0I+PAD) = 4096
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+5] offset:5120 // lwoA_0_0_5_0 = (0*LSCA) + (5*LSPA)(*MT0I+PAD) = 5120
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+6] offset:6144 // lwoA_0_0_6_0 = (0*LSCA) + (6*LSPA)(*MT0I+PAD) = 6144
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+7] offset:7168 // lwoA_0_0_7_0 = (0*LSCA) + (7*LSPA)(*MT0I+PAD) = 7168

/* local write b */
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:1280 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 1280

/* local write swap a */
v_xor_b32 v[vgprLocalWriteAddrA+0], 0x4000, v[vgprLocalWriteAddrA+0] // swap Red Blk

/* local write swap b */
v_xor_b32 v[vgprLocalWriteAddrB+0], 0x4000, v[vgprLocalWriteAddrB+0] // swap Red Blk
s_cmp_eq_u32 s[sgprLoopCounterL], 0x1              // PGR=2 but only 1 loop
s_cbranch_scc1 label_skipPGR2_0                    // PGR=2 but only 1 loop
buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:0 // G -> Reg 0_0_3_0
buffer_load_dword v[vgprG2LA+4], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+3] offen offset:0 // G -> Reg 0_0_4_0
buffer_load_dword v[vgprG2LA+5], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+4] offen offset:0 // G -> Reg 0_0_5_0
buffer_load_dword v[vgprG2LA+6], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+5] offen offset:0 // G -> Reg 0_0_6_0
buffer_load_dword v[vgprG2LA+7], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+6] offen offset:0 // G -> Reg 0_0_7_0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:0 // G -> Reg 0_0_1_0
label_skipPGR2_0:
s_waitcnt lgkmcnt(0)                               // 0prefetch wait for local write
// Skip force waitcnt0
s_barrier

/* local read prefetch a */
ds_read_u16 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v33, v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v34, v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=0 iui=0

/* local read prefetch b */
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read inc a */
/* N/A, lro->256 */
/* self.localReadDoCntA 1 self.localReadDoCntB 1 */

/* local read inc b */
/* N/A, lro->32 */
/* self.localReadDoCntA 1 self.localReadDoCntB 1 */

/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/
label_openLoopL:
s_cmp_eq_u32 s[sgprLoopCounterL], 0x1              // LoopCounterL < EndCounter
s_cbranch_scc1 label_toPGR1_0                      // PGR=2 but only 1 loop, toPGR1
s_cmp_le_u32 s[sgprLoopCounterL], 0x2              // LoopCounterL < EndCounter
s_cbranch_scc1 label_LoopEndL                      // do not enter LoopL
label_LoopBeginL:

/******************************************/
/* Unrolled Loop 1/1 - Begin              */
/******************************************/

/* Begin Each Unroll: Check VGPR.checkin for INT8 LW */

/* iter 0 (swap and reset local write pointers iteration)  */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:0  */
ds_read_u16 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16 v[vgprValuA_X1_I0+1], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuB_X2_I0+0:vgprValuB_X2_I0+0+3], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0

/* global read inc A loopL */
s_add_u32 s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* global read inc B loopL */
s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32
s_setprio 3                                        // store optimization
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:0 // G -> Reg 0_0_0_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:1024 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 1024
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:0 // G -> Reg 0_0_1_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:2048 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 2048
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:0 // G -> Reg 0_0_2_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:3072 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 3072
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:0 // G -> Reg 0_0_3_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+4] offset:4096 // lwoA_0_0_4_0 = (0*LSCA) + (4*LSPA)(*MT0I+PAD) = 4096
buffer_load_dword v[vgprG2LA+4], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+3] offen offset:0 // G -> Reg 0_0_4_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+5] offset:5120 // lwoA_0_0_5_0 = (0*LSCA) + (5*LSPA)(*MT0I+PAD) = 5120
buffer_load_dword v[vgprG2LA+5], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+4] offen offset:0 // G -> Reg 0_0_5_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+6] offset:6144 // lwoA_0_0_6_0 = (0*LSCA) + (6*LSPA)(*MT0I+PAD) = 6144
buffer_load_dword v[vgprG2LA+6], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+5] offen offset:0 // G -> Reg 0_0_6_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+7] offset:7168 // lwoA_0_0_7_0 = (0*LSCA) + (7*LSPA)(*MT0I+PAD) = 7168
buffer_load_dword v[vgprG2LA+7], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+6] offen offset:0 // G -> Reg 0_0_7_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:0 // G -> Reg 0_0_0_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:1280 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 1280
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:0 // G -> Reg 0_0_1_0

/* local write swap offsets a */
v_xor_b32 v[vgprLocalWriteAddrA+0], 0x4000, v[vgprLocalWriteAddrA+0] // swap Red Blk

/* local write swap offsets b */
v_xor_b32 v[vgprLocalWriteAddrB+0], 0x4000, v[vgprLocalWriteAddrB+0] // swap Red Blk
s_waitcnt lgkmcnt(15)                              // wait for prior local read local write old=0, new=15 newLW=10 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v34 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=-1 numReadsIterA=1 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/* iter 1 */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:1  */
ds_read_u16 v[vgprValuA_X2_I0+0], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v33, v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=2 iui=0
ds_read_u16 v[vgprValuA_X2_I0+1], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v34, v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=2 iui=0
s_waitcnt lgkmcnt(14)                              // wait for prior local read local write old=0, new=14 newLW=10 newLR=4
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X1_I0+0], v[vgprValuA_X1_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X1_I0+1], v[vgprValuA_X1_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X1_I0+0+0+0:vgprValuA_X1_I0+0+0+0+1], v[vgprValuB_X0_I0+0+2+0:vgprValuB_X0_I0+0+2+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=0 numReadsIterA=2 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */

/* iter 2 (reset local read pointers iteration)  (swap local read pointers iteration)  */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:2  */
ds_read_u16 v[vgprValuA_X3_I0+0], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=3 iui=0
ds_read_u16 v[vgprValuA_X3_I0+1], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=3 iui=0

/* local read swap offsets a */
v_xor_b32 v[vgprLocalReadAddrA], 0x4000, v[vgprLocalReadAddrA] // swap Red Blk

/* local read swap offsets b */
v_xor_b32 v[vgprLocalReadAddrB], 0x4000, v[vgprLocalReadAddrB] // swap Red Blk

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */
s_waitcnt lgkmcnt(4)                               // wait for prior local read local write old=0, new=4 newLW=0 newLR=4
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X2_I0+0], v[vgprValuA_X2_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X2_I0+1], v[vgprValuA_X2_I0+1], v34 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X2_I0+0+0+0:vgprValuA_X2_I0+0+0+0+1], v[vgprValuB_X2_I0+0+0+0:vgprValuB_X2_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=0 */
/* dataAtIterA=1 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */

/* iter 3 */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:3  */
s_waitcnt lgkmcnt(0)                               // 3wait for local write
// Skip force waitcnt0
s_barrier
ds_read_u16 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v33, v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v34, v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X3_I0+0], v[vgprValuA_X3_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X3_I0+1], v[vgprValuA_X3_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X3_I0+0+0+0:vgprValuA_X3_I0+0+0+0+1], v[vgprValuB_X2_I0+0+2+0:vgprValuB_X2_I0+0+2+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=1 */
/* dataAtIterA=2 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/******************************************/
/* Unrolled Loop - End                    */
/******************************************/

/* closeLoop loopL finalLoop=1 tailLoop=0 */
s_sub_u32 s[sgprLoopCounterL], s[sgprLoopCounterL], 1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounterL], 0x2              // counterL==2
s_cbranch_scc0 label_LoopBeginL                    // restart LoopL
label_LoopEndL:

/* Before NLL: Check VGPR.checkin for INT8 LW */

/******************************************/
/* Ord. NoGlobalLoadLoop - Begin          */
/******************************************/

/* iter 0 (swap and reset local write pointers iteration)  */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:0  */
ds_read_u16 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16 v[vgprValuA_X1_I0+1], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuB_X2_I0+0:vgprValuB_X2_I0+0+3], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0

/* global read inc A loopL */
s_add_u32 s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* global read inc B loopL */
s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32
s_setprio 3                                        // store optimization
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(8)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:1024 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 1024
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(7)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:2048 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 2048
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(6)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:3072 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 3072
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(5)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+4] offset:4096 // lwoA_0_0_4_0 = (0*LSCA) + (4*LSPA)(*MT0I+PAD) = 4096
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(4)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+5] offset:5120 // lwoA_0_0_5_0 = (0*LSCA) + (5*LSPA)(*MT0I+PAD) = 5120
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(3)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+6] offset:6144 // lwoA_0_0_6_0 = (0*LSCA) + (6*LSPA)(*MT0I+PAD) = 6144
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(2)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+7] offset:7168 // lwoA_0_0_7_0 = (0*LSCA) + (7*LSPA)(*MT0I+PAD) = 7168
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:1280 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 1280

/* local write swap offsets a */
v_xor_b32 v[vgprLocalWriteAddrA+0], 0x4000, v[vgprLocalWriteAddrA+0] // swap Red Blk

/* local write swap offsets b */
v_xor_b32 v[vgprLocalWriteAddrB+0], 0x4000, v[vgprLocalWriteAddrB+0] // swap Red Blk
s_waitcnt lgkmcnt(15)                              // wait for prior local read local write old=0, new=15 newLW=10 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v34 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=-1 numReadsIterA=1 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/* iter 1 */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:1  */
ds_read_u16 v[vgprValuA_X2_I0+0], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v33, v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=2 iui=0
ds_read_u16 v[vgprValuA_X2_I0+1], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v34, v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=2 iui=0
s_waitcnt lgkmcnt(14)                              // wait for prior local read local write old=0, new=14 newLW=10 newLR=4
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X1_I0+0], v[vgprValuA_X1_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X1_I0+1], v[vgprValuA_X1_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X1_I0+0+0+0:vgprValuA_X1_I0+0+0+0+1], v[vgprValuB_X0_I0+0+2+0:vgprValuB_X0_I0+0+2+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=0 numReadsIterA=2 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */

/* iter 2 (reset local read pointers iteration)  (swap local read pointers iteration)  */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:2  */
ds_read_u16 v[vgprValuA_X3_I0+0], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=3 iui=0
ds_read_u16 v[vgprValuA_X3_I0+1], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=3 iui=0

/* local read swap offsets a */
v_xor_b32 v[vgprLocalReadAddrA], 0x4000, v[vgprLocalReadAddrA] // swap Red Blk

/* local read swap offsets b */
v_xor_b32 v[vgprLocalReadAddrB], 0x4000, v[vgprLocalReadAddrB] // swap Red Blk

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */
s_waitcnt lgkmcnt(4)                               // wait for prior local read local write old=0, new=4 newLW=0 newLR=4
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X2_I0+0], v[vgprValuA_X2_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X2_I0+1], v[vgprValuA_X2_I0+1], v34 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X2_I0+0+0+0:vgprValuA_X2_I0+0+0+0+1], v[vgprValuB_X2_I0+0+0+0:vgprValuB_X2_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=0 */
/* dataAtIterA=1 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */

/* iter 3 */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:3  */
s_waitcnt lgkmcnt(0)                               // 3wait for local write
// Skip force waitcnt0
s_barrier
ds_read_u16 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v33, v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v34, v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=0 iui=0
ds_read_b128 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+3], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X3_I0+0], v[vgprValuA_X3_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X3_I0+1], v[vgprValuA_X3_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X3_I0+0+0+0:vgprValuA_X3_I0+0+0+0+1], v[vgprValuB_X2_I0+0+2+0:vgprValuB_X2_I0+0+2+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=1 */
/* dataAtIterA=2 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */
label_toPGR1_0:

/******************************************/
/* Opt. NoLoadLoop - Begin                */
/******************************************/
s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 label_OptNLL_End                    // Branch if Beta is not zero

s_cmp_eq_u32 s[sgprAlpha], 1.0                     // Alpha == 1.0 ?
s_cbranch_scc0 label_OptNLL_End                    // branch if alpha != 1

s_and_b32 s62, 63, s[sgprSizeI]                    // s62 = s[sgprSizeI] % 64
s_add_u32 s63, -0x1, s[sgprNumWorkGroups0]
s_cmp_ge_u32 s[sgprWorkGroup0], s63                // wg0 >= nwg0-1 ?
s_cselect_b32 s62, s62, 0                          // set rMT0
s_cmpk_gt_u32 s62, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_OptNLL_End                    // jump if edges required
s_and_b32 s62, 15, s[sgprSizeJ]                    // s62 = s[sgprSizeJ] % 16
s_add_u32 s63, -0x1, s[sgprNumWorkGroups1]
s_cmp_ge_u32 s[sgprWorkGroup1], s63                // wg1 >= nwg1-1
s_cselect_b32 s62, s62, 0                          // set rMT1
s_cmpk_gt_u32 s62, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_OptNLL_End                    // jump if edges required

s_and_b32 s63, 63, s[sgprSizesSum+0]               // s63 = s[sgprSizesSum+0] % 64
s_cmp_eq_u32 s63, 0x0                              // numIterL == 0
s_cbranch_scc0 label_OptNLL_End                    // skip if tail loop required

/* iter 0 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:0  */
ds_read_u16 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16 v[vgprValuA_X1_I0+1], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuB_X2_I0+0:vgprValuB_X2_I0+0+3], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
s_setprio 3                                        // store optimization
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v34 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=-1 numReadsIterA=1 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/* iter 1 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:1  */
ds_read_u16 v[vgprValuA_X2_I0+0], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v33, v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=2 iui=0
ds_read_u16 v[vgprValuA_X2_I0+1], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v34, v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=2 iui=0
s_waitcnt lgkmcnt(4)                               // wait for prior local read local write old=0, new=4 newLW=0 newLR=4
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X1_I0+0], v[vgprValuA_X1_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X1_I0+1], v[vgprValuA_X1_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X1_I0+0+0+0:vgprValuA_X1_I0+0+0+0+1], v[vgprValuB_X0_I0+0+2+0:vgprValuB_X0_I0+0+2+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=0 numReadsIterA=2 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */

/* iter 2 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:2  */
ds_read_u16 v[vgprValuA_X3_I0+0], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=3 iui=0
ds_read_u16 v[vgprValuA_X3_I0+1], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=3 iui=0
s_waitcnt lgkmcnt(4)                               // wait for prior local read local write old=0, new=4 newLW=0 newLR=4
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X2_I0+0], v[vgprValuA_X2_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X2_I0+1], v[vgprValuA_X2_I0+1], v34 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X2_I0+0+0+0:vgprValuA_X2_I0+0+0+0+1], v[vgprValuB_X2_I0+0+0+0:vgprValuB_X2_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=0 */
/* dataAtIterA=1 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */

/* iter 3 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:3  */
s_waitcnt lgkmcnt(0)                               // wait for prior local read local write old=0, new=0 newLW=0 newLR=0
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X3_I0+0], v[vgprValuA_X3_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X3_I0+1], v[vgprValuA_X3_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X3_I0+0+0+0:vgprValuA_X3_I0+0+0+0+1], v[vgprValuB_X2_I0+0+2+0:vgprValuB_X2_I0+0+2+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=2 numReadsIterA=3 skipReadsIterA=0 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */
/* Stores for OptNLL */
label_Summation_End_OptNLL:
s_setprio 0                                        // optimization store
/* endSummation: add vgpr [0...30) to pool */
.set ScalarGlobalReadOffsetB, UNDEF
.set ShadowLimitA, UNDEF
.set SrdA, UNDEF
.set SrdB, UNDEF
.set ShadowLimitB, UNDEF
.set ScalarGlobalReadOffsetA, UNDEF
/* load store sgprs */

/* Mapping of Acc register -> C Vgpr register */
/* computeStoreVgprs */
v_lshrrev_b32 v4, 6, v[vgprSerial]                 // v4 = v[vgprSerial] / 64
v_lshrrev_b32 v1, 2, v4                            // v1 = v4 / 4
v_mul_lo_u32 v1, 0x10, v1                          // wave coordination offset 1
v_and_b32 v5, 15, v[vgprSerial]                    // v5 = v[vgprSerial] % 16
v_add_u32 v1, v5, v1                               // coordination 1 = wave_id1 + tid1
v_mul_lo_u32 v2, v1, s[sgprStrideC1J]              //  offset 1
v_mul_lo_u32 v3, v1, s[sgprStrideD1J]              //  offset 1
v_and_b32 v5, 3, v4                                // v5 = v4 % 4
v_mul_lo_u32 v5, 0x10, v5                          // wave coordination offset 0
v_and_b32 v0, 63, v[vgprSerial]                    // v0 = v[vgprSerial] % 64
v_lshrrev_b32 v0, 4, v0                            // v0 = v0 / 16
v_lshlrev_b32 v0, 0x2, v0                          // thread0 * continuous_output
v_add_u32 v0, v5, v0                               // coordination 0 = wave_id0 + tid0
s_mul_i32 s41, 64, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v0, s41, v0                              // coord 0 = (tid0/MI_m)*4 + waveG0*MIB_m + MT0*SG0
s_mul_i32 s41, 16, s[sgprWorkGroup1]               // wgp1 * MT1
v_add_u32 v1, s41, v1                              // coord 1 = (tid0%MI_m) + waveG1*MIB_n + MT1*SG1

/******************************************/
/* Global Write Elements                  */
/******************************************/
label_GW_B0_E0:

/* edge=0, allocate 2 sgpr. perBatchTmpS=2 perBatchMaskS=0 perElementMaskS=0 elementsPerBatch=58 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw4)                       */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v6, v3, v0, 0x1                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+8], acc0            // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+9], acc1            // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+10], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+11], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* apply mask, calc new C and issue writes */
v_cvt_f16_f32 v[vgprValuC+8], v[vgprValuC+8]       // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+9], v[vgprValuC+9]       // convert C to fp16
v_pack_b32_f16 v8, v[vgprValuC+8], v[vgprValuC+9]  // Pack with neighbor
v_cvt_f16_f32 v[vgprValuC+10], v[vgprValuC+10]     // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+11], v[vgprValuC+11]     // convert C to fp16
v_pack_b32_f16 v9, v[vgprValuC+10], v[vgprValuC+11] // Pack with neighbor
buffer_store_dwordx2 v[8:9], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_GW_End                              // jump to end
label_GW_End:

//s_endpgm                                           // Kernel End
s_branch GLOBAL_SYNC_ENTRY


label_OptNLL_End:

/******************************************/
/* Ord. NoLoadLoop - Begin                */
/******************************************/

/* iter 0 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:0  */
ds_read_u16 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:640 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16 v[vgprValuA_X1_I0+1], v[vgprLocalReadAddrA] offset:768 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:896 // L -> Reg lro=256 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuB_X2_I0+0:vgprValuB_X2_I0+0+3], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
s_setprio 3                                        // store optimization
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v34 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=-1 numReadsIterA=1 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/* iter 1 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:1  */
ds_read_u16 v[vgprValuA_X2_I0+0], v[vgprLocalReadAddrA] offset:4096 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v33, v[vgprLocalReadAddrA] offset:4224 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=2 iui=0
ds_read_u16 v[vgprValuA_X2_I0+1], v[vgprLocalReadAddrA] offset:4352 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v34, v[vgprLocalReadAddrA] offset:4480 // L -> Reg lro=2048 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=2 iui=0
s_waitcnt lgkmcnt(4)                               // wait for prior local read local write old=0, new=4 newLW=0 newLR=4
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X1_I0+0], v[vgprValuA_X1_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X1_I0+1], v[vgprValuA_X1_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X1_I0+0+0+0:vgprValuA_X1_I0+0+0+0+1], v[vgprValuB_X0_I0+0+2+0:vgprValuB_X0_I0+0+2+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=0 numReadsIterA=2 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */

/* iter 2 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:2  */
ds_read_u16 v[vgprValuA_X3_I0+0], v[vgprLocalReadAddrA] offset:4608 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:4736 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=3 iui=0
ds_read_u16 v[vgprValuA_X3_I0+1], v[vgprLocalReadAddrA] offset:4864 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:4992 // L -> Reg lro=2304 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=3 iui=0
s_waitcnt lgkmcnt(4)                               // wait for prior local read local write old=0, new=4 newLW=0 newLR=4
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X2_I0+0], v[vgprValuA_X2_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X2_I0+1], v[vgprValuA_X2_I0+1], v34 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X2_I0+0+0+0:vgprValuA_X2_I0+0+0+0+1], v[vgprValuB_X2_I0+0+0+0:vgprValuB_X2_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=0 */
/* dataAtIterA=1 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */

/* iter 3 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:3  */
s_waitcnt lgkmcnt(0)                               // wait for prior local read local write old=0, new=0 newLW=0 newLR=0
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X3_I0+0], v[vgprValuA_X3_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X3_I0+1], v[vgprValuA_X3_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X3_I0+0+0+0:vgprValuA_X3_I0+0+0+0+1], v[vgprValuB_X2_I0+0+2+0:vgprValuB_X2_I0+0+2+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=2 numReadsIterA=3 skipReadsIterA=0 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=1 skipReadsIterB=0 readsPerIterB=1 */
label_PrefetchGlobalLastIterEnd:

/******************************************/
/* Tail Loop                              */
/******************************************/

/* local write reset offsets a */
v_and_b32 v[vgprLocalWriteAddrA], 0xf03fff, v[vgprLocalWriteAddrA] // reset to Red

/* local write reset offsets b */
v_and_b32 v[vgprLocalWriteAddrB], 0xf03fff, v[vgprLocalWriteAddrB] // reset to Red

// numIterL = (((sizeL % LOCAL_DEPTHU) + LOCAL_SPLITU - 1) / LOCAL_SPLITU)
s_and_b32 s[sgprLoopCounterL], 63, s[sgprSizesSum+0] // s[sgprLoopCounterL] = s[sgprSizesSum+0] % 64
s_cmp_eq_u32 s[sgprLoopCounterL], 0x0              // numIterL == 0
s_mov_b32 s[sgprOrigLoopCounter], 0                // repurpose to count each localRead increment
s_cbranch_scc1 label_SkipTailLoopL                 // skip to end of tail loop b/c numIter==0

/* Update M0 for DTLDS */

/* global read a */
/* g2l=0, load component 0 */
buffer_load_short_d16 v[vgprG2LA+0+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+0+0], v[vgprG2LA+0+0], v33     // HasEccHalf: pack
/* g2l=1, load component 0 */
buffer_load_short_d16 v[vgprG2LA+1+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:0 // load one buffer value
/* g2l=1, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+1+0], v[vgprG2LA+1+0], v33     // HasEccHalf: pack
/* g2l=2, load component 0 */
buffer_load_short_d16 v[vgprG2LA+2+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:0 // load one buffer value
/* g2l=2, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+2+0], v[vgprG2LA+2+0], v33     // HasEccHalf: pack
/* g2l=3, load component 0 */
buffer_load_short_d16 v[vgprG2LA+3+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:0 // load one buffer value
/* g2l=3, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+3+0], v[vgprG2LA+3+0], v33     // HasEccHalf: pack
/* g2l=4, load component 0 */
buffer_load_short_d16 v[vgprG2LA+4+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+3] offen offset:0 // load one buffer value
/* g2l=4, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+3] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+4+0], v[vgprG2LA+4+0], v33     // HasEccHalf: pack
/* g2l=5, load component 0 */
buffer_load_short_d16 v[vgprG2LA+5+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+4] offen offset:0 // load one buffer value
/* g2l=5, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+4] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+5+0], v[vgprG2LA+5+0], v33     // HasEccHalf: pack
/* g2l=6, load component 0 */
buffer_load_short_d16 v[vgprG2LA+6+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+5] offen offset:0 // load one buffer value
/* g2l=6, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+5] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+6+0], v[vgprG2LA+6+0], v33     // HasEccHalf: pack
/* g2l=7, load component 0 */
buffer_load_short_d16 v[vgprG2LA+7+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+6] offen offset:0 // load one buffer value
/* g2l=7, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+6] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+7+0], v[vgprG2LA+7+0], v33     // HasEccHalf: pack

/* Update M0 for DTLDS */

/* global read b */
/* g2l=0, load component 0 */
buffer_load_short_d16 v[vgprG2LB+0+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+0+0], v[vgprG2LB+0+0], v33     // HasEccHalf: pack
/* g2l=1, load component 0 */
buffer_load_short_d16 v[vgprG2LB+1+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:0 // load one buffer value
/* g2l=1, load component 1 */
buffer_load_short_d16_hi v33, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+1+0], v[vgprG2LB+1+0], v33     // HasEccHalf: pack
s_waitcnt vmcnt(0)                                 // 2wait for global read
// Skip force waitcnt0
s_barrier

/* local write a */
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:1024 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 1024
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:2048 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 2048
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:3072 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 3072
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+4] offset:4096 // lwoA_0_0_4_0 = (0*LSCA) + (4*LSPA)(*MT0I+PAD) = 4096
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+5] offset:5120 // lwoA_0_0_5_0 = (0*LSCA) + (5*LSPA)(*MT0I+PAD) = 5120
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+6] offset:6144 // lwoA_0_0_6_0 = (0*LSCA) + (6*LSPA)(*MT0I+PAD) = 6144
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+7] offset:7168 // lwoA_0_0_7_0 = (0*LSCA) + (7*LSPA)(*MT0I+PAD) = 7168

/* local write b */
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:1280 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 1280

/* Recalc local read offsets */
/* lr0I */
v_and_b32 v35, 63, v[vgprSerial]                   // 0. thread id in wave: wtid = tid % wavelength(64)
v_and_b32 v34, 15, v35                             // 1. N offset: nIdx = wtid % MI_N(16)
                                                   // 1. N offset: nOffset = nIdx * nStride(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v33, 4, v35                          // 2. block offset: bnIdx = wtid / dividedForBlkId(16)
v_and_b32 v33, 0, v33                              // 2. block offset: bnIdx = bnIdx % num1DBlocks(1)
v_lshlrev_b32 v33, 0x4, v33                        // 2. block offset: bnOffset = bnIdx * strideBlock(16)
v_add_u32 v34, v33, v34                            // 3. add N and block offset: bnOffset = block and N offset
                                                   // 3. apply VectorWidth: bnOffset = bnOffset * vw(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v35, 4, v35                          // 4. K offset: kIdx = wtid / (MIN(16) * MIBB(1))
v_lshlrev_b32 v35, 0x8, v35                        // 4. K offset: lrKOffset = kIdx * mStride(256)
v_add_u32 v34, v35, v34                            // 5. offset in wave: lrOffset = bnOffset + lrKOffset
v_lshrrev_b32 v33, 6, v[vgprSerial]                // 6. wave offset in N dimen: wtid = tid / dividedForWaveId(64)
v_and_b32 v33, 3, v33                              // 6. wave offset in M dimen: wtid0 = wtid / num1DWaves(4)
v_lshlrev_b32 v33, 0x4, v33                        // 6. wave offset in M dimen: wOffset = wtid0 * W0Stride(16)
v_add_u32 v34, v33, v34                            // 7. final local read offset: flrOffset = lrOffset + WOffset
/* lr1J */
v_and_b32 v36, 63, v[vgprSerial]                   // 0. thread id in wave: wtid = tid % wavelength(64)
v_and_b32 v35, 15, v36                             // 1. N offset: nIdx = wtid % MI_N(16)
v_lshlrev_b32 v35, 0x6, v35                        // 1. N offset: nOffset = nIdx * nStride(64)
v_lshrrev_b32 v33, 4, v36                          // 2. block offset: bnIdx = wtid / dividedForBlkId(16)
v_and_b32 v33, 0, v33                              // 2. block offset: bnIdx = bnIdx % num1DBlocks(1)
v_lshlrev_b32 v33, 0xa, v33                        // 2. block offset: bnOffset = bnIdx * strideBlock(1024)
v_add_u32 v35, v33, v35                            // 3. add N and block offset: bnOffset = block and N offset
                                                   // 3. apply VectorWidth: bnOffset = bnOffset * vw(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v36, 4, v36                          // 4. K offset: kIdx = wtid / (MIN(16) * MIBB(1))
v_lshlrev_b32 v36, 0x2, v36                        // 4. K offset: lrKOffset = kIdx * mStride(4)
v_add_u32 v35, v36, v35                            // 5. offset in wave: lrOffset = bnOffset + lrKOffset
v_lshrrev_b32 v33, 8, v[vgprSerial]                // LSU offset: sgid = Serial / subGroup(256)
s_mov_b32 s61, 64                                  // LSU offset: stride = MT0(64) + PAD0(0)
v_mul_lo_u32 v33, s61, v33                         // LSU offset: lsuoffset = sgid*(MT0+PAD)
v_add_lshl_u32 v[vgprLocalReadAddrA], v33, v34, 0x1 // Final Offset: offset = (lro0*VW+lsuoffset)*bpe
/* N/A */
v_lshrrev_b32 v33, 8, v[vgprSerial]                // LSU offset: sgid = Serial / subGroup(256)
s_mov_b32 s61, 16                                  // LSU offset: stride = MT1(16) + PAD1(0)
v_mul_lo_u32 v33, s61, v33                         // LSU offset: lsuoffset = sgid*(MT1+PAD)
v_add_lshl_u32 v[vgprLocalReadAddrB], v33, v35, 0x1 // Final Offset: offset = (lro1*VW+lsuoffset)*bpe
v_lshrrev_b32 v34, 7, v[vgprLocalReadAddrB]        // Final Offset: padding 16 per block 128
v_lshlrev_b32 v34, 0x5, v34                        // Final Offset: padding 16 per block 128
v_add_u32 v[vgprLocalReadAddrB], v34, v[vgprLocalReadAddrB] // Final Offset: add padding 16 per block 128
v_add_co_u32 v[vgprLocalReadAddrB+0], vcc, 0x2000, v[vgprLocalReadAddrB+0] //  += LdsOffsetB (lower)
s_waitcnt lgkmcnt(0)                               // 5wait for local write
// Skip force waitcnt0
s_barrier

/* local read reset offsets a */

/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrA], 0x3fff, v[vgprLocalReadAddrA] // reset Red,Blk -> Red

/* local read reset offsets b */

/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrB], 0x3fff, v[vgprLocalReadAddrB] // reset Red,Blk -> Red

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */

/* tail loop: macs */
label_TailLoopBeginL:

/* local read a */
ds_read_u16 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v33, v[vgprLocalReadAddrA] offset:128 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:256 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=2 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v34, v[vgprLocalReadAddrA] offset:384 // L -> Reg lro=0 swapByteOffset=0 ti=64 vIdx=0 rIdx=3 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b64 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+1], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read inc a */
s_mov_b32 s61, 0x800                               // inc
v_add_co_u32 v[vgprLocalReadAddrA], vcc, s61, v[vgprLocalReadAddrA] // lrA += 2048 (LSU*(MT+PAD)*bpe)

/* local read inc b */
s_mov_b32 s61, 0x20                                // inc
v_add_co_u32 v[vgprLocalReadAddrB], vcc, s61, v[vgprLocalReadAddrB] // lrB += 32 (LSU*bpe)
s_waitcnt lgkmcnt(0)                               // 4wait for local read
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v33 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v34 // pack two half Vgpr to one Vgpr
v_and_b32 v33, 63, v[vgprSerial]                   // v33 = v[vgprSerial] % 64
v_lshrrev_b32 v33, 4, v33                          // v33 = v33 / 16
v_lshlrev_b32 v33, 0x2, v33                        // v33 = v33 * 4
v_cmp_ge_i32 s[62:63], v33, s[sgprLoopCounterL]    // check K index >= Size L
v_cndmask_b32 v[vgprValuA_X0_I0+0+0], v[vgprValuA_X0_I0+0+0], 0x0, s[62:63] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuB_X0_I0+0+0], v[vgprValuB_X0_I0+0+0], 0x0, s[62:63] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuA_X0_I0+0+1], v[vgprValuA_X0_I0+0+1], 0x0, s[62:63] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuB_X0_I0+0+1], v[vgprValuB_X0_I0+0+1], 0x0, s[62:63] // set 0 if K_idx >= sizeL
v_sub_u32 v33, s[sgprLoopCounterL], v33            // get distance between size and k index
v_cmp_lt_i32 s[62:63], v33, 4                      // set partial 0 if distance less than input per thread
s_and_b32 s64, s[sgprLoopCounterL], 3              // get inputs for edge thread
s_sub_u32 s64, 4, s64                              // use shift to fill 0 for outside element
s_lshl_b32 s64, s64, 4                             // use shift to fill 0 for outside element
v_lshlrev_b64 v[34:35], s64, v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1]
v_cndmask_b32 v[vgprValuA_X0_I0+0+0+0+0], v[vgprValuA_X0_I0+0+0+0+0], v34, s[62:63]
v_cndmask_b32 v[vgprValuA_X0_I0+0+0+0+1], v[vgprValuA_X0_I0+0+0+0+1], v35, s[62:63]
v_lshlrev_b64 v[34:35], s64, v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1]
v_cndmask_b32 v[vgprValuB_X0_I0+0+0+0+0], v[vgprValuB_X0_I0+0+0+0+0], v34, s[62:63]
v_cndmask_b32 v[vgprValuB_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0+1], v35, s[62:63]
s_nop 1
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]

/* closeLoop loopL finalLoop=1 tailLoop=1 */
s_sub_i32 s[sgprLoopCounterL], s[sgprLoopCounterL], 0x10 // dec counterL (tailLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x10 // inc counterL
s_cmp_le_i32 s[sgprLoopCounterL], 0x0              // counterL<=0
s_cbranch_scc0 label_TailLoopBeginL                // restart LoopL
label_TailLoopEndL:
label_SkipTailLoopL:
label_Summation_End_41J57QVIGG8A3EGO_0:
s_setprio 0                                        // optimization store
/* endSummation: add vgpr [0...30) to pool */
.set ScalarGlobalReadOffsetB, UNDEF
.set ShadowLimitA, UNDEF
.set SrdA, UNDEF
.set SrdB, UNDEF
.set ShadowLimitB, UNDEF
.set ScalarGlobalReadOffsetA, UNDEF
/* load store sgprs */

/* Mapping of Acc register -> C Vgpr register */

/* not-LocalSplitU: global write indices */
/* computeStoreVgprs */
v_lshrrev_b32 v4, 6, v[vgprSerial]                 // v4 = v[vgprSerial] / 64
v_lshrrev_b32 v1, 2, v4                            // v1 = v4 / 4
v_mul_lo_u32 v1, 0x10, v1                          // wave coordination offset 1
v_and_b32 v5, 15, v[vgprSerial]                    // v5 = v[vgprSerial] % 16
v_add_u32 v1, v5, v1                               // coordination 1 = wave_id1 + tid1
v_mul_lo_u32 v2, v1, s[sgprStrideC1J]              //  offset 1
v_mul_lo_u32 v3, v1, s[sgprStrideD1J]              //  offset 1
v_and_b32 v5, 3, v4                                // v5 = v4 % 4
v_mul_lo_u32 v5, 0x10, v5                          // wave coordination offset 0
v_and_b32 v0, 63, v[vgprSerial]                    // v0 = v[vgprSerial] % 64
v_lshrrev_b32 v0, 4, v0                            // v0 = v0 / 16
v_lshlrev_b32 v0, 0x2, v0                          // thread0 * continuous_output
v_add_u32 v0, v5, v0                               // coordination 0 = wave_id0 + tid0
s_mul_i32 s41, 64, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v0, s41, v0                              // coord 0 = (tid0/MI_m)*4 + waveG0*MIB_m + MT0*SG0
s_mul_i32 s41, 16, s[sgprWorkGroup1]               // wgp1 * MT1
v_add_u32 v1, s41, v1                              // coord 1 = (tid0%MI_m) + waveG1*MIB_n + MT1*SG1

/* not-LocalSplitU: global write */

/******************************************/
/* Global Write Elements                  */
/******************************************/
s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 label_GW_Beta_3                     // Branch if Beta is not zero

s_and_b32 s42, 63, s[sgprSizeI]                    // s42 = s[sgprSizeI] % 64
s_add_u32 s43, -0x1, s[sgprNumWorkGroups0]
s_cmp_ge_u32 s[sgprWorkGroup0], s43                // wg0 >= nwg0-1 ?
s_cselect_b32 s42, s42, 0                          // set rMT0
s_cmpk_gt_u32 s42, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_GW_B0_E1                      // jump if edges required
s_and_b32 s42, 15, s[sgprSizeJ]                    // s42 = s[sgprSizeJ] % 16
s_add_u32 s43, -0x1, s[sgprNumWorkGroups1]
s_cmp_ge_u32 s[sgprWorkGroup1], s43                // wg1 >= nwg1-1
s_cselect_b32 s42, s42, 0                          // set rMT1
s_cmpk_gt_u32 s42, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_GW_B0_E1                      // jump if edges required
label_GW_B0_E0_1:

/* edge=0, allocate 2 sgpr. perBatchTmpS=2 perBatchMaskS=0 perElementMaskS=0 elementsPerBatch=58 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw4)                       */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v6, v3, v0, 0x1                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+8], acc0            // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+9], acc1            // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+10], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+11], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0)] */
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha

/* apply mask, calc new C and issue writes */
v_cvt_f16_f32 v[vgprValuC+8], v[vgprValuC+8]       // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+9], v[vgprValuC+9]       // convert C to fp16
v_pack_b32_f16 v8, v[vgprValuC+8], v[vgprValuC+9]  // Pack with neighbor
v_cvt_f16_f32 v[vgprValuC+10], v[vgprValuC+10]     // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+11], v[vgprValuC+11]     // convert C to fp16
v_pack_b32_f16 v9, v[vgprValuC+10], v[vgprValuC+11] // Pack with neighbor
buffer_store_dwordx2 v[8:9], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_GW_End_1                            // jump to end
label_GW_B0_E1:

/* edge=1, allocate 6 sgpr. perBatchTmpS=4 perBatchMaskS=2 perElementMaskS=0 elementsPerBatch=46 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw4)                       */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[42:43], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[46:47], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[46:47], s[42:43], s[46:47]             // in0 && in1
v_add_lshl_u32 v6, v3, v0, 0x1                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v6, -1, v6, s[46:47]                 // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+8], acc0            // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+9], acc1            // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+10], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+11], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0)] */
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha

/* apply mask, calc new C and issue writes */
v_cvt_f16_f32 v[vgprValuC+8], v[vgprValuC+8]       // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+9], v[vgprValuC+9]       // convert C to fp16
v_pack_b32_f16 v8, v[vgprValuC+8], v[vgprValuC+9]  // Pack with neighbor
v_cvt_f16_f32 v[vgprValuC+10], v[vgprValuC+10]     // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+11], v[vgprValuC+11]     // convert C to fp16
v_pack_b32_f16 v9, v[vgprValuC+10], v[vgprValuC+11] // Pack with neighbor
buffer_store_dwordx2 v[8:9], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_GW_End_1                            // jump to end
label_GW_Beta_3:
s_and_b32 s42, 63, s[sgprSizeI]                    // s42 = s[sgprSizeI] % 64
s_add_u32 s43, -0x1, s[sgprNumWorkGroups0]
s_cmp_ge_u32 s[sgprWorkGroup0], s43                // wg0 >= nwg0-1 ?
s_cselect_b32 s42, s42, 0                          // set rMT0
s_cmpk_gt_u32 s42, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_GW_B1_E1                      // jump if edges required
s_and_b32 s42, 15, s[sgprSizeJ]                    // s42 = s[sgprSizeJ] % 16
s_add_u32 s43, -0x1, s[sgprNumWorkGroups1]
s_cmp_ge_u32 s[sgprWorkGroup1], s43                // wg1 >= nwg1-1
s_cselect_b32 s42, s42, 0                          // set rMT1
s_cmpk_gt_u32 s42, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_GW_B1_E1                      // jump if edges required
label_GW_B1_E0:

/* edge=0, allocate 2 sgpr. perBatchTmpS=2 perBatchMaskS=0 perElementMaskS=0 elementsPerBatch=38 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw4)                       */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v7, v2, v0, 0x1                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dwordx2 v[8:9], v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C for beta calc
v_add_lshl_u32 v6, v3, v0, 0x1                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+12], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+13], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+14], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+15], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0)] */
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt vmcnt(0)                                 // wait C (interleaved) 0 = 1(1,0) - 0(0,0) + 0 - 1
v_fma_mix_f32 v[vgprValuC+12], s[sgprBeta], v8, v[vgprValuC+12] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+13], s[sgprBeta], v8, v[vgprValuC+13] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+14], s[sgprBeta], v9, v[vgprValuC+14] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+15], s[sgprBeta], v9, v[vgprValuC+15] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_cvt_f16_f32 v[vgprValuC+12], v[vgprValuC+12]     // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+13], v[vgprValuC+13]     // convert C to fp16
v_pack_b32_f16 v12, v[vgprValuC+12], v[vgprValuC+13] // Pack with neighbor
v_cvt_f16_f32 v[vgprValuC+14], v[vgprValuC+14]     // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+15], v[vgprValuC+15]     // convert C to fp16
v_pack_b32_f16 v13, v[vgprValuC+14], v[vgprValuC+15] // Pack with neighbor
buffer_store_dwordx2 v[12:13], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_GW_End_1                            // jump to end
label_GW_B1_E1:

/* edge=1, allocate 6 sgpr. perBatchTmpS=4 perBatchMaskS=2 perElementMaskS=0 elementsPerBatch=32 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw4)                       */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[42:43], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[46:47], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[46:47], s[42:43], s[46:47]             // in0 && in1
v_add_lshl_u32 v6, v2, v0, 0x1                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v6, -1, v6, s[46:47]                 // LDC clip if OOB. offset
buffer_load_dwordx2 v[8:9], v6, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C for beta calc
v_add_lshl_u32 v6, v3, v0, 0x1                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v6, -1, v6, s[46:47]                 // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+12], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+13], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+14], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+15], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0)] */
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
s_waitcnt vmcnt(0)                                 // writes & wait C

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+12], s[sgprBeta], v8, v[vgprValuC+12] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+13], s[sgprBeta], v8, v[vgprValuC+13] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+14], s[sgprBeta], v9, v[vgprValuC+14] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+15], s[sgprBeta], v9, v[vgprValuC+15] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_cvt_f16_f32 v[vgprValuC+12], v[vgprValuC+12]     // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+13], v[vgprValuC+13]     // convert C to fp16
v_pack_b32_f16 v12, v[vgprValuC+12], v[vgprValuC+13] // Pack with neighbor
v_cvt_f16_f32 v[vgprValuC+14], v[vgprValuC+14]     // convert C to fp16
v_cvt_f16_f32 v[vgprValuC+15], v[vgprValuC+15]     // convert C to fp16
v_pack_b32_f16 v13, v[vgprValuC+14], v[vgprValuC+15] // Pack with neighbor
buffer_store_dwordx2 v[12:13], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_GW_End_1                            // jump to end
label_GW_End_1:
label_KernelEnd:
s_endpgm                                           // Kernel End

; global sync logic
GLOBAL_SYNC_ENTRY:
    ; fetch semaphore pointer
    ; s[0:1] = kernarg segment pointer
    ; s[0:1]+0x80 = sempahore pointer on HBM
    s_load_dwordx2 s[18:19], s[0:1], 0x80

    ; check if we are at workitem 0
    ; v32 = workitem ID X
    v_cmp_eq_u32_e32 vcc, 0, v32
    s_waitcnt lgkmcnt(0)
    ; backup EXEC mask
    s_and_saveexec_b64 s[0:1], vcc

    ; workitem 0 in a workgroup atomically add 1 to the semaphore
    v_mov_b32_e32 v2, 1
    v_mov_b32_e32 v18, s18
    v_mov_b32_e32 v19, s19
    v_mov_b32_e32 v3, 72 + 1
    flat_atomic_inc v2, v[18:19], v3 glc
    s_waitcnt vmcnt(0)

    ; for workitems != 0 enter barrier directly
    s_cbranch_execz GLOBAL_SYNC_LOOP_END

    ; for workgroups >= 4 enter barrier directly
    s_cmpk_lt_u32_e32 s10, 4 
    s_cbranch_scc0 GLOBAL_SYNC_LOOP_END

    ; only workitem 0 on workgroup [0..4) participate in the spin loop
    ; use atomic add instructions to retrieve the # of workgroups finished
GLOBAL_SYNC_LOOP:
    v_mov_b32_e32 v2, 0
    flat_atomic_add v2, v[18:19], v2 glc
    s_waitcnt vmcnt(0)
    v_cmp_eq_u32_e32 vcc, 72, v2
    s_waitcnt vmcnt(0)
    s_cbranch_vccz GLOBAL_SYNC_LOOP

    ; do an no-effect atomic add plus 0 once again
    v_mov_b32_e32 v2, 0
    flat_atomic_add v2, v[18:19], v2 glc
    s_waitcnt vmcnt(0)

GLOBAL_SYNC_LOOP_END:
    s_barrier

    ; restore EXEC mask
    s_or_saveexec_b64 s[0:1], s[0:1]

    ; clear the semaphore only on workgroup 0
    ; s2 = workgroup ID X
    s_cmpk_eq_u32_e32 s2, 0
    s_cbranch_scc0 GLOBAL_SYNC_END
    s_mov_b32 s20, 0
    s_store_dword s20, s[18:19] glc
    s_waitcnt vmcnt(0) lgkmcnt(0)

GLOBAL_SYNC_END:

; context restore logic
    ; restore workitem ID x
    v_mov_b32_e32 v0, v200
    ; restore queue_ptr SGPR
    s_mov_b32_e32 s4, s68
    s_mov_b32_e32 s5, s69
    ; restore kernarg_segment_ptr SGPR
    s_mov_b32_e32 s6, s70
    s_mov_b32_e32 s7, s71
    ; restore flat_scratch_init SGPR
    s_mov_b32_e32 s8, s72
    s_mov_b32_e32 s9, s73
    ; restore workgroup_id_x SGPR
    s_mov_b32_e32 s10, s74
    ; restore private segment wavefront offset SGPR
    s_mov_b32_e32 s11, s75
    ; modify kernarg segment ptr to match guest kernel
    s_addc_u32_e32 s6, s6, 0x68

GUEST_KERNEL_ENTRY:
; begin of guest kernel
	s_load_dwordx4 s[72:75], s[6:7], 0x0                       // 000000008100: C00A1203 00000000
	s_load_dwordx2 s[76:77], s[6:7], 0x10                      // 000000008108: C0061303 00000010
	s_add_u32 flat_scratch_lo, s8, s11                         // 000000008110: 80660B08
	s_addc_u32 flat_scratch_hi, s9, 0                          // 000000008114: 82678009
	s_add_u32 s0, s0, s11                                      // 000000008118: 80000B00
	v_mov_b32_e32 v41, v0                                      // 00000000811C: 7E520300
	s_addc_u32 s1, s1, 0                                       // 000000008120: 82018001
	s_mov_b32 s64, s10                                         // 000000008124: BEC0000A
	s_mov_b64 s[66:67], s[4:5]                                 // 000000008128: BEC20104
	s_mov_b32 s4, 0                                            // 00000000812C: BE840080
	v_cmp_eq_u32_e64 s[68:69], 0, v41                          // 000000008130: D0CA0044 00025280
	s_mov_b32 s32, 0                                           // 000000008138: BEA00080
	s_and_saveexec_b64 s[6:7], s[68:69]                        // 00000000813C: BE862044
	s_cbranch_execz 33                                         // 000000008140: BF880021 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0xc8>
	s_mov_b32 s5, s4                                           // 000000008144: BE850004
	s_mov_b32 s10, s4                                          // 000000008148: BE8A0004
	s_mov_b32 s11, s4                                          // 00000000814C: BE8B0004
	v_mov_b32_e32 v6, 0                                        // 000000008150: 7E0C0280
	v_pk_mov_b32 v[0:1], s[4:5], s[4:5] op_sel:[0,1]           // 000000008154: D3B35000 18000804
	v_pk_mov_b32 v[2:3], s[10:11], s[10:11] op_sel:[0,1]       // 00000000815C: D3B35002 1800140A
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:31 offset1:32     // 000000008164: D89C201F 00020006
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:33 offset1:34     // 00000000816C: D89C2221 00020006
	v_pk_mov_b32 v[4:5], s[4:5], s[4:5] op_sel:[0,1]           // 000000008174: D3B35004 18000804
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:67 offset1:68     // 00000000817C: D89C4443 00020006
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:69 offset1:70     // 000000008184: D89C4645 00020006
	ds_write2_b64 v6, v[4:5], v[4:5] offset0:35 offset1:71     // 00000000818C: D89C4723 00040406
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:103 offset1:104   // 000000008194: D89C6867 00020006
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:105 offset1:106   // 00000000819C: D89C6A69 00020006
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:139 offset1:140   // 0000000081A4: D89C8C8B 00020006
	ds_write2_b64 v6, v[0:1], v[2:3] offset0:141 offset1:142   // 0000000081AC: D89C8E8D 00020006
	ds_write2_b64 v6, v[4:5], v[4:5] offset0:107 offset1:143   // 0000000081B4: D89C8F6B 00040406
	v_mov_b32_e32 v0, -1                                       // 0000000081BC: 7E0002C1
	ds_write_b32 v6, v0 offset:1216                            // 0000000081C0: D81A04C0 00000006
	s_or_b64 exec, exec, s[6:7]                                // 0000000081C8: 87FE067E
	v_cmp_gt_u32_e32 vcc, 64, v41                              // 0000000081CC: 7D9852C0
	s_waitcnt lgkmcnt(0)                                       // 0000000081D0: BF8CC07F
	s_barrier                                                  // 0000000081D4: BF8A0000
	s_and_saveexec_b64 s[4:5], vcc                             // 0000000081D8: BE84206A
	s_cbranch_execz 22                                         // 0000000081DC: BF880016 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x138>
	v_lshlrev_b64 v[0:1], v41, 1                               // 0000000081E0: D28F0000 00010329
	s_waitcnt lgkmcnt(0)                                       // 0000000081E8: BF8CC07F
	v_and_b32_e32 v3, s75, v1                                  // 0000000081EC: 2606024B
	v_and_b32_e32 v2, s74, v0                                  // 0000000081F0: 2604004A
	v_cmp_ne_u64_e32 vcc, 0, v[2:3]                            // 0000000081F4: 7DDA0480
	s_and_b64 exec, exec, vcc                                  // 0000000081F8: 86FE6A7E
	s_cbranch_execz 14                                         // 0000000081FC: BF88000E <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x138>
	v_add_co_u32_e32 v0, vcc, -1, v0                           // 000000008200: 320000C1
	v_addc_co_u32_e32 v1, vcc, -1, v1, vcc                     // 000000008204: 380202C1
	v_and_b32_e32 v0, s74, v0                                  // 000000008208: 2600004A
	v_and_b32_e32 v1, s75, v1                                  // 00000000820C: 2602024B
	v_bcnt_u32_b32 v0, v0, 0                                   // 000000008210: D28B0000 00010100
	v_bcnt_u32_b32 v0, v1, v0                                  // 000000008218: D28B0000 00020101
	v_cmp_eq_u32_e32 vcc, s64, v0                              // 000000008220: 7D940040
	s_and_b64 exec, exec, vcc                                  // 000000008224: 86FE6A7E
	s_cbranch_execz 3                                          // 000000008228: BF880003 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x138>
	v_mov_b32_e32 v0, 0                                        // 00000000822C: 7E000280
	ds_write_b32 v0, v41 offset:1216                           // 000000008230: D81A04C0 00002900
	s_or_b64 exec, exec, s[4:5]                                // 000000008238: 87FE047E
	v_mov_b32_e32 v0, 0                                        // 00000000823C: 7E000280
	s_waitcnt lgkmcnt(0)                                       // 000000008240: BF8CC07F
	s_barrier                                                  // 000000008244: BF8A0000
	ds_read_b32 v0, v0 offset:1216                             // 000000008248: D86C04C0 00000000
	s_waitcnt lgkmcnt(0)                                       // 000000008250: BF8CC07F
	v_cmp_eq_u32_e32 vcc, -1, v0                               // 000000008254: 7D9400C1
	v_readfirstlane_b32 s12, v0                                // 000000008258: 7E180500
	s_cbranch_vccnz 350                                        // 00000000825C: BF87015E <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x6d8>
	v_lshrrev_b32_e32 v5, 6, v41                               // 000000008260: 200A5286
	v_cmp_lt_i32_e32 vcc, 0, v5                                // 000000008264: 7D820A80
	s_and_saveexec_b64 s[4:5], vcc                             // 000000008268: BE84206A
	s_xor_b64 s[4:5], exec, s[4:5]                             // 00000000826C: 8884047E
	s_cbranch_execz 42                                         // 000000008270: BF88002A <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x21c>
	v_cmp_lt_i32_e32 vcc, 1, v5                                // 000000008274: 7D820A81
	s_and_saveexec_b64 s[8:9], vcc                             // 000000008278: BE88206A
	s_xor_b64 s[8:9], exec, s[8:9]                             // 00000000827C: 8888087E
	s_cbranch_execz 10                                         // 000000008280: BF88000A <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x1ac>
	v_cmp_eq_u32_e32 vcc, 2, v5                                // 000000008284: 7D940A82
	v_mov_b32_e32 v4, 0                                        // 000000008288: 7E080280
	s_and_saveexec_b64 s[10:11], vcc                           // 00000000828C: BE8A206A
	s_mov_b32 s65, 0                                           // 000000008290: BEC10080
	s_lshl_b64 s[6:7], s[64:65], 8                             // 000000008294: 8E868840
	s_add_u32 s6, s76, s6                                      // 000000008298: 8006064C
	s_addc_u32 s7, s77, s7                                     // 00000000829C: 8207074D
	v_mov_b32_e32 v4, 0x100                                    // 0000000082A0: 7E0802FF 00000100
	s_or_b64 exec, exec, s[10:11]                              // 0000000082A8: 87FE0A7E
	s_or_saveexec_b64 s[8:9], s[8:9]                           // 0000000082AC: BE882108
	s_getreg_b32 s10, hwreg(HW_REG_SH_MEM_BASES, 16, 16)       // 0000000082B0: B88A7C0F
	s_lshl_b32 s11, s10, 16                                    // 0000000082B4: 8E0B900A
	s_movk_i32 s10, 0x5c0                                      // 0000000082B8: B00A05C0
	v_pk_mov_b32 v[0:1], s[10:11], s[10:11] op_sel:[0,1]       // 0000000082BC: D3B35000 1800140A
	v_pk_mov_b32 v[2:3], s[6:7], s[6:7] op_sel:[0,1]           // 0000000082C4: D3B35002 18000C06
	s_xor_b64 exec, exec, s[8:9]                               // 0000000082CC: 88FE087E
	s_cbranch_execz 17                                         // 0000000082D0: BF880011 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x218>
	s_mul_hi_i32 s6, s12, 0xa0                                 // 0000000082D4: 9686FF0C 000000A0
	s_mulk_i32 s12, 0xa0                                       // 0000000082DC: B78C00A0
	s_add_u32 s7, s72, s12                                     // 0000000082E0: 80070C48
	s_addc_u32 s10, s73, s6                                    // 0000000082E4: 820A0649
	s_add_u32 s6, s7, 0x50                                     // 0000000082E8: 8006FF07 00000050
	s_addc_u32 s7, s10, 0                                      // 0000000082F0: 8207800A
	s_getreg_b32 s10, hwreg(HW_REG_SH_MEM_BASES, 16, 16)       // 0000000082F4: B88A7C0F
	s_lshl_b32 s11, s10, 16                                    // 0000000082F8: 8E0B900A
	s_movk_i32 s10, 0x520                                      // 0000000082FC: B00A0520
	v_pk_mov_b32 v[0:1], s[10:11], s[10:11] op_sel:[0,1]       // 000000008300: D3B35000 1800140A
	v_pk_mov_b32 v[2:3], s[6:7], s[6:7] op_sel:[0,1]           // 000000008308: D3B35002 18000C06
	v_mov_b32_e32 v4, 0xa0                                     // 000000008310: 7E0802FF 000000A0
	s_or_b64 exec, exec, s[8:9]                                // 000000008318: 87FE087E
	s_andn2_saveexec_b64 s[4:5], s[4:5]                        // 00000000831C: BE842304
	s_getreg_b32 s6, hwreg(HW_REG_SH_MEM_BASES, 16, 16)        // 000000008320: B8867C0F
	s_lshl_b32 s7, s6, 16                                      // 000000008324: 8E079006
	s_movk_i32 s6, 0x4d0                                       // 000000008328: B00604D0
	v_mov_b32_e32 v4, 0x48                                     // 00000000832C: 7E0802FF 00000048
	v_pk_mov_b32 v[2:3], s[72:73], s[72:73] op_sel:[0,1]       // 000000008334: D3B35002 18009048
	v_pk_mov_b32 v[0:1], s[6:7], s[6:7] op_sel:[0,1]           // 00000000833C: D3B35000 18000C06
	s_or_b64 exec, exec, s[4:5]                                // 000000008344: 87FE047E
	v_lshlrev_b32_e32 v42, 4, v41                              // 000000008348: 24545284
	v_and_b32_e32 v5, 0x3f0, v42                               // 00000000834C: 260A54FF 000003F0
	v_cmp_lt_u32_e32 vcc, v5, v4                               // 000000008354: 7D920905
	s_and_saveexec_b64 s[4:5], vcc                             // 000000008358: BE84206A
	s_cbranch_execz 14                                         // 00000000835C: BF88000E <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x298>
	v_add_co_u32_e32 v2, vcc, v2, v5                           // 000000008360: 32040B02
	v_addc_co_u32_e32 v3, vcc, 0, v3, vcc                      // 000000008364: 38060680
	flat_load_dwordx2 v[6:7], v[2:3]                           // 000000008368: DC540000 06000002
	v_add_co_u32_e32 v0, vcc, v0, v5                           // 000000008370: 32000B00
	v_addc_co_u32_e32 v1, vcc, 0, v1, vcc                      // 000000008374: 38020280
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008378: BF8C0070
	flat_store_dwordx2 v[0:1], v[6:7]                          // 00000000837C: DC740000 00000600
	flat_load_dwordx2 v[2:3], v[2:3] offset:8                  // 000000008384: DC540008 02000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000838C: BF8C0070
	flat_store_dwordx2 v[0:1], v[2:3] offset:8                 // 000000008390: DC740008 00000200
	s_or_b64 exec, exec, s[4:5]                                // 000000008398: 87FE047E
	s_movk_i32 s4, 0xf8                                        // 00000000839C: B00400F8
	v_mov_b32_e32 v0, 0x5c8                                    // 0000000083A0: 7E0002FF 000005C8
	v_mad_u32_u24 v43, v41, s4, v0                             // 0000000083A8: D1C3002B 04000929
	v_mov_b32_e32 v0, 0x5f0                                    // 0000000083B0: 7E0002FF 000005F0
	v_mad_u32_u24 v46, v41, s4, v0                             // 0000000083B8: D1C3002E 04000929
	v_mul_i32_i24_e32 v0, 0xffffff40, v41                      // 0000000083C0: 0C0052FF FFFFFF40
	v_mul_i32_i24_e32 v1, 0xffffffe8, v41                      // 0000000083C8: 0C0252FF FFFFFFE8
	v_lshl_add_u32 v47, v1, 3, v46                             // 0000000083D0: D1FD002F 04B90701
	v_cmp_gt_u32_e64 s[70:71], 16, v41                         // 0000000083D8: D0CC0046 00025290
	v_mov_b32_e32 v45, 0                                       // 0000000083E0: 7E5A0280
	s_mov_b32 s63, 0                                           // 0000000083E4: BEBF0080
	v_add_u32_e32 v56, v43, v0                                 // 0000000083E8: 6870012B
	s_waitcnt lgkmcnt(0)                                       // 0000000083EC: BF8CC07F
	s_barrier                                                  // 0000000083F0: BF8A0000
	s_getpc_b64 s[74:75]                                       // 0000000083F4: BECA1C00
	s_add_u32 s74, s74, _Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv@rel32@lo+4                             // 0000000083F8: 804AFF4A FFFFA018
	s_addc_u32 s75, s75, _Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv@rel32@hi+12                                    // 000000008400: 824BFF4B FFFFFFFF
	s_branch 8                                                 // 000000008408: BF820008 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x32c>
	s_or_b64 exec, exec, s[4:5]                                // 00000000840C: 87FE047E
	s_waitcnt lgkmcnt(0)                                       // 000000008410: BF8CC07F
	v_cmp_ne_u32_e32 vcc, 0, v0                                // 000000008414: 7D9A0080
	s_cmp_lg_u64 vcc, 0                                        // 000000008418: BF13806A
	s_mov_b64 s[4:5], 0                                        // 00000000841C: BE840180
	s_cselect_b64 s[6:7], -1, 0                                // 000000008420: 858680C1
	s_and_b64 vcc, exec, s[6:7]                                // 000000008424: 86EA067E
	s_cbranch_vccnz 200                                        // 000000008428: BF8700C8 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x64c>
	s_and_saveexec_b64 s[4:5], s[68:69]                        // 00000000842C: BE842044
	s_cbranch_execz 13                                         // 000000008430: BF88000D <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x368>
	ds_read_u8 v0, v45 offset:1478                             // 000000008434: D87405C6 0000002D
	s_waitcnt lgkmcnt(0)                                       // 00000000843C: BF8CC07F
	v_and_b32_e32 v0, 3, v0                                    // 000000008440: 26000083
	v_cmp_ne_u16_e32 vcc, 3, v0                                // 000000008444: 7D5A0083
	s_cbranch_vccnz 7                                          // 000000008448: BF870007 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x368>
	ds_read_b64 v[0:1], v45 offset:1464                        // 00000000844C: D8EC05B8 0000002D
	ds_read_b32 v2, v45 offset:1472                            // 000000008454: D86C05C0 0200002D
	s_waitcnt lgkmcnt(0)                                       // 00000000845C: BF8CC07F
	flat_store_dword v[0:1], v2                                // 000000008460: DC700000 00000200
	s_or_b64 exec, exec, s[4:5]                                // 000000008468: 87FE047E
	ds_read_u8 v0, v45 offset:1479                             // 00000000846C: D87405C7 0000002D
	s_mov_b64 s[4:5], -1                                       // 000000008474: BE8401C1
	s_waitcnt lgkmcnt(0)                                       // 000000008478: BF8CC07F
	v_readfirstlane_b32 s12, v0                                // 00000000847C: 7E180500
	v_cmp_lt_i16_e64 s[6:7], s12, 3                            // 000000008480: D0A10006 0001060C
	s_and_b64 vcc, exec, s[6:7]                                // 000000008488: 86EA067E
	s_cbranch_vccnz 64                                         // 00000000848C: BF870040 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x490>
	v_cmp_eq_u16_e64 s[4:5], s12, 3                            // 000000008490: D0AA0004 0001060C
	s_and_b64 vcc, exec, s[4:5]                                // 000000008498: 86EA047E
	s_cbranch_vccz 59                                          // 00000000849C: BF86003B <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x48c>
	s_and_saveexec_b64 s[4:5], s[68:69]                        // 0000000084A0: BE842044
	s_cbranch_execz 56                                         // 0000000084A4: BF880038 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x488>
	ds_read_u8 v0, v43                                         // 0000000084A8: D8740000 0000002B
	s_waitcnt lgkmcnt(0)                                       // 0000000084B0: BF8CC07F
	v_and_b32_e32 v0, 3, v0                                    // 0000000084B4: 26000083
	v_cmp_eq_u16_e32 vcc, 3, v0                                // 0000000084B8: 7D540083
	s_and_b64 exec, exec, vcc                                  // 0000000084BC: 86FE6A7E
	s_cbranch_execz 49                                         // 0000000084C0: BF880031 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x488>
	ds_read_b64 v[2:3], v46                                    // 0000000084C4: D8EC0000 0200002E
	s_waitcnt lgkmcnt(0)                                       // 0000000084CC: BF8CC07F
	v_and_b32_e32 v0, 1, v2                                    // 0000000084D0: 26000481
	v_cmp_eq_u32_e32 vcc, 1, v0                                // 0000000084D4: 7D940081
	s_and_saveexec_b64 s[6:7], vcc                             // 0000000084D8: BE86206A
	s_xor_b64 s[6:7], exec, s[6:7]                             // 0000000084DC: 8886067E
	s_cbranch_execz 6                                          // 0000000084E0: BF880006 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x3fc>
	flat_load_ubyte v0, v[2:3]                                 // 0000000084E4: DC400000 00000002
	v_mov_b32_e32 v1, s63                                      // 0000000084EC: 7E02023F
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000084F0: BF8C0070
	v_and_b32_e32 v0, 0xffff, v0                               // 0000000084F4: 260000FF 0000FFFF
	s_andn2_saveexec_b64 s[6:7], s[6:7]                        // 0000000084FC: BE862306
	s_cbranch_execz 29                                         // 000000008500: BF88001D <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x478>
	v_and_b32_e32 v44, 3, v2                                   // 000000008504: 26580483
	v_cmp_ne_u64_e32 vcc, 0, v[44:45]                          // 000000008508: 7DDA5880
	s_and_saveexec_b64 s[8:9], vcc                             // 00000000850C: BE88206A
	s_xor_b64 s[8:9], exec, s[8:9]                             // 000000008510: 8888087E
	s_cbranch_execz 6                                          // 000000008514: BF880006 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x430>
	flat_load_ushort v0, v[2:3]                                // 000000008518: DC480000 00000002
	v_mov_b32_e32 v1, s63                                      // 000000008520: 7E02023F
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008524: BF8C0070
	v_and_b32_e32 v0, 0xffff, v0                               // 000000008528: 260000FF 0000FFFF
	s_andn2_saveexec_b64 s[8:9], s[8:9]                        // 000000008530: BE882308
	s_cbranch_execz 15                                         // 000000008534: BF88000F <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x474>
	v_and_b32_e32 v44, 7, v2                                   // 000000008538: 26580487
	v_cmp_ne_u64_e32 vcc, 0, v[44:45]                          // 00000000853C: 7DDA5880
	s_and_saveexec_b64 s[10:11], vcc                           // 000000008540: BE8A206A
	s_xor_b64 s[10:11], exec, s[10:11]                         // 000000008544: 888A0A7E
	s_cbranch_execz 5                                          // 000000008548: BF880005 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x460>
	flat_load_dword v44, v[2:3]                                // 00000000854C: DC500000 2C000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008554: BF8C0070
	v_pk_mov_b32 v[0:1], v[44:45], v[44:45] op_sel:[0,1]       // 000000008558: D3B35000 1802592C
	s_andn2_saveexec_b64 s[10:11], s[10:11]                    // 000000008560: BE8A230A
	s_cbranch_execz 2                                          // 000000008564: BF880002 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x470>
	flat_load_dwordx2 v[0:1], v[2:3]                           // 000000008568: DC540000 00000002
	s_or_b64 exec, exec, s[10:11]                              // 000000008570: 87FE0A7E
	s_or_b64 exec, exec, s[8:9]                                // 000000008574: 87FE087E
	s_or_b64 exec, exec, s[6:7]                                // 000000008578: 87FE067E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000857C: BF8C0070
	ds_write_b64 v46, v[0:1]                                   // 000000008580: D89A0000 0000002E
	s_or_b64 exec, exec, s[4:5]                                // 000000008588: 87FE047E
	s_mov_b64 s[4:5], 0                                        // 00000000858C: BE840180
	s_andn2_b64 vcc, exec, s[4:5]                              // 000000008590: 89EA047E
	s_cbranch_vccnz 63                                         // 000000008594: BF87003F <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x594>
	v_cmp_ne_u16_e64 s[4:5], s12, 1                            // 000000008598: D0AD0004 0001020C
	s_and_b64 vcc, exec, s[4:5]                                // 0000000085A0: 86EA047E
	s_cbranch_vccnz 59                                         // 0000000085A4: BF87003B <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x594>
	s_and_saveexec_b64 s[4:5], s[68:69]                        // 0000000085A8: BE842044
	s_cbranch_execz 56                                         // 0000000085AC: BF880038 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x590>
	ds_read_u8 v0, v56                                         // 0000000085B0: D8740000 00000038
	s_waitcnt lgkmcnt(0)                                       // 0000000085B8: BF8CC07F
	v_and_b32_e32 v0, 3, v0                                    // 0000000085BC: 26000083
	v_cmp_eq_u16_e32 vcc, 3, v0                                // 0000000085C0: 7D540083
	s_and_b64 exec, exec, vcc                                  // 0000000085C4: 86FE6A7E
	s_cbranch_execz 49                                         // 0000000085C8: BF880031 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x590>
	ds_read_b64 v[2:3], v47                                    // 0000000085CC: D8EC0000 0200002F
	s_waitcnt lgkmcnt(0)                                       // 0000000085D4: BF8CC07F
	v_and_b32_e32 v0, 1, v2                                    // 0000000085D8: 26000481
	v_cmp_eq_u32_e32 vcc, 1, v0                                // 0000000085DC: 7D940081
	s_and_saveexec_b64 s[6:7], vcc                             // 0000000085E0: BE86206A
	s_xor_b64 s[6:7], exec, s[6:7]                             // 0000000085E4: 8886067E
	s_cbranch_execz 6                                          // 0000000085E8: BF880006 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x504>
	flat_load_ubyte v0, v[2:3]                                 // 0000000085EC: DC400000 00000002
	v_mov_b32_e32 v1, s63                                      // 0000000085F4: 7E02023F
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000085F8: BF8C0070
	v_and_b32_e32 v0, 0xffff, v0                               // 0000000085FC: 260000FF 0000FFFF
	s_andn2_saveexec_b64 s[6:7], s[6:7]                        // 000000008604: BE862306
	s_cbranch_execz 29                                         // 000000008608: BF88001D <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x580>
	v_and_b32_e32 v44, 3, v2                                   // 00000000860C: 26580483
	v_cmp_ne_u64_e32 vcc, 0, v[44:45]                          // 000000008610: 7DDA5880
	s_and_saveexec_b64 s[8:9], vcc                             // 000000008614: BE88206A
	s_xor_b64 s[8:9], exec, s[8:9]                             // 000000008618: 8888087E
	s_cbranch_execz 6                                          // 00000000861C: BF880006 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x538>
	flat_load_ushort v0, v[2:3]                                // 000000008620: DC480000 00000002
	v_mov_b32_e32 v1, s63                                      // 000000008628: 7E02023F
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000862C: BF8C0070
	v_and_b32_e32 v0, 0xffff, v0                               // 000000008630: 260000FF 0000FFFF
	s_andn2_saveexec_b64 s[8:9], s[8:9]                        // 000000008638: BE882308
	s_cbranch_execz 15                                         // 00000000863C: BF88000F <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x57c>
	v_and_b32_e32 v44, 7, v2                                   // 000000008640: 26580487
	v_cmp_ne_u64_e32 vcc, 0, v[44:45]                          // 000000008644: 7DDA5880
	s_and_saveexec_b64 s[10:11], vcc                           // 000000008648: BE8A206A
	s_xor_b64 s[10:11], exec, s[10:11]                         // 00000000864C: 888A0A7E
	s_cbranch_execz 5                                          // 000000008650: BF880005 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x568>
	flat_load_dword v44, v[2:3]                                // 000000008654: DC500000 2C000002
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000865C: BF8C0070
	v_pk_mov_b32 v[0:1], v[44:45], v[44:45] op_sel:[0,1]       // 000000008660: D3B35000 1802592C
	s_andn2_saveexec_b64 s[10:11], s[10:11]                    // 000000008668: BE8A230A
	s_cbranch_execz 2                                          // 00000000866C: BF880002 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x578>
	flat_load_dwordx2 v[0:1], v[2:3]                           // 000000008670: DC540000 00000002
	s_or_b64 exec, exec, s[10:11]                              // 000000008678: 87FE0A7E
	s_or_b64 exec, exec, s[8:9]                                // 00000000867C: 87FE087E
	s_or_b64 exec, exec, s[6:7]                                // 000000008680: 87FE067E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008684: BF8C0070
	ds_write_b64 v47, v[0:1]                                   // 000000008688: D89A0000 0000002F
	s_or_b64 exec, exec, s[4:5]                                // 000000008690: 87FE047E
	s_mov_b64 s[6:7], s[66:67]                                 // 000000008694: BE860142
	s_mov_b32 s12, s64                                         // 000000008698: BE8C0040
	v_mov_b32_e32 v31, v41                                     // 00000000869C: 7E3E0329
	s_waitcnt lgkmcnt(0)                                       // 0000000086A0: BF8CC07F
	s_barrier                                                  // 0000000086A4: BF8A0000
	s_swappc_b64 s[30:31], s[74:75]                            // 0000000086A8: BE9E1E4A
	ds_read_b32 v0, v45 offset:1472                            // 0000000086AC: D86C05C0 0000002D
	s_waitcnt lgkmcnt(0)                                       // 0000000086B4: BF8CC07F
	s_barrier                                                  // 0000000086B8: BF8A0000
	ds_read_u8 v1, v45 offset:1478                             // 0000000086BC: D87405C6 0100002D
	s_mov_b64 s[4:5], -1                                       // 0000000086C4: BE8401C1
	s_waitcnt lgkmcnt(0)                                       // 0000000086C8: BF8CC07F
	v_readfirstlane_b32 s6, v1                                 // 0000000086CC: 7E0C0501
	s_bitcmp1_b32 s6, 0                                        // 0000000086D0: BF0D8006
	s_cselect_b64 s[6:7], -1, 0                                // 0000000086D4: 858680C1
	s_and_b64 vcc, exec, s[6:7]                                // 0000000086D8: 86EA067E
	s_mov_b64 s[6:7], -1                                       // 0000000086DC: BE8601C1
	s_cbranch_vccnz 65360                                      // 0000000086E0: BF87FF50 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x324>
	s_and_saveexec_b64 s[4:5], s[70:71]                        // 0000000086E4: BE842046
	s_cbranch_execz 13                                         // 0000000086E8: BF88000D <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x620>
	v_ashrrev_i32_e32 v1, 31, v0                               // 0000000086EC: 2202009F
	v_lshlrev_b64 v[0:1], 8, v[0:1]                            // 0000000086F0: D28F0000 00020088
	v_mov_b32_e32 v2, s77                                      // 0000000086F8: 7E04024D
	v_add_co_u32_e32 v0, vcc, s76, v0                          // 0000000086FC: 3200004C
	v_addc_co_u32_e32 v1, vcc, v2, v1, vcc                     // 000000008700: 38020302
	v_add_co_u32_e32 v0, vcc, v0, v42                          // 000000008704: 32005500
	v_addc_co_u32_e32 v1, vcc, 0, v1, vcc                      // 000000008708: 38020280
	global_load_dwordx4 v[0:3], v[0:1], off                    // 00000000870C: DC5C8000 007F0000
	s_waitcnt vmcnt(0)                                         // 000000008714: BF8C0F70
	ds_write_b128 v42, v[0:3] offset:1472                      // 000000008718: D9BE05C0 0000002A
	s_or_b64 exec, exec, s[4:5]                                // 000000008720: 87FE047E
	v_mov_b32_e32 v0, 0                                        // 000000008724: 7E000280
	s_and_saveexec_b64 s[4:5], s[68:69]                        // 000000008728: BE842044
	s_cbranch_execz 65335                                      // 00000000872C: BF88FF37 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x30c>
	global_load_dwordx2 v[0:1], v45, s[72:73] offset:32        // 000000008730: DC548020 0048002D
	s_waitcnt vmcnt(0)                                         // 000000008738: BF8C0F70
	flat_load_dword v0, v[0:1] glc                             // 00000000873C: DC510000 00000000
	s_waitcnt vmcnt(0)                                         // 000000008744: BF8C0F70
	s_branch 65328                                             // 000000008748: BF82FF30 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x30c>
	s_andn2_b64 vcc, exec, s[4:5]                              // 00000000874C: 89EA047E
	s_cbranch_vccz 33                                          // 000000008750: BF860021 <_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork+0x6d8>
	v_mov_b32_e32 v2, 0                                        // 000000008754: 7E040280
	ds_read_b64 v[0:1], v2 offset:1288                         // 000000008758: D8EC0508 00000002
	v_mov_b32_e32 v3, 1                                        // 000000008760: 7E060281
	buffer_wbl2                                                // 000000008764: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000876C: BF8C0070
	flat_atomic_add v4, v[0:1], v3 glc                         // 000000008770: DD090000 04000300
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008778: BF8C0070
	buffer_invl2                                               // 00000000877C: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 000000008784: E0FC0000 00000000
	ds_read_b64 v[0:1], v2 offset:1280                         // 00000000878C: D8EC0500 00000002
	s_memrealtime s[4:5]                                       // 000000008794: C0940100 00000000
	v_lshlrev_b16_e64 v2, 8, s64                               // 00000000879C: D12A0002 00008088
	v_or_b32_e32 v5, 4, v2                                     // 0000000087A4: 280A0484
	s_waitcnt lgkmcnt(0)                                       // 0000000087A8: BF8CC07F
	v_pk_mov_b32 v[2:3], s[4:5], s[4:5] op_sel:[0,1]           // 0000000087AC: D3B35002 18000804
	v_and_b32_e32 v4, 0x1fff, v4                               // 0000000087B4: 260808FF 00001FFF
	v_lshlrev_b32_e32 v4, 5, v4                                // 0000000087BC: 24080885
	v_add_co_u32_e32 v0, vcc, v0, v4                           // 0000000087C0: 32000900
	v_addc_co_u32_e32 v1, vcc, 0, v1, vcc                      // 0000000087C4: 38020280
	flat_store_dwordx2 v[0:1], v[2:3] offset:8                 // 0000000087C8: DC740008 00000200
	flat_store_short v[0:1], v5                                // 0000000087D0: DC680000 00000500
	s_endpgm                                                   // 0000000087D8: BF810000

	.text
	.p2align	2
	.type	_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv,@function
_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002410: BF8C0000
	s_or_saveexec_b64 s[4:5], -1                               // 000000002414: BE8421C1
	buffer_store_dword v40, off, s[0:3], s32                   // 000000002418: E0700000 20002800
	s_mov_b64 exec, s[4:5]                                     // 000000002420: BEFE0104
	v_writelane_b32 v40, s33, 31                               // 000000002424: D28A0028 00013E21
	s_mov_b32 s33, s32                                         // 00000000242C: BEA10020
	v_writelane_b32 v40, s34, 0                                // 000000002430: D28A0028 00010022
	s_addk_i32 s32, 0x400                                      // 000000002438: B7200400
	v_writelane_b32 v40, s35, 1                                // 00000000243C: D28A0028 00010223
	v_writelane_b32 v40, s36, 2                                // 000000002444: D28A0028 00010424
	v_writelane_b32 v40, s37, 3                                // 00000000244C: D28A0028 00010625
	v_writelane_b32 v40, s38, 4                                // 000000002454: D28A0028 00010826
	v_writelane_b32 v40, s39, 5                                // 00000000245C: D28A0028 00010A27
	v_writelane_b32 v40, s40, 6                                // 000000002464: D28A0028 00010C28
	v_writelane_b32 v40, s41, 7                                // 00000000246C: D28A0028 00010E29
	v_writelane_b32 v40, s42, 8                                // 000000002474: D28A0028 0001102A
	v_writelane_b32 v40, s43, 9                                // 00000000247C: D28A0028 0001122B
	v_writelane_b32 v40, s44, 10                               // 000000002484: D28A0028 0001142C
	v_writelane_b32 v40, s45, 11                               // 00000000248C: D28A0028 0001162D
	v_writelane_b32 v40, s46, 12                               // 000000002494: D28A0028 0001182E
	v_writelane_b32 v40, s47, 13                               // 00000000249C: D28A0028 00011A2F
	v_writelane_b32 v40, s48, 14                               // 0000000024A4: D28A0028 00011C30
	v_writelane_b32 v40, s49, 15                               // 0000000024AC: D28A0028 00011E31
	v_writelane_b32 v40, s50, 16                               // 0000000024B4: D28A0028 00012032
	v_writelane_b32 v40, s51, 17                               // 0000000024BC: D28A0028 00012233
	v_writelane_b32 v40, s52, 18                               // 0000000024C4: D28A0028 00012434
	v_writelane_b32 v40, s53, 19                               // 0000000024CC: D28A0028 00012635
	v_writelane_b32 v40, s54, 20                               // 0000000024D4: D28A0028 00012836
	v_writelane_b32 v40, s55, 21                               // 0000000024DC: D28A0028 00012A37
	v_writelane_b32 v40, s56, 22                               // 0000000024E4: D28A0028 00012C38
	v_writelane_b32 v40, s57, 23                               // 0000000024EC: D28A0028 00012E39
	v_writelane_b32 v40, s58, 24                               // 0000000024F4: D28A0028 0001303A
	v_writelane_b32 v40, s59, 25                               // 0000000024FC: D28A0028 0001323B
	v_writelane_b32 v40, s60, 26                               // 000000002504: D28A0028 0001343C
	v_writelane_b32 v40, s61, 27                               // 00000000250C: D28A0028 0001363D
	v_writelane_b32 v40, s62, 28                               // 000000002514: D28A0028 0001383E
	v_writelane_b32 v40, s30, 29                               // 00000000251C: D28A0028 00013A1E
	v_writelane_b32 v40, s31, 30                               // 000000002524: D28A0028 00013C1F
	v_mov_b32_e32 v0, 0                                        // 00000000252C: 7E000280
	ds_read_u8 v0, v0 offset:1479                              // 000000002530: D87405C7 00000000
	s_mov_b64 s[56:57], s[6:7]                                 // 000000002538: BEB80106
	s_movk_i32 s62, 0x5c8                                      // 00000000253C: B03E05C8
	s_waitcnt lgkmcnt(0)                                       // 000000002540: BF8CC07F
	v_cmp_eq_u16_e32 vcc, 3, v0                                // 000000002544: 7D540083
	s_and_b64 s[4:5], vcc, exec                                // 000000002548: 86847E6A
	s_cselect_b32 s55, 0xf8, 56                                // 00000000254C: 8537B8FF 000000F8
	s_add_i32 s4, s55, 0x5c8                                   // 000000002554: 8104FF37 000005C8
	s_cmpk_gt_u32 s4, 0x6c0                                    // 00000000255C: B50406C0
	s_cbranch_scc1 44                                          // 000000002560: BF85002C <_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv+0x204>
	v_mov_b32_e32 v196, v31                                    // 000000002564: 7F88031F
	v_and_b32_e32 v0, 0x3c0, v196                              // 000000002568: 260188FF 000003C0
	v_lshrrev_b32_e32 v197, 6, v0                              // 000000002570: 218A0086
	s_getpc_b64 s[58:59]                                       // 000000002574: BEBA1C00
	s_add_u32 s58, s58, _ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem@rel32@lo+4                                  // 000000002578: 803AFF3A 000001B8
	s_addc_u32 s59, s59, _ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem@rel32@hi+12                                     // 000000002580: 823BFF3B 00000000
	s_branch 7                                                 // 000000002588: BF820007 <_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv+0x198>
	s_or_b64 exec, exec, s[60:61]                              // 00000000258C: 87FE3C7E
	s_add_i32 s62, s62, s55                                    // 000000002590: 813E373E
	s_add_i32 s4, s62, s55                                     // 000000002594: 8104373E
	s_cmpk_gt_u32 s4, 0x6c0                                    // 000000002598: B50406C0
	s_cselect_b64 s[4:5], -1, 0                                // 00000000259C: 858480C1
	s_and_b64 vcc, exec, s[4:5]                                // 0000000025A0: 86EA047E
	s_cbranch_vccnz 27                                         // 0000000025A4: BF87001B <_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv+0x204>
	v_mov_b32_e32 v0, s62                                      // 0000000025A8: 7E00023E
	ds_read_u8 v0, v0                                          // 0000000025AC: D8740000 00000000
	s_waitcnt lgkmcnt(0)                                       // 0000000025B4: BF8CC07F
	v_readfirstlane_b32 s4, v0                                 // 0000000025B8: 7E080500
	v_and_b32_e32 v0, 1, v0                                    // 0000000025BC: 26000081
	v_cmp_eq_u16_e32 vcc, 0, v0                                // 0000000025C0: 7D540080
	s_cbranch_vccnz 18                                         // 0000000025C4: BF870012 <_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv+0x200>
	s_and_b32 s4, 0xffff, s4                                   // 0000000025C8: 860404FF 0000FFFF
	s_lshr_b32 s4, s4, 3                                       // 0000000025D0: 8F048304
	v_cmp_gt_u32_e32 vcc, s4, v197                             // 0000000025D4: 7D998A04
	s_and_saveexec_b64 s[60:61], vcc                           // 0000000025D8: BEBC206A
	s_cbranch_execz 65515                                      // 0000000025DC: BF88FFEB <_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv+0x17c>
	s_cmp_lg_u32 s62, -1                                       // 0000000025E0: BF07C13E
	s_getreg_b32 s4, hwreg(HW_REG_SH_MEM_BASES, 16, 16)        // 0000000025E4: B8847C0F
	s_cselect_b64 vcc, -1, 0                                   // 0000000025E8: 85EA80C1
	s_lshl_b32 s4, s4, 16                                      // 0000000025EC: 8E049004
	v_mov_b32_e32 v0, s62                                      // 0000000025F0: 7E00023E
	v_mov_b32_e32 v1, s4                                       // 0000000025F4: 7E020204
	v_cndmask_b32_e32 v0, 0, v0, vcc                           // 0000000025F8: 00000080
	v_cndmask_b32_e32 v1, 0, v1, vcc                           // 0000000025FC: 00020280
	s_mov_b64 s[6:7], s[56:57]                                 // 000000002600: BE860138
	v_mov_b32_e32 v31, v196                                    // 000000002604: 7E3E03C4
	s_swappc_b64 s[30:31], s[58:59]                            // 000000002608: BE9E1E3A
	s_branch 65503                                             // 00000000260C: BF82FFDF <_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv+0x17c>
	s_cbranch_execz 65509                                      // 000000002610: BF88FFE5 <_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv+0x198>
	v_readlane_b32 s30, v40, 29                                // 000000002614: D289001E 00013B28
	v_readlane_b32 s31, v40, 30                                // 00000000261C: D289001F 00013D28
	v_readlane_b32 s62, v40, 28                                // 000000002624: D289003E 00013928
	v_readlane_b32 s61, v40, 27                                // 00000000262C: D289003D 00013728
	v_readlane_b32 s60, v40, 26                                // 000000002634: D289003C 00013528
	v_readlane_b32 s59, v40, 25                                // 00000000263C: D289003B 00013328
	v_readlane_b32 s58, v40, 24                                // 000000002644: D289003A 00013128
	v_readlane_b32 s57, v40, 23                                // 00000000264C: D2890039 00012F28
	v_readlane_b32 s56, v40, 22                                // 000000002654: D2890038 00012D28
	v_readlane_b32 s55, v40, 21                                // 00000000265C: D2890037 00012B28
	v_readlane_b32 s54, v40, 20                                // 000000002664: D2890036 00012928
	v_readlane_b32 s53, v40, 19                                // 00000000266C: D2890035 00012728
	v_readlane_b32 s52, v40, 18                                // 000000002674: D2890034 00012528
	v_readlane_b32 s51, v40, 17                                // 00000000267C: D2890033 00012328
	v_readlane_b32 s50, v40, 16                                // 000000002684: D2890032 00012128
	v_readlane_b32 s49, v40, 15                                // 00000000268C: D2890031 00011F28
	v_readlane_b32 s48, v40, 14                                // 000000002694: D2890030 00011D28
	v_readlane_b32 s47, v40, 13                                // 00000000269C: D289002F 00011B28
	v_readlane_b32 s46, v40, 12                                // 0000000026A4: D289002E 00011928
	v_readlane_b32 s45, v40, 11                                // 0000000026AC: D289002D 00011728
	v_readlane_b32 s44, v40, 10                                // 0000000026B4: D289002C 00011528
	v_readlane_b32 s43, v40, 9                                 // 0000000026BC: D289002B 00011328
	v_readlane_b32 s42, v40, 8                                 // 0000000026C4: D289002A 00011128
	v_readlane_b32 s41, v40, 7                                 // 0000000026CC: D2890029 00010F28
	v_readlane_b32 s40, v40, 6                                 // 0000000026D4: D2890028 00010D28
	v_readlane_b32 s39, v40, 5                                 // 0000000026DC: D2890027 00010B28
	v_readlane_b32 s38, v40, 4                                 // 0000000026E4: D2890026 00010928
	v_readlane_b32 s37, v40, 3                                 // 0000000026EC: D2890025 00010728
	v_readlane_b32 s36, v40, 2                                 // 0000000026F4: D2890024 00010528
	v_readlane_b32 s35, v40, 1                                 // 0000000026FC: D2890023 00010328
	v_readlane_b32 s34, v40, 0                                 // 000000002704: D2890022 00010128
	s_addk_i32 s32, 0xfc00                                     // 00000000270C: B720FC00
	v_readlane_b32 s33, v40, 31                                // 000000002710: D2890021 00013F28
	s_or_saveexec_b64 s[4:5], -1                               // 000000002718: BE8421C1
	buffer_load_dword v40, off, s[0:3], s32                    // 00000000271C: E0500000 20002800
	s_mov_b64 exec, s[4:5]                                     // 000000002724: BEFE0104
	s_waitcnt vmcnt(0)                                         // 000000002728: BF8C0F70
	s_setpc_b64 s[30:31]                                       // 00000000272C: BE801D1E
.Lfunc_end_call_graph1:
	.size	_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv, .Lfunc_end_call_graph1-_Z44ncclFunction_AllReduce_RING_SIMPLE_Sum_floatv

	.text
	.p2align	2
	.type	_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem,@function
_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem:
	s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)                    // 000000002730: BF8C0000
	s_or_saveexec_b64 s[4:5], -1                               // 000000002734: BE8421C1
	buffer_store_dword v2, off, s[0:3], s32                    // 000000002738: E0700000 20000200
	s_mov_b64 exec, s[4:5]                                     // 000000002740: BEFE0104
	v_writelane_b32 v2, s34, 0                                 // 000000002744: D28A0002 00010022
	v_writelane_b32 v2, s35, 1                                 // 00000000274C: D28A0002 00010223
	v_writelane_b32 v2, s36, 2                                 // 000000002754: D28A0002 00010424
	v_writelane_b32 v2, s37, 3                                 // 00000000275C: D28A0002 00010625
	v_writelane_b32 v2, s38, 4                                 // 000000002764: D28A0002 00010826
	v_writelane_b32 v2, s39, 5                                 // 00000000276C: D28A0002 00010A27
	v_writelane_b32 v2, s40, 6                                 // 000000002774: D28A0002 00010C28
	v_writelane_b32 v2, s41, 7                                 // 00000000277C: D28A0002 00010E29
	v_writelane_b32 v2, s42, 8                                 // 000000002784: D28A0002 0001102A
	v_writelane_b32 v2, s43, 9                                 // 00000000278C: D28A0002 0001122B
	v_writelane_b32 v2, s44, 10                                // 000000002794: D28A0002 0001142C
	v_writelane_b32 v2, s45, 11                                // 00000000279C: D28A0002 0001162D
	v_writelane_b32 v2, s46, 12                                // 0000000027A4: D28A0002 0001182E
	v_writelane_b32 v2, s47, 13                                // 0000000027AC: D28A0002 00011A2F
	v_writelane_b32 v2, s48, 14                                // 0000000027B4: D28A0002 00011C30
	v_writelane_b32 v2, s49, 15                                // 0000000027BC: D28A0002 00011E31
	v_writelane_b32 v2, s50, 16                                // 0000000027C4: D28A0002 00012032
	v_writelane_b32 v2, s51, 17                                // 0000000027CC: D28A0002 00012233
	v_writelane_b32 v2, s52, 18                                // 0000000027D4: D28A0002 00012434
	v_writelane_b32 v2, s53, 19                                // 0000000027DC: D28A0002 00012635
	v_writelane_b32 v2, s54, 20                                // 0000000027E4: D28A0002 00012836
	v_writelane_b32 v2, s30, 21                                // 0000000027EC: D28A0002 00012A1E
	v_writelane_b32 v2, s31, 22                                // 0000000027F4: D28A0002 00012C1F
	flat_load_ubyte v18, v[0:1]                                // 0000000027FC: DC400000 12000000
	flat_load_ushort v19, v[0:1] offset:2                      // 000000002804: DC480002 13000000
	flat_load_dwordx2 v[26:27], v[0:1] offset:24               // 00000000280C: DC540018 1A000000
	flat_load_dwordx2 v[16:17], v[0:1] offset:40               // 000000002814: DC540028 10000000
	flat_load_dwordx4 v[12:15], v[0:1] offset:8                // 00000000281C: DC5C0008 0C000000
	flat_load_dword v4, v[0:1] offset:4                        // 000000002824: DC500004 04000000
	v_mov_b32_e32 v0, 0                                        // 00000000282C: 7E000280
	s_movk_i32 s4, 0x400                                       // 000000002830: B0040400
	v_add_u32_e64 v3, s4, 0                                    // 000000002834: D1340003 00010004
	ds_read_b32 v5, v0 offset:1336                             // 00000000283C: D86C0538 05000000
	ds_read_b64 v[0:1], v0 offset:1320                         // 000000002844: D8EC0528 00000000
	ds_read2_b32 v[8:9], v3 offset0:53 offset1:56              // 00000000284C: D86E3835 08000003
	v_and_b32_e32 v24, 0x3ff, v31                              // 000000002854: 26303EFF 000003FF
	s_mov_b64 s[8:9], 0                                        // 00000000285C: BE880180
	v_and_b32_e32 v3, 7, v24                                   // 000000002860: 26063087
	s_waitcnt lgkmcnt(0)                                       // 000000002864: BF8CC07F
	v_cmp_ne_u32_e64 s[4:5], -1, v0                            // 000000002868: D0CD0004 000200C1
	v_cmp_lt_u32_e32 vcc, 7, v24                               // 000000002870: 7D923087
	v_readfirstlane_b32 s16, v5                                // 000000002874: 7E200505
	v_cndmask_b32_e64 v6, 0, 1, s[4:5]                         // 000000002878: D1000006 00110280
	v_readfirstlane_b32 s13, v9                                // 000000002880: 7E1A0509
	v_readfirstlane_b32 s25, v8                                // 000000002884: 7E320508
	s_waitcnt vmcnt(0)                                         // 000000002888: BF8C0F70
	v_lshrrev_b16_e32 v0, 3, v18                               // 00000000288C: 56002483
	s_and_saveexec_b64 s[4:5], vcc                             // 000000002890: BE84206A
	s_xor_b64 s[6:7], exec, s[4:5]                             // 000000002894: 8886047E
	s_cbranch_execnz 5310                                      // 000000002898: BF8914BE <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5464>
	s_andn2_saveexec_b64 s[4:5], s[6:7]                        // 00000000289C: BE842306
	s_cbranch_execnz 5360                                      // 0000000028A0: BF8914F0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5534>
	s_or_b64 exec, exec, s[4:5]                                // 0000000028A4: 87FE047E
	v_mov_b32_e32 v55, 0                                       // 0000000028A8: 7E6E0280
	s_and_saveexec_b64 s[4:5], s[8:9]                          // 0000000028AC: BE842008
	v_mov_b32_e32 v55, v5                                      // 0000000028B0: 7E6E0305
	v_mov_b32_e32 v20, v5                                      // 0000000028B4: 7E280305
	s_or_b64 exec, exec, s[4:5]                                // 0000000028B8: 87FE047E
	v_and_b32_e32 v1, 36, v20                                  // 0000000028BC: 260228A4
	v_cmp_ne_u32_e32 vcc, 0, v1                                // 0000000028C0: 7D9A0280
	v_mov_b32_e32 v1, 0                                        // 0000000028C4: 7E020280
	s_and_saveexec_b64 s[4:5], vcc                             // 0000000028C8: BE84206A
	s_cbranch_execz 3                                          // 0000000028CC: BF880003 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1ac>
	v_lshlrev_b32_e32 v1, 2, v3                                // 0000000028D0: 24020682
	ds_read_b32 v1, v1 offset:1320                             // 0000000028D4: D86C0528 01000001
	s_or_b64 exec, exec, s[4:5]                                // 0000000028DC: 87FE047E
	v_and_b32_e32 v5, 24, v20                                  // 0000000028E0: 260A2898
	v_cmp_ne_u32_e64 s[4:5], 0, v5                             // 0000000028E4: D0CD0004 00020A80
	s_and_saveexec_b64 s[6:7], s[4:5]                          // 0000000028EC: BE862004
	s_cbranch_execz 4                                          // 0000000028F0: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1d4>
	s_waitcnt lgkmcnt(0)                                       // 0000000028F4: BF8CC07F
	v_lshlrev_b32_e32 v1, 2, v3                                // 0000000028F8: 24020682
	ds_read_b32 v1, v1 offset:1324                             // 0000000028FC: D86C052C 01000001
	s_or_b64 exec, exec, s[6:7]                                // 000000002904: 87FE067E
	v_lshrrev_b32_e32 v22, 30, v4                              // 000000002908: 202C089E
	s_and_saveexec_b64 s[6:7], vcc                             // 00000000290C: BE86206A
	s_cbranch_execz 64                                         // 000000002910: BF880040 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2e4>
	v_mov_b32_e32 v4, 0                                        // 000000002914: 7E080280
	ds_read_b64 v[4:5], v4 offset:1312                         // 000000002918: D8EC0520 04000004
	s_movk_i32 s8, 0x2a0                                       // 000000002920: B00802A0
	s_movk_i32 s9, 0x70                                        // 000000002924: B0090070
	v_and_b32_e32 v8, 32, v20                                  // 000000002928: 261028A0
	v_cmp_ne_u32_e32 vcc, 0, v8                                // 00000000292C: 7D9A1080
	s_waitcnt lgkmcnt(0)                                       // 000000002930: BF8CC07F
	v_mad_i64_i32 v[6:7], s[4:5], v1, s8, v[4:5]               // 000000002934: D1E90406 04101101
	v_mad_u64_u32 v[6:7], s[4:5], v22, s9, v[6:7]              // 00000000293C: D1E80406 04181316
	flat_load_dwordx2 v[6:7], v[6:7] offset:416                // 000000002944: DC5401A0 06000006
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000294C: BF8C0070
	v_add_co_u32_e64 v6, s[4:5], 3, v6                         // 000000002950: D1190406 00020C83
	v_addc_co_u32_e64 v29, s[4:5], 0, v7, s[4:5]               // 000000002958: D11C041D 00120E80
	v_and_b32_e32 v28, -4, v6                                  // 000000002960: 26380CC4
	s_and_saveexec_b64 s[4:5], vcc                             // 000000002964: BE84206A
	s_cbranch_execz 10                                         // 000000002968: BF88000A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x264>
	v_mad_i64_i32 v[6:7], s[10:11], v1, s8, v[4:5]             // 00000000296C: D1E90A06 04101101
	v_mad_u64_u32 v[6:7], s[8:9], v22, s9, v[6:7]              // 000000002974: D1E80806 04181316
	flat_load_dwordx2 v[6:7], v[6:7] offset:368                // 00000000297C: DC540170 06000006
	v_mov_b32_e32 v20, v55                                     // 000000002984: 7E280337
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002988: BF8C0070
	flat_store_dwordx2 v[6:7], v[28:29]                        // 00000000298C: DC740000 00001C06
	s_or_b64 exec, exec, s[4:5]                                // 000000002994: 87FE047E
	v_and_b32_e32 v8, 4, v20                                   // 000000002998: 26102884
	v_cmp_ne_u32_e32 vcc, 0, v8                                // 00000000299C: 7D9A1080
	s_and_saveexec_b64 s[4:5], vcc                             // 0000000029A0: BE84206A
	s_cbranch_execz 26                                         // 0000000029A4: BF88001A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2e0>
	s_movk_i32 s8, 0x2a0                                       // 0000000029A8: B00802A0
	v_mad_i64_i32 v[4:5], s[8:9], v1, s8, v[4:5]               // 0000000029AC: D1E90804 04101101
	s_movk_i32 s8, 0x70                                        // 0000000029B4: B0080070
	v_mad_u64_u32 v[8:9], s[8:9], v22, s8, v[4:5]              // 0000000029B8: D1E80808 04101116
	v_add_co_u32_e32 v4, vcc, 0x150, v8                        // 0000000029C0: 320810FF 00000150
	v_addc_co_u32_e32 v5, vcc, 0, v9, vcc                      // 0000000029C8: 380A1280
	v_lshlrev_b32_e32 v6, 3, v3                                // 0000000029CC: 240C0683
	ds_write_b64 v6, v[4:5]                                    // 0000000029D0: D89A0000 00000406
	flat_load_dwordx4 v[4:7], v[8:9] offset:352                // 0000000029D8: DC5C0160 04000008
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000029E0: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 0000000029E4: DC550000 24000006
	flat_load_dwordx2 v[30:31], v[8:9] offset:408              // 0000000029EC: DC540198 1E000008
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000029F4: BF8C0070
	v_cmp_ne_u64_e32 vcc, 0, v[30:31]                          // 0000000029F8: 7DDA3C80
	v_cndmask_b32_e64 v8, 0, 1, vcc                            // 0000000029FC: D1000008 01A90280
	v_lshl_or_b32 v20, v8, 7, v55                              // 000000002A04: D2000014 04DD0F08
	v_mov_b32_e32 v55, v20                                     // 000000002A0C: 7E6E0314
	s_or_b64 exec, exec, s[4:5]                                // 000000002A10: 87FE047E
	s_or_b64 exec, exec, s[6:7]                                // 000000002A14: 87FE067E
	v_and_b32_e32 v8, 24, v20                                  // 000000002A18: 26102898
	v_lshrrev_b16_e32 v21, 8, v19                              // 000000002A1C: 562A2688
	v_cmp_ne_u32_e32 vcc, 0, v8                                // 000000002A20: 7D9A1080
	s_and_saveexec_b64 s[4:5], vcc                             // 000000002A24: BE84206A
	s_cbranch_execz 69                                         // 000000002A28: BF880045 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x410>
	v_mov_b32_e32 v8, 0                                        // 000000002A2C: 7E100280
	ds_read_b64 v[10:11], v8 offset:1312                       // 000000002A30: D8EC0520 0A000008
	s_movk_i32 s8, 0x2a0                                       // 000000002A38: B00802A0
	s_movk_i32 s9, 0x70                                        // 000000002A3C: B0090070
	v_and_b32_e32 v23, 16, v20                                 // 000000002A40: 262E2890
	v_cmp_ne_u32_e32 vcc, 0, v23                               // 000000002A44: 7D9A2E80
	s_waitcnt lgkmcnt(0)                                       // 000000002A48: BF8CC07F
	v_mad_i64_i32 v[8:9], s[6:7], v1, s8, v[10:11]             // 000000002A4C: D1E90608 04281101
	v_mad_u64_u32 v[8:9], s[6:7], v22, s9, v[8:9]              // 000000002A54: D1E80608 04201316
	flat_load_dwordx2 v[8:9], v[8:9] offset:80                 // 000000002A5C: DC540050 08000008
	s_and_saveexec_b64 s[6:7], vcc                             // 000000002A64: BE86206A
	s_cbranch_execz 8                                          // 000000002A68: BF880008 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x35c>
	v_mad_i64_i32 v[6:7], s[10:11], v1, s8, v[10:11]           // 000000002A6C: D1E90A06 04281101
	v_mad_u64_u32 v[28:29], s[8:9], v22, s9, v[6:7]            // 000000002A74: D1E8081C 04181316
	flat_load_dwordx2 v[6:7], v[28:29] offset:24               // 000000002A7C: DC540018 0600001C
	flat_load_dwordx2 v[34:35], v[28:29] offset:96             // 000000002A84: DC540060 2200001C
	s_or_b64 exec, exec, s[6:7]                                // 000000002A8C: 87FE067E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002A90: BF8C0070
	v_add_co_u32_e32 v8, vcc, 3, v8                            // 000000002A94: 32101083
	v_addc_co_u32_e32 v29, vcc, 0, v9, vcc                     // 000000002A98: 383A1280
	v_and_b32_e32 v28, -4, v8                                  // 000000002A9C: 263810C4
	v_and_b32_e32 v8, 8, v20                                   // 000000002AA0: 26102888
	v_cmp_ne_u32_e32 vcc, 0, v8                                // 000000002AA4: 7D9A1080
	s_and_saveexec_b64 s[6:7], vcc                             // 000000002AA8: BE86206A
	s_cbranch_execz 35                                         // 000000002AAC: BF880023 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x40c>
	s_movk_i32 s8, 0x2a0                                       // 000000002AB0: B00802A0
	v_mad_i64_i32 v[4:5], s[8:9], v1, s8, v[10:11]             // 000000002AB4: D1E90804 04281101
	s_movk_i32 s8, 0x70                                        // 000000002ABC: B0080070
	v_mad_u64_u32 v[22:23], s[8:9], v22, s8, v[4:5]            // 000000002AC0: D1E80816 04101116
	v_lshlrev_b32_e32 v1, 3, v3                                // 000000002AC8: 24020683
	ds_write_b64 v1, v[22:23] offset:56                        // 000000002ACC: D89A0038 00001601
	flat_load_dwordx2 v[6:7], v[22:23] offset:32               // 000000002AD4: DC540020 06000016
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002ADC: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 000000002AE0: DC550000 24000006
	flat_load_dwordx4 v[8:11], v[22:23] offset:64              // 000000002AE8: DC5C0040 08000016
	flat_load_dwordx2 v[4:5], v[22:23] offset:16               // 000000002AF0: DC540010 04000016
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000002AF8: BF8C0070
	v_cmp_ne_u64_e32 vcc, 0, v[10:11]                          // 000000002AFC: 7DDA1480
	v_cndmask_b32_e64 v1, 0, 1, vcc                            // 000000002B00: D1000001 01A90280
	v_lshl_or_b32 v20, v1, 7, v55                              // 000000002B08: D2000014 04DD0F01
	v_and_b32_e32 v1, 0x80, v20                                // 000000002B10: 260228FF 00000080
	v_cmp_eq_u32_e32 vcc, 0, v1                                // 000000002B18: 7D940280
	v_cndmask_b32_e32 v31, v11, v31, vcc                       // 000000002B1C: 003E3F0B
	v_cndmask_b32_e32 v30, v10, v30, vcc                       // 000000002B20: 003C3D0A
	v_cmp_ne_u64_e32 vcc, 0, v[8:9]                            // 000000002B24: 7DDA1080
	s_and_saveexec_b64 s[8:9], vcc                             // 000000002B28: BE88206A
	v_or_b32_e32 v20, 0x100, v20                               // 000000002B2C: 282828FF 00000100
	s_or_b64 exec, exec, s[8:9]                                // 000000002B34: 87FE087E
	v_mov_b32_e32 v55, v20                                     // 000000002B38: 7E6E0314
	s_or_b64 exec, exec, s[6:7]                                // 000000002B3C: 87FE067E
	s_or_b64 exec, exec, s[4:5]                                // 000000002B40: 87FE047E
	s_waitcnt lgkmcnt(0)                                       // 000000002B44: BF8CC07F
	v_and_b32_e32 v1, 1, v20                                   // 000000002B48: 26022881
	v_cmp_eq_u32_e32 vcc, 1, v1                                // 000000002B4C: 7D940281
	s_and_saveexec_b64 s[4:5], vcc                             // 000000002B50: BE84206A
	s_cbranch_execz 5                                          // 000000002B54: BF880005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x43c>
	v_mov_b32_e32 v1, 0                                        // 000000002B58: 7E020280
	v_pk_mov_b32 v[4:5], v[12:13], v[12:13] op_sel:[0,1]       // 000000002B5C: D3B35004 1802190C
	ds_write_b64 v1, v[16:17] offset:1152                      // 000000002B64: D89A0480 00001001
	s_or_b64 exec, exec, s[4:5]                                // 000000002B6C: 87FE047E
	v_lshlrev_b32_e32 v32, 6, v0                               // 000000002B70: 24400086
	s_mov_b64 s[20:21], 0                                      // 000000002B74: BE940180
	v_cmp_lt_i64_e32 vcc, 0, v[26:27]                          // 000000002B78: 7DC23480
	s_and_saveexec_b64 s[18:19], vcc                           // 000000002B7C: BE92206A
	s_cbranch_execz 5195                                       // 000000002B80: BF88144B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5580>
	v_and_b32_e32 v1, 2, v20                                   // 000000002B84: 26022882
	v_cmp_eq_u32_e32 vcc, 0, v1                                // 000000002B88: 7D940280
	s_ashr_i32 s4, s13, 31                                     // 000000002B8C: 90049F0D
	v_mul_lo_u32 v48, s25, v21                                 // 000000002B90: D2850030 00022A19
	v_cndmask_b32_e32 v1, v15, v5, vcc                         // 000000002B98: 00020B0F
	v_cndmask_b32_e32 v38, v14, v4, vcc                        // 000000002B9C: 004C090E
	s_lshr_b32 s4, s4, 29                                      // 000000002BA0: 8F049D04
	v_ashrrev_i32_e32 v39, 31, v48                             // 000000002BA4: 224E609F
	v_add_co_u32_e32 v97, vcc, v26, v48                        // 000000002BA8: 32C2611A
	s_add_i32 s13, s13, s4                                     // 000000002BAC: 810D040D
	v_addc_co_u32_e32 v99, vcc, v27, v39, vcc                  // 000000002BB0: 38C64F1B
	v_lshlrev_b32_e32 v50, 7, v0                               // 000000002BB4: 24640087
	s_ashr_i32 s4, s13, 3                                      // 000000002BB8: 9004830D
	v_add_co_u32_e32 v101, vcc, -1, v50                        // 000000002BBC: 32CA64C1
	s_and_b32 s22, s4, -4                                      // 000000002BC0: 8616C404
	v_addc_co_u32_e64 v118, s[4:5], 0, -1, vcc                 // 000000002BC4: D11C0476 01A98280
	s_ashr_i32 s23, s22, 31                                    // 000000002BCC: 90179F16
	s_ashr_i32 s24, s13, 5                                     // 000000002BD0: 9018850D
	s_add_i32 s47, s25, s16                                    // 000000002BD4: 812F1019
	s_not_b32 s4, s25                                          // 000000002BD8: BE840419
	s_cmp_gt_i32 s16, 0                                        // 000000002BDC: BF028010
	v_and_b32_e32 v4, 0xff, v19                                // 000000002BE0: 260826FF 000000FF
	s_cselect_b32 s4, s4, -1                                   // 000000002BE8: 8504C104
	s_add_i32 s4, s4, s47                                      // 000000002BEC: 81042F04
	v_mul_lo_u32 v54, s25, v4                                  // 000000002BF0: D2850036 00020819
	s_ashr_i32 s5, s4, 31                                      // 000000002BF8: 90059F04
	v_add_co_u32_e32 v119, vcc, s4, v54                        // 000000002BFC: 32EE6C04
	s_lshr_b32 s4, s24, 28                                     // 000000002C00: 8F049C18
	s_add_i32 s4, s24, s4                                      // 000000002C04: 81040418
	s_ashr_i32 s48, s4, 4                                      // 000000002C08: 90308404
	s_ashr_i32 s13, s24, 31                                    // 000000002C0C: 900D9F18
	v_ashrrev_i32_e32 v49, 31, v54                             // 000000002C10: 22626C9F
	v_mov_b32_e32 v4, s5                                       // 000000002C14: 7E080205
	s_cmp_gt_i32 s25, 2                                        // 000000002C18: BF028219
	v_addc_co_u32_e32 v128, vcc, v4, v49, vcc                  // 000000002C1C: 39006304
	v_and_b32_e32 v4, 63, v24                                  // 000000002C20: 260830BF
	v_lshrrev_b32_e32 v5, 6, v24                               // 000000002C24: 200A3086
	s_cselect_b64 s[26:27], -1, 0                              // 000000002C28: 859A80C1
	s_ashr_i32 s14, s16, 31                                    // 000000002C2C: 900E9F10
	v_cmp_eq_u32_e64 s[4:5], 0, v4                             // 000000002C30: D0CA0004 00020880
	v_lshl_or_b32 v66, v5, 8, v4                               // 000000002C38: D2000042 04111105
	v_lshl_or_b32 v132, v5, 9, v4                              // 000000002C40: D2000084 04111305
	v_lshl_or_b32 v68, v5, 7, v4                               // 000000002C48: D2000044 04110F05
	v_mov_b32_e32 v4, s14                                      // 000000002C50: 7E08020E
	v_add_co_u32_e64 v133, s[14:15], s16, v54                  // 000000002C54: D1190E85 00026C10
	s_add_i32 s16, s16, 1                                      // 000000002C5C: 81108110
	v_addc_co_u32_e64 v134, s[14:15], v49, v4, s[14:15]        // 000000002C60: D11C0E86 003A0931
	s_cmp_le_i32 s25, s16                                      // 000000002C68: BF051019
	s_cselect_b32 s14, s25, 0                                  // 000000002C6C: 850E8019
	s_sub_i32 s14, s16, s14                                    // 000000002C70: 818E0E10
	s_ashr_i32 s15, s14, 31                                    // 000000002C74: 900F9F0E
	s_mov_b32 s17, 0                                           // 000000002C78: BE910080
	s_movk_i32 s49, 0x100                                      // 000000002C7C: B0310100
	v_mov_b32_e32 v4, s15                                      // 000000002C80: 7E08020F
	v_add_co_u32_e64 v135, s[14:15], s14, v54                  // 000000002C84: D1190E87 00026C0E
	v_lshl_or_b32 v130, v5, 3, s49                             // 000000002C8C: D2000082 00C50705
	v_addc_co_u32_e64 v144, s[14:15], v4, v49, s[14:15]        // 000000002C94: D11C0E90 003A6304
	v_and_b32_e32 v4, 0xffff, v18                              // 000000002C9C: 260824FF 0000FFFF
	v_mov_b32_e32 v5, s17                                      // 000000002CA4: 7E0A0211
	v_mov_b32_e32 v53, 0                                       // 000000002CA8: 7E6A0280
	v_cmp_ge_u32_e32 vcc, v24, v32                             // 000000002CAC: 7D9C4118
	v_lshlrev_b32_e32 v10, 3, v3                               // 000000002CB0: 24140683
	v_lshrrev_b64 v[4:5], 3, v[4:5]                            // 000000002CB4: D2900004 00020883
	s_movk_i32 s46, 0xff                                       // 000000002CBC: B02E00FF
	v_mov_b32_e32 v51, v53                                     // 000000002CC0: 7E660335
	v_add_u32_e32 v129, 0xb0, v10                              // 000000002CC4: 690214FF 000000B0
	v_lshlrev_b32_e32 v64, 8, v0                               // 000000002CCC: 24800088
	v_mov_b32_e32 v67, v53                                     // 000000002CD0: 7E860335
	v_mov_b32_e32 v65, v53                                     // 000000002CD4: 7E820335
	v_mov_b32_e32 v25, v53                                     // 000000002CD8: 7E320335
	v_mov_b32_e32 v33, v53                                     // 000000002CDC: 7E420335
	v_lshlrev_b32_e32 v131, 9, v0                              // 000000002CE0: 25060089
	v_cmp_eq_u32_e64 s[6:7], 0, v3                             // 000000002CE4: D0CA0006 00020680
	v_cmp_eq_u64_e64 s[8:9], 0, v[34:35]                       // 000000002CEC: D0EA0008 00024480
	v_cmp_ne_u64_e64 s[10:11], 0, v[34:35]                     // 000000002CF4: D0ED000A 00024480
	v_mov_b32_e32 v69, v53                                     // 000000002CFC: 7E8A0335
	v_add_u32_e32 v145, 0x70, v10                              // 000000002D00: 692214FF 00000070
	s_add_i32 s50, s25, -2                                     // 000000002D08: 8132C219
	v_lshlrev_b64 v[70:71], 12, v[4:5]                         // 000000002D0C: D28F0046 0002088C
	v_lshlrev_b64 v[80:81], 11, v[4:5]                         // 000000002D14: D28F0050 0002088B
	v_lshlrev_b32_e32 v82, 2, v68                              // 000000002D1C: 24A48882
	v_mov_b32_e32 v83, v53                                     // 000000002D20: 7EA60335
	v_lshlrev_b64 v[84:85], 10, v[4:5]                         // 000000002D24: D28F0054 0002088A
	s_mov_b32 s51, 0x4f800000                                  // 000000002D2C: BEB300FF 4F800000
	s_mov_b32 s52, 0xf4240                                     // 000000002D34: BEB400FF 000F4240
	s_xor_b64 s[28:29], vcc, -1                                // 000000002D3C: 889CC16A
	v_mov_b32_e32 v146, 1                                      // 000000002D40: 7F240281
	v_mov_b32_e32 v147, 0x70                                   // 000000002D44: 7F2602FF 00000070
	v_mov_b32_e32 v148, 5                                      // 000000002D4C: 7F280285
	v_mov_b32_e32 v149, 0xb0                                   // 000000002D50: 7F2A02FF 000000B0
	v_mov_b32_e32 v150, 0x78                                   // 000000002D58: 7F2C02FF 00000078
	v_mov_b32_e32 v151, 0xb8                                   // 000000002D60: 7F2E02FF 000000B8
	v_mad_i64_i32 v[86:87], s[14:15], v48, s22, 0              // 000000002D68: D1E90E56 02002D30
	v_lshlrev_b32_e32 v96, 4, v66                              // 000000002D70: 24C08484
	v_lshlrev_b32_e32 v98, 2, v132                             // 000000002D74: 24C50882
	v_lshlrev_b32_e32 v100, 2, v24                             // 000000002D78: 24C83082
	v_pk_mov_b32 v[102:103], 0, 0                              // 000000002D7C: D3B34066 18010080
	s_branch 8                                                 // 000000002D84: BF820008 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x678>
	s_or_b64 exec, exec, s[30:31]                              // 000000002D88: 87FE1E7E
	s_or_b64 exec, exec, s[16:17]                              // 000000002D8C: 87FE107E
	v_add_co_u32_e32 v102, vcc, v102, v86                      // 000000002D90: 32CCAD66
	v_addc_co_u32_e32 v103, vcc, v103, v87, vcc                // 000000002D94: 38CEAF67
	v_cmp_le_i64_e32 vcc, v[26:27], v[102:103]                 // 000000002D98: 7DC6CD1A
	s_or_b64 s[20:21], vcc, s[20:21]                           // 000000002D9C: 8794146A
	s_andn2_b64 exec, exec, s[20:21]                           // 000000002DA0: 89FE147E
	s_cbranch_execz 5057                                       // 000000002DA4: BF8813C1 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x557c>
	v_not_b32_e32 v5, v102                                     // 000000002DA8: 7E0A5766
	v_not_b32_e32 v4, v103                                     // 000000002DAC: 7E085767
	v_add_co_u32_e32 v10, vcc, v97, v5                         // 000000002DB0: 32140B61
	v_addc_co_u32_e32 v11, vcc, v99, v4, vcc                   // 000000002DB4: 38160963
	v_or_b32_e32 v5, v11, v39                                  // 000000002DB8: 280A4F0B
	v_mov_b32_e32 v4, v53                                      // 000000002DBC: 7E080335
	v_cmp_ne_u64_e32 vcc, 0, v[4:5]                            // 000000002DC0: 7DDA0880
	s_and_saveexec_b64 s[14:15], vcc                           // 000000002DC4: BE8E206A
	s_xor_b64 s[16:17], exec, s[14:15]                         // 000000002DC8: 88900E7E
	s_cbranch_execz 152                                        // 000000002DCC: BF880098 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x900>
	v_mov_b32_e32 v4, v39                                      // 000000002DD0: 7E080327
	v_mov_b32_e32 v5, v39                                      // 000000002DD4: 7E0A0327
	v_add_co_u32_e32 v12, vcc, v48, v4                         // 000000002DD8: 32180930
	v_addc_co_u32_e32 v13, vcc, v39, v5, vcc                   // 000000002DDC: 381A0B27
	v_xor_b32_e32 v20, v13, v5                                 // 000000002DE0: 2A280B0D
	v_xor_b32_e32 v21, v12, v4                                 // 000000002DE4: 2A2A090C
	v_cvt_f32_u32_e32 v12, v21                                 // 000000002DE8: 7E180D15
	v_cvt_f32_u32_e32 v13, v20                                 // 000000002DEC: 7E1A0D14
	v_sub_co_u32_e32 v17, vcc, 0, v21                          // 000000002DF0: 34222A80
	v_subb_co_u32_e32 v18, vcc, 0, v20, vcc                    // 000000002DF4: 3A242880
	v_mac_f32_e32 v12, 0x4f800000, v13                         // 000000002DF8: 2C181AFF 4F800000
	v_rcp_f32_e32 v12, v12                                     // 000000002E00: 7E18450C
	v_mul_f32_e32 v12, 0x5f7ffffc, v12                         // 000000002E04: 0A1818FF 5F7FFFFC
	v_mul_f32_e32 v13, 0x2f800000, v12                         // 000000002E0C: 0A1A18FF 2F800000
	v_trunc_f32_e32 v13, v13                                   // 000000002E14: 7E1A390D
	v_mac_f32_e32 v12, 0xcf800000, v13                         // 000000002E18: 2C181AFF CF800000
	v_cvt_u32_f32_e32 v16, v12                                 // 000000002E20: 7E200F0C
	v_cvt_u32_f32_e32 v19, v13                                 // 000000002E24: 7E260F0D
	v_mul_lo_u32 v14, v18, v16                                 // 000000002E28: D285000E 00022112
	v_mad_u64_u32 v[12:13], s[14:15], v17, v16, 0              // 000000002E30: D1E80E0C 02022111
	v_mul_lo_u32 v15, v17, v19                                 // 000000002E38: D285000F 00022711
	v_add3_u32 v13, v13, v15, v14                              // 000000002E40: D1FF000D 043A1F0D
	v_mad_u64_u32 v[14:15], s[14:15], v16, v13, 0              // 000000002E48: D1E80E0E 02021B10
	v_mul_hi_u32 v22, v16, v12                                 // 000000002E50: D2860016 00021910
	v_add_co_u32_e32 v22, vcc, v22, v14                        // 000000002E58: 322C1D16
	v_addc_co_u32_e32 v23, vcc, 0, v15, vcc                    // 000000002E5C: 382E1E80
	v_mad_u64_u32 v[14:15], s[14:15], v19, v13, 0              // 000000002E60: D1E80E0E 02021B13
	v_mad_u64_u32 v[12:13], s[14:15], v19, v12, 0              // 000000002E68: D1E80E0C 02021913
	v_add_co_u32_e32 v12, vcc, v22, v12                        // 000000002E70: 32181916
	v_addc_co_u32_e32 v12, vcc, v23, v13, vcc                  // 000000002E74: 38181B17
	v_addc_co_u32_e32 v13, vcc, 0, v15, vcc                    // 000000002E78: 381A1E80
	v_add_co_u32_e32 v12, vcc, v12, v14                        // 000000002E7C: 32181D0C
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc                    // 000000002E80: 381A1A80
	v_add_co_u32_e32 v22, vcc, v16, v12                        // 000000002E84: 322C1910
	v_addc_co_u32_e32 v23, vcc, v19, v13, vcc                  // 000000002E88: 382E1B13
	v_mul_lo_u32 v14, v17, v23                                 // 000000002E8C: D285000E 00022F11
	v_mul_lo_u32 v15, v18, v22                                 // 000000002E94: D285000F 00022D12
	v_mad_u64_u32 v[12:13], s[14:15], v17, v22, 0              // 000000002E9C: D1E80E0C 02022D11
	v_add3_u32 v13, v13, v14, v15                              // 000000002EA4: D1FF000D 043E1D0D
	v_mad_u64_u32 v[16:17], s[14:15], v23, v12, 0              // 000000002EAC: D1E80E10 02021917
	v_mad_u64_u32 v[18:19], s[14:15], v22, v13, 0              // 000000002EB4: D1E80E12 02021B16
	v_mul_hi_u32 v12, v22, v12                                 // 000000002EBC: D286000C 00021916
	v_add_co_u32_e32 v12, vcc, v12, v18                        // 000000002EC4: 3218250C
	v_mad_u64_u32 v[14:15], s[14:15], v23, v13, 0              // 000000002EC8: D1E80E0E 02021B17
	v_addc_co_u32_e32 v13, vcc, 0, v19, vcc                    // 000000002ED0: 381A2680
	v_add_co_u32_e32 v12, vcc, v12, v16                        // 000000002ED4: 3218210C
	v_addc_co_u32_e32 v12, vcc, v13, v17, vcc                  // 000000002ED8: 3818230D
	v_addc_co_u32_e32 v13, vcc, 0, v15, vcc                    // 000000002EDC: 381A1E80
	v_add_co_u32_e32 v12, vcc, v12, v14                        // 000000002EE0: 32181D0C
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc                    // 000000002EE4: 381A1A80
	v_add_co_u32_e32 v12, vcc, v22, v12                        // 000000002EE8: 32181916
	v_addc_co_u32_e32 v13, vcc, v23, v13, vcc                  // 000000002EEC: 381A1B17
	v_ashrrev_i32_e32 v14, 31, v11                             // 000000002EF0: 221C169F
	v_add_co_u32_e32 v10, vcc, v10, v14                        // 000000002EF4: 32141D0A
	v_addc_co_u32_e32 v11, vcc, v11, v14, vcc                  // 000000002EF8: 38161D0B
	v_xor_b32_e32 v16, v10, v14                                // 000000002EFC: 2A201D0A
	v_xor_b32_e32 v15, v11, v14                                // 000000002F00: 2A1E1D0B
	v_mad_u64_u32 v[10:11], s[14:15], v16, v13, 0              // 000000002F04: D1E80E0A 02021B10
	v_mul_hi_u32 v17, v16, v12                                 // 000000002F0C: D2860011 00021910
	v_add_co_u32_e32 v17, vcc, v17, v10                        // 000000002F14: 32221511
	v_addc_co_u32_e32 v18, vcc, 0, v11, vcc                    // 000000002F18: 38241680
	v_mad_u64_u32 v[10:11], s[14:15], v15, v13, 0              // 000000002F1C: D1E80E0A 02021B0F
	v_mad_u64_u32 v[12:13], s[14:15], v15, v12, 0              // 000000002F24: D1E80E0C 0202190F
	v_add_co_u32_e32 v12, vcc, v17, v12                        // 000000002F2C: 32181911
	v_addc_co_u32_e32 v12, vcc, v18, v13, vcc                  // 000000002F30: 38181B12
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 000000002F34: 38161680
	v_add_co_u32_e32 v12, vcc, v12, v10                        // 000000002F38: 3218150C
	v_addc_co_u32_e32 v13, vcc, 0, v11, vcc                    // 000000002F3C: 381A1680
	v_mul_lo_u32 v17, v20, v12                                 // 000000002F40: D2850011 00021914
	v_mul_lo_u32 v18, v21, v13                                 // 000000002F48: D2850012 00021B15
	v_mad_u64_u32 v[10:11], s[14:15], v21, v12, 0              // 000000002F50: D1E80E0A 02021915
	v_add3_u32 v11, v11, v18, v17                              // 000000002F58: D1FF000B 0446250B
	v_sub_u32_e32 v17, v15, v11                                // 000000002F60: 6A22170F
	v_sub_co_u32_e32 v10, vcc, v16, v10                        // 000000002F64: 34141510
	v_subb_co_u32_e64 v16, s[14:15], v17, v20, vcc             // 000000002F68: D11D0E10 01AA2911
	v_sub_co_u32_e64 v17, s[14:15], v10, v21                   // 000000002F70: D11A0E11 00022B0A
	v_subbrev_co_u32_e64 v16, s[14:15], 0, v16, s[14:15]       // 000000002F78: D11E0E10 003A2080
	v_cmp_ge_u32_e64 s[14:15], v16, v20                        // 000000002F80: D0CE000E 00022910
	v_cndmask_b32_e64 v18, 0, -1, s[14:15]                     // 000000002F88: D1000012 00398280
	v_cmp_ge_u32_e64 s[14:15], v17, v21                        // 000000002F90: D0CE000E 00022B11
	v_cndmask_b32_e64 v17, 0, -1, s[14:15]                     // 000000002F98: D1000011 00398280
	v_cmp_eq_u32_e64 s[14:15], v16, v20                        // 000000002FA0: D0CA000E 00022910
	v_cndmask_b32_e64 v16, v18, v17, s[14:15]                  // 000000002FA8: D1000010 003A2312
	v_add_co_u32_e64 v17, s[14:15], 2, v12                     // 000000002FB0: D1190E11 00021882
	v_subb_co_u32_e32 v11, vcc, v15, v11, vcc                  // 000000002FB8: 3A16170F
	v_addc_co_u32_e64 v18, s[14:15], 0, v13, s[14:15]          // 000000002FBC: D11C0E12 003A1A80
	v_cmp_ge_u32_e32 vcc, v11, v20                             // 000000002FC4: 7D9C290B
	v_add_co_u32_e64 v19, s[14:15], 1, v12                     // 000000002FC8: D1190E13 00021881
	v_cndmask_b32_e64 v15, 0, -1, vcc                          // 000000002FD0: D100000F 01A98280
	v_cmp_ge_u32_e32 vcc, v10, v21                             // 000000002FD8: 7D9C2B0A
	v_addc_co_u32_e64 v22, s[14:15], 0, v13, s[14:15]          // 000000002FDC: D11C0E16 003A1A80
	v_cndmask_b32_e64 v10, 0, -1, vcc                          // 000000002FE4: D100000A 01A98280
	v_cmp_eq_u32_e32 vcc, v11, v20                             // 000000002FEC: 7D94290B
	v_cmp_ne_u32_e64 s[14:15], 0, v16                          // 000000002FF0: D0CD000E 00022080
	v_cndmask_b32_e32 v10, v15, v10, vcc                       // 000000002FF8: 0014150F
	v_cmp_ne_u32_e32 vcc, 0, v10                               // 000000002FFC: 7D9A1480
	v_cndmask_b32_e64 v11, v19, v17, s[14:15]                  // 000000003000: D100000B 003A2313
	v_cndmask_b32_e64 v16, v22, v18, s[14:15]                  // 000000003008: D1000010 003A2516
	v_cndmask_b32_e32 v11, v12, v11, vcc                       // 000000003010: 0016170C
	v_xor_b32_e32 v4, v14, v4                                  // 000000003014: 2A08090E
	v_cndmask_b32_e32 v10, v13, v16, vcc                       // 000000003018: 0014210D
	v_xor_b32_e32 v5, v14, v5                                  // 00000000301C: 2A0A0B0E
	v_xor_b32_e32 v11, v11, v4                                 // 000000003020: 2A16090B
	v_xor_b32_e32 v10, v10, v5                                 // 000000003024: 2A140B0A
	v_sub_co_u32_e32 v4, vcc, v11, v4                          // 000000003028: 3408090B
	v_subb_co_u32_e32 v5, vcc, v10, v5, vcc                    // 00000000302C: 3A0A0B0A
	s_andn2_saveexec_b64 s[14:15], s[16:17]                    // 000000003030: BE8E2310
	s_cbranch_execz 26                                         // 000000003034: BF88001A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x970>
	v_cvt_f32_u32_e32 v4, v48                                  // 000000003038: 7E080D30
	v_sub_u32_e32 v5, 0, v48                                   // 00000000303C: 6A0A6080
	v_rcp_iflag_f32_e32 v4, v4                                 // 000000003040: 7E084704
	v_mul_f32_e32 v4, 0x4f7ffffe, v4                           // 000000003044: 0A0808FF 4F7FFFFE
	v_cvt_u32_f32_e32 v4, v4                                   // 00000000304C: 7E080F04
	v_mul_lo_u32 v5, v5, v4                                    // 000000003050: D2850005 00020905
	v_mul_hi_u32 v5, v4, v5                                    // 000000003058: D2860005 00020B04
	v_add_u32_e32 v4, v4, v5                                   // 000000003060: 68080B04
	v_mul_hi_u32 v4, v10, v4                                   // 000000003064: D2860004 0002090A
	v_mul_lo_u32 v5, v4, v48                                   // 00000000306C: D2850005 00026104
	v_sub_u32_e32 v5, v10, v5                                  // 000000003074: 6A0A0B0A
	v_add_u32_e32 v11, 1, v4                                   // 000000003078: 68160881
	v_sub_u32_e32 v10, v5, v48                                 // 00000000307C: 6A146105
	v_cmp_ge_u32_e32 vcc, v5, v48                              // 000000003080: 7D9C6105
	v_cndmask_b32_e32 v5, v5, v10, vcc                         // 000000003084: 000A1505
	v_cndmask_b32_e32 v4, v4, v11, vcc                         // 000000003088: 00081704
	v_add_u32_e32 v10, 1, v4                                   // 00000000308C: 68140881
	v_cmp_ge_u32_e32 vcc, v5, v48                              // 000000003090: 7D9C6105
	v_cndmask_b32_e32 v52, v4, v10, vcc                        // 000000003094: 00681504
	v_pk_mov_b32 v[4:5], v[52:53], v[52:53] op_sel:[0,1]       // 000000003098: D3B35004 18026934
	s_or_b64 exec, exec, s[14:15]                              // 0000000030A0: 87FE0E7E
	v_mov_b32_e32 v10, s23                                     // 0000000030A4: 7E140217
	v_cmp_lt_i64_e32 vcc, s[22:23], v[4:5]                     // 0000000030A8: 7DC20816
	v_cndmask_b32_e32 v5, v5, v10, vcc                         // 0000000030AC: 000A1505
	v_mov_b32_e32 v10, s22                                     // 0000000030B0: 7E140216
	v_cndmask_b32_e32 v4, v4, v10, vcc                         // 0000000030B4: 00081504
	v_add_co_u32_e32 v12, vcc, v101, v4                        // 0000000030B8: 32180965
	v_addc_co_u32_e32 v5, vcc, v118, v5, vcc                   // 0000000030BC: 380A0B76
	v_mov_b32_e32 v4, v53                                      // 0000000030C0: 7E080335
	v_cmp_ne_u64_e32 vcc, 0, v[4:5]                            // 0000000030C4: 7DDA0880
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000030C8: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 0000000030CC: 888E0E7E
	s_cbranch_execz 105                                        // 0000000030D0: BF880069 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xb48>
	v_cvt_f32_u32_e32 v4, v50                                  // 0000000030D4: 7E080D32
	v_sub_co_u32_e32 v16, vcc, 0, v50                          // 0000000030D8: 34206480
	v_subb_co_u32_e64 v17, s[16:17], 0, 0, vcc                 // 0000000030DC: D11D1011 01A90080
	v_mac_f32_e64 v4, 0, s51                                   // 0000000030E4: D1160004 00006680
	v_rcp_f32_e32 v4, v4                                       // 0000000030EC: 7E084504
	v_mul_f32_e32 v4, 0x5f7ffffc, v4                           // 0000000030F0: 0A0808FF 5F7FFFFC
	v_mul_f32_e32 v10, 0x2f800000, v4                          // 0000000030F8: 0A1408FF 2F800000
	v_trunc_f32_e32 v10, v10                                   // 000000003100: 7E14390A
	v_mac_f32_e32 v4, 0xcf800000, v10                          // 000000003104: 2C0814FF CF800000
	v_cvt_u32_f32_e32 v13, v10                                 // 00000000310C: 7E1A0F0A
	v_cvt_u32_f32_e32 v4, v4                                   // 000000003110: 7E080F04
	v_mul_lo_u32 v14, v16, v13                                 // 000000003114: D285000E 00021B10
	v_mul_lo_u32 v15, v17, v4                                  // 00000000311C: D285000F 00020911
	v_mad_u64_u32 v[10:11], s[16:17], v16, v4, 0               // 000000003124: D1E8100A 02020910
	v_add3_u32 v11, v11, v14, v15                              // 00000000312C: D1FF000B 043E1D0B
	v_mad_u64_u32 v[14:15], s[16:17], v4, v11, 0               // 000000003134: D1E8100E 02021704
	v_mul_hi_u32 v18, v4, v10                                  // 00000000313C: D2860012 00021504
	v_add_co_u32_e32 v18, vcc, v18, v14                        // 000000003144: 32241D12
	v_addc_co_u32_e32 v19, vcc, 0, v15, vcc                    // 000000003148: 38261E80
	v_mad_u64_u32 v[14:15], s[16:17], v13, v11, 0              // 00000000314C: D1E8100E 0202170D
	v_mad_u64_u32 v[10:11], s[16:17], v13, v10, 0              // 000000003154: D1E8100A 0202150D
	v_add_co_u32_e32 v10, vcc, v18, v10                        // 00000000315C: 32141512
	v_addc_co_u32_e32 v10, vcc, v19, v11, vcc                  // 000000003160: 38141713
	v_addc_co_u32_e32 v11, vcc, 0, v15, vcc                    // 000000003164: 38161E80
	v_add_co_u32_e32 v10, vcc, v10, v14                        // 000000003168: 32141D0A
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 00000000316C: 38161680
	v_add_co_u32_e32 v4, vcc, v4, v10                          // 000000003170: 32081504
	v_addc_co_u32_e32 v13, vcc, v13, v11, vcc                  // 000000003174: 381A170D
	v_mul_lo_u32 v14, v16, v13                                 // 000000003178: D285000E 00021B10
	v_mul_lo_u32 v15, v17, v4                                  // 000000003180: D285000F 00020911
	v_mad_u64_u32 v[10:11], s[16:17], v16, v4, 0               // 000000003188: D1E8100A 02020910
	v_add3_u32 v11, v11, v14, v15                              // 000000003190: D1FF000B 043E1D0B
	v_mad_u64_u32 v[16:17], s[16:17], v13, v10, 0              // 000000003198: D1E81010 0202150D
	v_mad_u64_u32 v[18:19], s[16:17], v4, v11, 0               // 0000000031A0: D1E81012 02021704
	v_mul_hi_u32 v10, v4, v10                                  // 0000000031A8: D286000A 00021504
	v_add_co_u32_e32 v10, vcc, v10, v18                        // 0000000031B0: 3214250A
	v_mad_u64_u32 v[14:15], s[16:17], v13, v11, 0              // 0000000031B4: D1E8100E 0202170D
	v_addc_co_u32_e32 v11, vcc, 0, v19, vcc                    // 0000000031BC: 38162680
	v_add_co_u32_e32 v10, vcc, v10, v16                        // 0000000031C0: 3214210A
	v_addc_co_u32_e32 v10, vcc, v11, v17, vcc                  // 0000000031C4: 3814230B
	v_addc_co_u32_e32 v11, vcc, 0, v15, vcc                    // 0000000031C8: 38161E80
	v_add_co_u32_e32 v10, vcc, v10, v14                        // 0000000031CC: 32141D0A
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 0000000031D0: 38161680
	v_add_co_u32_e32 v4, vcc, v4, v10                          // 0000000031D4: 32081504
	v_addc_co_u32_e32 v13, vcc, v13, v11, vcc                  // 0000000031D8: 381A170D
	v_mad_u64_u32 v[10:11], s[16:17], v12, v13, 0              // 0000000031DC: D1E8100A 02021B0C
	v_mul_hi_u32 v14, v12, v4                                  // 0000000031E4: D286000E 0002090C
	v_add_co_u32_e32 v16, vcc, v14, v10                        // 0000000031EC: 3220150E
	v_addc_co_u32_e32 v17, vcc, 0, v11, vcc                    // 0000000031F0: 38221680
	v_mad_u64_u32 v[14:15], s[16:17], v5, v4, 0                // 0000000031F4: D1E8100E 02020905
	v_add_co_u32_e32 v4, vcc, v16, v14                         // 0000000031FC: 32081D10
	v_mad_u64_u32 v[10:11], s[16:17], v5, v13, 0               // 000000003200: D1E8100A 02021B05
	v_addc_co_u32_e32 v4, vcc, v17, v15, vcc                   // 000000003208: 38081F11
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 00000000320C: 38161680
	v_add_co_u32_e32 v4, vcc, v4, v10                          // 000000003210: 32081504
	v_addc_co_u32_e32 v13, vcc, 0, v11, vcc                    // 000000003214: 381A1680
	v_mad_u64_u32 v[10:11], s[16:17], v50, v4, 0               // 000000003218: D1E8100A 02020932
	v_mov_b32_e32 v4, v11                                      // 000000003220: 7E08030B
	v_mad_u64_u32 v[14:15], s[16:17], v50, v13, v[4:5]         // 000000003224: D1E8100E 04121B32
	v_sub_co_u32_e32 v4, vcc, v12, v10                         // 00000000322C: 3408150C
	v_subb_co_u32_e32 v5, vcc, v5, v14, vcc                    // 000000003230: 3A0A1D05
	v_sub_co_u32_e32 v10, vcc, v4, v50                         // 000000003234: 34146504
	v_subbrev_co_u32_e32 v11, vcc, 0, v5, vcc                  // 000000003238: 3C160A80
	v_sub_co_u32_e32 v13, vcc, v10, v50                        // 00000000323C: 341A650A
	v_cmp_ge_u32_e32 vcc, v10, v50                             // 000000003240: 7D9C650A
	v_cndmask_b32_e64 v14, 0, -1, vcc                          // 000000003244: D100000E 01A98280
	v_cmp_eq_u32_e32 vcc, 0, v11                               // 00000000324C: 7D941680
	v_cndmask_b32_e32 v11, -1, v14, vcc                        // 000000003250: 00161CC1
	v_cmp_ge_u32_e32 vcc, v4, v50                              // 000000003254: 7D9C6504
	v_cndmask_b32_e64 v14, 0, -1, vcc                          // 000000003258: D100000E 01A98280
	v_cmp_eq_u32_e32 vcc, 0, v5                                // 000000003260: 7D940A80
	v_cndmask_b32_e32 v5, -1, v14, vcc                         // 000000003264: 000A1CC1
	v_cmp_ne_u32_e32 vcc, 0, v11                               // 000000003268: 7D9A1680
	v_cndmask_b32_e32 v10, v10, v13, vcc                       // 00000000326C: 00141B0A
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000003270: 7D9A0A80
	v_cndmask_b32_e32 v10, v4, v10, vcc                        // 000000003274: 00141504
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000003278: BE8E230E
	s_cbranch_execz 22                                         // 00000000327C: BF880016 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xba8>
	v_cvt_f32_u32_e32 v4, v50                                  // 000000003280: 7E080D32
	v_sub_u32_e32 v5, 0, v50                                   // 000000003284: 6A0A6480
	v_rcp_iflag_f32_e32 v4, v4                                 // 000000003288: 7E084704
	v_mul_f32_e32 v4, 0x4f7ffffe, v4                           // 00000000328C: 0A0808FF 4F7FFFFE
	v_cvt_u32_f32_e32 v4, v4                                   // 000000003294: 7E080F04
	v_mul_lo_u32 v5, v5, v4                                    // 000000003298: D2850005 00020905
	v_mul_hi_u32 v5, v4, v5                                    // 0000000032A0: D2860005 00020B04
	v_add_u32_e32 v4, v4, v5                                   // 0000000032A8: 68080B04
	v_mul_hi_u32 v4, v12, v4                                   // 0000000032AC: D2860004 0002090C
	v_mul_lo_u32 v4, v4, v50                                   // 0000000032B4: D2850004 00026504
	v_sub_u32_e32 v4, v12, v4                                  // 0000000032BC: 6A08090C
	v_sub_u32_e32 v5, v4, v50                                  // 0000000032C0: 6A0A6504
	v_cmp_ge_u32_e32 vcc, v4, v50                              // 0000000032C4: 7D9C6504
	v_cndmask_b32_e32 v4, v4, v5, vcc                          // 0000000032C8: 00080B04
	v_sub_u32_e32 v5, v4, v50                                  // 0000000032CC: 6A0A6504
	v_cmp_ge_u32_e32 vcc, v4, v50                              // 0000000032D0: 7D9C6504
	v_cndmask_b32_e32 v10, v4, v5, vcc                         // 0000000032D4: 00140B04
	s_or_b64 exec, exec, s[14:15]                              // 0000000032D8: 87FE0E7E
	v_sub_co_u32_e32 v112, vcc, v12, v10                       // 0000000032DC: 34E0150C
	v_ashrrev_i32_e32 v113, 31, v112                           // 0000000032E0: 22E2E09F
	v_mul_lo_u32 v4, v113, v119                                // 0000000032E4: D2850004 0002EF71
	v_mul_lo_u32 v5, v112, v128                                // 0000000032EC: D2850005 00030170
	v_mad_u64_u32 v[10:11], s[14:15], v112, v119, v[102:103]   // 0000000032F4: D1E80E0A 059AEF70
	v_add3_u32 v11, v4, v11, v5                                // 0000000032FC: D1FF000B 04161704
	v_sub_co_u32_e32 v4, vcc, v26, v10                         // 000000003304: 3408151A
	v_subb_co_u32_e32 v5, vcc, v27, v11, vcc                   // 000000003308: 3A0A171B
	v_cmp_lt_i64_e32 vcc, v[112:113], v[4:5]                   // 00000000330C: 7DC20970
	v_cndmask_b32_e32 v4, v4, v112, vcc                        // 000000003310: 0008E104
	v_max_i32_e32 v18, 0, v4                                   // 000000003314: 1A240880
	v_add_u32_e32 v5, 31, v18                                  // 000000003318: 680A249F
	v_ashrrev_i32_e32 v12, 31, v5                              // 00000000331C: 22180A9F
	v_lshrrev_b32_e32 v12, 27, v12                             // 000000003320: 2018189B
	v_add_u32_e32 v5, v5, v12                                  // 000000003324: 680A1905
	v_ashrrev_i32_e32 v5, 5, v5                                // 000000003328: 220A0A85
	v_lshlrev_b32_e32 v5, 4, v5                                // 00000000332C: 240A0A84
	v_cmp_lt_i32_e32 vcc, 0, v4                                // 000000003330: 7D820880
	v_max_i32_e32 v19, s48, v5                                 // 000000003334: 1A260A30
	s_and_b64 s[14:15], s[28:29], vcc                          // 000000003338: 868E6A1C
	v_mov_b32_e32 v4, 0                                        // 00000000333C: 7E080280
	v_mov_b32_e32 v5, 0                                        // 000000003340: 7E0A0280
	s_and_saveexec_b64 s[30:31], s[14:15]                      // 000000003344: BE9E200E
	s_cbranch_execnz 8                                         // 000000003348: BF890008 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xc3c>
	s_or_b64 exec, exec, s[30:31]                              // 00000000334C: 87FE1E7E
	v_cmp_gt_i32_e32 vcc, 2, v5                                // 000000003350: 7D880A82
	s_and_saveexec_b64 s[16:17], vcc                           // 000000003354: BE90206A
	s_cbranch_execnz 579                                       // 000000003358: BF890243 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1538>
	s_or_b64 exec, exec, s[16:17]                              // 00000000335C: 87FE107E
	s_andn2_b64 vcc, exec, s[26:27]                            // 000000003360: 89EA1A7E
	s_cbranch_vccz 844                                         // 000000003364: BF86034C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1968>
	s_branch 1834                                              // 000000003368: BF82072A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x28e4>
	v_lshlrev_b64 v[4:5], 2, v[10:11]                          // 00000000336C: D28F0004 00021482
	v_add_co_u32_e32 v20, vcc, v38, v4                         // 000000003374: 32280926
	v_addc_co_u32_e32 v21, vcc, v1, v5, vcc                    // 000000003378: 382A0B01
	s_mov_b32 s44, 1                                           // 00000000337C: BEAC0081
	s_mov_b64 s[36:37], -1                                     // 000000003380: BEA401C1
	s_mov_b64 s[34:35], 0                                      // 000000003384: BEA20180
	v_mov_b32_e32 v4, 0                                        // 000000003388: 7E080280
	s_branch 20                                                // 00000000338C: BF820014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xcb0>
	s_or_b64 exec, exec, s[16:17]                              // 000000003390: 87FE107E
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000003394: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000003398: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 00000000339C: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 0000000033A0: DC740000 00001C06
	s_or_b64 exec, exec, s[14:15]                              // 0000000033A8: 87FE0E7E
	v_add_u32_e32 v4, v19, v4                                  // 0000000033AC: 68080913
	v_cmp_ge_i32_e32 vcc, v4, v18                              // 0000000033B0: 7D8C2504
	s_xor_b64 s[14:15], s[36:37], -1                           // 0000000033B4: 888EC124
	s_or_b64 s[14:15], s[14:15], vcc                           // 0000000033B8: 878E6A0E
	s_and_b64 s[14:15], exec, s[14:15]                         // 0000000033BC: 868E0E7E
	v_or_b32_e32 v55, 0x800, v55                               // 0000000033C0: 286E6EFF 00000800
	s_or_b64 s[34:35], s[14:15], s[34:35]                      // 0000000033C8: 87A2220E
	s_mov_b64 s[36:37], 0                                      // 0000000033CC: BEA40180
	v_mov_b32_e32 v5, s44                                      // 0000000033D0: 7E0A022C
	s_mov_b32 s44, 2                                           // 0000000033D4: BEAC0082
	s_andn2_b64 exec, exec, s[34:35]                           // 0000000033D8: 89FE227E
	s_cbranch_execz 541                                        // 0000000033DC: BF88021D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1524>
	v_and_b32_e32 v5, 1, v55                                   // 0000000033E0: 260A6E81
	v_cmp_eq_u32_e32 vcc, 1, v5                                // 0000000033E4: 7D940A81
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000033E8: BE8E206A
	s_cbranch_execz 7                                          // 0000000033EC: BF880007 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xcdc>
	v_ashrrev_i32_e32 v5, 31, v4                               // 0000000033F0: 220A089F
	v_lshlrev_b64 v[10:11], 2, v[4:5]                          // 0000000033F4: D28F000A 00020882
	v_add_co_u32_e32 v10, vcc, v20, v10                        // 0000000033FC: 32141514
	v_addc_co_u32_e32 v11, vcc, v21, v11, vcc                  // 000000003400: 38161715
	ds_write_b64 v53, v[10:11] offset:112                      // 000000003404: D89A0070 00000A35
	s_or_b64 exec, exec, s[14:15]                              // 00000000340C: 87FE0E7E
	v_and_b32_e32 v5, 8, v55                                   // 000000003410: 260A6E88
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000003414: 7D9A0A80
	s_mov_b64 s[14:15], -1                                     // 000000003418: BE8E01C1
	s_and_saveexec_b64 s[16:17], vcc                           // 00000000341C: BE90206A
	s_cbranch_execz 106                                        // 000000003420: BF88006A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xe9c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003424: BF8C0070
	v_add_co_u32_e32 v12, vcc, 8, v36                          // 000000003428: 32184888
	v_addc_co_u32_e32 v13, vcc, 0, v37, vcc                    // 00000000342C: 381A4A80
	v_add_co_u32_e32 v10, vcc, 2, v28                          // 000000003430: 32143882
	v_addc_co_u32_e32 v11, vcc, 0, v29, vcc                    // 000000003434: 38163A80
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]                   // 000000003438: 7DD2150C
	v_mov_b32_e32 v5, 1                                        // 00000000343C: 7E0A0281
	s_and_saveexec_b64 s[38:39], vcc                           // 000000003440: BEA6206A
	s_cbranch_execz 93                                         // 000000003444: BF88005D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xe8c>
	v_add_u32_e32 v12, 2, v28                                  // 000000003448: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 00000000344C: 221A189F
	s_mov_b64 s[40:41], 0                                      // 000000003450: BEA80180
	v_mov_b32_e32 v5, 0                                        // 000000003454: 7E0A0280
	s_branch 11                                                // 000000003458: BF82000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xd58>
	s_or_b64 exec, exec, s[42:43]                              // 00000000345C: 87FE2A7E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003460: BF8C0070
	v_add_co_u32_e32 v14, vcc, 8, v36                          // 000000003464: 321C4888
	v_addc_co_u32_e32 v15, vcc, 0, v37, vcc                    // 000000003468: 381E4A80
	v_cmp_ge_u64_e32 vcc, v[14:15], v[10:11]                   // 00000000346C: 7DDC150E
	s_orn2_b64 s[42:43], vcc, exec                             // 000000003470: 8AAA7E6A
	s_or_b64 exec, exec, s[14:15]                              // 000000003474: 87FE0E7E
	s_and_b64 s[14:15], exec, s[42:43]                         // 000000003478: 868E2A7E
	s_or_b64 s[40:41], s[14:15], s[40:41]                      // 00000000347C: 87A8280E
	s_andn2_b64 exec, exec, s[40:41]                           // 000000003480: 89FE287E
	s_cbranch_execz 75                                         // 000000003484: BF88004B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xe84>
	s_sleep 1                                                  // 000000003488: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000348C: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 000000003490: DC550000 24000006
	v_add_u32_e32 v5, 1, v5                                    // 000000003498: 680A0A81
	v_and_b32_e32 v14, 64, v55                                 // 00000000349C: 261C6EC0
	v_cmp_eq_u32_e32 vcc, 0, v14                               // 0000000034A0: 7D941C80
	v_cmp_eq_u32_e64 s[14:15], s52, v5                         // 0000000034A4: D0CA000E 00020A34
	s_and_b64 vcc, vcc, s[14:15]                               // 0000000034AC: 86EA0E6A
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000034B0: BE8E206A
	s_cbranch_execz 13                                         // 0000000034B4: BF88000D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xdbc>
	ds_read_b64 v[14:15], v53 offset:1264                      // 0000000034B8: D8EC04F0 0E000035
	s_waitcnt lgkmcnt(0)                                       // 0000000034C0: BF8CC07F
	flat_load_dword v5, v[14:15] glc                           // 0000000034C4: DC510000 0500000E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000034CC: BF8C0070
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 0000000034D0: 7D9A0A80
	v_cndmask_b32_e64 v5, 0, 1, vcc                            // 0000000034D4: D1000005 01A90280
	v_lshl_or_b32 v55, v5, 6, v55                              // 0000000034DC: D2000037 04DD0D05
	v_and_b32_e32 v14, 64, v55                                 // 0000000034E4: 261C6EC0
	v_mov_b32_e32 v5, 0                                        // 0000000034E8: 7E0A0280
	s_or_b64 exec, exec, s[14:15]                              // 0000000034EC: 87FE0E7E
	v_cmp_eq_u32_e32 vcc, 0, v14                               // 0000000034F0: 7D941C80
	s_mov_b64 s[42:43], -1                                     // 0000000034F4: BEAA01C1
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000034F8: BE8E206A
	s_cbranch_execz 65501                                      // 0000000034FC: BF88FFDD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xd44>
	v_cmp_eq_u32_e32 vcc, 0, v5                                // 000000003500: 7D940A80
	s_and_saveexec_b64 s[42:43], vcc                           // 000000003504: BEAA206A
	s_cbranch_execz 65492                                      // 000000003508: BF88FFD4 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xd2c>
	ds_read_b64 v[14:15], v53 offset:1288                      // 00000000350C: D8EC0508 0E000035
	v_mov_b32_e32 v52, s12                                     // 000000003514: 7E68020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003518: BF8C0070
	v_add_u32_e32 v16, 8, v36                                  // 00000000351C: 68204888
	buffer_wbl2                                                // 000000003520: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003528: BF8C0070
	flat_atomic_add v17, v[14:15], v146 glc                    // 00000000352C: DD090000 1100920E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003534: BF8C0070
	buffer_invl2                                               // 000000003538: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 000000003540: E0FC0000 00000000
	ds_read_b64 v[14:15], v53 offset:1280                      // 000000003548: D8EC0500 0E000035
	v_and_b32_e32 v17, 0x1fff, v17                             // 000000003550: 262222FF 00001FFF
	v_lshlrev_b32_e32 v17, 5, v17                              // 000000003558: 24222285
	s_waitcnt lgkmcnt(0)                                       // 00000000355C: BF8CC07F
	v_add_co_u32_e32 v22, vcc, v14, v17                        // 000000003560: 322C230E
	v_addc_co_u32_e32 v23, vcc, 0, v15, vcc                    // 000000003564: 382E1E80
	flat_store_byte v[22:23], v52 offset:1                     // 000000003568: DC600001 00003416
	s_memrealtime vcc                                          // 000000003570: C0941A80 00000000
	v_ashrrev_i32_e32 v17, 31, v16                             // 000000003578: 2222209F
	flat_store_short v[22:23], v147 offset:2                   // 00000000357C: DC680002 00009316
	flat_store_dword v[22:23], v24 offset:4                    // 000000003584: DC700004 00001816
	flat_store_dwordx2 v[22:23], v[12:13] offset:24            // 00000000358C: DC740018 00000C16
	s_waitcnt lgkmcnt(0)                                       // 000000003594: BF8CC07F
	v_mov_b32_e32 v14, vcc_lo                                  // 000000003598: 7E1C026A
	v_mov_b32_e32 v15, vcc_hi                                  // 00000000359C: 7E1E026B
	flat_store_dwordx4 v[22:23], v[14:17] offset:8             // 0000000035A0: DC7C0008 00000E16
	flat_store_byte v[22:23], v148                             // 0000000035A8: DC600000 00009416
	s_branch 65450                                             // 0000000035B0: BF82FFAA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xd2c>
	s_or_b64 exec, exec, s[40:41]                              // 0000000035B4: 87FE287E
	v_and_b32_e32 v5, 8, v55                                   // 0000000035B8: 260A6E88
	s_or_b64 exec, exec, s[38:39]                              // 0000000035BC: 87FE267E
	v_cmp_eq_u32_e32 vcc, 0, v5                                // 0000000035C0: 7D940A80
	s_orn2_b64 s[14:15], vcc, exec                             // 0000000035C4: 8A8E7E6A
	s_wakeup                                                   // 0000000035C8: BF830000
	s_or_b64 exec, exec, s[16:17]                              // 0000000035CC: 87FE107E
	v_sub_u32_e32 v5, v18, v4                                  // 0000000035D0: 6A0A0912
	s_xor_b64 s[16:17], s[14:15], -1                           // 0000000035D4: 8890C10E
	v_min_i32_e32 v19, v19, v5                                 // 0000000035D8: 18260B13
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 0000000035DC: BE8E2010
	s_cbranch_execz 54                                         // 0000000035E0: BF880036 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xf8c>
	v_and_b32_e32 v5, 0x100, v55                               // 0000000035E4: 260A6EFF 00000100
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 0000000035EC: 7D9A0A80
	s_and_saveexec_b64 s[16:17], vcc                           // 0000000035F0: BE90206A
	s_xor_b64 s[16:17], exec, s[16:17]                         // 0000000035F4: 8890107E
	s_cbranch_execz 11                                         // 0000000035F8: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xef8>
	v_and_b32_e32 v52, 7, v28                                  // 0000000035FC: 26683887
	v_lshlrev_b64 v[10:11], 2, v[52:53]                        // 000000003600: D28F000A 00026882
	v_add_co_u32_e32 v10, vcc, v8, v10                         // 000000003608: 32141508
	v_lshlrev_b32_e32 v5, 2, v19                               // 00000000360C: 240A2682
	v_addc_co_u32_e32 v11, vcc, v9, v11, vcc                   // 000000003610: 38161709
	buffer_wbl2                                                // 000000003614: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000361C: BF8C0070
	flat_store_dword v[10:11], v5                              // 000000003620: DC700000 0000050A
	s_andn2_saveexec_b64 s[16:17], s[16:17]                    // 000000003628: BE902310
	v_and_b32_e32 v52, 7, v28                                  // 00000000362C: 26683887
	s_or_b64 exec, exec, s[16:17]                              // 000000003630: 87FE107E
	v_and_b32_e32 v5, 0x80, v55                                // 000000003634: 260A6EFF 00000080
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 00000000363C: 7D9A0A80
	s_and_saveexec_b64 s[16:17], vcc                           // 000000003640: BE90206A
	s_xor_b64 s[16:17], exec, s[16:17]                         // 000000003644: 8890107E
	s_cbranch_execz 10                                         // 000000003648: BF88000A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xf44>
	v_lshlrev_b64 v[10:11], 2, v[52:53]                        // 00000000364C: D28F000A 00026882
	v_add_co_u32_e32 v10, vcc, v30, v10                        // 000000003654: 3214151E
	v_addc_co_u32_e32 v11, vcc, v31, v11, vcc                  // 000000003658: 3816171F
	flat_load_dwordx2 v[10:11], v[10:11] glc                   // 00000000365C: DC550000 0A00000A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003664: BF8C0070
	v_ashrrev_i32_e32 v11, 31, v10                             // 000000003668: 2216149F
	v_lshrrev_b64 v[10:11], 2, v[10:11]                        // 00000000366C: D290000A 00021482
	s_andn2_saveexec_b64 s[16:17], s[16:17]                    // 000000003674: BE902310
	v_mul_lo_u32 v5, v53, s24                                  // 000000003678: D2850005 00003135
	v_mul_lo_u32 v12, v52, s13                                 // 000000003680: D285000C 00001B34
	v_mad_u64_u32 v[10:11], vcc, v52, s24, 0                   // 000000003688: D1E86A0A 02003134
	v_add3_u32 v11, v11, v12, v5                               // 000000003690: D1FF000B 0416190B
	s_or_b64 exec, exec, s[16:17]                              // 000000003698: 87FE107E
	v_lshlrev_b64 v[10:11], 2, v[10:11]                        // 00000000369C: D28F000A 00021482
	v_add_co_u32_e32 v10, vcc, v38, v10                        // 0000000036A4: 32141526
	v_addc_co_u32_e32 v11, vcc, v1, v11, vcc                   // 0000000036A8: 38161701
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 0000000036AC: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 0000000036B0: 383A3A80
	ds_write_b64 v129, v[10:11]                                // 0000000036B4: D89A0000 00000A81
	s_or_b64 exec, exec, s[14:15]                              // 0000000036BC: 87FE0E7E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 0000000036C0: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 0000000036C4: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000036C8: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 0000000036CC: 888E0E7E
	s_cbranch_execnz 6                                         // 0000000036D0: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xfbc>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 0000000036D4: BE8E230E
	s_cbranch_execnz 16                                        // 0000000036D8: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xfec>
	s_or_b64 exec, exec, s[14:15]                              // 0000000036DC: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 0000000036E0: BE8E2010
	s_cbranch_execnz 20                                        // 0000000036E4: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1008>
	s_branch 51                                                // 0000000036E8: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1088>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 0000000036EC: 7D944031
	s_mov_b64 s[38:39], -1                                     // 0000000036F0: BEA601C1
	s_and_saveexec_b64 s[16:17], vcc                           // 0000000036F4: BE90206A
	s_cbranch_execz 4                                          // 0000000036F8: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xfdc>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000036FC: BF8C0070
	s_barrier                                                  // 000000003700: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000003704: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 000000003708: 88A6C17E
	s_or_b64 exec, exec, s[16:17]                              // 00000000370C: 87FE107E
	s_and_b64 s[16:17], s[38:39], exec                         // 000000003710: 86907E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000003714: BE8E230E
	s_cbranch_execz 65520                                      // 000000003718: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xfac>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 00000000371C: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 000000003720: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 000000003724: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 000000003728: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 00000000372C: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000003730: BE8E2010
	s_cbranch_execz 32                                         // 000000003734: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1088>
	s_and_b64 exec, exec, s[4:5]                               // 000000003738: 86FE047E
	s_cbranch_execz 30                                         // 00000000373C: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1088>
	ds_read_b64 v[10:11], v130                                 // 000000003740: D8EC0000 0A000082
	v_mov_b32_e32 v12, 1                                       // 000000003748: 7E180281
	v_mov_b32_e32 v13, 0                                       // 00000000374C: 7E1A0280
	s_waitcnt lgkmcnt(0)                                       // 000000003750: BF8CC07F
	v_add_co_u32_e32 v10, vcc, v10, v0                         // 000000003754: 3214010A
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 000000003758: 38161680
	ds_write_b64 v130, v[10:11]                                // 00000000375C: D89A0000 00000A82
	ds_add_u64 v53, v[12:13] offset:248                        // 000000003764: D88000F8 00000C35
	ds_read_b64 v[12:13], v53 offset:248                       // 00000000376C: D8EC00F8 0C000035
	s_waitcnt lgkmcnt(0)                                       // 000000003774: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]                   // 000000003778: 7DD2150C
	s_and_saveexec_b64 s[16:17], vcc                           // 00000000377C: BE90206A
	s_cbranch_execz 11                                         // 000000003780: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1080>
	s_mov_b64 s[38:39], 0                                      // 000000003784: BEA60180
	s_sleep 1                                                  // 000000003788: BF8E0001
	ds_read_b64 v[10:11], v53 offset:248                       // 00000000378C: D8EC00F8 0A000035
	ds_read_b64 v[12:13], v130                                 // 000000003794: D8EC0000 0C000082
	s_waitcnt lgkmcnt(0)                                       // 00000000379C: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]                   // 0000000037A0: 7DDC190A
	s_or_b64 s[38:39], vcc, s[38:39]                           // 0000000037A4: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 0000000037A8: 89FE267E
	s_cbranch_execnz 65526                                     // 0000000037AC: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1058>
	s_or_b64 exec, exec, s[16:17]                              // 0000000037B0: 87FE107E
	s_wakeup                                                   // 0000000037B4: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 0000000037B8: 87FE0E7E
	v_cmp_lt_i32_e32 vcc, 0, v19                               // 0000000037BC: 7D822680
	s_and_saveexec_b64 s[38:39], vcc                           // 0000000037C0: BEA6206A
	s_cbranch_execz 208                                        // 0000000037C4: BF8800D0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x13d8>
	ds_read2_b64 v[10:13], v53 offset0:14 offset1:22           // 0000000037C8: D8EE160E 0A000035
	v_mov_b32_e32 v15, 0                                       // 0000000037D0: 7E1E0280
	s_mov_b64 s[16:17], -1                                     // 0000000037D4: BE9001C1
	v_mov_b32_e32 v16, v19                                     // 0000000037D8: 7E200313
	s_waitcnt lgkmcnt(0)                                       // 0000000037DC: BF8CC07F
	v_or_b32_e32 v5, v12, v10                                  // 0000000037E0: 280A150C
	v_and_b32_e32 v14, 3, v5                                   // 0000000037E4: 261C0A83
	v_cmp_ne_u64_e32 vcc, 0, v[14:15]                          // 0000000037E8: 7DDA1C80
	s_cbranch_vccz 3                                           // 0000000037EC: BF860003 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x10cc>
	s_and_b64 exec, exec, s[16:17]                             // 0000000037F0: 86FE107E
	s_cbranch_execnz 106                                       // 0000000037F4: BF89006A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1270>
	s_branch 195                                               // 0000000037F8: BF8200C3 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x13d8>
	v_lshrrev_b32_e32 v5, 2, v19                               // 0000000037FC: 200A2682
	v_and_b32_e32 v5, 0x3fffff00, v5                           // 000000003800: 260A0AFF 3FFFFF00
	v_cmp_lt_u32_e32 vcc, v66, v5                              // 000000003808: 7D920B42
	s_and_saveexec_b64 s[40:41], vcc                           // 00000000380C: BEA8206A
	s_cbranch_execz 40                                         // 000000003810: BF880028 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1184>
	s_mov_b64 s[42:43], 0                                      // 000000003814: BEAA0180
	v_pk_mov_b32 v[14:15], v[12:13], v[12:13] op_sel:[0,1]     // 000000003818: D3B3500E 1802190C
	v_pk_mov_b32 v[16:17], v[10:11], v[10:11] op_sel:[0,1]     // 000000003820: D3B35010 1802150A
	v_mov_b32_e32 v22, v66                                     // 000000003828: 7E2C0342
	v_add_co_u32_e32 v180, vcc, v16, v96                       // 00000000382C: 3368C110
	v_addc_co_u32_e32 v181, vcc, 0, v17, vcc                   // 000000003830: 396A2280
	flat_load_dwordx4 v[114:117], v[180:181] glc slc           // 000000003834: DC5F0000 720000B4
	flat_load_dwordx4 v[160:163], v[180:181] offset:1024 glc slc// 00000000383C: DC5F0400 A00000B4
	flat_load_dwordx4 v[164:167], v[180:181] offset:2048 glc slc// 000000003844: DC5F0800 A40000B4
	flat_load_dwordx4 v[176:179], v[180:181] offset:3072 glc slc// 00000000384C: DC5F0C00 B00000B4
	v_add_co_u32_e32 v180, vcc, v14, v96                       // 000000003854: 3368C10E
	v_add_co_u32_e64 v16, s[14:15], v16, v70                   // 000000003858: D1190E10 00028D10
	v_add_co_u32_e64 v14, s[16:17], v14, v70                   // 000000003860: D119100E 00028D0E
	v_add_u32_e32 v22, v22, v64                                // 000000003868: 682C8116
	v_addc_co_u32_e32 v181, vcc, 0, v15, vcc                   // 00000000386C: 396A1E80
	v_addc_co_u32_e64 v17, vcc, v17, v71, s[14:15]             // 000000003870: D11C6A11 003A8F11
	v_addc_co_u32_e64 v15, vcc, v15, v71, s[16:17]             // 000000003878: D11C6A0F 00428F0F
	v_cmp_ge_u32_e32 vcc, v22, v5                              // 000000003880: 7D9C0B16
	s_or_b64 s[42:43], vcc, s[42:43]                           // 000000003884: 87AA2A6A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003888: BF8C0070
	flat_store_dwordx4 v[180:181], v[114:117] glc slc          // 00000000388C: DC7F0000 000072B4
	flat_store_dwordx4 v[180:181], v[160:163] offset:1024 glc slc// 000000003894: DC7F0400 0000A0B4
	flat_store_dwordx4 v[180:181], v[164:167] offset:2048 glc slc// 00000000389C: DC7F0800 0000A4B4
	flat_store_dwordx4 v[180:181], v[176:179] offset:3072 glc slc// 0000000038A4: DC7F0C00 0000B0B4
	s_andn2_b64 exec, exec, s[42:43]                           // 0000000038AC: 89FE2A7E
	s_cbranch_execnz 65502                                     // 0000000038B0: BF89FFDE <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x10fc>
	s_or_b64 exec, exec, s[40:41]                              // 0000000038B4: 87FE287E
	v_lshlrev_b32_e32 v52, 2, v5                               // 0000000038B8: 24680A82
	v_cmp_ne_u32_e32 vcc, v19, v52                             // 0000000038BC: 7D9A6913
	s_mov_b64 s[16:17], 0                                      // 0000000038C0: BE900180
	v_mov_b32_e32 v16, 0                                       // 0000000038C4: 7E200280
	v_mov_b32_e32 v15, 0                                       // 0000000038C8: 7E1E0280
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000038CC: BE8E206A
	s_cbranch_execz 48                                         // 0000000038D0: BF880030 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1264>
	v_sub_u32_e32 v5, v19, v52                                 // 0000000038D4: 6A0A6913
	v_ashrrev_i32_e32 v22, 2, v5                               // 0000000038D8: 222C0A82
	v_cmp_lt_i32_e32 vcc, v24, v22                             // 0000000038DC: 7D822D18
	s_and_saveexec_b64 s[16:17], vcc                           // 0000000038E0: BE90206A
	s_cbranch_execz 30                                         // 0000000038E4: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1230>
	v_lshlrev_b64 v[16:17], 2, v[52:53]                        // 0000000038E8: D28F0010 00026882
	v_add_co_u32_e32 v14, vcc, v12, v16                        // 0000000038F0: 321C210C
	v_addc_co_u32_e32 v15, vcc, v13, v17, vcc                  // 0000000038F4: 381E230D
	v_lshlrev_b64 v[114:115], 4, v[24:25]                      // 0000000038F8: D28F0072 00023084
	v_add_co_u32_e32 v14, vcc, v14, v114                       // 000000003900: 321CE50E
	v_addc_co_u32_e32 v15, vcc, v15, v115, vcc                 // 000000003904: 381EE70F
	v_add_co_u32_e32 v16, vcc, v10, v16                        // 000000003908: 3220210A
	v_addc_co_u32_e32 v17, vcc, v11, v17, vcc                  // 00000000390C: 3822230B
	v_add_co_u32_e32 v16, vcc, v16, v114                       // 000000003910: 3220E510
	v_addc_co_u32_e32 v17, vcc, v17, v115, vcc                 // 000000003914: 3822E711
	s_mov_b64 s[40:41], 0                                      // 000000003918: BEA80180
	v_mov_b32_e32 v23, v24                                     // 00000000391C: 7E2E0318
	flat_load_dwordx4 v[114:117], v[16:17] glc slc             // 000000003920: DC5F0000 72000010
	v_lshlrev_b64 v[160:161], 4, v[32:33]                      // 000000003928: D28F00A0 00024084
	v_add_co_u32_e32 v16, vcc, v16, v160                       // 000000003930: 32214110
	v_add_u32_e32 v23, v23, v32                                // 000000003934: 682E4117
	v_addc_co_u32_e32 v17, vcc, v17, v161, vcc                 // 000000003938: 38234311
	v_cmp_ge_i32_e32 vcc, v23, v22                             // 00000000393C: 7D8C2D17
	s_or_b64 s[40:41], vcc, s[40:41]                           // 000000003940: 87A8286A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003944: BF8C0070
	flat_store_dwordx4 v[14:15], v[114:117] glc slc            // 000000003948: DC7F0000 0000720E
	v_add_co_u32_e32 v14, vcc, v14, v160                       // 000000003950: 321D410E
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc                 // 000000003954: 381F430F
	s_andn2_b64 exec, exec, s[40:41]                           // 000000003958: 89FE287E
	s_cbranch_execnz 65520                                     // 00000000395C: BF89FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x11f0>
	s_or_b64 exec, exec, s[16:17]                              // 000000003960: 87FE107E
	v_and_b32_e32 v14, 3, v5                                   // 000000003964: 261C0A83
	v_cmp_ne_u32_e32 vcc, 0, v14                               // 000000003968: 7D9A1C80
	s_mov_b64 s[16:17], 0                                      // 00000000396C: BE900180
	v_mov_b32_e32 v16, 0                                       // 000000003970: 7E200280
	s_and_saveexec_b64 s[40:41], vcc                           // 000000003974: BEA8206A
	v_and_b32_e32 v5, -4, v5                                   // 000000003978: 260A0AC4
	s_mov_b64 s[16:17], exec                                   // 00000000397C: BE90017E
	v_add_u32_e32 v52, v5, v52                                 // 000000003980: 68686905
	v_mov_b32_e32 v16, v14                                     // 000000003984: 7E20030E
	s_or_b64 exec, exec, s[40:41]                              // 000000003988: 87FE287E
	s_and_b64 s[16:17], s[16:17], exec                         // 00000000398C: 86907E10
	v_mov_b32_e32 v15, v52                                     // 000000003990: 7E1E0334
	s_or_b64 exec, exec, s[14:15]                              // 000000003994: 87FE0E7E
	s_and_b64 exec, exec, s[16:17]                             // 000000003998: 86FE107E
	s_cbranch_execz 90                                         // 00000000399C: BF88005A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x13d8>
	v_and_b32_e32 v17, 0xfffffe00, v16                         // 0000000039A0: 262220FF FFFFFE00
	v_cmp_lt_i32_e32 vcc, v132, v17                            // 0000000039A8: 7D822384
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000039AC: BE8E206A
	s_cbranch_execz 52                                         // 0000000039B0: BF880034 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1354>
	v_ashrrev_i32_e32 v23, 31, v15                             // 0000000039B4: 222E1E9F
	v_mov_b32_e32 v22, v15                                     // 0000000039B8: 7E2C030F
	v_lshlrev_b64 v[22:23], 2, v[22:23]                        // 0000000039BC: D28F0016 00022C82
	v_add_co_u32_e32 v14, vcc, v98, v22                        // 0000000039C4: 321C2D62
	v_addc_co_u32_e32 v5, vcc, 0, v23, vcc                     // 0000000039C8: 380A2E80
	s_mov_b64 s[16:17], 0                                      // 0000000039CC: BE900180
	v_mov_b32_e32 v22, v132                                    // 0000000039D0: 7E2C0384
	v_add_co_u32_e32 v114, vcc, v10, v14                       // 0000000039D4: 32E41D0A
	v_addc_co_u32_e32 v115, vcc, v11, v5, vcc                  // 0000000039D8: 38E60B0B
	flat_load_dword v23, v[114:115] glc slc                    // 0000000039DC: DC530000 17000072
	flat_load_dword v52, v[114:115] offset:256 glc slc         // 0000000039E4: DC530100 34000072
	flat_load_dword v116, v[114:115] offset:512 glc slc        // 0000000039EC: DC530200 74000072
	flat_load_dword v117, v[114:115] offset:768 glc slc        // 0000000039F4: DC530300 75000072
	flat_load_dword v160, v[114:115] offset:1024 glc slc       // 0000000039FC: DC530400 A0000072
	flat_load_dword v161, v[114:115] offset:1280 glc slc       // 000000003A04: DC530500 A1000072
	flat_load_dword v162, v[114:115] offset:1536 glc slc       // 000000003A0C: DC530600 A2000072
	flat_load_dword v163, v[114:115] offset:1792 glc slc       // 000000003A14: DC530700 A3000072
	v_add_co_u32_e32 v114, vcc, v12, v14                       // 000000003A1C: 32E41D0C
	v_addc_co_u32_e32 v115, vcc, v13, v5, vcc                  // 000000003A20: 38E60B0D
	v_add_co_u32_e32 v14, vcc, v14, v80                        // 000000003A24: 321CA10E
	v_add_u32_e32 v22, v22, v131                               // 000000003A28: 682D0716
	v_addc_co_u32_e32 v5, vcc, v5, v81, vcc                    // 000000003A2C: 380AA305
	v_cmp_ge_i32_e32 vcc, v22, v17                             // 000000003A30: 7D8C2316
	s_or_b64 s[16:17], vcc, s[16:17]                           // 000000003A34: 8790106A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003A38: BF8C0070
	flat_store_dword v[114:115], v23 glc slc                   // 000000003A3C: DC730000 00001772
	flat_store_dword v[114:115], v52 offset:256 glc slc        // 000000003A44: DC730100 00003472
	flat_store_dword v[114:115], v116 offset:512 glc slc       // 000000003A4C: DC730200 00007472
	flat_store_dword v[114:115], v117 offset:768 glc slc       // 000000003A54: DC730300 00007572
	flat_store_dword v[114:115], v160 offset:1024 glc slc      // 000000003A5C: DC730400 0000A072
	flat_store_dword v[114:115], v161 offset:1280 glc slc      // 000000003A64: DC730500 0000A172
	flat_store_dword v[114:115], v162 offset:1536 glc slc      // 000000003A6C: DC730600 0000A272
	flat_store_dword v[114:115], v163 offset:1792 glc slc      // 000000003A74: DC730700 0000A372
	s_andn2_b64 exec, exec, s[16:17]                           // 000000003A7C: 89FE107E
	s_cbranch_execnz 65492                                     // 000000003A80: BF89FFD4 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x12a4>
	s_or_b64 exec, exec, s[14:15]                              // 000000003A84: 87FE0E7E
	v_and_b32_e32 v16, 0x1ff, v16                              // 000000003A88: 262020FF 000001FF
	v_cmp_ne_u32_e32 vcc, 0, v16                               // 000000003A90: 7D9A2080
	v_cmp_lt_u32_e64 s[14:15], v24, v16                        // 000000003A94: D0C9000E 00022118
	s_and_b64 s[14:15], vcc, s[14:15]                          // 000000003A9C: 868E0E6A
	s_and_b64 exec, exec, s[14:15]                             // 000000003AA0: 86FE0E7E
	s_cbranch_execz 24                                         // 000000003AA4: BF880018 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x13d8>
	v_add_u32_e32 v14, v17, v15                                // 000000003AA8: 681C1F11
	v_ashrrev_i32_e32 v15, 31, v14                             // 000000003AAC: 221E1C9F
	v_lshlrev_b64 v[14:15], 2, v[14:15]                        // 000000003AB0: D28F000E 00021C82
	v_add_co_u32_e32 v14, vcc, v100, v14                       // 000000003AB8: 321C1D64
	v_addc_co_u32_e32 v5, vcc, 0, v15, vcc                     // 000000003ABC: 380A1E80
	s_mov_b64 s[14:15], 0                                      // 000000003AC0: BE8E0180
	v_mov_b32_e32 v15, v24                                     // 000000003AC4: 7E1E0318
	v_add_co_u32_e32 v22, vcc, v10, v14                        // 000000003AC8: 322C1D0A
	v_addc_co_u32_e32 v23, vcc, v11, v5, vcc                   // 000000003ACC: 382E0B0B
	flat_load_dword v17, v[22:23] glc slc                      // 000000003AD0: DC530000 11000016
	v_add_co_u32_e32 v22, vcc, v12, v14                        // 000000003AD8: 322C1D0C
	v_addc_co_u32_e32 v23, vcc, v13, v5, vcc                   // 000000003ADC: 382E0B0D
	v_add_co_u32_e32 v14, vcc, v14, v64                        // 000000003AE0: 321C810E
	v_add_u32_e32 v15, v15, v32                                // 000000003AE4: 681E410F
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000003AE8: 380A0A80
	v_cmp_ge_u32_e32 vcc, v15, v16                             // 000000003AEC: 7D9C210F
	s_or_b64 s[14:15], vcc, s[14:15]                           // 000000003AF0: 878E0E6A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003AF4: BF8C0070
	flat_store_dword v[22:23], v17 glc slc                     // 000000003AF8: DC730000 00001116
	s_andn2_b64 exec, exec, s[14:15]                           // 000000003B00: 89FE0E7E
	s_cbranch_execnz 65520                                     // 000000003B04: BF89FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1398>
	s_or_b64 exec, exec, s[38:39]                              // 000000003B08: 87FE267E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000003B0C: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 000000003B10: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000003B14: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000003B18: 888E0E7E
	s_cbranch_execnz 6                                         // 000000003B1C: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1408>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000003B20: BE8E230E
	s_cbranch_execnz 16                                        // 000000003B24: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1438>
	s_or_b64 exec, exec, s[14:15]                              // 000000003B28: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000003B2C: BE8E2010
	s_cbranch_execnz 20                                        // 000000003B30: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1454>
	s_branch 51                                                // 000000003B34: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x14d4>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000003B38: 7D944031
	s_mov_b64 s[38:39], -1                                     // 000000003B3C: BEA601C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000003B40: BE90206A
	s_cbranch_execz 4                                          // 000000003B44: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1428>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003B48: BF8C0070
	s_barrier                                                  // 000000003B4C: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000003B50: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 000000003B54: 88A6C17E
	s_or_b64 exec, exec, s[16:17]                              // 000000003B58: 87FE107E
	s_and_b64 s[16:17], s[38:39], exec                         // 000000003B5C: 86907E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000003B60: BE8E230E
	s_cbranch_execz 65520                                      // 000000003B64: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x13f8>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000003B68: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 000000003B6C: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 000000003B70: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 000000003B74: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 000000003B78: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000003B7C: BE8E2010
	s_cbranch_execz 32                                         // 000000003B80: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x14d4>
	s_and_b64 exec, exec, s[4:5]                               // 000000003B84: 86FE047E
	s_cbranch_execz 30                                         // 000000003B88: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x14d4>
	ds_read_b64 v[10:11], v130                                 // 000000003B8C: D8EC0000 0A000082
	v_mov_b32_e32 v12, 1                                       // 000000003B94: 7E180281
	v_mov_b32_e32 v13, 0                                       // 000000003B98: 7E1A0280
	s_waitcnt lgkmcnt(0)                                       // 000000003B9C: BF8CC07F
	v_add_co_u32_e32 v10, vcc, v10, v0                         // 000000003BA0: 3214010A
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 000000003BA4: 38161680
	ds_write_b64 v130, v[10:11]                                // 000000003BA8: D89A0000 00000A82
	ds_add_u64 v53, v[12:13] offset:248                        // 000000003BB0: D88000F8 00000C35
	ds_read_b64 v[12:13], v53 offset:248                       // 000000003BB8: D8EC00F8 0C000035
	s_waitcnt lgkmcnt(0)                                       // 000000003BC0: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]                   // 000000003BC4: 7DD2150C
	s_and_saveexec_b64 s[16:17], vcc                           // 000000003BC8: BE90206A
	s_cbranch_execz 11                                         // 000000003BCC: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x14cc>
	s_mov_b64 s[38:39], 0                                      // 000000003BD0: BEA60180
	s_sleep 1                                                  // 000000003BD4: BF8E0001
	ds_read_b64 v[10:11], v53 offset:248                       // 000000003BD8: D8EC00F8 0A000035
	ds_read_b64 v[12:13], v130                                 // 000000003BE0: D8EC0000 0C000082
	s_waitcnt lgkmcnt(0)                                       // 000000003BE8: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]                   // 000000003BEC: 7DDC190A
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000003BF0: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 000000003BF4: 89FE267E
	s_cbranch_execnz 65526                                     // 000000003BF8: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x14a4>
	s_or_b64 exec, exec, s[16:17]                              // 000000003BFC: 87FE107E
	s_wakeup                                                   // 000000003C00: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000003C04: 87FE0E7E
	v_and_b32_e32 v5, 16, v55                                  // 000000003C08: 260A6E90
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000003C0C: 7D9A0A80
	s_and_b64 s[16:17], vcc, s[6:7]                            // 000000003C10: 8690066A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000003C14: BE8E2010
	s_cbranch_execz 1                                          // 000000003C18: BF880001 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x14f0>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003C1C: BF8C0070
	s_or_b64 exec, exec, s[14:15]                              // 000000003C20: 87FE0E7E
	v_and_b32_e32 v5, 16, v55                                  // 000000003C24: 260A6E90
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000003C28: 7D9A0A80
	s_and_saveexec_b64 s[14:15], vcc                           // 000000003C2C: BE8E206A
	s_cbranch_execz 64989                                      // 000000003C30: BF88FDDD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xc78>
	s_and_saveexec_b64 s[16:17], s[10:11]                      // 000000003C34: BE90200A
	s_cbranch_execz 64981                                      // 000000003C38: BF88FDD5 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xc60>
	v_mov_b32_e32 v10, 1                                       // 000000003C3C: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000003C40: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000003C44: BF8CC07F
	flat_store_dwordx2 v[34:35], v[10:11]                      // 000000003C48: DC740000 00000A22
	s_branch 64975                                             // 000000003C50: BF82FDCF <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xc60>
	s_or_b64 exec, exec, s[34:35]                              // 000000003C54: 87FE227E
	s_or_b64 exec, exec, s[30:31]                              // 000000003C58: 87FE1E7E
	v_cmp_gt_i32_e32 vcc, 2, v5                                // 000000003C5C: 7D880A82
	s_and_saveexec_b64 s[16:17], vcc                           // 000000003C60: BE90206A
	s_cbranch_execz 64957                                      // 000000003C64: BF88FDBD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0xc2c>
	s_mov_b64 s[30:31], 0                                      // 000000003C68: BE9E0180
	s_branch 15                                                // 000000003C6C: BF82000F <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x157c>
	s_or_b64 exec, exec, vcc                                   // 000000003C70: 87FE6A7E
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000003C74: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000003C78: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 000000003C7C: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 000000003C80: DC740000 00001C06
	s_or_b64 exec, exec, s[14:15]                              // 000000003C88: 87FE0E7E
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000003C8C: 7D9A0A80
	v_or_b32_e32 v55, 0x800, v55                               // 000000003C90: 286E6EFF 00000800
	v_add_u32_e32 v4, v19, v4                                  // 000000003C98: 68080913
	s_or_b64 s[30:31], vcc, s[30:31]                           // 000000003C9C: 879E1E6A
	v_mov_b32_e32 v5, 1                                        // 000000003CA0: 7E0A0281
	s_andn2_b64 exec, exec, s[30:31]                           // 000000003CA4: 89FE1E7E
	s_cbranch_execz 247                                        // 000000003CA8: BF8800F7 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1958>
	v_and_b32_e32 v10, 8, v55                                  // 000000003CAC: 26146E88
	v_cmp_ne_u32_e32 vcc, 0, v10                               // 000000003CB0: 7D9A1480
	s_mov_b64 s[14:15], -1                                     // 000000003CB4: BE8E01C1
	s_and_saveexec_b64 s[34:35], vcc                           // 000000003CB8: BEA2206A
	s_cbranch_execz 106                                        // 000000003CBC: BF88006A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1738>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003CC0: BF8C0070
	v_add_co_u32_e32 v12, vcc, 8, v36                          // 000000003CC4: 32184888
	v_addc_co_u32_e32 v13, vcc, 0, v37, vcc                    // 000000003CC8: 381A4A80
	v_add_co_u32_e32 v10, vcc, 2, v28                          // 000000003CCC: 32143882
	v_addc_co_u32_e32 v11, vcc, 0, v29, vcc                    // 000000003CD0: 38163A80
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]                   // 000000003CD4: 7DD2150C
	v_mov_b32_e32 v12, 1                                       // 000000003CD8: 7E180281
	s_and_saveexec_b64 s[36:37], vcc                           // 000000003CDC: BEA4206A
	s_cbranch_execz 93                                         // 000000003CE0: BF88005D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1728>
	v_add_u32_e32 v12, 2, v28                                  // 000000003CE4: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 000000003CE8: 221A189F
	s_mov_b64 s[38:39], 0                                      // 000000003CEC: BEA60180
	v_mov_b32_e32 v14, 0                                       // 000000003CF0: 7E1C0280
	s_branch 11                                                // 000000003CF4: BF82000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x15f4>
	s_or_b64 exec, exec, s[40:41]                              // 000000003CF8: 87FE287E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003CFC: BF8C0070
	v_add_co_u32_e32 v16, vcc, 8, v36                          // 000000003D00: 32204888
	v_addc_co_u32_e32 v17, vcc, 0, v37, vcc                    // 000000003D04: 38224A80
	v_cmp_ge_u64_e32 vcc, v[16:17], v[10:11]                   // 000000003D08: 7DDC1510
	s_orn2_b64 s[40:41], vcc, exec                             // 000000003D0C: 8AA87E6A
	s_or_b64 exec, exec, s[14:15]                              // 000000003D10: 87FE0E7E
	s_and_b64 s[14:15], exec, s[40:41]                         // 000000003D14: 868E287E
	s_or_b64 s[38:39], s[14:15], s[38:39]                      // 000000003D18: 87A6260E
	s_andn2_b64 exec, exec, s[38:39]                           // 000000003D1C: 89FE267E
	s_cbranch_execz 75                                         // 000000003D20: BF88004B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1720>
	s_sleep 1                                                  // 000000003D24: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003D28: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 000000003D2C: DC550000 24000006
	v_add_u32_e32 v14, 1, v14                                  // 000000003D34: 681C1C81
	v_and_b32_e32 v15, 64, v55                                 // 000000003D38: 261E6EC0
	v_cmp_eq_u32_e32 vcc, 0, v15                               // 000000003D3C: 7D941E80
	v_cmp_eq_u32_e64 s[14:15], s52, v14                        // 000000003D40: D0CA000E 00021C34
	s_and_b64 vcc, vcc, s[14:15]                               // 000000003D48: 86EA0E6A
	s_and_saveexec_b64 s[14:15], vcc                           // 000000003D4C: BE8E206A
	s_cbranch_execz 13                                         // 000000003D50: BF88000D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1658>
	ds_read_b64 v[14:15], v53 offset:1264                      // 000000003D54: D8EC04F0 0E000035
	s_waitcnt lgkmcnt(0)                                       // 000000003D5C: BF8CC07F
	flat_load_dword v14, v[14:15] glc                          // 000000003D60: DC510000 0E00000E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003D68: BF8C0070
	v_cmp_ne_u32_e32 vcc, 0, v14                               // 000000003D6C: 7D9A1C80
	v_cndmask_b32_e64 v14, 0, 1, vcc                           // 000000003D70: D100000E 01A90280
	v_lshl_or_b32 v55, v14, 6, v55                             // 000000003D78: D2000037 04DD0D0E
	v_and_b32_e32 v15, 64, v55                                 // 000000003D80: 261E6EC0
	v_mov_b32_e32 v14, 0                                       // 000000003D84: 7E1C0280
	s_or_b64 exec, exec, s[14:15]                              // 000000003D88: 87FE0E7E
	v_cmp_eq_u32_e32 vcc, 0, v15                               // 000000003D8C: 7D941E80
	s_mov_b64 s[40:41], -1                                     // 000000003D90: BEA801C1
	s_and_saveexec_b64 s[14:15], vcc                           // 000000003D94: BE8E206A
	s_cbranch_execz 65501                                      // 000000003D98: BF88FFDD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x15e0>
	v_cmp_eq_u32_e32 vcc, 0, v14                               // 000000003D9C: 7D941C80
	s_and_saveexec_b64 s[40:41], vcc                           // 000000003DA0: BEA8206A
	s_cbranch_execz 65492                                      // 000000003DA4: BF88FFD4 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x15c8>
	ds_read_b64 v[16:17], v53 offset:1288                      // 000000003DA8: D8EC0508 10000035
	v_mov_b32_e32 v20, s12                                     // 000000003DB0: 7E28020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003DB4: BF8C0070
	v_add_u32_e32 v22, 8, v36                                  // 000000003DB8: 682C4888
	v_ashrrev_i32_e32 v23, 31, v22                             // 000000003DBC: 222E2C9F
	buffer_wbl2                                                // 000000003DC0: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003DC8: BF8C0070
	flat_atomic_add v15, v[16:17], v146 glc                    // 000000003DCC: DD090000 0F009210
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003DD4: BF8C0070
	buffer_invl2                                               // 000000003DD8: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 000000003DE0: E0FC0000 00000000
	ds_read_b64 v[16:17], v53 offset:1280                      // 000000003DE8: D8EC0500 10000035
	v_and_b32_e32 v15, 0x1fff, v15                             // 000000003DF0: 261E1EFF 00001FFF
	v_lshlrev_b32_e32 v15, 5, v15                              // 000000003DF8: 241E1E85
	s_waitcnt lgkmcnt(0)                                       // 000000003DFC: BF8CC07F
	v_add_co_u32_e32 v16, vcc, v16, v15                        // 000000003E00: 32201F10
	v_addc_co_u32_e32 v17, vcc, 0, v17, vcc                    // 000000003E04: 38222280
	flat_store_byte v[16:17], v20 offset:1                     // 000000003E08: DC600001 00001410
	s_memrealtime vcc                                          // 000000003E10: C0941A80 00000000
	flat_store_short v[16:17], v147 offset:2                   // 000000003E18: DC680002 00009310
	flat_store_dword v[16:17], v24 offset:4                    // 000000003E20: DC700004 00001810
	flat_store_dwordx2 v[16:17], v[12:13] offset:24            // 000000003E28: DC740018 00000C10
	s_waitcnt lgkmcnt(0)                                       // 000000003E30: BF8CC07F
	v_mov_b32_e32 v20, vcc_lo                                  // 000000003E34: 7E28026A
	v_mov_b32_e32 v21, vcc_hi                                  // 000000003E38: 7E2A026B
	flat_store_dwordx4 v[16:17], v[20:23] offset:8             // 000000003E3C: DC7C0008 00001410
	flat_store_byte v[16:17], v148                             // 000000003E44: DC600000 00009410
	s_branch 65450                                             // 000000003E4C: BF82FFAA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x15c8>
	s_or_b64 exec, exec, s[38:39]                              // 000000003E50: 87FE267E
	v_and_b32_e32 v12, 8, v55                                  // 000000003E54: 26186E88
	s_or_b64 exec, exec, s[36:37]                              // 000000003E58: 87FE247E
	v_cmp_eq_u32_e32 vcc, 0, v12                               // 000000003E5C: 7D941880
	s_orn2_b64 s[14:15], vcc, exec                             // 000000003E60: 8A8E7E6A
	s_wakeup                                                   // 000000003E64: BF830000
	s_or_b64 exec, exec, s[34:35]                              // 000000003E68: 87FE227E
	s_xor_b64 vcc, s[14:15], -1                                // 000000003E6C: 88EAC10E
	s_and_saveexec_b64 s[14:15], vcc                           // 000000003E70: BE8E206A
	s_cbranch_execz 44                                         // 000000003E74: BF88002C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x17f8>
	v_and_b32_e32 v10, 0x100, v55                              // 000000003E78: 26146EFF 00000100
	v_cmp_ne_u32_e32 vcc, 0, v10                               // 000000003E80: 7D9A1480
	v_and_b32_e32 v52, 7, v28                                  // 000000003E84: 26683887
	s_and_saveexec_b64 s[34:35], vcc                           // 000000003E88: BEA2206A
	s_cbranch_execz 9                                          // 000000003E8C: BF880009 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1784>
	v_lshlrev_b64 v[10:11], 2, v[52:53]                        // 000000003E90: D28F000A 00026882
	v_add_co_u32_e32 v10, vcc, v8, v10                         // 000000003E98: 32141508
	v_addc_co_u32_e32 v11, vcc, v9, v11, vcc                   // 000000003E9C: 38161709
	buffer_wbl2                                                // 000000003EA0: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003EA8: BF8C0070
	flat_store_dword v[10:11], v53                             // 000000003EAC: DC700000 0000350A
	s_or_b64 exec, exec, s[34:35]                              // 000000003EB4: 87FE227E
	v_and_b32_e32 v10, 0x80, v55                               // 000000003EB8: 26146EFF 00000080
	v_cmp_ne_u32_e32 vcc, 0, v10                               // 000000003EC0: 7D9A1480
	s_and_saveexec_b64 s[34:35], vcc                           // 000000003EC4: BEA2206A
	s_xor_b64 s[34:35], exec, s[34:35]                         // 000000003EC8: 88A2227E
	s_cbranch_execz 10                                         // 000000003ECC: BF88000A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x17c8>
	v_lshlrev_b64 v[10:11], 2, v[52:53]                        // 000000003ED0: D28F000A 00026882
	v_add_co_u32_e32 v10, vcc, v30, v10                        // 000000003ED8: 3214151E
	v_addc_co_u32_e32 v11, vcc, v31, v11, vcc                  // 000000003EDC: 3816171F
	flat_load_dwordx2 v[10:11], v[10:11] glc                   // 000000003EE0: DC550000 0A00000A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003EE8: BF8C0070
	v_ashrrev_i32_e32 v11, 31, v10                             // 000000003EEC: 2216149F
	v_lshrrev_b64 v[10:11], 2, v[10:11]                        // 000000003EF0: D290000A 00021482
	s_andn2_saveexec_b64 vcc, s[34:35]                         // 000000003EF8: BEEA2322
	v_mad_i64_i32 v[10:11], s[34:35], v52, s24, 0              // 000000003EFC: D1E9220A 02003134
	s_or_b64 exec, exec, vcc                                   // 000000003F04: 87FE6A7E
	v_lshlrev_b64 v[10:11], 2, v[10:11]                        // 000000003F08: D28F000A 00021482
	v_add_co_u32_e32 v10, vcc, v38, v10                        // 000000003F10: 32141526
	v_addc_co_u32_e32 v11, vcc, v1, v11, vcc                   // 000000003F14: 38161701
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000003F18: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000003F1C: 383A3A80
	ds_write_b64 v129, v[10:11]                                // 000000003F20: D89A0000 00000A81
	s_or_b64 exec, exec, s[14:15]                              // 000000003F28: 87FE0E7E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000003F2C: 7D82402E
	s_mov_b64 s[34:35], 0                                      // 000000003F30: BEA20180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000003F34: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000003F38: 888E0E7E
	s_cbranch_execnz 6                                         // 000000003F3C: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1828>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000003F40: BE8E230E
	s_cbranch_execnz 16                                        // 000000003F44: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1858>
	s_or_b64 exec, exec, s[14:15]                              // 000000003F48: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[34:35]                      // 000000003F4C: BE8E2022
	s_cbranch_execnz 20                                        // 000000003F50: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1874>
	s_branch 51                                                // 000000003F54: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x18f4>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000003F58: 7D944031
	s_mov_b64 s[36:37], -1                                     // 000000003F5C: BEA401C1
	s_and_saveexec_b64 s[34:35], vcc                           // 000000003F60: BEA2206A
	s_cbranch_execz 4                                          // 000000003F64: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1848>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000003F68: BF8C0070
	s_barrier                                                  // 000000003F6C: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000003F70: BF8CC07F
	s_xor_b64 s[36:37], exec, -1                               // 000000003F74: 88A4C17E
	s_or_b64 exec, exec, s[34:35]                              // 000000003F78: 87FE227E
	s_and_b64 s[34:35], s[36:37], exec                         // 000000003F7C: 86A27E24
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000003F80: BE8E230E
	s_cbranch_execz 65520                                      // 000000003F84: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1818>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000003F88: 7D9A40C0
	s_andn2_b64 s[34:35], s[34:35], exec                       // 000000003F8C: 89A27E22
	s_and_b64 vcc, vcc, exec                                   // 000000003F90: 86EA7E6A
	s_or_b64 s[34:35], s[34:35], vcc                           // 000000003F94: 87A26A22
	s_or_b64 exec, exec, s[14:15]                              // 000000003F98: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[34:35]                      // 000000003F9C: BE8E2022
	s_cbranch_execz 32                                         // 000000003FA0: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x18f4>
	s_and_b64 exec, exec, s[4:5]                               // 000000003FA4: 86FE047E
	s_cbranch_execz 30                                         // 000000003FA8: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x18f4>
	ds_read_b64 v[10:11], v130                                 // 000000003FAC: D8EC0000 0A000082
	v_mov_b32_e32 v12, 1                                       // 000000003FB4: 7E180281
	v_mov_b32_e32 v13, 0                                       // 000000003FB8: 7E1A0280
	s_waitcnt lgkmcnt(0)                                       // 000000003FBC: BF8CC07F
	v_add_co_u32_e32 v10, vcc, v10, v0                         // 000000003FC0: 3214010A
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 000000003FC4: 38161680
	ds_write_b64 v130, v[10:11]                                // 000000003FC8: D89A0000 00000A82
	ds_add_u64 v53, v[12:13] offset:248                        // 000000003FD0: D88000F8 00000C35
	ds_read_b64 v[12:13], v53 offset:248                       // 000000003FD8: D8EC00F8 0C000035
	s_waitcnt lgkmcnt(0)                                       // 000000003FE0: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]                   // 000000003FE4: 7DD2150C
	s_and_saveexec_b64 s[34:35], vcc                           // 000000003FE8: BEA2206A
	s_cbranch_execz 11                                         // 000000003FEC: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x18ec>
	s_mov_b64 s[36:37], 0                                      // 000000003FF0: BEA40180
	s_sleep 1                                                  // 000000003FF4: BF8E0001
	ds_read_b64 v[10:11], v53 offset:248                       // 000000003FF8: D8EC00F8 0A000035
	ds_read_b64 v[12:13], v130                                 // 000000004000: D8EC0000 0C000082
	s_waitcnt lgkmcnt(0)                                       // 000000004008: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]                   // 00000000400C: 7DDC190A
	s_or_b64 s[36:37], vcc, s[36:37]                           // 000000004010: 87A4246A
	s_andn2_b64 exec, exec, s[36:37]                           // 000000004014: 89FE247E
	s_cbranch_execnz 65526                                     // 000000004018: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x18c4>
	s_or_b64 exec, exec, s[34:35]                              // 00000000401C: 87FE227E
	s_wakeup                                                   // 000000004020: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000004024: 87FE0E7E
	v_sub_u32_e32 v10, v18, v4                                 // 000000004028: 6A140912
	v_min_i32_e32 v19, v19, v10                                // 00000000402C: 18261513
	v_and_b32_e32 v10, 16, v55                                 // 000000004030: 26146E90
	v_cmp_ne_u32_e32 vcc, 0, v10                               // 000000004034: 7D9A1480
	v_cmp_lt_i32_e64 s[14:15], 0, v19                          // 000000004038: D0C1000E 00022680
	s_and_b64 s[14:15], vcc, s[14:15]                          // 000000004040: 868E0E6A
	s_and_b64 vcc, s[14:15], s[6:7]                            // 000000004044: 86EA060E
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004048: BE8E206A
	s_cbranch_execz 1                                          // 00000000404C: BF880001 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1924>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004050: BF8C0070
	s_or_b64 exec, exec, s[14:15]                              // 000000004054: 87FE0E7E
	v_and_b32_e32 v10, 16, v55                                 // 000000004058: 26146E90
	v_cmp_ne_u32_e32 vcc, 0, v10                               // 00000000405C: 7D9A1480
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004060: BE8E206A
	s_cbranch_execz 65288                                      // 000000004064: BF88FF08 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1558>
	s_and_saveexec_b64 vcc, s[10:11]                           // 000000004068: BEEA200A
	s_cbranch_execz 65280                                      // 00000000406C: BF88FF00 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1540>
	v_mov_b32_e32 v10, 1                                       // 000000004070: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000004074: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000004078: BF8CC07F
	flat_store_dwordx2 v[34:35], v[10:11]                      // 00000000407C: DC740000 00000A22
	s_branch 65274                                             // 000000004084: BF82FEFA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1540>
	s_or_b64 exec, exec, s[30:31]                              // 000000004088: 87FE1E7E
	s_or_b64 exec, exec, s[16:17]                              // 00000000408C: 87FE107E
	s_andn2_b64 vcc, exec, s[26:27]                            // 000000004090: 89EA1A7E
	s_cbranch_vccnz 991                                        // 000000004094: BF8703DF <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x28e4>
	s_mov_b32 s53, 2                                           // 000000004098: BEB50082
	s_branch 5                                                 // 00000000409C: BF820005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1984>
	s_or_b64 exec, exec, s[34:35]                              // 0000000040A0: 87FE227E
	s_or_b64 exec, exec, s[30:31]                              // 0000000040A4: 87FE1E7E
	s_add_i32 s53, s53, 1                                      // 0000000040A8: 81358135
	s_cmp_eq_u32 s53, s25                                      // 0000000040AC: BF061935
	s_cbranch_scc1 984                                         // 0000000040B0: BF8503D8 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x28e4>
	s_sub_i32 s14, s47, s53                                    // 0000000040B4: 818E352F
	s_cmp_le_i32 s25, s14                                      // 0000000040B8: BF050E19
	s_cselect_b32 s15, s25, 0                                  // 0000000040BC: 850F8019
	s_sub_i32 s14, s14, s15                                    // 0000000040C0: 818E0F0E
	s_ashr_i32 s15, s14, 31                                    // 0000000040C4: 900F9F0E
	v_mov_b32_e32 v4, s15                                      // 0000000040C8: 7E08020F
	v_add_co_u32_e32 v5, vcc, s14, v54                         // 0000000040CC: 320A6C0E
	v_addc_co_u32_e32 v4, vcc, v4, v49, vcc                    // 0000000040D0: 38086304
	v_mul_lo_u32 v10, v5, v113                                 // 0000000040D4: D285000A 0002E305
	v_mul_lo_u32 v11, v4, v112                                 // 0000000040DC: D285000B 0002E104
	v_mad_u64_u32 v[4:5], s[14:15], v5, v112, v[102:103]       // 0000000040E4: D1E80E04 059AE105
	v_add3_u32 v5, v11, v5, v10                                // 0000000040EC: D1FF0005 042A0B0B
	v_sub_co_u32_e32 v10, vcc, v26, v4                         // 0000000040F4: 3414091A
	v_subb_co_u32_e32 v11, vcc, v27, v5, vcc                   // 0000000040F8: 3A160B1B
	v_cmp_lt_i64_e32 vcc, v[112:113], v[10:11]                 // 0000000040FC: 7DC21570
	v_cndmask_b32_e32 v10, v10, v112, vcc                      // 000000004100: 0014E10A
	v_max_i32_e32 v114, 0, v10                                 // 000000004104: 1AE41480
	v_add_u32_e32 v11, 31, v114                                // 000000004108: 6816E49F
	v_ashrrev_i32_e32 v12, 31, v11                             // 00000000410C: 2218169F
	v_lshrrev_b32_e32 v12, 27, v12                             // 000000004110: 2018189B
	v_add_u32_e32 v11, v11, v12                                // 000000004114: 6816190B
	v_ashrrev_i32_e32 v11, 5, v11                              // 000000004118: 22161685
	v_lshlrev_b32_e32 v11, 4, v11                              // 00000000411C: 24161684
	v_cmp_lt_i32_e32 vcc, 0, v10                               // 000000004120: 7D821480
	v_max_i32_e32 v115, s48, v11                               // 000000004124: 1AE61630
	s_and_b64 s[14:15], s[28:29], vcc                          // 000000004128: 868E6A1C
	v_mov_b32_e32 v16, 0                                       // 00000000412C: 7E200280
	v_mov_b32_e32 v14, 0                                       // 000000004130: 7E1C0280
	s_and_saveexec_b64 s[30:31], s[14:15]                      // 000000004134: BE9E200E
	s_cbranch_execnz 5                                         // 000000004138: BF890005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1a20>
	s_or_b64 exec, exec, s[30:31]                              // 00000000413C: 87FE1E7E
	v_cmp_gt_i32_e32 vcc, 2, v14                               // 000000004140: 7D881C82
	s_and_saveexec_b64 s[30:31], vcc                           // 000000004144: BE9E206A
	s_cbranch_execz 65494                                      // 000000004148: BF88FFD6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1974>
	s_branch 652                                               // 00000000414C: BF82028C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2450>
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 000000004150: D28F0004 00020882
	v_add_co_u32_e32 v116, vcc, v38, v4                        // 000000004158: 32E80926
	v_addc_co_u32_e32 v117, vcc, v1, v5, vcc                   // 00000000415C: 38EA0B01
	s_mov_b32 s54, 1                                           // 000000004160: BEB60081
	s_mov_b64 s[36:37], -1                                     // 000000004164: BEA401C1
	s_mov_b64 s[34:35], 0                                      // 000000004168: BEA20180
	v_mov_b32_e32 v16, 0                                       // 00000000416C: 7E200280
	s_branch 14                                                // 000000004170: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1a7c>
	s_or_b64 exec, exec, s[14:15]                              // 000000004174: 87FE0E7E
	v_add_u32_e32 v16, v115, v16                               // 000000004178: 68202173
	v_cmp_ge_i32_e32 vcc, v16, v114                            // 00000000417C: 7D8CE510
	s_xor_b64 s[14:15], s[36:37], -1                           // 000000004180: 888EC124
	s_or_b64 s[14:15], s[14:15], vcc                           // 000000004184: 878E6A0E
	s_and_b64 s[14:15], exec, s[14:15]                         // 000000004188: 868E0E7E
	v_or_b32_e32 v55, 0x800, v55                               // 00000000418C: 286E6EFF 00000800
	s_or_b64 s[34:35], s[14:15], s[34:35]                      // 000000004194: 87A2220E
	s_mov_b64 s[36:37], 0                                      // 000000004198: BEA40180
	v_mov_b32_e32 v14, s54                                     // 00000000419C: 7E1C0236
	s_mov_b32 s54, 2                                           // 0000000041A0: BEB60082
	s_andn2_b64 exec, exec, s[34:35]                           // 0000000041A4: 89FE227E
	s_cbranch_execz 624                                        // 0000000041A8: BF880270 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x243c>
	v_and_b32_e32 v4, 1, v55                                   // 0000000041AC: 26086E81
	v_cmp_eq_u32_e32 vcc, 1, v4                                // 0000000041B0: 7D940881
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000041B4: BE8E206A
	s_cbranch_execz 7                                          // 0000000041B8: BF880007 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1aa8>
	v_ashrrev_i32_e32 v17, 31, v16                             // 0000000041BC: 2222209F
	v_lshlrev_b64 v[4:5], 2, v[16:17]                          // 0000000041C0: D28F0004 00022082
	v_add_co_u32_e32 v4, vcc, v116, v4                         // 0000000041C8: 32080974
	v_addc_co_u32_e32 v5, vcc, v117, v5, vcc                   // 0000000041CC: 380A0B75
	ds_write_b64 v53, v[4:5] offset:112                        // 0000000041D0: D89A0070 00000435
	s_or_b64 exec, exec, s[14:15]                              // 0000000041D8: 87FE0E7E
	v_and_b32_e32 v4, 8, v55                                   // 0000000041DC: 26086E88
	v_and_b32_e32 v5, 12, v55                                  // 0000000041E0: 260A6E8C
	v_cmp_eq_u32_e32 vcc, 0, v4                                // 0000000041E4: 7D940880
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 0000000041E8: D0CD000E 00020A80
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 0000000041F0: BEA6200E
	s_cbranch_execz 116                                        // 0000000041F4: BF880074 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1c98>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000041F8: BF8C0070
	v_add_co_u32_e64 v12, s[14:15], v36, v4                    // 0000000041FC: D1190E0C 00020924
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]          // 000000004204: D11C0E0D 003A4A80
	v_add_co_u32_e64 v10, s[14:15], 2, v28                     // 00000000420C: D1190E0A 00023882
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]          // 000000004214: D11C0E0B 003A3A80
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]              // 00000000421C: D0E9000E 0002150C
	s_and_saveexec_b64 s[40:41], s[14:15]                      // 000000004224: BEA8200E
	s_cbranch_execz 101                                        // 000000004228: BF880065 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1c90>
	v_add_u32_e32 v12, 2, v28                                  // 00000000422C: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 000000004230: 221A189F
	s_mov_b64 s[42:43], 0                                      // 000000004234: BEAA0180
	v_mov_b32_e32 v5, 0                                        // 000000004238: 7E0A0280
	s_branch 14                                                // 00000000423C: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1b48>
	s_or_b64 exec, exec, s[44:45]                              // 000000004240: 87FE2C7E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004244: BF8C0070
	v_add_co_u32_e64 v14, s[14:15], v36, v4                    // 000000004248: D1190E0E 00020924
	v_addc_co_u32_e64 v15, s[14:15], 0, v37, s[14:15]          // 000000004250: D11C0E0F 003A4A80
	v_cmp_ge_u64_e64 s[14:15], v[14:15], v[10:11]              // 000000004258: D0EE000E 0002150E
	s_orn2_b64 s[44:45], s[14:15], exec                        // 000000004260: 8AAC7E0E
	s_or_b64 exec, exec, s[16:17]                              // 000000004264: 87FE107E
	s_and_b64 s[14:15], exec, s[44:45]                         // 000000004268: 868E2C7E
	s_or_b64 s[42:43], s[14:15], s[42:43]                      // 00000000426C: 87AA2A0E
	s_andn2_b64 exec, exec, s[42:43]                           // 000000004270: 89FE2A7E
	s_cbranch_execz 81                                         // 000000004274: BF880051 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1c8c>
	s_sleep 1                                                  // 000000004278: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000427C: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 000000004280: DC550000 24000006
	v_add_u32_e32 v5, 1, v5                                    // 000000004288: 680A0A81
	v_and_b32_e32 v14, 64, v55                                 // 00000000428C: 261C6EC0
	v_cmp_eq_u32_e64 s[14:15], 0, v14                          // 000000004290: D0CA000E 00021C80
	v_cmp_eq_u32_e64 s[16:17], s52, v5                         // 000000004298: D0CA0010 00020A34
	s_and_b64 s[14:15], s[14:15], s[16:17]                     // 0000000042A0: 868E100E
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 0000000042A4: BE90200E
	s_cbranch_execz 14                                         // 0000000042A8: BF88000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1bb4>
	ds_read_b64 v[14:15], v53 offset:1264                      // 0000000042AC: D8EC04F0 0E000035
	s_waitcnt lgkmcnt(0)                                       // 0000000042B4: BF8CC07F
	flat_load_dword v5, v[14:15] glc                           // 0000000042B8: DC510000 0500000E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000042C0: BF8C0070
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 0000000042C4: D0CD000E 00020A80
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]                       // 0000000042CC: D1000005 00390280
	v_lshl_or_b32 v55, v5, 6, v55                              // 0000000042D4: D2000037 04DD0D05
	v_and_b32_e32 v14, 64, v55                                 // 0000000042DC: 261C6EC0
	v_mov_b32_e32 v5, 0                                        // 0000000042E0: 7E0A0280
	s_or_b64 exec, exec, s[16:17]                              // 0000000042E4: 87FE107E
	v_cmp_eq_u32_e64 s[14:15], 0, v14                          // 0000000042E8: D0CA000E 00021C80
	s_mov_b64 s[44:45], -1                                     // 0000000042F0: BEAC01C1
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 0000000042F4: BE90200E
	s_cbranch_execz 65498                                      // 0000000042F8: BF88FFDA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1b34>
	v_cmp_eq_u32_e64 s[14:15], 0, v5                           // 0000000042FC: D0CA000E 00020A80
	s_and_saveexec_b64 s[44:45], s[14:15]                      // 000000004304: BEAC200E
	s_cbranch_execz 65485                                      // 000000004308: BF88FFCD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1b10>
	ds_read_b64 v[14:15], v53 offset:1288                      // 00000000430C: D8EC0508 0E000035
	v_mov_b32_e32 v18, s12                                     // 000000004314: 7E24020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004318: BF8C0070
	v_add_u32_e32 v20, v4, v36                                 // 00000000431C: 68284904
	v_ashrrev_i32_e32 v21, 31, v20                             // 000000004320: 222A289F
	buffer_wbl2                                                // 000000004324: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000432C: BF8C0070
	flat_atomic_add v17, v[14:15], v146 glc                    // 000000004330: DD090000 1100920E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004338: BF8C0070
	buffer_invl2                                               // 00000000433C: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 000000004344: E0FC0000 00000000
	ds_read_b64 v[14:15], v53 offset:1280                      // 00000000434C: D8EC0500 0E000035
	v_and_b32_e32 v17, 0x1fff, v17                             // 000000004354: 262222FF 00001FFF
	v_lshlrev_b32_e32 v17, 5, v17                              // 00000000435C: 24222285
	s_waitcnt lgkmcnt(0)                                       // 000000004360: BF8CC07F
	v_add_co_u32_e64 v14, s[14:15], v14, v17                   // 000000004364: D1190E0E 0002230E
	v_addc_co_u32_e64 v15, s[14:15], 0, v15, s[14:15]          // 00000000436C: D11C0E0F 003A1E80
	flat_store_byte v[14:15], v18 offset:1                     // 000000004374: DC600001 0000120E
	s_memrealtime s[14:15]                                     // 00000000437C: C0940380 00000000
	flat_store_short v[14:15], v147 offset:2                   // 000000004384: DC680002 0000930E
	flat_store_dword v[14:15], v24 offset:4                    // 00000000438C: DC700004 0000180E
	flat_store_dwordx2 v[14:15], v[12:13] offset:24            // 000000004394: DC740018 00000C0E
	s_waitcnt lgkmcnt(0)                                       // 00000000439C: BF8CC07F
	v_mov_b32_e32 v18, s14                                     // 0000000043A0: 7E24020E
	v_mov_b32_e32 v19, s15                                     // 0000000043A4: 7E26020F
	flat_store_dwordx4 v[14:15], v[18:21] offset:8             // 0000000043A8: DC7C0008 0000120E
	flat_store_byte v[14:15], v148                             // 0000000043B0: DC600000 0000940E
	s_branch 65441                                             // 0000000043B8: BF82FFA1 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1b10>
	s_or_b64 exec, exec, s[42:43]                              // 0000000043BC: 87FE2A7E
	s_or_b64 exec, exec, s[40:41]                              // 0000000043C0: 87FE287E
	s_wakeup                                                   // 0000000043C4: BF830000
	s_or_b64 exec, exec, s[38:39]                              // 0000000043C8: 87FE267E
	v_sub_u32_e32 v4, v114, v16                                // 0000000043CC: 6A082172
	v_min_i32_e32 v115, v115, v4                               // 0000000043D0: 18E60973
	v_and_b32_e32 v4, 12, v55                                  // 0000000043D4: 26086E8C
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 0000000043D8: D0CD000E 00020880
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 0000000043E0: BE90200E
	s_cbranch_execz 65                                         // 0000000043E4: BF880041 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1dbc>
	v_and_b32_e32 v4, 0x100, v55                               // 0000000043E8: 26086EFF 00000100
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 0000000043F0: D0CD000E 00020880
	s_xor_b64 s[38:39], vcc, -1                                // 0000000043F8: 88A6C16A
	s_and_b64 s[14:15], s[38:39], s[14:15]                     // 0000000043FC: 868E0E26
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 000000004400: BEA6200E
	s_xor_b64 s[38:39], exec, s[38:39]                         // 000000004404: 88A6267E
	s_cbranch_execz 13                                         // 000000004408: BF88000D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1d10>
	v_and_b32_e32 v52, 7, v28                                  // 00000000440C: 26683887
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000004410: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v8, v4                      // 000000004418: D1190E04 00020908
	v_lshlrev_b32_e32 v10, 2, v115                             // 000000004420: 2414E682
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]           // 000000004424: D11C0E05 003A0B09
	buffer_wbl2                                                // 00000000442C: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004434: BF8C0070
	flat_store_dword v[4:5], v10                               // 000000004438: DC700000 00000A04
	s_andn2_saveexec_b64 s[14:15], s[38:39]                    // 000000004440: BE8E2326
	v_and_b32_e32 v52, 7, v28                                  // 000000004444: 26683887
	s_or_b64 exec, exec, s[14:15]                              // 000000004448: 87FE0E7E
	v_and_b32_e32 v4, 0x80, v55                                // 00000000444C: 26086EFF 00000080
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000004454: D0CD000E 00020880
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 00000000445C: BEA6200E
	s_xor_b64 s[38:39], exec, s[38:39]                         // 000000004460: 88A6267E
	s_cbranch_execz 12                                         // 000000004464: BF88000C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1d68>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000004468: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v30, v4                     // 000000004470: D1190E04 0002091E
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]          // 000000004478: D11C0E05 003A0B1F
	flat_load_dwordx2 v[4:5], v[4:5] glc                       // 000000004480: DC550000 04000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004488: BF8C0070
	v_ashrrev_i32_e32 v5, 31, v4                               // 00000000448C: 220A089F
	v_lshrrev_b64 v[4:5], 2, v[4:5]                            // 000000004490: D2900004 00020882
	s_andn2_saveexec_b64 s[14:15], s[38:39]                    // 000000004498: BE8E2326
	v_mul_lo_u32 v10, v53, s24                                 // 00000000449C: D285000A 00003135
	v_mul_lo_u32 v11, v52, s13                                 // 0000000044A4: D285000B 00001B34
	v_mad_u64_u32 v[4:5], s[38:39], v52, s24, 0                // 0000000044AC: D1E82604 02003134
	v_add3_u32 v5, v5, v11, v10                                // 0000000044B4: D1FF0005 042A1705
	s_or_b64 exec, exec, s[14:15]                              // 0000000044BC: 87FE0E7E
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 0000000044C0: D28F0004 00020882
	v_cndmask_b32_e32 v10, v149, v150, vcc                     // 0000000044C8: 00152D95
	v_add_co_u32_e32 v4, vcc, v38, v4                          // 0000000044CC: 32080926
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc                     // 0000000044D0: 380A0B01
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 0000000044D4: 32383882
	v_lshl_add_u32 v10, v3, 3, v10                             // 0000000044D8: D1FD000A 04290703
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 0000000044E0: 383A3A80
	ds_write_b64 v10, v[4:5]                                   // 0000000044E4: D89A0000 0000040A
	s_or_b64 exec, exec, s[16:17]                              // 0000000044EC: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 0000000044F0: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 0000000044F4: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000044F8: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 0000000044FC: 888E0E7E
	s_cbranch_execnz 6                                         // 000000004500: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1dec>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000004504: BE8E230E
	s_cbranch_execnz 16                                        // 000000004508: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1e1c>
	s_or_b64 exec, exec, s[14:15]                              // 00000000450C: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004510: BE8E2010
	s_cbranch_execnz 20                                        // 000000004514: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1e38>
	s_branch 51                                                // 000000004518: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1eb8>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 00000000451C: 7D944031
	s_mov_b64 s[38:39], -1                                     // 000000004520: BEA601C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000004524: BE90206A
	s_cbranch_execz 4                                          // 000000004528: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1e0c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000452C: BF8C0070
	s_barrier                                                  // 000000004530: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000004534: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 000000004538: 88A6C17E
	s_or_b64 exec, exec, s[16:17]                              // 00000000453C: 87FE107E
	s_and_b64 s[16:17], s[38:39], exec                         // 000000004540: 86907E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000004544: BE8E230E
	s_cbranch_execz 65520                                      // 000000004548: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1ddc>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 00000000454C: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 000000004550: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 000000004554: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 000000004558: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 00000000455C: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004560: BE8E2010
	s_cbranch_execz 32                                         // 000000004564: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1eb8>
	s_and_b64 exec, exec, s[4:5]                               // 000000004568: 86FE047E
	s_cbranch_execz 30                                         // 00000000456C: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1eb8>
	ds_read_b64 v[4:5], v130                                   // 000000004570: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 000000004578: 7E140281
	v_mov_b32_e32 v11, 0                                       // 00000000457C: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000004580: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000004584: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000004588: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 00000000458C: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 000000004594: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 00000000459C: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 0000000045A4: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 0000000045A8: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 0000000045AC: BE90206A
	s_cbranch_execz 11                                         // 0000000045B0: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1eb0>
	s_mov_b64 s[38:39], 0                                      // 0000000045B4: BEA60180
	s_sleep 1                                                  // 0000000045B8: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 0000000045BC: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 0000000045C4: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 0000000045CC: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 0000000045D0: 7DDC1504
	s_or_b64 s[38:39], vcc, s[38:39]                           // 0000000045D4: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 0000000045D8: 89FE267E
	s_cbranch_execnz 65526                                     // 0000000045DC: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1e88>
	s_or_b64 exec, exec, s[16:17]                              // 0000000045E0: 87FE107E
	s_wakeup                                                   // 0000000045E4: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 0000000045E8: 87FE0E7E
	v_cmp_lt_i32_e32 vcc, 0, v115                              // 0000000045EC: 7D82E680
	s_and_saveexec_b64 s[16:17], vcc                           // 0000000045F0: BE90206A
	s_cbranch_execz 256                                        // 0000000045F4: BF880100 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x22c8>
	ds_read_b128 v[10:13], v53 offset:112                      // 0000000045F8: D9FE0070 0A000035
	ds_read_b64 v[18:19], v53 offset:176                       // 000000004600: D8EC00B0 12000035
	v_mov_b32_e32 v21, 0                                       // 000000004608: 7E2A0280
	s_mov_b64 s[38:39], -1                                     // 00000000460C: BEA601C1
	v_mov_b32_e32 v17, v115                                    // 000000004610: 7E220373
	s_waitcnt lgkmcnt(0)                                       // 000000004614: BF8CC07F
	v_or_b32_e32 v4, v12, v10                                  // 000000004618: 2808150C
	v_or_b32_e32 v4, v4, v18                                   // 00000000461C: 28082504
	v_and_b32_e32 v20, 3, v4                                   // 000000004620: 26280883
	v_cmp_ne_u64_e32 vcc, 0, v[20:21]                          // 000000004624: 7DDA2880
	s_cbranch_vccz 3                                           // 000000004628: BF860003 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1f08>
	s_and_b64 exec, exec, s[38:39]                             // 00000000462C: 86FE267E
	s_cbranch_execnz 124                                       // 000000004630: BF89007C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x20f4>
	s_branch 240                                               // 000000004634: BF8200F0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x22c8>
	v_lshrrev_b32_e32 v4, 2, v115                              // 000000004638: 2008E682
	v_and_b32_e32 v17, 0x3fffff80, v4                          // 00000000463C: 262208FF 3FFFFF80
	v_cmp_lt_u32_e32 vcc, v68, v17                             // 000000004644: 7D922344
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004648: BE8E206A
	s_cbranch_execz 46                                         // 00000000464C: BF88002E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1fd8>
	v_lshlrev_b64 v[14:15], 4, v[68:69]                        // 000000004650: D28F000E 00028884
	v_add_co_u32_e32 v4, vcc, v10, v14                         // 000000004658: 32081D0A
	v_addc_co_u32_e32 v5, vcc, v11, v15, vcc                   // 00000000465C: 380A1F0B
	v_add_co_u32_e32 v14, vcc, v12, v14                        // 000000004660: 321C1D0C
	v_addc_co_u32_e32 v15, vcc, v13, v15, vcc                  // 000000004664: 381E1F0D
	v_lshlrev_b64 v[20:21], 2, v[82:83]                        // 000000004668: D28F0014 0002A482
	v_add_co_u32_e32 v20, vcc, v18, v20                        // 000000004670: 32282912
	v_addc_co_u32_e32 v21, vcc, v19, v21, vcc                  // 000000004674: 382A2B13
	s_mov_b64 s[38:39], 0                                      // 000000004678: BEA60180
	v_mov_b32_e32 v22, v68                                     // 00000000467C: 7E2C0344
	flat_load_dwordx4 v[160:163], v[14:15] glc slc             // 000000004680: DC5F0000 A000000E
	flat_load_dwordx4 v[164:167], v[4:5] glc slc               // 000000004688: DC5F0000 A4000004
	flat_load_dwordx4 v[176:179], v[4:5] offset:1024 glc slc   // 000000004690: DC5F0400 B0000004
	flat_load_dwordx4 v[180:183], v[14:15] offset:1024 glc slc // 000000004698: DC5F0400 B400000E
	v_lshlrev_b64 v[192:193], 4, v[50:51]                      // 0000000046A0: D28F00C0 00026484
	v_add_co_u32_e32 v4, vcc, v4, v192                         // 0000000046A8: 32098104
	v_addc_co_u32_e32 v5, vcc, v5, v193, vcc                   // 0000000046AC: 380B8305
	v_add_co_u32_e32 v14, vcc, v14, v192                       // 0000000046B0: 321D810E
	v_add_u32_e32 v22, v22, v50                                // 0000000046B4: 682C6516
	v_addc_co_u32_e32 v15, vcc, v15, v193, vcc                 // 0000000046B8: 381F830F
	v_cmp_ge_u32_e32 vcc, v22, v17                             // 0000000046BC: 7D9C2316
	s_or_b64 s[38:39], vcc, s[38:39]                           // 0000000046C0: 87A6266A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000046C4: BF8C0070
	v_add_f32_e32 v160, v164, v160                             // 0000000046C8: 034141A4
	v_add_f32_e32 v161, v165, v161                             // 0000000046CC: 034343A5
	v_add_f32_e32 v162, v166, v162                             // 0000000046D0: 034545A6
	v_add_f32_e32 v163, v167, v163                             // 0000000046D4: 034747A7
	v_add_f32_e32 v164, v176, v180                             // 0000000046D8: 034969B0
	v_add_f32_e32 v165, v177, v181                             // 0000000046DC: 034B6BB1
	v_add_f32_e32 v166, v178, v182                             // 0000000046E0: 034D6DB2
	v_add_f32_e32 v167, v179, v183                             // 0000000046E4: 034F6FB3
	flat_store_dwordx4 v[20:21], v[160:163] glc slc            // 0000000046E8: DC7F0000 0000A014
	flat_store_dwordx4 v[20:21], v[164:167] offset:1024 glc slc// 0000000046F0: DC7F0400 0000A414
	v_add_co_u32_e32 v20, vcc, v20, v80                        // 0000000046F8: 3228A114
	v_addc_co_u32_e32 v21, vcc, v21, v81, vcc                  // 0000000046FC: 382AA315
	s_andn2_b64 exec, exec, s[38:39]                           // 000000004700: 89FE267E
	s_cbranch_execnz 65502                                     // 000000004704: BF89FFDE <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1f50>
	s_or_b64 exec, exec, s[14:15]                              // 000000004708: 87FE0E7E
	v_lshlrev_b32_e32 v52, 2, v17                              // 00000000470C: 24682282
	v_cmp_ne_u32_e32 vcc, v115, v52                            // 000000004710: 7D9A6973
	s_mov_b64 s[38:39], 0                                      // 000000004714: BEA60180
	v_mov_b32_e32 v17, 0                                       // 000000004718: 7E220280
	v_mov_b32_e32 v21, 0                                       // 00000000471C: 7E2A0280
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004720: BE8E206A
	s_cbranch_execz 60                                         // 000000004724: BF88003C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x20e8>
	v_sub_u32_e32 v22, v115, v52                               // 000000004728: 6A2C6973
	v_ashrrev_i32_e32 v17, 2, v22                              // 00000000472C: 22222C82
	v_cmp_lt_i32_e32 vcc, v24, v17                             // 000000004730: 7D822318
	s_and_saveexec_b64 s[38:39], vcc                           // 000000004734: BEA6206A
	s_cbranch_execz 42                                         // 000000004738: BF88002A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x20b4>
	v_lshlrev_b64 v[20:21], 2, v[52:53]                        // 00000000473C: D28F0014 00026882
	v_add_co_u32_e32 v4, vcc, v10, v20                         // 000000004744: 3208290A
	v_addc_co_u32_e32 v5, vcc, v11, v21, vcc                   // 000000004748: 380A2B0B
	v_lshlrev_b64 v[160:161], 4, v[24:25]                      // 00000000474C: D28F00A0 00023084
	v_add_co_u32_e32 v4, vcc, v4, v160                         // 000000004754: 32094104
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc                   // 000000004758: 380B4305
	v_add_co_u32_e32 v14, vcc, v12, v20                        // 00000000475C: 321C290C
	v_addc_co_u32_e32 v15, vcc, v13, v21, vcc                  // 000000004760: 381E2B0D
	v_add_co_u32_e32 v14, vcc, v14, v160                       // 000000004764: 321D410E
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc                 // 000000004768: 381F430F
	v_add_co_u32_e32 v20, vcc, v18, v20                        // 00000000476C: 32282912
	v_addc_co_u32_e32 v21, vcc, v19, v21, vcc                  // 000000004770: 382A2B13
	v_add_co_u32_e32 v20, vcc, v20, v160                       // 000000004774: 32294114
	v_addc_co_u32_e32 v21, vcc, v21, v161, vcc                 // 000000004778: 382B4315
	s_mov_b64 s[40:41], 0                                      // 00000000477C: BEA80180
	v_mov_b32_e32 v23, v24                                     // 000000004780: 7E2E0318
	flat_load_dwordx4 v[160:163], v[4:5] glc slc               // 000000004784: DC5F0000 A0000004
	flat_load_dwordx4 v[164:167], v[14:15] glc slc             // 00000000478C: DC5F0000 A400000E
	v_lshlrev_b64 v[176:177], 4, v[32:33]                      // 000000004794: D28F00B0 00024084
	v_add_co_u32_e32 v4, vcc, v4, v176                         // 00000000479C: 32096104
	v_addc_co_u32_e32 v5, vcc, v5, v177, vcc                   // 0000000047A0: 380B6305
	v_add_co_u32_e32 v14, vcc, v14, v176                       // 0000000047A4: 321D610E
	v_add_u32_e32 v23, v23, v32                                // 0000000047A8: 682E4117
	v_addc_co_u32_e32 v15, vcc, v15, v177, vcc                 // 0000000047AC: 381F630F
	v_cmp_ge_i32_e32 vcc, v23, v17                             // 0000000047B0: 7D8C2317
	s_or_b64 s[40:41], vcc, s[40:41]                           // 0000000047B4: 87A8286A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000047B8: BF8C0070
	v_add_f32_e32 v160, v160, v164                             // 0000000047BC: 034149A0
	v_add_f32_e32 v161, v161, v165                             // 0000000047C0: 03434BA1
	v_add_f32_e32 v162, v162, v166                             // 0000000047C4: 03454DA2
	v_add_f32_e32 v163, v163, v167                             // 0000000047C8: 03474FA3
	flat_store_dwordx4 v[20:21], v[160:163] glc slc            // 0000000047CC: DC7F0000 0000A014
	v_add_co_u32_e32 v20, vcc, v20, v176                       // 0000000047D4: 32296114
	v_addc_co_u32_e32 v21, vcc, v21, v177, vcc                 // 0000000047D8: 382B6315
	s_andn2_b64 exec, exec, s[40:41]                           // 0000000047DC: 89FE287E
	s_cbranch_execnz 65512                                     // 0000000047E0: BF89FFE8 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2054>
	s_or_b64 exec, exec, s[38:39]                              // 0000000047E4: 87FE267E
	v_and_b32_e32 v4, 3, v22                                   // 0000000047E8: 26082C83
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 0000000047EC: 7D9A0880
	s_mov_b64 s[38:39], 0                                      // 0000000047F0: BEA60180
	v_mov_b32_e32 v17, 0                                       // 0000000047F4: 7E220280
	s_and_saveexec_b64 s[40:41], vcc                           // 0000000047F8: BEA8206A
	v_and_b32_e32 v5, -4, v22                                  // 0000000047FC: 260A2CC4
	s_mov_b64 s[38:39], exec                                   // 000000004800: BEA6017E
	v_add_u32_e32 v52, v5, v52                                 // 000000004804: 68686905
	v_mov_b32_e32 v17, v4                                      // 000000004808: 7E220304
	s_or_b64 exec, exec, s[40:41]                              // 00000000480C: 87FE287E
	s_and_b64 s[38:39], s[38:39], exec                         // 000000004810: 86A67E26
	v_mov_b32_e32 v21, v52                                     // 000000004814: 7E2A0334
	s_or_b64 exec, exec, s[14:15]                              // 000000004818: 87FE0E7E
	s_and_b64 exec, exec, s[38:39]                             // 00000000481C: 86FE267E
	s_cbranch_execz 117                                        // 000000004820: BF880075 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x22c8>
	v_and_b32_e32 v20, 0xffffff00, v17                         // 000000004824: 262822FF FFFFFF00
	v_cmp_lt_i32_e32 vcc, v66, v20                             // 00000000482C: 7D822942
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004830: BE8E206A
	s_cbranch_execz 62                                         // 000000004834: BF88003E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2200>
	v_lshlrev_b64 v[22:23], 2, v[66:67]                        // 000000004838: D28F0016 00028482
	v_ashrrev_i32_e32 v5, 31, v21                              // 000000004840: 220A2A9F
	v_mov_b32_e32 v4, v21                                      // 000000004844: 7E080315
	v_add_co_u32_e32 v14, vcc, v10, v22                        // 000000004848: 321C2D0A
	v_addc_co_u32_e32 v15, vcc, v11, v23, vcc                  // 00000000484C: 381E2F0B
	v_lshlrev_b64 v[160:161], 2, v[4:5]                        // 000000004850: D28F00A0 00020882
	v_add_co_u32_e32 v4, vcc, v14, v160                        // 000000004858: 3209410E
	v_addc_co_u32_e32 v5, vcc, v15, v161, vcc                  // 00000000485C: 380B430F
	v_add_co_u32_e32 v14, vcc, v12, v22                        // 000000004860: 321C2D0C
	v_addc_co_u32_e32 v15, vcc, v13, v23, vcc                  // 000000004864: 381E2F0D
	v_add_co_u32_e32 v14, vcc, v14, v160                       // 000000004868: 321D410E
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc                 // 00000000486C: 381F430F
	v_add_co_u32_e32 v22, vcc, v18, v22                        // 000000004870: 322C2D12
	v_addc_co_u32_e32 v23, vcc, v19, v23, vcc                  // 000000004874: 382E2F13
	v_add_co_u32_e32 v22, vcc, v22, v160                       // 000000004878: 322D4116
	v_addc_co_u32_e32 v23, vcc, v23, v161, vcc                 // 00000000487C: 382F4317
	s_mov_b64 s[38:39], 0                                      // 000000004880: BEA60180
	v_mov_b32_e32 v52, v66                                     // 000000004884: 7E680342
	flat_load_dword v162, v[4:5] glc slc                       // 000000004888: DC530000 A2000004
	flat_load_dword v163, v[4:5] offset:256 glc slc            // 000000004890: DC530100 A3000004
	flat_load_dword v164, v[4:5] offset:512 glc slc            // 000000004898: DC530200 A4000004
	flat_load_dword v165, v[4:5] offset:768 glc slc            // 0000000048A0: DC530300 A5000004
	flat_load_dword v166, v[14:15] glc slc                     // 0000000048A8: DC530000 A600000E
	flat_load_dword v167, v[14:15] offset:256 glc slc          // 0000000048B0: DC530100 A700000E
	flat_load_dword v176, v[14:15] offset:512 glc slc          // 0000000048B8: DC530200 B000000E
	flat_load_dword v177, v[14:15] offset:768 glc slc          // 0000000048C0: DC530300 B100000E
	v_lshlrev_b64 v[160:161], 2, v[64:65]                      // 0000000048C8: D28F00A0 00028082
	v_add_co_u32_e32 v4, vcc, v4, v160                         // 0000000048D0: 32094104
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc                   // 0000000048D4: 380B4305
	v_add_co_u32_e32 v14, vcc, v14, v160                       // 0000000048D8: 321D410E
	v_add_u32_e32 v52, v52, v64                                // 0000000048DC: 68688134
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc                 // 0000000048E0: 381F430F
	v_cmp_ge_i32_e32 vcc, v52, v20                             // 0000000048E4: 7D8C2934
	s_or_b64 s[38:39], vcc, s[38:39]                           // 0000000048E8: 87A6266A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000048EC: BF8C0070
	v_add_f32_e32 v160, v162, v166                             // 0000000048F0: 03414DA2
	v_add_f32_e32 v161, v163, v167                             // 0000000048F4: 03434FA3
	v_add_f32_e32 v162, v164, v176                             // 0000000048F8: 034561A4
	v_add_f32_e32 v163, v165, v177                             // 0000000048FC: 034763A5
	flat_store_dword v[22:23], v160 glc slc                    // 000000004900: DC730000 0000A016
	flat_store_dword v[22:23], v161 offset:256 glc slc         // 000000004908: DC730100 0000A116
	flat_store_dword v[22:23], v162 offset:512 glc slc         // 000000004910: DC730200 0000A216
	flat_store_dword v[22:23], v163 offset:768 glc slc         // 000000004918: DC730300 0000A316
	v_add_co_u32_e32 v22, vcc, v22, v84                        // 000000004920: 322CA916
	v_addc_co_u32_e32 v23, vcc, v23, v85, vcc                  // 000000004924: 382EAB17
	s_andn2_b64 exec, exec, s[38:39]                           // 000000004928: 89FE267E
	s_cbranch_execnz 65494                                     // 00000000492C: BF89FFD6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2158>
	s_or_b64 exec, exec, s[14:15]                              // 000000004930: 87FE0E7E
	v_and_b32_e32 v14, 0xff, v17                               // 000000004934: 261C22FF 000000FF
	v_cmp_ne_u32_e32 vcc, 0, v14                               // 00000000493C: 7D9A1C80
	v_cmp_lt_u32_e64 s[14:15], v24, v14                        // 000000004940: D0C9000E 00021D18
	s_and_b64 s[14:15], vcc, s[14:15]                          // 000000004948: 868E0E6A
	s_and_b64 exec, exec, s[14:15]                             // 00000000494C: 86FE0E7E
	s_cbranch_execz 41                                         // 000000004950: BF880029 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x22c8>
	v_add_u32_e32 v4, v20, v21                                 // 000000004954: 68082B14
	v_lshlrev_b64 v[20:21], 2, v[24:25]                        // 000000004958: D28F0014 00023082
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000004960: 220A089F
	v_add_co_u32_e32 v10, vcc, v10, v20                        // 000000004964: 3214290A
	v_addc_co_u32_e32 v11, vcc, v11, v21, vcc                  // 000000004968: 38162B0B
	v_lshlrev_b64 v[22:23], 2, v[4:5]                          // 00000000496C: D28F0016 00020882
	v_add_co_u32_e32 v4, vcc, v10, v22                         // 000000004974: 32082D0A
	v_addc_co_u32_e32 v5, vcc, v11, v23, vcc                   // 000000004978: 380A2F0B
	v_add_co_u32_e32 v10, vcc, v12, v20                        // 00000000497C: 3214290C
	v_addc_co_u32_e32 v11, vcc, v13, v21, vcc                  // 000000004980: 38162B0D
	v_add_co_u32_e32 v10, vcc, v10, v22                        // 000000004984: 32142D0A
	v_addc_co_u32_e32 v11, vcc, v11, v23, vcc                  // 000000004988: 38162F0B
	v_add_co_u32_e32 v12, vcc, v18, v20                        // 00000000498C: 32182912
	v_addc_co_u32_e32 v13, vcc, v19, v21, vcc                  // 000000004990: 381A2B13
	v_add_co_u32_e32 v12, vcc, v12, v22                        // 000000004994: 32182D0C
	v_addc_co_u32_e32 v13, vcc, v13, v23, vcc                  // 000000004998: 381A2F0D
	s_mov_b64 s[14:15], 0                                      // 00000000499C: BE8E0180
	v_mov_b32_e32 v15, v24                                     // 0000000049A0: 7E1E0318
	flat_load_dword v17, v[4:5] glc slc                        // 0000000049A4: DC530000 11000004
	flat_load_dword v20, v[10:11] glc slc                      // 0000000049AC: DC530000 1400000A
	v_lshlrev_b64 v[18:19], 2, v[32:33]                        // 0000000049B4: D28F0012 00024082
	v_add_co_u32_e32 v4, vcc, v4, v18                          // 0000000049BC: 32082504
	v_addc_co_u32_e32 v5, vcc, v5, v19, vcc                    // 0000000049C0: 380A2705
	v_add_co_u32_e32 v10, vcc, v10, v18                        // 0000000049C4: 3214250A
	v_add_u32_e32 v15, v15, v32                                // 0000000049C8: 681E410F
	v_addc_co_u32_e32 v11, vcc, v11, v19, vcc                  // 0000000049CC: 3816270B
	v_cmp_ge_u32_e32 vcc, v15, v14                             // 0000000049D0: 7D9C1D0F
	s_or_b64 s[14:15], vcc, s[14:15]                           // 0000000049D4: 878E0E6A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000049D8: BF8C0070
	v_add_f32_e32 v17, v17, v20                                // 0000000049DC: 02222911
	flat_store_dword v[12:13], v17 glc slc                     // 0000000049E0: DC730000 0000110C
	v_add_co_u32_e32 v12, vcc, v12, v64                        // 0000000049E8: 3218810C
	v_addc_co_u32_e32 v13, vcc, 0, v13, vcc                    // 0000000049EC: 381A1A80
	s_andn2_b64 exec, exec, s[14:15]                           // 0000000049F0: 89FE0E7E
	s_cbranch_execnz 65515                                     // 0000000049F4: BF89FFEB <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2274>
	s_or_b64 exec, exec, s[16:17]                              // 0000000049F8: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 0000000049FC: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 000000004A00: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004A04: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000004A08: 888E0E7E
	s_cbranch_execnz 6                                         // 000000004A0C: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x22f8>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000004A10: BE8E230E
	s_cbranch_execnz 16                                        // 000000004A14: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2328>
	s_or_b64 exec, exec, s[14:15]                              // 000000004A18: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004A1C: BE8E2010
	s_cbranch_execnz 20                                        // 000000004A20: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2344>
	s_branch 51                                                // 000000004A24: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x23c4>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000004A28: 7D944031
	s_mov_b64 s[38:39], -1                                     // 000000004A2C: BEA601C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000004A30: BE90206A
	s_cbranch_execz 4                                          // 000000004A34: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2318>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004A38: BF8C0070
	s_barrier                                                  // 000000004A3C: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000004A40: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 000000004A44: 88A6C17E
	s_or_b64 exec, exec, s[16:17]                              // 000000004A48: 87FE107E
	s_and_b64 s[16:17], s[38:39], exec                         // 000000004A4C: 86907E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000004A50: BE8E230E
	s_cbranch_execz 65520                                      // 000000004A54: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x22e8>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000004A58: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 000000004A5C: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 000000004A60: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 000000004A64: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 000000004A68: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004A6C: BE8E2010
	s_cbranch_execz 32                                         // 000000004A70: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x23c4>
	s_and_b64 exec, exec, s[4:5]                               // 000000004A74: 86FE047E
	s_cbranch_execz 30                                         // 000000004A78: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x23c4>
	ds_read_b64 v[4:5], v130                                   // 000000004A7C: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 000000004A84: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000004A88: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000004A8C: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000004A90: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000004A94: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 000000004A98: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 000000004AA0: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 000000004AA8: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 000000004AB0: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 000000004AB4: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 000000004AB8: BE90206A
	s_cbranch_execz 11                                         // 000000004ABC: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x23bc>
	s_mov_b64 s[38:39], 0                                      // 000000004AC0: BEA60180
	s_sleep 1                                                  // 000000004AC4: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 000000004AC8: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 000000004AD0: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 000000004AD8: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000004ADC: 7DDC1504
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000004AE0: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 000000004AE4: 89FE267E
	s_cbranch_execnz 65526                                     // 000000004AE8: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2394>
	s_or_b64 exec, exec, s[16:17]                              // 000000004AEC: 87FE107E
	s_wakeup                                                   // 000000004AF0: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000004AF4: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000004AF8: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000004AFC: 7D9A0880
	s_and_b64 s[16:17], vcc, s[6:7]                            // 000000004B00: 8690066A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004B04: BE8E2010
	s_cbranch_execz 1                                          // 000000004B08: BF880001 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x23e0>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004B0C: BF8C0070
	s_or_b64 exec, exec, s[14:15]                              // 000000004B10: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000004B14: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000004B18: 7D9A0880
	s_xor_b64 s[14:15], s[8:9], -1                             // 000000004B1C: 888EC108
	s_and_b64 s[16:17], vcc, s[14:15]                          // 000000004B20: 86900E6A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004B24: BE8E2010
	s_cbranch_execz 5                                          // 000000004B28: BF880005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2410>
	v_mov_b32_e32 v4, 1                                        // 000000004B2C: 7E080281
	v_mov_b32_e32 v5, 0                                        // 000000004B30: 7E0A0280
	s_waitcnt lgkmcnt(0)                                       // 000000004B34: BF8CC07F
	flat_store_dwordx2 v[34:35], v[4:5]                        // 000000004B38: DC740000 00000422
	s_or_b64 exec, exec, s[14:15]                              // 000000004B40: 87FE0E7E
	v_and_b32_e32 v4, 48, v55                                  // 000000004B44: 26086EB0
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000004B48: 7D9A0880
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004B4C: BE8E206A
	s_cbranch_execz 64904                                      // 000000004B50: BF88FD88 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1a44>
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000004B54: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000004B58: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 000000004B5C: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 000000004B60: DC740000 00001C06
	s_branch 64898                                             // 000000004B68: BF82FD82 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1a44>
	s_or_b64 exec, exec, s[34:35]                              // 000000004B6C: 87FE227E
	s_or_b64 exec, exec, s[30:31]                              // 000000004B70: 87FE1E7E
	v_cmp_gt_i32_e32 vcc, 2, v14                               // 000000004B74: 7D881C82
	s_and_saveexec_b64 s[30:31], vcc                           // 000000004B78: BE9E206A
	s_cbranch_execz 64841                                      // 000000004B7C: BF88FD49 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1974>
	s_mov_b64 s[34:35], 0                                      // 000000004B80: BEA20180
	s_branch 9                                                 // 000000004B84: BF820009 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x247c>
	s_or_b64 exec, exec, s[14:15]                              // 000000004B88: 87FE0E7E
	v_cmp_ne_u32_e32 vcc, 0, v14                               // 000000004B8C: 7D9A1C80
	v_or_b32_e32 v55, 0x800, v55                               // 000000004B90: 286E6EFF 00000800
	v_add_u32_e32 v16, v115, v16                               // 000000004B98: 68202173
	s_or_b64 s[34:35], vcc, s[34:35]                           // 000000004B9C: 87A2226A
	v_mov_b32_e32 v14, 1                                       // 000000004BA0: 7E1C0281
	s_andn2_b64 exec, exec, s[34:35]                           // 000000004BA4: 89FE227E
	s_cbranch_execz 64829                                      // 000000004BA8: BF88FD3D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x1970>
	v_and_b32_e32 v4, 8, v55                                   // 000000004BAC: 26086E88
	v_and_b32_e32 v5, 12, v55                                  // 000000004BB0: 260A6E8C
	v_cmp_eq_u32_e32 vcc, 0, v4                                // 000000004BB4: 7D940880
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000004BB8: D0CD000E 00020A80
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000004BC0: BEA4200E
	s_cbranch_execz 116                                        // 000000004BC4: BF880074 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2668>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004BC8: BF8C0070
	v_add_co_u32_e64 v12, s[14:15], v36, v4                    // 000000004BCC: D1190E0C 00020924
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]          // 000000004BD4: D11C0E0D 003A4A80
	v_add_co_u32_e64 v10, s[14:15], 2, v28                     // 000000004BDC: D1190E0A 00023882
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]          // 000000004BE4: D11C0E0B 003A3A80
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]              // 000000004BEC: D0E9000E 0002150C
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 000000004BF4: BEA6200E
	s_cbranch_execz 101                                        // 000000004BF8: BF880065 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2660>
	v_add_u32_e32 v12, 2, v28                                  // 000000004BFC: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 000000004C00: 221A189F
	s_mov_b64 s[40:41], 0                                      // 000000004C04: BEA80180
	v_mov_b32_e32 v5, 0                                        // 000000004C08: 7E0A0280
	s_branch 14                                                // 000000004C0C: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2518>
	s_or_b64 exec, exec, s[42:43]                              // 000000004C10: 87FE2A7E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004C14: BF8C0070
	v_add_co_u32_e64 v18, s[14:15], v36, v4                    // 000000004C18: D1190E12 00020924
	v_addc_co_u32_e64 v19, s[14:15], 0, v37, s[14:15]          // 000000004C20: D11C0E13 003A4A80
	v_cmp_ge_u64_e64 s[14:15], v[18:19], v[10:11]              // 000000004C28: D0EE000E 00021512
	s_orn2_b64 s[42:43], s[14:15], exec                        // 000000004C30: 8AAA7E0E
	s_or_b64 exec, exec, s[16:17]                              // 000000004C34: 87FE107E
	s_and_b64 s[14:15], exec, s[42:43]                         // 000000004C38: 868E2A7E
	s_or_b64 s[40:41], s[14:15], s[40:41]                      // 000000004C3C: 87A8280E
	s_andn2_b64 exec, exec, s[40:41]                           // 000000004C40: 89FE287E
	s_cbranch_execz 81                                         // 000000004C44: BF880051 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x265c>
	s_sleep 1                                                  // 000000004C48: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004C4C: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 000000004C50: DC550000 24000006
	v_add_u32_e32 v5, 1, v5                                    // 000000004C58: 680A0A81
	v_and_b32_e32 v15, 64, v55                                 // 000000004C5C: 261E6EC0
	v_cmp_eq_u32_e64 s[14:15], 0, v15                          // 000000004C60: D0CA000E 00021E80
	v_cmp_eq_u32_e64 s[16:17], s52, v5                         // 000000004C68: D0CA0010 00020A34
	s_and_b64 s[14:15], s[14:15], s[16:17]                     // 000000004C70: 868E100E
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000004C74: BE90200E
	s_cbranch_execz 14                                         // 000000004C78: BF88000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2584>
	ds_read_b64 v[18:19], v53 offset:1264                      // 000000004C7C: D8EC04F0 12000035
	s_waitcnt lgkmcnt(0)                                       // 000000004C84: BF8CC07F
	flat_load_dword v5, v[18:19] glc                           // 000000004C88: DC510000 05000012
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004C90: BF8C0070
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000004C94: D0CD000E 00020A80
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]                       // 000000004C9C: D1000005 00390280
	v_lshl_or_b32 v55, v5, 6, v55                              // 000000004CA4: D2000037 04DD0D05
	v_and_b32_e32 v15, 64, v55                                 // 000000004CAC: 261E6EC0
	v_mov_b32_e32 v5, 0                                        // 000000004CB0: 7E0A0280
	s_or_b64 exec, exec, s[16:17]                              // 000000004CB4: 87FE107E
	v_cmp_eq_u32_e64 s[14:15], 0, v15                          // 000000004CB8: D0CA000E 00021E80
	s_mov_b64 s[42:43], -1                                     // 000000004CC0: BEAA01C1
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000004CC4: BE90200E
	s_cbranch_execz 65498                                      // 000000004CC8: BF88FFDA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2504>
	v_cmp_eq_u32_e64 s[14:15], 0, v5                           // 000000004CCC: D0CA000E 00020A80
	s_and_saveexec_b64 s[42:43], s[14:15]                      // 000000004CD4: BEAA200E
	s_cbranch_execz 65485                                      // 000000004CD8: BF88FFCD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x24e0>
	ds_read_b64 v[18:19], v53 offset:1288                      // 000000004CDC: D8EC0508 12000035
	v_mov_b32_e32 v17, s12                                     // 000000004CE4: 7E22020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004CE8: BF8C0070
	v_add_u32_e32 v20, v4, v36                                 // 000000004CEC: 68284904
	v_ashrrev_i32_e32 v21, 31, v20                             // 000000004CF0: 222A289F
	buffer_wbl2                                                // 000000004CF4: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004CFC: BF8C0070
	flat_atomic_add v15, v[18:19], v146 glc                    // 000000004D00: DD090000 0F009212
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004D08: BF8C0070
	buffer_invl2                                               // 000000004D0C: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 000000004D14: E0FC0000 00000000
	ds_read_b64 v[18:19], v53 offset:1280                      // 000000004D1C: D8EC0500 12000035
	v_and_b32_e32 v15, 0x1fff, v15                             // 000000004D24: 261E1EFF 00001FFF
	v_lshlrev_b32_e32 v15, 5, v15                              // 000000004D2C: 241E1E85
	s_waitcnt lgkmcnt(0)                                       // 000000004D30: BF8CC07F
	v_add_co_u32_e64 v22, s[14:15], v18, v15                   // 000000004D34: D1190E16 00021F12
	v_addc_co_u32_e64 v23, s[14:15], 0, v19, s[14:15]          // 000000004D3C: D11C0E17 003A2680
	flat_store_byte v[22:23], v17 offset:1                     // 000000004D44: DC600001 00001116
	s_memrealtime s[14:15]                                     // 000000004D4C: C0940380 00000000
	flat_store_short v[22:23], v147 offset:2                   // 000000004D54: DC680002 00009316
	flat_store_dword v[22:23], v24 offset:4                    // 000000004D5C: DC700004 00001816
	flat_store_dwordx2 v[22:23], v[12:13] offset:24            // 000000004D64: DC740018 00000C16
	s_waitcnt lgkmcnt(0)                                       // 000000004D6C: BF8CC07F
	v_mov_b32_e32 v18, s14                                     // 000000004D70: 7E24020E
	v_mov_b32_e32 v19, s15                                     // 000000004D74: 7E26020F
	flat_store_dwordx4 v[22:23], v[18:21] offset:8             // 000000004D78: DC7C0008 00001216
	flat_store_byte v[22:23], v148                             // 000000004D80: DC600000 00009416
	s_branch 65441                                             // 000000004D88: BF82FFA1 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x24e0>
	s_or_b64 exec, exec, s[40:41]                              // 000000004D8C: 87FE287E
	s_or_b64 exec, exec, s[38:39]                              // 000000004D90: 87FE267E
	s_wakeup                                                   // 000000004D94: BF830000
	s_or_b64 exec, exec, s[36:37]                              // 000000004D98: 87FE247E
	v_and_b32_e32 v4, 12, v55                                  // 000000004D9C: 26086E8C
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000004DA0: D0CD000E 00020880
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000004DA8: BE90200E
	s_cbranch_execz 55                                         // 000000004DAC: BF880037 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x275c>
	v_and_b32_e32 v4, 0x100, v55                               // 000000004DB0: 26086EFF 00000100
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000004DB8: D0CD000E 00020880
	s_xor_b64 s[36:37], vcc, -1                                // 000000004DC0: 88A4C16A
	s_and_b64 s[14:15], s[36:37], s[14:15]                     // 000000004DC4: 868E0E24
	v_and_b32_e32 v52, 7, v28                                  // 000000004DC8: 26683887
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000004DCC: BEA4200E
	s_cbranch_execz 11                                         // 000000004DD0: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x26d0>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000004DD4: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v8, v4                      // 000000004DDC: D1190E04 00020908
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]           // 000000004DE4: D11C0E05 003A0B09
	buffer_wbl2                                                // 000000004DEC: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004DF4: BF8C0070
	flat_store_dword v[4:5], v53                               // 000000004DF8: DC700000 00003504
	s_or_b64 exec, exec, s[36:37]                              // 000000004E00: 87FE247E
	v_and_b32_e32 v4, 0x80, v55                                // 000000004E04: 26086EFF 00000080
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000004E0C: D0CD000E 00020880
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000004E14: BEA4200E
	s_xor_b64 s[36:37], exec, s[36:37]                         // 000000004E18: 88A4247E
	s_cbranch_execz 12                                         // 000000004E1C: BF88000C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2720>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000004E20: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v30, v4                     // 000000004E28: D1190E04 0002091E
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]          // 000000004E30: D11C0E05 003A0B1F
	flat_load_dwordx2 v[4:5], v[4:5] glc                       // 000000004E38: DC550000 04000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004E40: BF8C0070
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000004E44: 220A089F
	v_lshrrev_b64 v[4:5], 2, v[4:5]                            // 000000004E48: D2900004 00020882
	s_andn2_saveexec_b64 s[14:15], s[36:37]                    // 000000004E50: BE8E2324
	v_mad_i64_i32 v[4:5], s[36:37], v52, s24, 0                // 000000004E54: D1E92404 02003134
	s_or_b64 exec, exec, s[14:15]                              // 000000004E5C: 87FE0E7E
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 000000004E60: D28F0004 00020882
	v_cndmask_b32_e32 v10, v149, v150, vcc                     // 000000004E68: 00152D95
	v_add_co_u32_e32 v4, vcc, v38, v4                          // 000000004E6C: 32080926
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc                     // 000000004E70: 380A0B01
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000004E74: 32383882
	v_lshl_add_u32 v10, v3, 3, v10                             // 000000004E78: D1FD000A 04290703
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000004E80: 383A3A80
	ds_write_b64 v10, v[4:5]                                   // 000000004E84: D89A0000 0000040A
	s_or_b64 exec, exec, s[16:17]                              // 000000004E8C: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000004E90: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 000000004E94: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004E98: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000004E9C: 888E0E7E
	s_cbranch_execnz 6                                         // 000000004EA0: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x278c>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000004EA4: BE8E230E
	s_cbranch_execnz 16                                        // 000000004EA8: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x27bc>
	s_or_b64 exec, exec, s[14:15]                              // 000000004EAC: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004EB0: BE8E2010
	s_cbranch_execnz 20                                        // 000000004EB4: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x27d8>
	s_branch 51                                                // 000000004EB8: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2858>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000004EBC: 7D944031
	s_mov_b64 s[36:37], -1                                     // 000000004EC0: BEA401C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000004EC4: BE90206A
	s_cbranch_execz 4                                          // 000000004EC8: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x27ac>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004ECC: BF8C0070
	s_barrier                                                  // 000000004ED0: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000004ED4: BF8CC07F
	s_xor_b64 s[36:37], exec, -1                               // 000000004ED8: 88A4C17E
	s_or_b64 exec, exec, s[16:17]                              // 000000004EDC: 87FE107E
	s_and_b64 s[16:17], s[36:37], exec                         // 000000004EE0: 86907E24
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000004EE4: BE8E230E
	s_cbranch_execz 65520                                      // 000000004EE8: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x277c>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000004EEC: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 000000004EF0: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 000000004EF4: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 000000004EF8: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 000000004EFC: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004F00: BE8E2010
	s_cbranch_execz 32                                         // 000000004F04: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2858>
	s_and_b64 exec, exec, s[4:5]                               // 000000004F08: 86FE047E
	s_cbranch_execz 30                                         // 000000004F0C: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2858>
	ds_read_b64 v[4:5], v130                                   // 000000004F10: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 000000004F18: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000004F1C: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000004F20: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000004F24: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000004F28: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 000000004F2C: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 000000004F34: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 000000004F3C: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 000000004F44: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 000000004F48: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 000000004F4C: BE90206A
	s_cbranch_execz 11                                         // 000000004F50: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2850>
	s_mov_b64 s[36:37], 0                                      // 000000004F54: BEA40180
	s_sleep 1                                                  // 000000004F58: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 000000004F5C: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 000000004F64: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 000000004F6C: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000004F70: 7DDC1504
	s_or_b64 s[36:37], vcc, s[36:37]                           // 000000004F74: 87A4246A
	s_andn2_b64 exec, exec, s[36:37]                           // 000000004F78: 89FE247E
	s_cbranch_execnz 65526                                     // 000000004F7C: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2828>
	s_or_b64 exec, exec, s[16:17]                              // 000000004F80: 87FE107E
	s_wakeup                                                   // 000000004F84: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000004F88: 87FE0E7E
	v_sub_u32_e32 v4, v114, v16                                // 000000004F8C: 6A082172
	v_min_i32_e32 v115, v115, v4                               // 000000004F90: 18E60973
	v_and_b32_e32 v4, 16, v55                                  // 000000004F94: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000004F98: 7D9A0880
	v_cmp_lt_i32_e64 s[14:15], 0, v115                         // 000000004F9C: D0C1000E 0002E680
	s_and_b64 s[14:15], vcc, s[14:15]                          // 000000004FA4: 868E0E6A
	s_and_b64 s[16:17], s[14:15], s[6:7]                       // 000000004FA8: 8690060E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004FAC: BE8E2010
	s_cbranch_execz 1                                          // 000000004FB0: BF880001 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2888>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000004FB4: BF8C0070
	s_or_b64 exec, exec, s[14:15]                              // 000000004FB8: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000004FBC: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000004FC0: 7D9A0880
	s_xor_b64 s[14:15], s[8:9], -1                             // 000000004FC4: 888EC108
	s_and_b64 s[16:17], vcc, s[14:15]                          // 000000004FC8: 86900E6A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000004FCC: BE8E2010
	s_cbranch_execz 5                                          // 000000004FD0: BF880005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x28b8>
	v_mov_b32_e32 v4, 1                                        // 000000004FD4: 7E080281
	v_mov_b32_e32 v5, 0                                        // 000000004FD8: 7E0A0280
	s_waitcnt lgkmcnt(0)                                       // 000000004FDC: BF8CC07F
	flat_store_dwordx2 v[34:35], v[4:5]                        // 000000004FE0: DC740000 00000422
	s_or_b64 exec, exec, s[14:15]                              // 000000004FE8: 87FE0E7E
	v_and_b32_e32 v4, 48, v55                                  // 000000004FEC: 26086EB0
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000004FF0: 7D9A0880
	s_and_saveexec_b64 s[14:15], vcc                           // 000000004FF4: BE8E206A
	s_cbranch_execz 65251                                      // 000000004FF8: BF88FEE3 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2458>
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000004FFC: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000005000: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 000000005004: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 000000005008: DC740000 00001C06
	s_branch 65245                                             // 000000005010: BF82FEDD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2458>
	v_mad_u64_u32 v[4:5], s[14:15], v112, v133, v[102:103]     // 000000005014: D1E80E04 059B0B70
	v_mul_lo_u32 v10, v112, v134                               // 00000000501C: D285000A 00030D70
	v_mul_lo_u32 v11, v113, v133                               // 000000005024: D285000B 00030B71
	v_add3_u32 v5, v11, v5, v10                                // 00000000502C: D1FF0005 042A0B0B
	v_sub_co_u32_e32 v10, vcc, v26, v4                         // 000000005034: 3414091A
	v_subb_co_u32_e32 v11, vcc, v27, v5, vcc                   // 000000005038: 3A160B1B
	v_cmp_lt_i64_e32 vcc, v[112:113], v[10:11]                 // 00000000503C: 7DC21570
	v_cndmask_b32_e32 v10, v10, v112, vcc                      // 000000005040: 0014E10A
	v_max_i32_e32 v160, 0, v10                                 // 000000005044: 1B401480
	v_add_u32_e32 v11, 31, v160                                // 000000005048: 6817409F
	v_ashrrev_i32_e32 v12, 31, v11                             // 00000000504C: 2218169F
	v_lshrrev_b32_e32 v12, 27, v12                             // 000000005050: 2018189B
	v_add_u32_e32 v11, v11, v12                                // 000000005054: 6816190B
	v_ashrrev_i32_e32 v11, 5, v11                              // 000000005058: 22161685
	v_lshlrev_b32_e32 v11, 4, v11                              // 00000000505C: 24161684
	v_cmp_lt_i32_e32 vcc, 0, v10                               // 000000005060: 7D821480
	v_max_i32_e32 v161, s48, v11                               // 000000005064: 1B421630
	s_and_b64 s[14:15], s[28:29], vcc                          // 000000005068: 868E6A1C
	v_mov_b32_e32 v114, 0                                      // 00000000506C: 7EE40280
	v_mov_b32_e32 v14, 0                                       // 000000005070: 7E1C0280
	s_and_saveexec_b64 s[30:31], s[14:15]                      // 000000005074: BE9E200E
	s_cbranch_execnz 8                                         // 000000005078: BF890008 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x296c>
	s_or_b64 exec, exec, s[30:31]                              // 00000000507C: 87FE1E7E
	v_cmp_gt_i32_e32 vcc, 2, v14                               // 000000005080: 7D881C82
	s_and_saveexec_b64 s[30:31], vcc                           // 000000005084: BE9E206A
	s_cbranch_execnz 702                                       // 000000005088: BF8902BE <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3454>
	s_or_b64 exec, exec, s[30:31]                              // 00000000508C: 87FE1E7E
	s_andn2_b64 vcc, exec, s[26:27]                            // 000000005090: 89EA1A7E
	s_cbranch_vccz 996                                         // 000000005094: BF8603E4 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x38f8>
	s_branch 1974                                              // 000000005098: BF8207B6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4844>
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 00000000509C: D28F0004 00020882
	v_add_co_u32_e32 v162, vcc, v38, v4                        // 0000000050A4: 33440926
	v_addc_co_u32_e32 v163, vcc, v1, v5, vcc                   // 0000000050A8: 39460B01
	s_mov_b32 s53, 1                                           // 0000000050AC: BEB50081
	s_mov_b64 s[36:37], -1                                     // 0000000050B0: BEA401C1
	s_mov_b64 s[34:35], 0                                      // 0000000050B4: BEA20180
	v_mov_b32_e32 v114, 0                                      // 0000000050B8: 7EE40280
	s_branch 14                                                // 0000000050BC: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x29c8>
	s_or_b64 exec, exec, s[14:15]                              // 0000000050C0: 87FE0E7E
	v_add_u32_e32 v114, v161, v114                             // 0000000050C4: 68E4E5A1
	v_cmp_ge_i32_e32 vcc, v114, v160                           // 0000000050C8: 7D8D4172
	s_xor_b64 s[14:15], s[36:37], -1                           // 0000000050CC: 888EC124
	s_or_b64 s[14:15], s[14:15], vcc                           // 0000000050D0: 878E6A0E
	s_and_b64 s[14:15], exec, s[14:15]                         // 0000000050D4: 868E0E7E
	v_or_b32_e32 v55, 0x800, v55                               // 0000000050D8: 286E6EFF 00000800
	s_or_b64 s[34:35], s[14:15], s[34:35]                      // 0000000050E0: 87A2220E
	s_mov_b64 s[36:37], 0                                      // 0000000050E4: BEA40180
	v_mov_b32_e32 v14, s53                                     // 0000000050E8: 7E1C0235
	s_mov_b32 s53, 2                                           // 0000000050EC: BEB50082
	s_andn2_b64 exec, exec, s[34:35]                           // 0000000050F0: 89FE227E
	s_cbranch_execz 670                                        // 0000000050F4: BF88029E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3440>
	v_and_b32_e32 v4, 1, v55                                   // 0000000050F8: 26086E81
	v_ashrrev_i32_e32 v115, 31, v114                           // 0000000050FC: 22E6E49F
	v_cmp_eq_u32_e32 vcc, 1, v4                                // 000000005100: 7D940881
	v_lshlrev_b64 v[4:5], 2, v[114:115]                        // 000000005104: D28F0004 0002E482
	v_add_co_u32_e64 v4, s[14:15], v162, v4                    // 00000000510C: D1190E04 000209A2
	v_addc_co_u32_e64 v5, s[14:15], v163, v5, s[14:15]         // 000000005114: D11C0E05 003A0BA3
	s_and_saveexec_b64 s[14:15], vcc                           // 00000000511C: BE8E206A
	s_cbranch_execz 2                                          // 000000005120: BF880002 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x29fc>
	ds_write_b64 v53, v[4:5] offset:112                        // 000000005124: D89A0070 00000435
	s_or_b64 exec, exec, s[14:15]                              // 00000000512C: 87FE0E7E
	v_and_b32_e32 v10, 2, v55                                  // 000000005130: 26146E82
	v_cmp_ne_u32_e32 vcc, 0, v10                               // 000000005134: 7D9A1480
	s_and_saveexec_b64 s[14:15], vcc                           // 000000005138: BE8E206A
	s_cbranch_execz 2                                          // 00000000513C: BF880002 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2a18>
	ds_write_b64 v53, v[4:5] offset:176                        // 000000005140: D89A00B0 00000435
	s_or_b64 exec, exec, s[14:15]                              // 000000005148: 87FE0E7E
	v_and_b32_e32 v4, 8, v55                                   // 00000000514C: 26086E88
	v_and_b32_e32 v5, 12, v55                                  // 000000005150: 260A6E8C
	v_cmp_eq_u32_e32 vcc, 0, v4                                // 000000005154: 7D940880
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000005158: D0CD000E 00020A80
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 000000005160: BEA6200E
	s_cbranch_execz 116                                        // 000000005164: BF880074 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2c08>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005168: BF8C0070
	v_add_co_u32_e64 v12, s[14:15], v36, v4                    // 00000000516C: D1190E0C 00020924
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]          // 000000005174: D11C0E0D 003A4A80
	v_add_co_u32_e64 v10, s[14:15], 2, v28                     // 00000000517C: D1190E0A 00023882
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]          // 000000005184: D11C0E0B 003A3A80
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]              // 00000000518C: D0E9000E 0002150C
	s_and_saveexec_b64 s[40:41], s[14:15]                      // 000000005194: BEA8200E
	s_cbranch_execz 101                                        // 000000005198: BF880065 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2c00>
	v_add_u32_e32 v12, 2, v28                                  // 00000000519C: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 0000000051A0: 221A189F
	s_mov_b64 s[42:43], 0                                      // 0000000051A4: BEAA0180
	v_mov_b32_e32 v5, 0                                        // 0000000051A8: 7E0A0280
	s_branch 14                                                // 0000000051AC: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2ab8>
	s_or_b64 exec, exec, s[44:45]                              // 0000000051B0: 87FE2C7E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000051B4: BF8C0070
	v_add_co_u32_e64 v14, s[14:15], v36, v4                    // 0000000051B8: D1190E0E 00020924
	v_addc_co_u32_e64 v15, s[14:15], 0, v37, s[14:15]          // 0000000051C0: D11C0E0F 003A4A80
	v_cmp_ge_u64_e64 s[14:15], v[14:15], v[10:11]              // 0000000051C8: D0EE000E 0002150E
	s_orn2_b64 s[44:45], s[14:15], exec                        // 0000000051D0: 8AAC7E0E
	s_or_b64 exec, exec, s[16:17]                              // 0000000051D4: 87FE107E
	s_and_b64 s[14:15], exec, s[44:45]                         // 0000000051D8: 868E2C7E
	s_or_b64 s[42:43], s[14:15], s[42:43]                      // 0000000051DC: 87AA2A0E
	s_andn2_b64 exec, exec, s[42:43]                           // 0000000051E0: 89FE2A7E
	s_cbranch_execz 81                                         // 0000000051E4: BF880051 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2bfc>
	s_sleep 1                                                  // 0000000051E8: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000051EC: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 0000000051F0: DC550000 24000006
	v_add_u32_e32 v5, 1, v5                                    // 0000000051F8: 680A0A81
	v_and_b32_e32 v14, 64, v55                                 // 0000000051FC: 261C6EC0
	v_cmp_eq_u32_e64 s[14:15], 0, v14                          // 000000005200: D0CA000E 00021C80
	v_cmp_eq_u32_e64 s[16:17], s52, v5                         // 000000005208: D0CA0010 00020A34
	s_and_b64 s[14:15], s[14:15], s[16:17]                     // 000000005210: 868E100E
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000005214: BE90200E
	s_cbranch_execz 14                                         // 000000005218: BF88000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2b24>
	ds_read_b64 v[14:15], v53 offset:1264                      // 00000000521C: D8EC04F0 0E000035
	s_waitcnt lgkmcnt(0)                                       // 000000005224: BF8CC07F
	flat_load_dword v5, v[14:15] glc                           // 000000005228: DC510000 0500000E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005230: BF8C0070
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000005234: D0CD000E 00020A80
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]                       // 00000000523C: D1000005 00390280
	v_lshl_or_b32 v55, v5, 6, v55                              // 000000005244: D2000037 04DD0D05
	v_and_b32_e32 v14, 64, v55                                 // 00000000524C: 261C6EC0
	v_mov_b32_e32 v5, 0                                        // 000000005250: 7E0A0280
	s_or_b64 exec, exec, s[16:17]                              // 000000005254: 87FE107E
	v_cmp_eq_u32_e64 s[14:15], 0, v14                          // 000000005258: D0CA000E 00021C80
	s_mov_b64 s[44:45], -1                                     // 000000005260: BEAC01C1
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000005264: BE90200E
	s_cbranch_execz 65498                                      // 000000005268: BF88FFDA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2aa4>
	v_cmp_eq_u32_e64 s[14:15], 0, v5                           // 00000000526C: D0CA000E 00020A80
	s_and_saveexec_b64 s[44:45], s[14:15]                      // 000000005274: BEAC200E
	s_cbranch_execz 65485                                      // 000000005278: BF88FFCD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2a80>
	ds_read_b64 v[14:15], v53 offset:1288                      // 00000000527C: D8EC0508 0E000035
	v_mov_b32_e32 v20, s12                                     // 000000005284: 7E28020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005288: BF8C0070
	v_add_u32_e32 v16, v4, v36                                 // 00000000528C: 68204904
	buffer_wbl2                                                // 000000005290: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005298: BF8C0070
	flat_atomic_add v17, v[14:15], v146 glc                    // 00000000529C: DD090000 1100920E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000052A4: BF8C0070
	buffer_invl2                                               // 0000000052A8: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 0000000052B0: E0FC0000 00000000
	ds_read_b64 v[14:15], v53 offset:1280                      // 0000000052B8: D8EC0500 0E000035
	v_and_b32_e32 v17, 0x1fff, v17                             // 0000000052C0: 262222FF 00001FFF
	v_lshlrev_b32_e32 v17, 5, v17                              // 0000000052C8: 24222285
	s_waitcnt lgkmcnt(0)                                       // 0000000052CC: BF8CC07F
	v_add_co_u32_e64 v18, s[14:15], v14, v17                   // 0000000052D0: D1190E12 0002230E
	v_addc_co_u32_e64 v19, s[14:15], 0, v15, s[14:15]          // 0000000052D8: D11C0E13 003A1E80
	flat_store_byte v[18:19], v20 offset:1                     // 0000000052E0: DC600001 00001412
	s_memrealtime s[14:15]                                     // 0000000052E8: C0940380 00000000
	v_ashrrev_i32_e32 v17, 31, v16                             // 0000000052F0: 2222209F
	flat_store_short v[18:19], v147 offset:2                   // 0000000052F4: DC680002 00009312
	flat_store_dword v[18:19], v24 offset:4                    // 0000000052FC: DC700004 00001812
	flat_store_dwordx2 v[18:19], v[12:13] offset:24            // 000000005304: DC740018 00000C12
	s_waitcnt lgkmcnt(0)                                       // 00000000530C: BF8CC07F
	v_mov_b32_e32 v14, s14                                     // 000000005310: 7E1C020E
	v_mov_b32_e32 v15, s15                                     // 000000005314: 7E1E020F
	flat_store_dwordx4 v[18:19], v[14:17] offset:8             // 000000005318: DC7C0008 00000E12
	flat_store_byte v[18:19], v148                             // 000000005320: DC600000 00009412
	s_branch 65441                                             // 000000005328: BF82FFA1 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2a80>
	s_or_b64 exec, exec, s[42:43]                              // 00000000532C: 87FE2A7E
	s_or_b64 exec, exec, s[40:41]                              // 000000005330: 87FE287E
	s_wakeup                                                   // 000000005334: BF830000
	s_or_b64 exec, exec, s[38:39]                              // 000000005338: 87FE267E
	v_sub_u32_e32 v4, v160, v114                               // 00000000533C: 6A08E5A0
	v_min_i32_e32 v161, v161, v4                               // 000000005340: 194209A1
	v_and_b32_e32 v4, 12, v55                                  // 000000005344: 26086E8C
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000005348: D0CD000E 00020880
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000005350: BE90200E
	s_cbranch_execz 65                                         // 000000005354: BF880041 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2d2c>
	v_and_b32_e32 v4, 0x100, v55                               // 000000005358: 26086EFF 00000100
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000005360: D0CD000E 00020880
	s_xor_b64 s[38:39], vcc, -1                                // 000000005368: 88A6C16A
	s_and_b64 s[14:15], s[38:39], s[14:15]                     // 00000000536C: 868E0E26
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 000000005370: BEA6200E
	s_xor_b64 s[38:39], exec, s[38:39]                         // 000000005374: 88A6267E
	s_cbranch_execz 13                                         // 000000005378: BF88000D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2c80>
	v_and_b32_e32 v52, 7, v28                                  // 00000000537C: 26683887
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000005380: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v8, v4                      // 000000005388: D1190E04 00020908
	v_lshlrev_b32_e32 v10, 2, v161                             // 000000005390: 24154282
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]           // 000000005394: D11C0E05 003A0B09
	buffer_wbl2                                                // 00000000539C: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000053A4: BF8C0070
	flat_store_dword v[4:5], v10                               // 0000000053A8: DC700000 00000A04
	s_andn2_saveexec_b64 s[14:15], s[38:39]                    // 0000000053B0: BE8E2326
	v_and_b32_e32 v52, 7, v28                                  // 0000000053B4: 26683887
	s_or_b64 exec, exec, s[14:15]                              // 0000000053B8: 87FE0E7E
	v_and_b32_e32 v4, 0x80, v55                                // 0000000053BC: 26086EFF 00000080
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 0000000053C4: D0CD000E 00020880
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 0000000053CC: BEA6200E
	s_xor_b64 s[38:39], exec, s[38:39]                         // 0000000053D0: 88A6267E
	s_cbranch_execz 12                                         // 0000000053D4: BF88000C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2cd8>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 0000000053D8: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v30, v4                     // 0000000053E0: D1190E04 0002091E
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]          // 0000000053E8: D11C0E05 003A0B1F
	flat_load_dwordx2 v[4:5], v[4:5] glc                       // 0000000053F0: DC550000 04000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000053F8: BF8C0070
	v_ashrrev_i32_e32 v5, 31, v4                               // 0000000053FC: 220A089F
	v_lshrrev_b64 v[4:5], 2, v[4:5]                            // 000000005400: D2900004 00020882
	s_andn2_saveexec_b64 s[14:15], s[38:39]                    // 000000005408: BE8E2326
	v_mul_lo_u32 v10, v53, s24                                 // 00000000540C: D285000A 00003135
	v_mul_lo_u32 v11, v52, s13                                 // 000000005414: D285000B 00001B34
	v_mad_u64_u32 v[4:5], s[38:39], v52, s24, 0                // 00000000541C: D1E82604 02003134
	v_add3_u32 v5, v5, v11, v10                                // 000000005424: D1FF0005 042A1705
	s_or_b64 exec, exec, s[14:15]                              // 00000000542C: 87FE0E7E
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 000000005430: D28F0004 00020882
	v_cndmask_b32_e32 v10, v149, v147, vcc                     // 000000005438: 00152795
	v_add_co_u32_e32 v4, vcc, v38, v4                          // 00000000543C: 32080926
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc                     // 000000005440: 380A0B01
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000005444: 32383882
	v_lshl_add_u32 v10, v3, 3, v10                             // 000000005448: D1FD000A 04290703
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000005450: 383A3A80
	ds_write_b64 v10, v[4:5] offset:8                          // 000000005454: D89A0008 0000040A
	s_or_b64 exec, exec, s[16:17]                              // 00000000545C: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000005460: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 000000005464: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000005468: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 00000000546C: 888E0E7E
	s_cbranch_execnz 6                                         // 000000005470: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2d5c>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000005474: BE8E230E
	s_cbranch_execnz 16                                        // 000000005478: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2d8c>
	s_or_b64 exec, exec, s[14:15]                              // 00000000547C: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005480: BE8E2010
	s_cbranch_execnz 20                                        // 000000005484: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2da8>
	s_branch 51                                                // 000000005488: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2e28>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 00000000548C: 7D944031
	s_mov_b64 s[38:39], -1                                     // 000000005490: BEA601C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000005494: BE90206A
	s_cbranch_execz 4                                          // 000000005498: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2d7c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000549C: BF8C0070
	s_barrier                                                  // 0000000054A0: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 0000000054A4: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 0000000054A8: 88A6C17E
	s_or_b64 exec, exec, s[16:17]                              // 0000000054AC: 87FE107E
	s_and_b64 s[16:17], s[38:39], exec                         // 0000000054B0: 86907E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 0000000054B4: BE8E230E
	s_cbranch_execz 65520                                      // 0000000054B8: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2d4c>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 0000000054BC: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 0000000054C0: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 0000000054C4: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 0000000054C8: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 0000000054CC: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 0000000054D0: BE8E2010
	s_cbranch_execz 32                                         // 0000000054D4: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2e28>
	s_and_b64 exec, exec, s[4:5]                               // 0000000054D8: 86FE047E
	s_cbranch_execz 30                                         // 0000000054DC: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2e28>
	ds_read_b64 v[4:5], v130                                   // 0000000054E0: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 0000000054E8: 7E140281
	v_mov_b32_e32 v11, 0                                       // 0000000054EC: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 0000000054F0: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 0000000054F4: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 0000000054F8: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 0000000054FC: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 000000005504: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 00000000550C: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 000000005514: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 000000005518: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 00000000551C: BE90206A
	s_cbranch_execz 11                                         // 000000005520: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2e20>
	s_mov_b64 s[38:39], 0                                      // 000000005524: BEA60180
	s_sleep 1                                                  // 000000005528: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 00000000552C: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 000000005534: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 00000000553C: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000005540: 7DDC1504
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000005544: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 000000005548: 89FE267E
	s_cbranch_execnz 65526                                     // 00000000554C: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2df8>
	s_or_b64 exec, exec, s[16:17]                              // 000000005550: 87FE107E
	s_wakeup                                                   // 000000005554: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000005558: 87FE0E7E
	v_cmp_lt_i32_e32 vcc, 0, v161                              // 00000000555C: 7D834280
	s_and_saveexec_b64 s[16:17], vcc                           // 000000005560: BE90206A
	s_cbranch_execz 293                                        // 000000005564: BF880125 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x32cc>
	ds_read_b128 v[10:13], v53 offset:112                      // 000000005568: D9FE0070 0A000035
	ds_read_b128 v[14:17], v53 offset:176                      // 000000005570: D9FE00B0 0E000035
	v_mov_b32_e32 v117, 0                                      // 000000005578: 7EEA0280
	s_mov_b64 s[38:39], -1                                     // 00000000557C: BEA601C1
	v_mov_b32_e32 v115, v161                                   // 000000005580: 7EE603A1
	s_waitcnt lgkmcnt(0)                                       // 000000005584: BF8CC07F
	v_or_b32_e32 v4, v12, v10                                  // 000000005588: 2808150C
	v_or_b32_e32 v4, v4, v14                                   // 00000000558C: 28081D04
	v_or_b32_e32 v4, v4, v16                                   // 000000005590: 28082104
	v_and_b32_e32 v116, 3, v4                                  // 000000005594: 26E80883
	v_cmp_ne_u64_e32 vcc, 0, v[116:117]                        // 000000005598: 7DDAE880
	s_cbranch_vccz 3                                           // 00000000559C: BF860003 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2e7c>
	s_and_b64 exec, exec, s[38:39]                             // 0000000055A0: 86FE267E
	s_cbranch_execnz 138                                       // 0000000055A4: BF89008A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x30a0>
	s_branch 276                                               // 0000000055A8: BF820114 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x32cc>
	v_lshrrev_b32_e32 v4, 2, v161                              // 0000000055AC: 20094282
	v_and_b32_e32 v52, 0x3fffff80, v4                          // 0000000055B0: 266808FF 3FFFFF80
	v_cmp_lt_u32_e32 vcc, v68, v52                             // 0000000055B8: 7D926944
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000055BC: BE8E206A
	s_cbranch_execz 52                                         // 0000000055C0: BF880034 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2f64>
	v_lshlrev_b64 v[22:23], 4, v[68:69]                        // 0000000055C4: D28F0016 00028884
	v_add_co_u32_e32 v4, vcc, v14, v22                         // 0000000055CC: 32082D0E
	v_addc_co_u32_e32 v5, vcc, v15, v23, vcc                   // 0000000055D0: 380A2F0F
	v_add_co_u32_e32 v18, vcc, v16, v22                        // 0000000055D4: 32242D10
	v_addc_co_u32_e32 v19, vcc, v17, v23, vcc                  // 0000000055D8: 38262F11
	v_add_co_u32_e32 v20, vcc, v10, v22                        // 0000000055DC: 32282D0A
	v_addc_co_u32_e32 v21, vcc, v11, v23, vcc                  // 0000000055E0: 382A2F0B
	v_add_co_u32_e32 v22, vcc, v12, v22                        // 0000000055E4: 322C2D0C
	v_addc_co_u32_e32 v23, vcc, v13, v23, vcc                  // 0000000055E8: 382E2F0D
	s_mov_b64 s[38:39], 0                                      // 0000000055EC: BEA60180
	v_mov_b32_e32 v115, v68                                    // 0000000055F0: 7EE60344
	flat_load_dwordx4 v[164:167], v[22:23] glc slc             // 0000000055F4: DC5F0000 A4000016
	flat_load_dwordx4 v[176:179], v[20:21] glc slc             // 0000000055FC: DC5F0000 B0000014
	flat_load_dwordx4 v[180:183], v[20:21] offset:1024 glc slc // 000000005604: DC5F0400 B4000014
	flat_load_dwordx4 v[192:195], v[22:23] offset:1024 glc slc // 00000000560C: DC5F0400 C0000016
	v_lshlrev_b64 v[116:117], 4, v[50:51]                      // 000000005614: D28F0074 00026484
	v_add_co_u32_e32 v20, vcc, v20, v116                       // 00000000561C: 3228E914
	v_addc_co_u32_e32 v21, vcc, v21, v117, vcc                 // 000000005620: 382AEB15
	v_add_co_u32_e32 v22, vcc, v22, v116                       // 000000005624: 322CE916
	v_add_u32_e32 v115, v115, v50                              // 000000005628: 68E66573
	v_addc_co_u32_e32 v23, vcc, v23, v117, vcc                 // 00000000562C: 382EEB17
	v_cmp_ge_u32_e32 vcc, v115, v52                            // 000000005630: 7D9C6973
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000005634: 87A6266A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005638: BF8C0070
	v_add_f32_e32 v164, v176, v164                             // 00000000563C: 034949B0
	v_add_f32_e32 v165, v177, v165                             // 000000005640: 034B4BB1
	v_add_f32_e32 v166, v178, v166                             // 000000005644: 034D4DB2
	v_add_f32_e32 v167, v179, v167                             // 000000005648: 034F4FB3
	v_add_f32_e32 v176, v180, v192                             // 00000000564C: 036181B4
	v_add_f32_e32 v177, v181, v193                             // 000000005650: 036383B5
	v_add_f32_e32 v178, v182, v194                             // 000000005654: 036585B6
	v_add_f32_e32 v179, v183, v195                             // 000000005658: 036787B7
	flat_store_dwordx4 v[4:5], v[164:167] glc slc              // 00000000565C: DC7F0000 0000A404
	flat_store_dwordx4 v[4:5], v[176:179] offset:1024 glc slc  // 000000005664: DC7F0400 0000B004
	flat_store_dwordx4 v[18:19], v[164:167] glc slc            // 00000000566C: DC7F0000 0000A412
	flat_store_dwordx4 v[18:19], v[176:179] offset:1024 glc slc// 000000005674: DC7F0400 0000B012
	v_add_co_u32_e32 v4, vcc, v4, v116                         // 00000000567C: 3208E904
	v_addc_co_u32_e32 v5, vcc, v5, v117, vcc                   // 000000005680: 380AEB05
	v_add_co_u32_e32 v18, vcc, v18, v116                       // 000000005684: 3224E912
	v_addc_co_u32_e32 v19, vcc, v19, v117, vcc                 // 000000005688: 3826EB13
	s_andn2_b64 exec, exec, s[38:39]                           // 00000000568C: 89FE267E
	s_cbranch_execnz 65496                                     // 000000005690: BF89FFD8 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2ec4>
	s_or_b64 exec, exec, s[14:15]                              // 000000005694: 87FE0E7E
	v_lshlrev_b32_e32 v52, 2, v52                              // 000000005698: 24686882
	v_cmp_ne_u32_e32 vcc, v161, v52                            // 00000000569C: 7D9A69A1
	s_mov_b64 s[38:39], 0                                      // 0000000056A0: BEA60180
	v_mov_b32_e32 v115, 0                                      // 0000000056A4: 7EE60280
	v_mov_b32_e32 v117, 0                                      // 0000000056A8: 7EEA0280
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000056AC: BE8E206A
	s_cbranch_execz 68                                         // 0000000056B0: BF880044 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3094>
	v_sub_u32_e32 v116, v161, v52                              // 0000000056B4: 6AE869A1
	v_ashrrev_i32_e32 v115, 2, v116                            // 0000000056B8: 22E6E882
	v_cmp_lt_i32_e32 vcc, v24, v115                            // 0000000056BC: 7D82E718
	s_and_saveexec_b64 s[38:39], vcc                           // 0000000056C0: BEA6206A
	s_cbranch_execz 50                                         // 0000000056C4: BF880032 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3060>
	v_lshlrev_b64 v[22:23], 2, v[52:53]                        // 0000000056C8: D28F0016 00026882
	v_add_co_u32_e32 v4, vcc, v14, v22                         // 0000000056D0: 32082D0E
	v_addc_co_u32_e32 v5, vcc, v15, v23, vcc                   // 0000000056D4: 380A2F0F
	v_lshlrev_b64 v[164:165], 4, v[24:25]                      // 0000000056D8: D28F00A4 00023084
	v_add_co_u32_e32 v4, vcc, v4, v164                         // 0000000056E0: 32094904
	v_addc_co_u32_e32 v5, vcc, v5, v165, vcc                   // 0000000056E4: 380B4B05
	v_add_co_u32_e32 v18, vcc, v16, v22                        // 0000000056E8: 32242D10
	v_addc_co_u32_e32 v19, vcc, v17, v23, vcc                  // 0000000056EC: 38262F11
	v_add_co_u32_e32 v18, vcc, v18, v164                       // 0000000056F0: 32254912
	v_addc_co_u32_e32 v19, vcc, v19, v165, vcc                 // 0000000056F4: 38274B13
	v_add_co_u32_e32 v20, vcc, v10, v22                        // 0000000056F8: 32282D0A
	v_addc_co_u32_e32 v21, vcc, v11, v23, vcc                  // 0000000056FC: 382A2F0B
	v_add_co_u32_e32 v20, vcc, v20, v164                       // 000000005700: 32294914
	v_addc_co_u32_e32 v21, vcc, v21, v165, vcc                 // 000000005704: 382B4B15
	v_add_co_u32_e32 v22, vcc, v12, v22                        // 000000005708: 322C2D0C
	v_addc_co_u32_e32 v23, vcc, v13, v23, vcc                  // 00000000570C: 382E2F0D
	v_add_co_u32_e32 v22, vcc, v22, v164                       // 000000005710: 322D4916
	v_addc_co_u32_e32 v23, vcc, v23, v165, vcc                 // 000000005714: 382F4B17
	s_mov_b64 s[40:41], 0                                      // 000000005718: BEA80180
	v_mov_b32_e32 v117, v24                                    // 00000000571C: 7EEA0318
	flat_load_dwordx4 v[164:167], v[20:21] glc slc             // 000000005720: DC5F0000 A4000014
	flat_load_dwordx4 v[176:179], v[22:23] glc slc             // 000000005728: DC5F0000 B0000016
	v_lshlrev_b64 v[180:181], 4, v[32:33]                      // 000000005730: D28F00B4 00024084
	v_add_co_u32_e32 v20, vcc, v20, v180                       // 000000005738: 32296914
	v_addc_co_u32_e32 v21, vcc, v21, v181, vcc                 // 00000000573C: 382B6B15
	v_add_co_u32_e32 v22, vcc, v22, v180                       // 000000005740: 322D6916
	v_add_u32_e32 v117, v117, v32                              // 000000005744: 68EA4175
	v_addc_co_u32_e32 v23, vcc, v23, v181, vcc                 // 000000005748: 382F6B17
	v_cmp_ge_i32_e32 vcc, v117, v115                           // 00000000574C: 7D8CE775
	s_or_b64 s[40:41], vcc, s[40:41]                           // 000000005750: 87A8286A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005754: BF8C0070
	v_add_f32_e32 v164, v164, v176                             // 000000005758: 034961A4
	v_add_f32_e32 v165, v165, v177                             // 00000000575C: 034B63A5
	v_add_f32_e32 v166, v166, v178                             // 000000005760: 034D65A6
	v_add_f32_e32 v167, v167, v179                             // 000000005764: 034F67A7
	flat_store_dwordx4 v[4:5], v[164:167] glc slc              // 000000005768: DC7F0000 0000A404
	flat_store_dwordx4 v[18:19], v[164:167] glc slc            // 000000005770: DC7F0000 0000A412
	v_add_co_u32_e32 v4, vcc, v4, v180                         // 000000005778: 32096904
	v_addc_co_u32_e32 v5, vcc, v5, v181, vcc                   // 00000000577C: 380B6B05
	v_add_co_u32_e32 v18, vcc, v18, v180                       // 000000005780: 32256912
	v_addc_co_u32_e32 v19, vcc, v19, v181, vcc                 // 000000005784: 38276B13
	s_andn2_b64 exec, exec, s[40:41]                           // 000000005788: 89FE287E
	s_cbranch_execnz 65508                                     // 00000000578C: BF89FFE4 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2ff0>
	s_or_b64 exec, exec, s[38:39]                              // 000000005790: 87FE267E
	v_and_b32_e32 v4, 3, v116                                  // 000000005794: 2608E883
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000005798: 7D9A0880
	s_mov_b64 s[38:39], 0                                      // 00000000579C: BEA60180
	v_mov_b32_e32 v115, 0                                      // 0000000057A0: 7EE60280
	s_and_saveexec_b64 s[40:41], vcc                           // 0000000057A4: BEA8206A
	v_and_b32_e32 v5, -4, v116                                 // 0000000057A8: 260AE8C4
	s_mov_b64 s[38:39], exec                                   // 0000000057AC: BEA6017E
	v_add_u32_e32 v52, v5, v52                                 // 0000000057B0: 68686905
	v_mov_b32_e32 v115, v4                                     // 0000000057B4: 7EE60304
	s_or_b64 exec, exec, s[40:41]                              // 0000000057B8: 87FE287E
	s_and_b64 s[38:39], s[38:39], exec                         // 0000000057BC: 86A67E26
	v_mov_b32_e32 v117, v52                                    // 0000000057C0: 7EEA0334
	s_or_b64 exec, exec, s[14:15]                              // 0000000057C4: 87FE0E7E
	s_and_b64 exec, exec, s[38:39]                             // 0000000057C8: 86FE267E
	s_cbranch_execz 139                                        // 0000000057CC: BF88008B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x32cc>
	v_and_b32_e32 v52, 0xffffff00, v115                        // 0000000057D0: 2668E6FF FFFFFF00
	v_cmp_lt_i32_e32 vcc, v66, v52                             // 0000000057D8: 7D826942
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000057DC: BE8E206A
	s_cbranch_execz 76                                         // 0000000057E0: BF88004C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x31e4>
	v_lshlrev_b64 v[22:23], 2, v[66:67]                        // 0000000057E4: D28F0016 00028482
	v_ashrrev_i32_e32 v5, 31, v117                             // 0000000057EC: 220AEA9F
	v_mov_b32_e32 v4, v117                                     // 0000000057F0: 7E080375
	v_add_co_u32_e32 v18, vcc, v14, v22                        // 0000000057F4: 32242D0E
	v_addc_co_u32_e32 v19, vcc, v15, v23, vcc                  // 0000000057F8: 38262F0F
	v_lshlrev_b64 v[164:165], 2, v[4:5]                        // 0000000057FC: D28F00A4 00020882
	v_add_co_u32_e32 v4, vcc, v18, v164                        // 000000005804: 32094912
	v_addc_co_u32_e32 v5, vcc, v19, v165, vcc                  // 000000005808: 380B4B13
	v_add_co_u32_e32 v18, vcc, v16, v22                        // 00000000580C: 32242D10
	v_addc_co_u32_e32 v19, vcc, v17, v23, vcc                  // 000000005810: 38262F11
	v_add_co_u32_e32 v18, vcc, v18, v164                       // 000000005814: 32254912
	v_addc_co_u32_e32 v19, vcc, v19, v165, vcc                 // 000000005818: 38274B13
	v_add_co_u32_e32 v20, vcc, v10, v22                        // 00000000581C: 32282D0A
	v_addc_co_u32_e32 v21, vcc, v11, v23, vcc                  // 000000005820: 382A2F0B
	v_add_co_u32_e32 v20, vcc, v20, v164                       // 000000005824: 32294914
	v_addc_co_u32_e32 v21, vcc, v21, v165, vcc                 // 000000005828: 382B4B15
	v_add_co_u32_e32 v22, vcc, v12, v22                        // 00000000582C: 322C2D0C
	v_addc_co_u32_e32 v23, vcc, v13, v23, vcc                  // 000000005830: 382E2F0D
	v_add_co_u32_e32 v22, vcc, v22, v164                       // 000000005834: 322D4916
	v_addc_co_u32_e32 v23, vcc, v23, v165, vcc                 // 000000005838: 382F4B17
	s_mov_b64 s[38:39], 0                                      // 00000000583C: BEA60180
	v_mov_b32_e32 v116, v66                                    // 000000005840: 7EE80342
	flat_load_dword v166, v[20:21] glc slc                     // 000000005844: DC530000 A6000014
	flat_load_dword v167, v[20:21] offset:256 glc slc          // 00000000584C: DC530100 A7000014
	flat_load_dword v176, v[20:21] offset:512 glc slc          // 000000005854: DC530200 B0000014
	flat_load_dword v177, v[20:21] offset:768 glc slc          // 00000000585C: DC530300 B1000014
	flat_load_dword v178, v[22:23] glc slc                     // 000000005864: DC530000 B2000016
	flat_load_dword v179, v[22:23] offset:256 glc slc          // 00000000586C: DC530100 B3000016
	flat_load_dword v180, v[22:23] offset:512 glc slc          // 000000005874: DC530200 B4000016
	flat_load_dword v181, v[22:23] offset:768 glc slc          // 00000000587C: DC530300 B5000016
	v_lshlrev_b64 v[164:165], 2, v[64:65]                      // 000000005884: D28F00A4 00028082
	v_add_co_u32_e32 v20, vcc, v20, v164                       // 00000000588C: 32294914
	v_addc_co_u32_e32 v21, vcc, v21, v165, vcc                 // 000000005890: 382B4B15
	v_add_co_u32_e32 v22, vcc, v22, v164                       // 000000005894: 322D4916
	v_add_u32_e32 v116, v116, v64                              // 000000005898: 68E88174
	v_addc_co_u32_e32 v23, vcc, v23, v165, vcc                 // 00000000589C: 382F4B17
	v_cmp_ge_i32_e32 vcc, v116, v52                            // 0000000058A0: 7D8C6974
	s_or_b64 s[38:39], vcc, s[38:39]                           // 0000000058A4: 87A6266A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000058A8: BF8C0070
	v_add_f32_e32 v166, v166, v178                             // 0000000058AC: 034D65A6
	v_add_f32_e32 v167, v167, v179                             // 0000000058B0: 034F67A7
	v_add_f32_e32 v176, v176, v180                             // 0000000058B4: 036169B0
	v_add_f32_e32 v177, v177, v181                             // 0000000058B8: 03636BB1
	flat_store_dword v[4:5], v166 glc slc                      // 0000000058BC: DC730000 0000A604
	flat_store_dword v[4:5], v167 offset:256 glc slc           // 0000000058C4: DC730100 0000A704
	flat_store_dword v[4:5], v176 offset:512 glc slc           // 0000000058CC: DC730200 0000B004
	flat_store_dword v[4:5], v177 offset:768 glc slc           // 0000000058D4: DC730300 0000B104
	flat_store_dword v[18:19], v166 glc slc                    // 0000000058DC: DC730000 0000A612
	flat_store_dword v[18:19], v167 offset:256 glc slc         // 0000000058E4: DC730100 0000A712
	flat_store_dword v[18:19], v176 offset:512 glc slc         // 0000000058EC: DC730200 0000B012
	flat_store_dword v[18:19], v177 offset:768 glc slc         // 0000000058F4: DC730300 0000B112
	v_add_co_u32_e32 v4, vcc, v4, v164                         // 0000000058FC: 32094904
	v_addc_co_u32_e32 v5, vcc, v5, v165, vcc                   // 000000005900: 380B4B05
	v_add_co_u32_e32 v18, vcc, v18, v164                       // 000000005904: 32254912
	v_addc_co_u32_e32 v19, vcc, v19, v165, vcc                 // 000000005908: 38274B13
	s_andn2_b64 exec, exec, s[38:39]                           // 00000000590C: 89FE267E
	s_cbranch_execnz 65484                                     // 000000005910: BF89FFCC <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3114>
	s_or_b64 exec, exec, s[14:15]                              // 000000005914: 87FE0E7E
	v_and_b32_e32 v18, 0xff, v115                              // 000000005918: 2624E6FF 000000FF
	v_cmp_ne_u32_e32 vcc, 0, v18                               // 000000005920: 7D9A2480
	v_cmp_lt_u32_e64 s[14:15], v24, v18                        // 000000005924: D0C9000E 00022518
	s_and_b64 s[14:15], vcc, s[14:15]                          // 00000000592C: 868E0E6A
	s_and_b64 exec, exec, s[14:15]                             // 000000005930: 86FE0E7E
	s_cbranch_execz 49                                         // 000000005934: BF880031 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x32cc>
	v_add_u32_e32 v4, v52, v117                                // 000000005938: 6808EB34
	v_lshlrev_b64 v[20:21], 2, v[24:25]                        // 00000000593C: D28F0014 00023082
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000005944: 220A089F
	v_add_co_u32_e32 v14, vcc, v14, v20                        // 000000005948: 321C290E
	v_addc_co_u32_e32 v15, vcc, v15, v21, vcc                  // 00000000594C: 381E2B0F
	v_lshlrev_b64 v[22:23], 2, v[4:5]                          // 000000005950: D28F0016 00020882
	v_add_co_u32_e32 v4, vcc, v14, v22                         // 000000005958: 32082D0E
	v_addc_co_u32_e32 v5, vcc, v15, v23, vcc                   // 00000000595C: 380A2F0F
	v_add_co_u32_e32 v14, vcc, v16, v20                        // 000000005960: 321C2910
	v_addc_co_u32_e32 v15, vcc, v17, v21, vcc                  // 000000005964: 381E2B11
	v_add_co_u32_e32 v14, vcc, v14, v22                        // 000000005968: 321C2D0E
	v_addc_co_u32_e32 v15, vcc, v15, v23, vcc                  // 00000000596C: 381E2F0F
	v_add_co_u32_e32 v10, vcc, v10, v20                        // 000000005970: 3214290A
	v_addc_co_u32_e32 v11, vcc, v11, v21, vcc                  // 000000005974: 38162B0B
	v_add_co_u32_e32 v10, vcc, v10, v22                        // 000000005978: 32142D0A
	v_addc_co_u32_e32 v11, vcc, v11, v23, vcc                  // 00000000597C: 38162F0B
	v_add_co_u32_e32 v12, vcc, v12, v20                        // 000000005980: 3218290C
	v_addc_co_u32_e32 v13, vcc, v13, v21, vcc                  // 000000005984: 381A2B0D
	v_add_co_u32_e32 v12, vcc, v12, v22                        // 000000005988: 32182D0C
	v_addc_co_u32_e32 v13, vcc, v13, v23, vcc                  // 00000000598C: 381A2F0D
	s_mov_b64 s[14:15], 0                                      // 000000005990: BE8E0180
	v_mov_b32_e32 v16, v24                                     // 000000005994: 7E200318
	flat_load_dword v17, v[10:11] glc slc                      // 000000005998: DC530000 1100000A
	flat_load_dword v19, v[12:13] glc slc                      // 0000000059A0: DC530000 1300000C
	v_lshlrev_b64 v[20:21], 2, v[32:33]                        // 0000000059A8: D28F0014 00024082
	v_add_co_u32_e32 v10, vcc, v10, v20                        // 0000000059B0: 3214290A
	v_addc_co_u32_e32 v11, vcc, v11, v21, vcc                  // 0000000059B4: 38162B0B
	v_add_co_u32_e32 v12, vcc, v12, v20                        // 0000000059B8: 3218290C
	v_add_u32_e32 v16, v16, v32                                // 0000000059BC: 68204110
	v_addc_co_u32_e32 v13, vcc, v13, v21, vcc                  // 0000000059C0: 381A2B0D
	v_cmp_ge_u32_e32 vcc, v16, v18                             // 0000000059C4: 7D9C2510
	s_or_b64 s[14:15], vcc, s[14:15]                           // 0000000059C8: 878E0E6A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000059CC: BF8C0070
	v_add_f32_e32 v17, v17, v19                                // 0000000059D0: 02222711
	flat_store_dword v[4:5], v17 glc slc                       // 0000000059D4: DC730000 00001104
	flat_store_dword v[14:15], v17 glc slc                     // 0000000059DC: DC730000 0000110E
	v_add_co_u32_e32 v4, vcc, v4, v20                          // 0000000059E4: 32082904
	v_addc_co_u32_e32 v5, vcc, v5, v21, vcc                    // 0000000059E8: 380A2B05
	v_add_co_u32_e32 v14, vcc, v14, v20                        // 0000000059EC: 321C290E
	v_addc_co_u32_e32 v15, vcc, v15, v21, vcc                  // 0000000059F0: 381E2B0F
	s_andn2_b64 exec, exec, s[14:15]                           // 0000000059F4: 89FE0E7E
	s_cbranch_execnz 65511                                     // 0000000059F8: BF89FFE7 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3268>
	s_or_b64 exec, exec, s[16:17]                              // 0000000059FC: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000005A00: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 000000005A04: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000005A08: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000005A0C: 888E0E7E
	s_cbranch_execnz 6                                         // 000000005A10: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x32fc>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000005A14: BE8E230E
	s_cbranch_execnz 16                                        // 000000005A18: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x332c>
	s_or_b64 exec, exec, s[14:15]                              // 000000005A1C: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005A20: BE8E2010
	s_cbranch_execnz 20                                        // 000000005A24: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3348>
	s_branch 51                                                // 000000005A28: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x33c8>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000005A2C: 7D944031
	s_mov_b64 s[38:39], -1                                     // 000000005A30: BEA601C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000005A34: BE90206A
	s_cbranch_execz 4                                          // 000000005A38: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x331c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005A3C: BF8C0070
	s_barrier                                                  // 000000005A40: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000005A44: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 000000005A48: 88A6C17E
	s_or_b64 exec, exec, s[16:17]                              // 000000005A4C: 87FE107E
	s_and_b64 s[16:17], s[38:39], exec                         // 000000005A50: 86907E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000005A54: BE8E230E
	s_cbranch_execz 65520                                      // 000000005A58: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x32ec>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000005A5C: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 000000005A60: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 000000005A64: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 000000005A68: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 000000005A6C: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005A70: BE8E2010
	s_cbranch_execz 32                                         // 000000005A74: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x33c8>
	s_and_b64 exec, exec, s[4:5]                               // 000000005A78: 86FE047E
	s_cbranch_execz 30                                         // 000000005A7C: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x33c8>
	ds_read_b64 v[4:5], v130                                   // 000000005A80: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 000000005A88: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000005A8C: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000005A90: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000005A94: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000005A98: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 000000005A9C: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 000000005AA4: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 000000005AAC: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 000000005AB4: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 000000005AB8: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 000000005ABC: BE90206A
	s_cbranch_execz 11                                         // 000000005AC0: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x33c0>
	s_mov_b64 s[38:39], 0                                      // 000000005AC4: BEA60180
	s_sleep 1                                                  // 000000005AC8: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 000000005ACC: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 000000005AD4: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 000000005ADC: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000005AE0: 7DDC1504
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000005AE4: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 000000005AE8: 89FE267E
	s_cbranch_execnz 65526                                     // 000000005AEC: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3398>
	s_or_b64 exec, exec, s[16:17]                              // 000000005AF0: 87FE107E
	s_wakeup                                                   // 000000005AF4: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000005AF8: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000005AFC: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000005B00: 7D9A0880
	s_and_b64 s[16:17], vcc, s[6:7]                            // 000000005B04: 8690066A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005B08: BE8E2010
	s_cbranch_execz 1                                          // 000000005B0C: BF880001 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x33e4>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005B10: BF8C0070
	s_or_b64 exec, exec, s[14:15]                              // 000000005B14: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000005B18: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000005B1C: 7D9A0880
	s_xor_b64 s[14:15], s[8:9], -1                             // 000000005B20: 888EC108
	s_and_b64 s[16:17], vcc, s[14:15]                          // 000000005B24: 86900E6A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005B28: BE8E2010
	s_cbranch_execz 5                                          // 000000005B2C: BF880005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3414>
	v_mov_b32_e32 v4, 1                                        // 000000005B30: 7E080281
	v_mov_b32_e32 v5, 0                                        // 000000005B34: 7E0A0280
	s_waitcnt lgkmcnt(0)                                       // 000000005B38: BF8CC07F
	flat_store_dwordx2 v[34:35], v[4:5]                        // 000000005B3C: DC740000 00000422
	s_or_b64 exec, exec, s[14:15]                              // 000000005B44: 87FE0E7E
	v_and_b32_e32 v4, 48, v55                                  // 000000005B48: 26086EB0
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000005B4C: 7D9A0880
	s_and_saveexec_b64 s[14:15], vcc                           // 000000005B50: BE8E206A
	s_cbranch_execz 64858                                      // 000000005B54: BF88FD5A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2990>
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000005B58: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000005B5C: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 000000005B60: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 000000005B64: DC740000 00001C06
	s_branch 64852                                             // 000000005B6C: BF82FD54 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x2990>
	s_or_b64 exec, exec, s[34:35]                              // 000000005B70: 87FE227E
	s_or_b64 exec, exec, s[30:31]                              // 000000005B74: 87FE1E7E
	v_cmp_gt_i32_e32 vcc, 2, v14                               // 000000005B78: 7D881C82
	s_and_saveexec_b64 s[30:31], vcc                           // 000000005B7C: BE9E206A
	s_cbranch_execz 64834                                      // 000000005B80: BF88FD42 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x295c>
	s_mov_b64 s[34:35], 0                                      // 000000005B84: BEA20180
	s_branch 9                                                 // 000000005B88: BF820009 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3480>
	s_or_b64 exec, exec, s[14:15]                              // 000000005B8C: 87FE0E7E
	v_cmp_ne_u32_e32 vcc, 0, v14                               // 000000005B90: 7D9A1C80
	v_or_b32_e32 v55, 0x800, v55                               // 000000005B94: 286E6EFF 00000800
	v_add_u32_e32 v114, v161, v114                             // 000000005B9C: 68E4E5A1
	s_or_b64 s[34:35], vcc, s[34:35]                           // 000000005BA0: 87A2226A
	v_mov_b32_e32 v14, 1                                       // 000000005BA4: 7E1C0281
	s_andn2_b64 exec, exec, s[34:35]                           // 000000005BA8: 89FE227E
	s_cbranch_execz 282                                        // 000000005BAC: BF88011A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x38e8>
	v_and_b32_e32 v4, 8, v55                                   // 000000005BB0: 26086E88
	v_and_b32_e32 v5, 12, v55                                  // 000000005BB4: 260A6E8C
	v_cmp_eq_u32_e32 vcc, 0, v4                                // 000000005BB8: 7D940880
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000005BBC: D0CD000E 00020A80
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000005BC4: BEA4200E
	s_cbranch_execz 116                                        // 000000005BC8: BF880074 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x366c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005BCC: BF8C0070
	v_add_co_u32_e64 v12, s[14:15], v36, v4                    // 000000005BD0: D1190E0C 00020924
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]          // 000000005BD8: D11C0E0D 003A4A80
	v_add_co_u32_e64 v10, s[14:15], 2, v28                     // 000000005BE0: D1190E0A 00023882
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]          // 000000005BE8: D11C0E0B 003A3A80
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]              // 000000005BF0: D0E9000E 0002150C
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 000000005BF8: BEA6200E
	s_cbranch_execz 101                                        // 000000005BFC: BF880065 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3664>
	v_add_u32_e32 v12, 2, v28                                  // 000000005C00: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 000000005C04: 221A189F
	s_mov_b64 s[40:41], 0                                      // 000000005C08: BEA80180
	v_mov_b32_e32 v5, 0                                        // 000000005C0C: 7E0A0280
	s_branch 14                                                // 000000005C10: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x351c>
	s_or_b64 exec, exec, s[42:43]                              // 000000005C14: 87FE2A7E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005C18: BF8C0070
	v_add_co_u32_e64 v16, s[14:15], v36, v4                    // 000000005C1C: D1190E10 00020924
	v_addc_co_u32_e64 v17, s[14:15], 0, v37, s[14:15]          // 000000005C24: D11C0E11 003A4A80
	v_cmp_ge_u64_e64 s[14:15], v[16:17], v[10:11]              // 000000005C2C: D0EE000E 00021510
	s_orn2_b64 s[42:43], s[14:15], exec                        // 000000005C34: 8AAA7E0E
	s_or_b64 exec, exec, s[16:17]                              // 000000005C38: 87FE107E
	s_and_b64 s[14:15], exec, s[42:43]                         // 000000005C3C: 868E2A7E
	s_or_b64 s[40:41], s[14:15], s[40:41]                      // 000000005C40: 87A8280E
	s_andn2_b64 exec, exec, s[40:41]                           // 000000005C44: 89FE287E
	s_cbranch_execz 81                                         // 000000005C48: BF880051 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3660>
	s_sleep 1                                                  // 000000005C4C: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005C50: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 000000005C54: DC550000 24000006
	v_add_u32_e32 v5, 1, v5                                    // 000000005C5C: 680A0A81
	v_and_b32_e32 v15, 64, v55                                 // 000000005C60: 261E6EC0
	v_cmp_eq_u32_e64 s[14:15], 0, v15                          // 000000005C64: D0CA000E 00021E80
	v_cmp_eq_u32_e64 s[16:17], s52, v5                         // 000000005C6C: D0CA0010 00020A34
	s_and_b64 s[14:15], s[14:15], s[16:17]                     // 000000005C74: 868E100E
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000005C78: BE90200E
	s_cbranch_execz 14                                         // 000000005C7C: BF88000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3588>
	ds_read_b64 v[16:17], v53 offset:1264                      // 000000005C80: D8EC04F0 10000035
	s_waitcnt lgkmcnt(0)                                       // 000000005C88: BF8CC07F
	flat_load_dword v5, v[16:17] glc                           // 000000005C8C: DC510000 05000010
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005C94: BF8C0070
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000005C98: D0CD000E 00020A80
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]                       // 000000005CA0: D1000005 00390280
	v_lshl_or_b32 v55, v5, 6, v55                              // 000000005CA8: D2000037 04DD0D05
	v_and_b32_e32 v15, 64, v55                                 // 000000005CB0: 261E6EC0
	v_mov_b32_e32 v5, 0                                        // 000000005CB4: 7E0A0280
	s_or_b64 exec, exec, s[16:17]                              // 000000005CB8: 87FE107E
	v_cmp_eq_u32_e64 s[14:15], 0, v15                          // 000000005CBC: D0CA000E 00021E80
	s_mov_b64 s[42:43], -1                                     // 000000005CC4: BEAA01C1
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000005CC8: BE90200E
	s_cbranch_execz 65498                                      // 000000005CCC: BF88FFDA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3508>
	v_cmp_eq_u32_e64 s[14:15], 0, v5                           // 000000005CD0: D0CA000E 00020A80
	s_and_saveexec_b64 s[42:43], s[14:15]                      // 000000005CD8: BEAA200E
	s_cbranch_execz 65485                                      // 000000005CDC: BF88FFCD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x34e4>
	ds_read_b64 v[16:17], v53 offset:1288                      // 000000005CE0: D8EC0508 10000035
	v_mov_b32_e32 v19, s12                                     // 000000005CE8: 7E26020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005CEC: BF8C0070
	v_add_u32_e32 v18, v4, v36                                 // 000000005CF0: 68244904
	buffer_wbl2                                                // 000000005CF4: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005CFC: BF8C0070
	flat_atomic_add v15, v[16:17], v146 glc                    // 000000005D00: DD090000 0F009210
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005D08: BF8C0070
	buffer_invl2                                               // 000000005D0C: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 000000005D14: E0FC0000 00000000
	ds_read_b64 v[16:17], v53 offset:1280                      // 000000005D1C: D8EC0500 10000035
	v_and_b32_e32 v15, 0x1fff, v15                             // 000000005D24: 261E1EFF 00001FFF
	v_lshlrev_b32_e32 v15, 5, v15                              // 000000005D2C: 241E1E85
	s_waitcnt lgkmcnt(0)                                       // 000000005D30: BF8CC07F
	v_add_co_u32_e64 v20, s[14:15], v16, v15                   // 000000005D34: D1190E14 00021F10
	v_addc_co_u32_e64 v21, s[14:15], 0, v17, s[14:15]          // 000000005D3C: D11C0E15 003A2280
	flat_store_byte v[20:21], v19 offset:1                     // 000000005D44: DC600001 00001314
	s_memrealtime s[14:15]                                     // 000000005D4C: C0940380 00000000
	v_ashrrev_i32_e32 v19, 31, v18                             // 000000005D54: 2226249F
	flat_store_short v[20:21], v147 offset:2                   // 000000005D58: DC680002 00009314
	flat_store_dword v[20:21], v24 offset:4                    // 000000005D60: DC700004 00001814
	flat_store_dwordx2 v[20:21], v[12:13] offset:24            // 000000005D68: DC740018 00000C14
	s_waitcnt lgkmcnt(0)                                       // 000000005D70: BF8CC07F
	v_mov_b32_e32 v16, s14                                     // 000000005D74: 7E20020E
	v_mov_b32_e32 v17, s15                                     // 000000005D78: 7E22020F
	flat_store_dwordx4 v[20:21], v[16:19] offset:8             // 000000005D7C: DC7C0008 00001014
	flat_store_byte v[20:21], v148                             // 000000005D84: DC600000 00009414
	s_branch 65441                                             // 000000005D8C: BF82FFA1 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x34e4>
	s_or_b64 exec, exec, s[40:41]                              // 000000005D90: 87FE287E
	s_or_b64 exec, exec, s[38:39]                              // 000000005D94: 87FE267E
	s_wakeup                                                   // 000000005D98: BF830000
	s_or_b64 exec, exec, s[36:37]                              // 000000005D9C: 87FE247E
	v_and_b32_e32 v4, 12, v55                                  // 000000005DA0: 26086E8C
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000005DA4: D0CD000E 00020880
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000005DAC: BE90200E
	s_cbranch_execz 55                                         // 000000005DB0: BF880037 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3760>
	v_and_b32_e32 v4, 0x100, v55                               // 000000005DB4: 26086EFF 00000100
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000005DBC: D0CD000E 00020880
	s_xor_b64 s[36:37], vcc, -1                                // 000000005DC4: 88A4C16A
	s_and_b64 s[14:15], s[36:37], s[14:15]                     // 000000005DC8: 868E0E24
	v_and_b32_e32 v52, 7, v28                                  // 000000005DCC: 26683887
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000005DD0: BEA4200E
	s_cbranch_execz 11                                         // 000000005DD4: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x36d4>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000005DD8: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v8, v4                      // 000000005DE0: D1190E04 00020908
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]           // 000000005DE8: D11C0E05 003A0B09
	buffer_wbl2                                                // 000000005DF0: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005DF8: BF8C0070
	flat_store_dword v[4:5], v53                               // 000000005DFC: DC700000 00003504
	s_or_b64 exec, exec, s[36:37]                              // 000000005E04: 87FE247E
	v_and_b32_e32 v4, 0x80, v55                                // 000000005E08: 26086EFF 00000080
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000005E10: D0CD000E 00020880
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000005E18: BEA4200E
	s_xor_b64 s[36:37], exec, s[36:37]                         // 000000005E1C: 88A4247E
	s_cbranch_execz 12                                         // 000000005E20: BF88000C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3724>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000005E24: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v30, v4                     // 000000005E2C: D1190E04 0002091E
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]          // 000000005E34: D11C0E05 003A0B1F
	flat_load_dwordx2 v[4:5], v[4:5] glc                       // 000000005E3C: DC550000 04000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005E44: BF8C0070
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000005E48: 220A089F
	v_lshrrev_b64 v[4:5], 2, v[4:5]                            // 000000005E4C: D2900004 00020882
	s_andn2_saveexec_b64 s[14:15], s[36:37]                    // 000000005E54: BE8E2324
	v_mad_i64_i32 v[4:5], s[36:37], v52, s24, 0                // 000000005E58: D1E92404 02003134
	s_or_b64 exec, exec, s[14:15]                              // 000000005E60: 87FE0E7E
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 000000005E64: D28F0004 00020882
	v_cndmask_b32_e32 v10, v149, v147, vcc                     // 000000005E6C: 00152795
	v_add_co_u32_e32 v4, vcc, v38, v4                          // 000000005E70: 32080926
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc                     // 000000005E74: 380A0B01
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000005E78: 32383882
	v_lshl_add_u32 v10, v3, 3, v10                             // 000000005E7C: D1FD000A 04290703
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000005E84: 383A3A80
	ds_write_b64 v10, v[4:5] offset:8                          // 000000005E88: D89A0008 0000040A
	s_or_b64 exec, exec, s[16:17]                              // 000000005E90: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000005E94: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 000000005E98: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000005E9C: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000005EA0: 888E0E7E
	s_cbranch_execnz 6                                         // 000000005EA4: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3790>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000005EA8: BE8E230E
	s_cbranch_execnz 16                                        // 000000005EAC: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x37c0>
	s_or_b64 exec, exec, s[14:15]                              // 000000005EB0: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005EB4: BE8E2010
	s_cbranch_execnz 20                                        // 000000005EB8: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x37dc>
	s_branch 51                                                // 000000005EBC: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x385c>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000005EC0: 7D944031
	s_mov_b64 s[36:37], -1                                     // 000000005EC4: BEA401C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000005EC8: BE90206A
	s_cbranch_execz 4                                          // 000000005ECC: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x37b0>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005ED0: BF8C0070
	s_barrier                                                  // 000000005ED4: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000005ED8: BF8CC07F
	s_xor_b64 s[36:37], exec, -1                               // 000000005EDC: 88A4C17E
	s_or_b64 exec, exec, s[16:17]                              // 000000005EE0: 87FE107E
	s_and_b64 s[16:17], s[36:37], exec                         // 000000005EE4: 86907E24
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000005EE8: BE8E230E
	s_cbranch_execz 65520                                      // 000000005EEC: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3780>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000005EF0: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 000000005EF4: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 000000005EF8: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 000000005EFC: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 000000005F00: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005F04: BE8E2010
	s_cbranch_execz 32                                         // 000000005F08: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x385c>
	s_and_b64 exec, exec, s[4:5]                               // 000000005F0C: 86FE047E
	s_cbranch_execz 30                                         // 000000005F10: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x385c>
	ds_read_b64 v[4:5], v130                                   // 000000005F14: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 000000005F1C: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000005F20: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000005F24: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000005F28: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000005F2C: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 000000005F30: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 000000005F38: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 000000005F40: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 000000005F48: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 000000005F4C: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 000000005F50: BE90206A
	s_cbranch_execz 11                                         // 000000005F54: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3854>
	s_mov_b64 s[36:37], 0                                      // 000000005F58: BEA40180
	s_sleep 1                                                  // 000000005F5C: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 000000005F60: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 000000005F68: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 000000005F70: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000005F74: 7DDC1504
	s_or_b64 s[36:37], vcc, s[36:37]                           // 000000005F78: 87A4246A
	s_andn2_b64 exec, exec, s[36:37]                           // 000000005F7C: 89FE247E
	s_cbranch_execnz 65526                                     // 000000005F80: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x382c>
	s_or_b64 exec, exec, s[16:17]                              // 000000005F84: 87FE107E
	s_wakeup                                                   // 000000005F88: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000005F8C: 87FE0E7E
	v_sub_u32_e32 v4, v160, v114                               // 000000005F90: 6A08E5A0
	v_min_i32_e32 v161, v161, v4                               // 000000005F94: 194209A1
	v_and_b32_e32 v4, 16, v55                                  // 000000005F98: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000005F9C: 7D9A0880
	v_cmp_lt_i32_e64 s[14:15], 0, v161                         // 000000005FA0: D0C1000E 00034280
	s_and_b64 s[14:15], vcc, s[14:15]                          // 000000005FA8: 868E0E6A
	s_and_b64 s[16:17], s[14:15], s[6:7]                       // 000000005FAC: 8690060E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005FB0: BE8E2010
	s_cbranch_execz 1                                          // 000000005FB4: BF880001 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x388c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000005FB8: BF8C0070
	s_or_b64 exec, exec, s[14:15]                              // 000000005FBC: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000005FC0: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000005FC4: 7D9A0880
	s_xor_b64 s[14:15], s[8:9], -1                             // 000000005FC8: 888EC108
	s_and_b64 s[16:17], vcc, s[14:15]                          // 000000005FCC: 86900E6A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000005FD0: BE8E2010
	s_cbranch_execz 5                                          // 000000005FD4: BF880005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x38bc>
	v_mov_b32_e32 v4, 1                                        // 000000005FD8: 7E080281
	v_mov_b32_e32 v5, 0                                        // 000000005FDC: 7E0A0280
	s_waitcnt lgkmcnt(0)                                       // 000000005FE0: BF8CC07F
	flat_store_dwordx2 v[34:35], v[4:5]                        // 000000005FE4: DC740000 00000422
	s_or_b64 exec, exec, s[14:15]                              // 000000005FEC: 87FE0E7E
	v_and_b32_e32 v4, 48, v55                                  // 000000005FF0: 26086EB0
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000005FF4: 7D9A0880
	s_and_saveexec_b64 s[14:15], vcc                           // 000000005FF8: BE8E206A
	s_cbranch_execz 65251                                      // 000000005FFC: BF88FEE3 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x345c>
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000006000: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000006004: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 000000006008: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 00000000600C: DC740000 00001C06
	s_branch 65245                                             // 000000006014: BF82FEDD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x345c>
	s_or_b64 exec, exec, s[34:35]                              // 000000006018: 87FE227E
	s_or_b64 exec, exec, s[30:31]                              // 00000000601C: 87FE1E7E
	s_andn2_b64 vcc, exec, s[26:27]                            // 000000006020: 89EA1A7E
	s_cbranch_vccnz 979                                        // 000000006024: BF8703D3 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4844>
	s_mov_b32 s53, 1                                           // 000000006028: BEB50081
	s_sub_i32 s14, s47, s53                                    // 00000000602C: 818E352F
	s_cmp_le_i32 s25, s14                                      // 000000006030: BF050E19
	s_cselect_b32 s15, s25, 0                                  // 000000006034: 850F8019
	s_sub_i32 s14, s14, s15                                    // 000000006038: 818E0F0E
	s_ashr_i32 s15, s14, 31                                    // 00000000603C: 900F9F0E
	v_mov_b32_e32 v4, s15                                      // 000000006040: 7E08020F
	v_add_co_u32_e32 v5, vcc, s14, v54                         // 000000006044: 320A6C0E
	v_addc_co_u32_e32 v4, vcc, v4, v49, vcc                    // 000000006048: 38086304
	v_mul_lo_u32 v10, v5, v113                                 // 00000000604C: D285000A 0002E305
	v_mul_lo_u32 v11, v4, v112                                 // 000000006054: D285000B 0002E104
	v_mad_u64_u32 v[4:5], s[14:15], v5, v112, v[102:103]       // 00000000605C: D1E80E04 059AE105
	v_add3_u32 v5, v11, v5, v10                                // 000000006064: D1FF0005 042A0B0B
	v_sub_co_u32_e32 v10, vcc, v26, v4                         // 00000000606C: 3414091A
	v_subb_co_u32_e32 v11, vcc, v27, v5, vcc                   // 000000006070: 3A160B1B
	v_cmp_lt_i64_e32 vcc, v[112:113], v[10:11]                 // 000000006074: 7DC21570
	v_cndmask_b32_e32 v10, v10, v112, vcc                      // 000000006078: 0014E10A
	v_max_i32_e32 v114, 0, v10                                 // 00000000607C: 1AE41480
	v_add_u32_e32 v11, 31, v114                                // 000000006080: 6816E49F
	v_ashrrev_i32_e32 v12, 31, v11                             // 000000006084: 2218169F
	v_lshrrev_b32_e32 v12, 27, v12                             // 000000006088: 2018189B
	v_add_u32_e32 v11, v11, v12                                // 00000000608C: 6816190B
	v_ashrrev_i32_e32 v11, 5, v11                              // 000000006090: 22161685
	v_lshlrev_b32_e32 v11, 4, v11                              // 000000006094: 24161684
	v_cmp_lt_i32_e32 vcc, 0, v10                               // 000000006098: 7D821480
	v_max_i32_e32 v115, s48, v11                               // 00000000609C: 1AE61630
	s_and_b64 s[14:15], s[28:29], vcc                          // 0000000060A0: 868E6A1C
	v_mov_b32_e32 v16, 0                                       // 0000000060A4: 7E200280
	v_mov_b32_e32 v14, 0                                       // 0000000060A8: 7E1C0280
	s_and_saveexec_b64 s[30:31], s[14:15]                      // 0000000060AC: BE9E200E
	s_cbranch_execnz 9                                         // 0000000060B0: BF890009 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x39a8>
	s_or_b64 exec, exec, s[30:31]                              // 0000000060B4: 87FE1E7E
	v_cmp_gt_i32_e32 vcc, 2, v14                               // 0000000060B8: 7D881C82
	s_and_saveexec_b64 s[30:31], vcc                           // 0000000060BC: BE9E206A
	s_cbranch_execnz 640                                       // 0000000060C0: BF890280 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4394>
	s_or_b64 exec, exec, s[30:31]                              // 0000000060C4: 87FE1E7E
	s_add_i32 s14, s53, 1                                      // 0000000060C8: 810E8135
	s_cmp_eq_u32 s53, s50                                      // 0000000060CC: BF063235
	s_cbranch_scc0 934                                         // 0000000060D0: BF8403A6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x483c>
	s_branch 935                                               // 0000000060D4: BF8203A7 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4844>
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 0000000060D8: D28F0004 00020882
	v_add_co_u32_e32 v116, vcc, v38, v4                        // 0000000060E0: 32E80926
	v_addc_co_u32_e32 v117, vcc, v1, v5, vcc                   // 0000000060E4: 38EA0B01
	s_mov_b32 s54, 1                                           // 0000000060E8: BEB60081
	s_mov_b64 s[36:37], -1                                     // 0000000060EC: BEA401C1
	s_mov_b64 s[34:35], 0                                      // 0000000060F0: BEA20180
	v_mov_b32_e32 v16, 0                                       // 0000000060F4: 7E200280
	s_branch 14                                                // 0000000060F8: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3a04>
	s_or_b64 exec, exec, s[14:15]                              // 0000000060FC: 87FE0E7E
	v_add_u32_e32 v16, v115, v16                               // 000000006100: 68202173
	v_cmp_ge_i32_e32 vcc, v16, v114                            // 000000006104: 7D8CE510
	s_xor_b64 s[14:15], s[36:37], -1                           // 000000006108: 888EC124
	s_or_b64 s[14:15], s[14:15], vcc                           // 00000000610C: 878E6A0E
	s_and_b64 s[14:15], exec, s[14:15]                         // 000000006110: 868E0E7E
	v_or_b32_e32 v55, 0x800, v55                               // 000000006114: 286E6EFF 00000800
	s_or_b64 s[34:35], s[14:15], s[34:35]                      // 00000000611C: 87A2220E
	s_mov_b64 s[36:37], 0                                      // 000000006120: BEA40180
	v_mov_b32_e32 v14, s54                                     // 000000006124: 7E1C0236
	s_mov_b32 s54, 2                                           // 000000006128: BEB60082
	s_andn2_b64 exec, exec, s[34:35]                           // 00000000612C: 89FE227E
	s_cbranch_execz 607                                        // 000000006130: BF88025F <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4380>
	v_and_b32_e32 v4, 2, v55                                   // 000000006134: 26086E82
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000006138: 7D9A0880
	s_and_saveexec_b64 s[14:15], vcc                           // 00000000613C: BE8E206A
	s_cbranch_execz 7                                          // 000000006140: BF880007 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3a30>
	v_ashrrev_i32_e32 v17, 31, v16                             // 000000006144: 2222209F
	v_lshlrev_b64 v[4:5], 2, v[16:17]                          // 000000006148: D28F0004 00022082
	v_add_co_u32_e32 v4, vcc, v116, v4                         // 000000006150: 32080974
	v_addc_co_u32_e32 v5, vcc, v117, v5, vcc                   // 000000006154: 380A0B75
	ds_write_b64 v53, v[4:5] offset:176                        // 000000006158: D89A00B0 00000435
	s_or_b64 exec, exec, s[14:15]                              // 000000006160: 87FE0E7E
	v_and_b32_e32 v4, 8, v55                                   // 000000006164: 26086E88
	v_and_b32_e32 v5, 12, v55                                  // 000000006168: 260A6E8C
	v_cmp_eq_u32_e32 vcc, 0, v4                                // 00000000616C: 7D940880
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000006170: D0CD000E 00020A80
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 000000006178: BEA6200E
	s_cbranch_execz 116                                        // 00000000617C: BF880074 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3c20>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006180: BF8C0070
	v_add_co_u32_e64 v12, s[14:15], v36, v4                    // 000000006184: D1190E0C 00020924
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]          // 00000000618C: D11C0E0D 003A4A80
	v_add_co_u32_e64 v10, s[14:15], 2, v28                     // 000000006194: D1190E0A 00023882
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]          // 00000000619C: D11C0E0B 003A3A80
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]              // 0000000061A4: D0E9000E 0002150C
	s_and_saveexec_b64 s[40:41], s[14:15]                      // 0000000061AC: BEA8200E
	s_cbranch_execz 101                                        // 0000000061B0: BF880065 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3c18>
	v_add_u32_e32 v12, 2, v28                                  // 0000000061B4: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 0000000061B8: 221A189F
	s_mov_b64 s[42:43], 0                                      // 0000000061BC: BEAA0180
	v_mov_b32_e32 v5, 0                                        // 0000000061C0: 7E0A0280
	s_branch 14                                                // 0000000061C4: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3ad0>
	s_or_b64 exec, exec, s[44:45]                              // 0000000061C8: 87FE2C7E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000061CC: BF8C0070
	v_add_co_u32_e64 v14, s[14:15], v36, v4                    // 0000000061D0: D1190E0E 00020924
	v_addc_co_u32_e64 v15, s[14:15], 0, v37, s[14:15]          // 0000000061D8: D11C0E0F 003A4A80
	v_cmp_ge_u64_e64 s[14:15], v[14:15], v[10:11]              // 0000000061E0: D0EE000E 0002150E
	s_orn2_b64 s[44:45], s[14:15], exec                        // 0000000061E8: 8AAC7E0E
	s_or_b64 exec, exec, s[16:17]                              // 0000000061EC: 87FE107E
	s_and_b64 s[14:15], exec, s[44:45]                         // 0000000061F0: 868E2C7E
	s_or_b64 s[42:43], s[14:15], s[42:43]                      // 0000000061F4: 87AA2A0E
	s_andn2_b64 exec, exec, s[42:43]                           // 0000000061F8: 89FE2A7E
	s_cbranch_execz 81                                         // 0000000061FC: BF880051 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3c14>
	s_sleep 1                                                  // 000000006200: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006204: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 000000006208: DC550000 24000006
	v_add_u32_e32 v5, 1, v5                                    // 000000006210: 680A0A81
	v_and_b32_e32 v14, 64, v55                                 // 000000006214: 261C6EC0
	v_cmp_eq_u32_e64 s[14:15], 0, v14                          // 000000006218: D0CA000E 00021C80
	v_cmp_eq_u32_e64 s[16:17], s52, v5                         // 000000006220: D0CA0010 00020A34
	s_and_b64 s[14:15], s[14:15], s[16:17]                     // 000000006228: 868E100E
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 00000000622C: BE90200E
	s_cbranch_execz 14                                         // 000000006230: BF88000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3b3c>
	ds_read_b64 v[14:15], v53 offset:1264                      // 000000006234: D8EC04F0 0E000035
	s_waitcnt lgkmcnt(0)                                       // 00000000623C: BF8CC07F
	flat_load_dword v5, v[14:15] glc                           // 000000006240: DC510000 0500000E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006248: BF8C0070
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 00000000624C: D0CD000E 00020A80
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]                       // 000000006254: D1000005 00390280
	v_lshl_or_b32 v55, v5, 6, v55                              // 00000000625C: D2000037 04DD0D05
	v_and_b32_e32 v14, 64, v55                                 // 000000006264: 261C6EC0
	v_mov_b32_e32 v5, 0                                        // 000000006268: 7E0A0280
	s_or_b64 exec, exec, s[16:17]                              // 00000000626C: 87FE107E
	v_cmp_eq_u32_e64 s[14:15], 0, v14                          // 000000006270: D0CA000E 00021C80
	s_mov_b64 s[44:45], -1                                     // 000000006278: BEAC01C1
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 00000000627C: BE90200E
	s_cbranch_execz 65498                                      // 000000006280: BF88FFDA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3abc>
	v_cmp_eq_u32_e64 s[14:15], 0, v5                           // 000000006284: D0CA000E 00020A80
	s_and_saveexec_b64 s[44:45], s[14:15]                      // 00000000628C: BEAC200E
	s_cbranch_execz 65485                                      // 000000006290: BF88FFCD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3a98>
	ds_read_b64 v[14:15], v53 offset:1288                      // 000000006294: D8EC0508 0E000035
	v_mov_b32_e32 v18, s12                                     // 00000000629C: 7E24020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000062A0: BF8C0070
	v_add_u32_e32 v20, v4, v36                                 // 0000000062A4: 68284904
	v_ashrrev_i32_e32 v21, 31, v20                             // 0000000062A8: 222A289F
	buffer_wbl2                                                // 0000000062AC: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000062B4: BF8C0070
	flat_atomic_add v17, v[14:15], v146 glc                    // 0000000062B8: DD090000 1100920E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000062C0: BF8C0070
	buffer_invl2                                               // 0000000062C4: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 0000000062CC: E0FC0000 00000000
	ds_read_b64 v[14:15], v53 offset:1280                      // 0000000062D4: D8EC0500 0E000035
	v_and_b32_e32 v17, 0x1fff, v17                             // 0000000062DC: 262222FF 00001FFF
	v_lshlrev_b32_e32 v17, 5, v17                              // 0000000062E4: 24222285
	s_waitcnt lgkmcnt(0)                                       // 0000000062E8: BF8CC07F
	v_add_co_u32_e64 v14, s[14:15], v14, v17                   // 0000000062EC: D1190E0E 0002230E
	v_addc_co_u32_e64 v15, s[14:15], 0, v15, s[14:15]          // 0000000062F4: D11C0E0F 003A1E80
	flat_store_byte v[14:15], v18 offset:1                     // 0000000062FC: DC600001 0000120E
	s_memrealtime s[14:15]                                     // 000000006304: C0940380 00000000
	flat_store_short v[14:15], v147 offset:2                   // 00000000630C: DC680002 0000930E
	flat_store_dword v[14:15], v24 offset:4                    // 000000006314: DC700004 0000180E
	flat_store_dwordx2 v[14:15], v[12:13] offset:24            // 00000000631C: DC740018 00000C0E
	s_waitcnt lgkmcnt(0)                                       // 000000006324: BF8CC07F
	v_mov_b32_e32 v18, s14                                     // 000000006328: 7E24020E
	v_mov_b32_e32 v19, s15                                     // 00000000632C: 7E26020F
	flat_store_dwordx4 v[14:15], v[18:21] offset:8             // 000000006330: DC7C0008 0000120E
	flat_store_byte v[14:15], v148                             // 000000006338: DC600000 0000940E
	s_branch 65441                                             // 000000006340: BF82FFA1 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3a98>
	s_or_b64 exec, exec, s[42:43]                              // 000000006344: 87FE2A7E
	s_or_b64 exec, exec, s[40:41]                              // 000000006348: 87FE287E
	s_wakeup                                                   // 00000000634C: BF830000
	s_or_b64 exec, exec, s[38:39]                              // 000000006350: 87FE267E
	v_sub_u32_e32 v4, v114, v16                                // 000000006354: 6A082172
	v_min_i32_e32 v115, v115, v4                               // 000000006358: 18E60973
	v_and_b32_e32 v4, 12, v55                                  // 00000000635C: 26086E8C
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000006360: D0CD000E 00020880
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000006368: BE90200E
	s_cbranch_execz 65                                         // 00000000636C: BF880041 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3d44>
	v_and_b32_e32 v4, 0x100, v55                               // 000000006370: 26086EFF 00000100
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000006378: D0CD000E 00020880
	s_xor_b64 s[38:39], vcc, -1                                // 000000006380: 88A6C16A
	s_and_b64 s[14:15], s[38:39], s[14:15]                     // 000000006384: 868E0E26
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 000000006388: BEA6200E
	s_xor_b64 s[38:39], exec, s[38:39]                         // 00000000638C: 88A6267E
	s_cbranch_execz 13                                         // 000000006390: BF88000D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3c98>
	v_and_b32_e32 v52, 7, v28                                  // 000000006394: 26683887
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000006398: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v8, v4                      // 0000000063A0: D1190E04 00020908
	v_lshlrev_b32_e32 v10, 2, v115                             // 0000000063A8: 2414E682
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]           // 0000000063AC: D11C0E05 003A0B09
	buffer_wbl2                                                // 0000000063B4: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000063BC: BF8C0070
	flat_store_dword v[4:5], v10                               // 0000000063C0: DC700000 00000A04
	s_andn2_saveexec_b64 s[14:15], s[38:39]                    // 0000000063C8: BE8E2326
	v_and_b32_e32 v52, 7, v28                                  // 0000000063CC: 26683887
	s_or_b64 exec, exec, s[14:15]                              // 0000000063D0: 87FE0E7E
	v_and_b32_e32 v4, 0x80, v55                                // 0000000063D4: 26086EFF 00000080
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 0000000063DC: D0CD000E 00020880
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 0000000063E4: BEA6200E
	s_xor_b64 s[38:39], exec, s[38:39]                         // 0000000063E8: 88A6267E
	s_cbranch_execz 12                                         // 0000000063EC: BF88000C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3cf0>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 0000000063F0: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v30, v4                     // 0000000063F8: D1190E04 0002091E
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]          // 000000006400: D11C0E05 003A0B1F
	flat_load_dwordx2 v[4:5], v[4:5] glc                       // 000000006408: DC550000 04000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006410: BF8C0070
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000006414: 220A089F
	v_lshrrev_b64 v[4:5], 2, v[4:5]                            // 000000006418: D2900004 00020882
	s_andn2_saveexec_b64 s[14:15], s[38:39]                    // 000000006420: BE8E2326
	v_mul_lo_u32 v10, v53, s24                                 // 000000006424: D285000A 00003135
	v_mul_lo_u32 v11, v52, s13                                 // 00000000642C: D285000B 00001B34
	v_mad_u64_u32 v[4:5], s[38:39], v52, s24, 0                // 000000006434: D1E82604 02003134
	v_add3_u32 v5, v5, v11, v10                                // 00000000643C: D1FF0005 042A1705
	s_or_b64 exec, exec, s[14:15]                              // 000000006444: 87FE0E7E
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 000000006448: D28F0004 00020882
	v_cndmask_b32_e32 v10, v151, v147, vcc                     // 000000006450: 00152797
	v_add_co_u32_e32 v4, vcc, v38, v4                          // 000000006454: 32080926
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc                     // 000000006458: 380A0B01
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 00000000645C: 32383882
	v_lshl_add_u32 v10, v3, 3, v10                             // 000000006460: D1FD000A 04290703
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000006468: 383A3A80
	ds_write_b64 v10, v[4:5]                                   // 00000000646C: D89A0000 0000040A
	s_or_b64 exec, exec, s[16:17]                              // 000000006474: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000006478: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 00000000647C: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000006480: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000006484: 888E0E7E
	s_cbranch_execnz 6                                         // 000000006488: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3d74>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 00000000648C: BE8E230E
	s_cbranch_execnz 16                                        // 000000006490: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3da4>
	s_or_b64 exec, exec, s[14:15]                              // 000000006494: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000006498: BE8E2010
	s_cbranch_execnz 20                                        // 00000000649C: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3dc0>
	s_branch 51                                                // 0000000064A0: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3e40>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 0000000064A4: 7D944031
	s_mov_b64 s[38:39], -1                                     // 0000000064A8: BEA601C1
	s_and_saveexec_b64 s[16:17], vcc                           // 0000000064AC: BE90206A
	s_cbranch_execz 4                                          // 0000000064B0: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3d94>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000064B4: BF8C0070
	s_barrier                                                  // 0000000064B8: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 0000000064BC: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 0000000064C0: 88A6C17E
	s_or_b64 exec, exec, s[16:17]                              // 0000000064C4: 87FE107E
	s_and_b64 s[16:17], s[38:39], exec                         // 0000000064C8: 86907E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 0000000064CC: BE8E230E
	s_cbranch_execz 65520                                      // 0000000064D0: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3d64>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 0000000064D4: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 0000000064D8: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 0000000064DC: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 0000000064E0: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 0000000064E4: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 0000000064E8: BE8E2010
	s_cbranch_execz 32                                         // 0000000064EC: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3e40>
	s_and_b64 exec, exec, s[4:5]                               // 0000000064F0: 86FE047E
	s_cbranch_execz 30                                         // 0000000064F4: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3e40>
	ds_read_b64 v[4:5], v130                                   // 0000000064F8: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 000000006500: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000006504: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000006508: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 00000000650C: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000006510: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 000000006514: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 00000000651C: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 000000006524: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 00000000652C: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 000000006530: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 000000006534: BE90206A
	s_cbranch_execz 11                                         // 000000006538: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3e38>
	s_mov_b64 s[38:39], 0                                      // 00000000653C: BEA60180
	s_sleep 1                                                  // 000000006540: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 000000006544: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 00000000654C: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 000000006554: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000006558: 7DDC1504
	s_or_b64 s[38:39], vcc, s[38:39]                           // 00000000655C: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 000000006560: 89FE267E
	s_cbranch_execnz 65526                                     // 000000006564: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3e10>
	s_or_b64 exec, exec, s[16:17]                              // 000000006568: 87FE107E
	s_wakeup                                                   // 00000000656C: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000006570: 87FE0E7E
	v_cmp_lt_i32_e32 vcc, 0, v115                              // 000000006574: 7D82E680
	s_and_saveexec_b64 s[16:17], vcc                           // 000000006578: BE90206A
	s_cbranch_execz 239                                        // 00000000657C: BF8800EF <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x420c>
	ds_read_b64 v[18:19], v53 offset:112                       // 000000006580: D8EC0070 12000035
	ds_read_b128 v[10:13], v53 offset:176                      // 000000006588: D9FE00B0 0A000035
	v_mov_b32_e32 v21, 0                                       // 000000006590: 7E2A0280
	s_mov_b64 s[38:39], -1                                     // 000000006594: BEA601C1
	v_mov_b32_e32 v17, v115                                    // 000000006598: 7E220373
	s_waitcnt lgkmcnt(0)                                       // 00000000659C: BF8CC07F
	v_or_b32_e32 v4, v10, v18                                  // 0000000065A0: 2808250A
	v_or_b32_e32 v4, v4, v12                                   // 0000000065A4: 28081904
	v_and_b32_e32 v20, 3, v4                                   // 0000000065A8: 26280883
	v_cmp_ne_u64_e32 vcc, 0, v[20:21]                          // 0000000065AC: 7DDA2880
	s_cbranch_vccz 3                                           // 0000000065B0: BF860003 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3e90>
	s_and_b64 exec, exec, s[38:39]                             // 0000000065B4: 86FE267E
	s_cbranch_execnz 112                                       // 0000000065B8: BF890070 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x404c>
	s_branch 223                                               // 0000000065BC: BF8200DF <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x420c>
	v_lshrrev_b32_e32 v4, 2, v115                              // 0000000065C0: 2008E682
	v_and_b32_e32 v17, 0x3fffff80, v4                          // 0000000065C4: 262208FF 3FFFFF80
	v_cmp_lt_u32_e32 vcc, v68, v17                             // 0000000065CC: 7D922344
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000065D0: BE8E206A
	s_cbranch_execz 38                                         // 0000000065D4: BF880026 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3f40>
	v_lshlrev_b64 v[14:15], 4, v[68:69]                        // 0000000065D8: D28F000E 00028884
	v_add_co_u32_e32 v4, vcc, v10, v14                         // 0000000065E0: 32081D0A
	v_addc_co_u32_e32 v5, vcc, v11, v15, vcc                   // 0000000065E4: 380A1F0B
	v_add_co_u32_e32 v14, vcc, v12, v14                        // 0000000065E8: 321C1D0C
	v_addc_co_u32_e32 v15, vcc, v13, v15, vcc                  // 0000000065EC: 381E1F0D
	v_lshlrev_b64 v[20:21], 2, v[82:83]                        // 0000000065F0: D28F0014 0002A482
	v_add_co_u32_e32 v20, vcc, v18, v20                        // 0000000065F8: 32282912
	v_addc_co_u32_e32 v21, vcc, v19, v21, vcc                  // 0000000065FC: 382A2B13
	s_mov_b64 s[38:39], 0                                      // 000000006600: BEA60180
	v_mov_b32_e32 v22, v68                                     // 000000006604: 7E2C0344
	flat_load_dwordx4 v[160:163], v[20:21] glc slc             // 000000006608: DC5F0000 A0000014
	flat_load_dwordx4 v[164:167], v[20:21] offset:1024 glc slc // 000000006610: DC5F0400 A4000014
	v_add_co_u32_e32 v20, vcc, v20, v80                        // 000000006618: 3228A114
	v_add_u32_e32 v22, v22, v50                                // 00000000661C: 682C6516
	v_addc_co_u32_e32 v21, vcc, v21, v81, vcc                  // 000000006620: 382AA315
	v_lshlrev_b64 v[176:177], 4, v[50:51]                      // 000000006624: D28F00B0 00026484
	v_cmp_ge_u32_e32 vcc, v22, v17                             // 00000000662C: 7D9C2316
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000006630: 87A6266A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006634: BF8C0070
	flat_store_dwordx4 v[4:5], v[160:163] glc slc              // 000000006638: DC7F0000 0000A004
	flat_store_dwordx4 v[4:5], v[164:167] offset:1024 glc slc  // 000000006640: DC7F0400 0000A404
	flat_store_dwordx4 v[14:15], v[160:163] glc slc            // 000000006648: DC7F0000 0000A00E
	flat_store_dwordx4 v[14:15], v[164:167] offset:1024 glc slc// 000000006650: DC7F0400 0000A40E
	v_add_co_u32_e32 v4, vcc, v4, v176                         // 000000006658: 32096104
	v_addc_co_u32_e32 v5, vcc, v5, v177, vcc                   // 00000000665C: 380B6305
	v_add_co_u32_e32 v14, vcc, v14, v176                       // 000000006660: 321D610E
	v_addc_co_u32_e32 v15, vcc, v15, v177, vcc                 // 000000006664: 381F630F
	s_andn2_b64 exec, exec, s[38:39]                           // 000000006668: 89FE267E
	s_cbranch_execnz 65510                                     // 00000000666C: BF89FFE6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3ed8>
	s_or_b64 exec, exec, s[14:15]                              // 000000006670: 87FE0E7E
	v_lshlrev_b32_e32 v52, 2, v17                              // 000000006674: 24682282
	v_cmp_ne_u32_e32 vcc, v115, v52                            // 000000006678: 7D9A6973
	s_mov_b64 s[38:39], 0                                      // 00000000667C: BEA60180
	v_mov_b32_e32 v17, 0                                       // 000000006680: 7E220280
	v_mov_b32_e32 v21, 0                                       // 000000006684: 7E2A0280
	s_and_saveexec_b64 s[14:15], vcc                           // 000000006688: BE8E206A
	s_cbranch_execz 56                                         // 00000000668C: BF880038 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4040>
	v_sub_u32_e32 v22, v115, v52                               // 000000006690: 6A2C6973
	v_ashrrev_i32_e32 v17, 2, v22                              // 000000006694: 22222C82
	v_cmp_lt_i32_e32 vcc, v24, v17                             // 000000006698: 7D822318
	s_and_saveexec_b64 s[38:39], vcc                           // 00000000669C: BEA6206A
	s_cbranch_execz 38                                         // 0000000066A0: BF880026 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x400c>
	v_lshlrev_b64 v[14:15], 2, v[52:53]                        // 0000000066A4: D28F000E 00026882
	v_add_co_u32_e32 v4, vcc, v18, v14                         // 0000000066AC: 32081D12
	v_addc_co_u32_e32 v5, vcc, v19, v15, vcc                   // 0000000066B0: 380A1F13
	v_lshlrev_b64 v[160:161], 4, v[24:25]                      // 0000000066B4: D28F00A0 00023084
	v_add_co_u32_e32 v20, vcc, v4, v160                        // 0000000066BC: 32294104
	v_addc_co_u32_e32 v21, vcc, v5, v161, vcc                  // 0000000066C0: 382B4305
	v_add_co_u32_e32 v4, vcc, v10, v14                         // 0000000066C4: 32081D0A
	v_addc_co_u32_e32 v5, vcc, v11, v15, vcc                   // 0000000066C8: 380A1F0B
	v_add_co_u32_e32 v4, vcc, v4, v160                         // 0000000066CC: 32094104
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc                   // 0000000066D0: 380B4305
	v_add_co_u32_e32 v14, vcc, v12, v14                        // 0000000066D4: 321C1D0C
	v_addc_co_u32_e32 v15, vcc, v13, v15, vcc                  // 0000000066D8: 381E1F0D
	v_add_co_u32_e32 v14, vcc, v14, v160                       // 0000000066DC: 321D410E
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc                 // 0000000066E0: 381F430F
	s_mov_b64 s[40:41], 0                                      // 0000000066E4: BEA80180
	v_mov_b32_e32 v23, v24                                     // 0000000066E8: 7E2E0318
	flat_load_dwordx4 v[160:163], v[20:21] glc slc             // 0000000066EC: DC5F0000 A0000014
	v_lshlrev_b64 v[164:165], 4, v[32:33]                      // 0000000066F4: D28F00A4 00024084
	v_add_co_u32_e32 v20, vcc, v20, v164                       // 0000000066FC: 32294914
	v_add_u32_e32 v23, v23, v32                                // 000000006700: 682E4117
	v_addc_co_u32_e32 v21, vcc, v21, v165, vcc                 // 000000006704: 382B4B15
	v_cmp_ge_i32_e32 vcc, v23, v17                             // 000000006708: 7D8C2317
	s_or_b64 s[40:41], vcc, s[40:41]                           // 00000000670C: 87A8286A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006710: BF8C0070
	flat_store_dwordx4 v[4:5], v[160:163] glc slc              // 000000006714: DC7F0000 0000A004
	flat_store_dwordx4 v[14:15], v[160:163] glc slc            // 00000000671C: DC7F0000 0000A00E
	v_add_co_u32_e32 v4, vcc, v4, v164                         // 000000006724: 32094904
	v_addc_co_u32_e32 v5, vcc, v5, v165, vcc                   // 000000006728: 380B4B05
	v_add_co_u32_e32 v14, vcc, v14, v164                       // 00000000672C: 321D490E
	v_addc_co_u32_e32 v15, vcc, v15, v165, vcc                 // 000000006730: 381F4B0F
	s_andn2_b64 exec, exec, s[40:41]                           // 000000006734: 89FE287E
	s_cbranch_execnz 65516                                     // 000000006738: BF89FFEC <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3fbc>
	s_or_b64 exec, exec, s[38:39]                              // 00000000673C: 87FE267E
	v_and_b32_e32 v4, 3, v22                                   // 000000006740: 26082C83
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000006744: 7D9A0880
	s_mov_b64 s[38:39], 0                                      // 000000006748: BEA60180
	v_mov_b32_e32 v17, 0                                       // 00000000674C: 7E220280
	s_and_saveexec_b64 s[40:41], vcc                           // 000000006750: BEA8206A
	v_and_b32_e32 v5, -4, v22                                  // 000000006754: 260A2CC4
	s_mov_b64 s[38:39], exec                                   // 000000006758: BEA6017E
	v_add_u32_e32 v52, v5, v52                                 // 00000000675C: 68686905
	v_mov_b32_e32 v17, v4                                      // 000000006760: 7E220304
	s_or_b64 exec, exec, s[40:41]                              // 000000006764: 87FE287E
	s_and_b64 s[38:39], s[38:39], exec                         // 000000006768: 86A67E26
	v_mov_b32_e32 v21, v52                                     // 00000000676C: 7E2A0334
	s_or_b64 exec, exec, s[14:15]                              // 000000006770: 87FE0E7E
	s_and_b64 exec, exec, s[38:39]                             // 000000006774: 86FE267E
	s_cbranch_execz 112                                        // 000000006778: BF880070 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x420c>
	v_and_b32_e32 v20, 0xffffff00, v17                         // 00000000677C: 262822FF FFFFFF00
	v_cmp_lt_i32_e32 vcc, v66, v20                             // 000000006784: 7D822942
	s_and_saveexec_b64 s[14:15], vcc                           // 000000006788: BE8E206A
	s_cbranch_execz 58                                         // 00000000678C: BF88003A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4148>
	v_lshlrev_b64 v[14:15], 2, v[66:67]                        // 000000006790: D28F000E 00028482
	v_ashrrev_i32_e32 v5, 31, v21                              // 000000006798: 220A2A9F
	v_mov_b32_e32 v4, v21                                      // 00000000679C: 7E080315
	v_add_co_u32_e32 v22, vcc, v18, v14                        // 0000000067A0: 322C1D12
	v_addc_co_u32_e32 v23, vcc, v19, v15, vcc                  // 0000000067A4: 382E1F13
	v_lshlrev_b64 v[160:161], 2, v[4:5]                        // 0000000067A8: D28F00A0 00020882
	v_add_co_u32_e32 v22, vcc, v22, v160                       // 0000000067B0: 322D4116
	v_addc_co_u32_e32 v23, vcc, v23, v161, vcc                 // 0000000067B4: 382F4317
	v_add_co_u32_e32 v4, vcc, v10, v14                         // 0000000067B8: 32081D0A
	v_addc_co_u32_e32 v5, vcc, v11, v15, vcc                   // 0000000067BC: 380A1F0B
	v_add_co_u32_e32 v4, vcc, v4, v160                         // 0000000067C0: 32094104
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc                   // 0000000067C4: 380B4305
	v_add_co_u32_e32 v14, vcc, v12, v14                        // 0000000067C8: 321C1D0C
	v_addc_co_u32_e32 v15, vcc, v13, v15, vcc                  // 0000000067CC: 381E1F0D
	v_add_co_u32_e32 v14, vcc, v14, v160                       // 0000000067D0: 321D410E
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc                 // 0000000067D4: 381F430F
	s_mov_b64 s[38:39], 0                                      // 0000000067D8: BEA60180
	v_mov_b32_e32 v52, v66                                     // 0000000067DC: 7E680342
	flat_load_dword v162, v[22:23] glc slc                     // 0000000067E0: DC530000 A2000016
	flat_load_dword v163, v[22:23] offset:256 glc slc          // 0000000067E8: DC530100 A3000016
	flat_load_dword v164, v[22:23] offset:512 glc slc          // 0000000067F0: DC530200 A4000016
	flat_load_dword v165, v[22:23] offset:768 glc slc          // 0000000067F8: DC530300 A5000016
	v_add_co_u32_e32 v22, vcc, v22, v84                        // 000000006800: 322CA916
	v_add_u32_e32 v52, v52, v64                                // 000000006804: 68688134
	v_addc_co_u32_e32 v23, vcc, v23, v85, vcc                  // 000000006808: 382EAB17
	v_lshlrev_b64 v[160:161], 2, v[64:65]                      // 00000000680C: D28F00A0 00028082
	v_cmp_ge_i32_e32 vcc, v52, v20                             // 000000006814: 7D8C2934
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000006818: 87A6266A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000681C: BF8C0070
	flat_store_dword v[4:5], v162 glc slc                      // 000000006820: DC730000 0000A204
	flat_store_dword v[4:5], v163 offset:256 glc slc           // 000000006828: DC730100 0000A304
	flat_store_dword v[4:5], v164 offset:512 glc slc           // 000000006830: DC730200 0000A404
	flat_store_dword v[4:5], v165 offset:768 glc slc           // 000000006838: DC730300 0000A504
	flat_store_dword v[14:15], v162 glc slc                    // 000000006840: DC730000 0000A20E
	flat_store_dword v[14:15], v163 offset:256 glc slc         // 000000006848: DC730100 0000A30E
	flat_store_dword v[14:15], v164 offset:512 glc slc         // 000000006850: DC730200 0000A40E
	flat_store_dword v[14:15], v165 offset:768 glc slc         // 000000006858: DC730300 0000A50E
	v_add_co_u32_e32 v4, vcc, v4, v160                         // 000000006860: 32094104
	v_addc_co_u32_e32 v5, vcc, v5, v161, vcc                   // 000000006864: 380B4305
	v_add_co_u32_e32 v14, vcc, v14, v160                       // 000000006868: 321D410E
	v_addc_co_u32_e32 v15, vcc, v15, v161, vcc                 // 00000000686C: 381F430F
	s_andn2_b64 exec, exec, s[38:39]                           // 000000006870: 89FE267E
	s_cbranch_execnz 65498                                     // 000000006874: BF89FFDA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x40b0>
	s_or_b64 exec, exec, s[14:15]                              // 000000006878: 87FE0E7E
	v_and_b32_e32 v17, 0xff, v17                               // 00000000687C: 262222FF 000000FF
	v_cmp_ne_u32_e32 vcc, 0, v17                               // 000000006884: 7D9A2280
	v_cmp_lt_u32_e64 s[14:15], v24, v17                        // 000000006888: D0C9000E 00022318
	s_and_b64 s[14:15], vcc, s[14:15]                          // 000000006890: 868E0E6A
	s_and_b64 exec, exec, s[14:15]                             // 000000006894: 86FE0E7E
	s_cbranch_execz 40                                         // 000000006898: BF880028 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x420c>
	v_add_u32_e32 v4, v20, v21                                 // 00000000689C: 68082B14
	v_lshlrev_b64 v[20:21], 2, v[24:25]                        // 0000000068A0: D28F0014 00023082
	v_ashrrev_i32_e32 v5, 31, v4                               // 0000000068A8: 220A089F
	v_add_co_u32_e32 v14, vcc, v18, v20                        // 0000000068AC: 321C2912
	v_addc_co_u32_e32 v15, vcc, v19, v21, vcc                  // 0000000068B0: 381E2B13
	v_lshlrev_b64 v[18:19], 2, v[4:5]                          // 0000000068B4: D28F0012 00020882
	v_add_co_u32_e32 v14, vcc, v14, v18                        // 0000000068BC: 321C250E
	v_addc_co_u32_e32 v15, vcc, v15, v19, vcc                  // 0000000068C0: 381E270F
	v_add_co_u32_e32 v4, vcc, v10, v20                         // 0000000068C4: 3208290A
	v_addc_co_u32_e32 v5, vcc, v11, v21, vcc                   // 0000000068C8: 380A2B0B
	v_add_co_u32_e32 v4, vcc, v4, v18                          // 0000000068CC: 32082504
	v_addc_co_u32_e32 v5, vcc, v5, v19, vcc                    // 0000000068D0: 380A2705
	v_add_co_u32_e32 v10, vcc, v12, v20                        // 0000000068D4: 3214290C
	v_addc_co_u32_e32 v11, vcc, v13, v21, vcc                  // 0000000068D8: 38162B0D
	v_add_co_u32_e32 v10, vcc, v10, v18                        // 0000000068DC: 3214250A
	v_addc_co_u32_e32 v11, vcc, v11, v19, vcc                  // 0000000068E0: 3816270B
	s_mov_b64 s[14:15], 0                                      // 0000000068E4: BE8E0180
	v_mov_b32_e32 v12, v24                                     // 0000000068E8: 7E180318
	flat_load_dword v13, v[14:15] glc slc                      // 0000000068EC: DC530000 0D00000E
	v_add_co_u32_e32 v14, vcc, v14, v64                        // 0000000068F4: 321C810E
	v_add_u32_e32 v12, v12, v32                                // 0000000068F8: 6818410C
	v_addc_co_u32_e32 v15, vcc, 0, v15, vcc                    // 0000000068FC: 381E1E80
	v_lshlrev_b64 v[18:19], 2, v[32:33]                        // 000000006900: D28F0012 00024082
	v_cmp_ge_u32_e32 vcc, v12, v17                             // 000000006908: 7D9C230C
	s_or_b64 s[14:15], vcc, s[14:15]                           // 00000000690C: 878E0E6A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006910: BF8C0070
	flat_store_dword v[4:5], v13 glc slc                       // 000000006914: DC730000 00000D04
	flat_store_dword v[10:11], v13 glc slc                     // 00000000691C: DC730000 00000D0A
	v_add_co_u32_e32 v4, vcc, v4, v18                          // 000000006924: 32082504
	v_addc_co_u32_e32 v5, vcc, v5, v19, vcc                    // 000000006928: 380A2705
	v_add_co_u32_e32 v10, vcc, v10, v18                        // 00000000692C: 3214250A
	v_addc_co_u32_e32 v11, vcc, v11, v19, vcc                  // 000000006930: 3816270B
	s_andn2_b64 exec, exec, s[14:15]                           // 000000006934: 89FE0E7E
	s_cbranch_execnz 65516                                     // 000000006938: BF89FFEC <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x41bc>
	s_or_b64 exec, exec, s[16:17]                              // 00000000693C: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000006940: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 000000006944: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000006948: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 00000000694C: 888E0E7E
	s_cbranch_execnz 6                                         // 000000006950: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x423c>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000006954: BE8E230E
	s_cbranch_execnz 16                                        // 000000006958: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x426c>
	s_or_b64 exec, exec, s[14:15]                              // 00000000695C: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000006960: BE8E2010
	s_cbranch_execnz 20                                        // 000000006964: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4288>
	s_branch 51                                                // 000000006968: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4308>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 00000000696C: 7D944031
	s_mov_b64 s[38:39], -1                                     // 000000006970: BEA601C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000006974: BE90206A
	s_cbranch_execz 4                                          // 000000006978: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x425c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000697C: BF8C0070
	s_barrier                                                  // 000000006980: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000006984: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 000000006988: 88A6C17E
	s_or_b64 exec, exec, s[16:17]                              // 00000000698C: 87FE107E
	s_and_b64 s[16:17], s[38:39], exec                         // 000000006990: 86907E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000006994: BE8E230E
	s_cbranch_execz 65520                                      // 000000006998: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x422c>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 00000000699C: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 0000000069A0: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 0000000069A4: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 0000000069A8: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 0000000069AC: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 0000000069B0: BE8E2010
	s_cbranch_execz 32                                         // 0000000069B4: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4308>
	s_and_b64 exec, exec, s[4:5]                               // 0000000069B8: 86FE047E
	s_cbranch_execz 30                                         // 0000000069BC: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4308>
	ds_read_b64 v[4:5], v130                                   // 0000000069C0: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 0000000069C8: 7E140281
	v_mov_b32_e32 v11, 0                                       // 0000000069CC: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 0000000069D0: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 0000000069D4: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 0000000069D8: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 0000000069DC: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 0000000069E4: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 0000000069EC: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 0000000069F4: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 0000000069F8: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 0000000069FC: BE90206A
	s_cbranch_execz 11                                         // 000000006A00: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4300>
	s_mov_b64 s[38:39], 0                                      // 000000006A04: BEA60180
	s_sleep 1                                                  // 000000006A08: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 000000006A0C: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 000000006A14: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 000000006A1C: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000006A20: 7DDC1504
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000006A24: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 000000006A28: 89FE267E
	s_cbranch_execnz 65526                                     // 000000006A2C: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x42d8>
	s_or_b64 exec, exec, s[16:17]                              // 000000006A30: 87FE107E
	s_wakeup                                                   // 000000006A34: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000006A38: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000006A3C: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000006A40: 7D9A0880
	s_and_b64 s[16:17], vcc, s[6:7]                            // 000000006A44: 8690066A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000006A48: BE8E2010
	s_cbranch_execz 1                                          // 000000006A4C: BF880001 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4324>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006A50: BF8C0070
	s_or_b64 exec, exec, s[14:15]                              // 000000006A54: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000006A58: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000006A5C: 7D9A0880
	s_xor_b64 s[14:15], s[8:9], -1                             // 000000006A60: 888EC108
	s_and_b64 s[16:17], vcc, s[14:15]                          // 000000006A64: 86900E6A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000006A68: BE8E2010
	s_cbranch_execz 5                                          // 000000006A6C: BF880005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4354>
	v_mov_b32_e32 v4, 1                                        // 000000006A70: 7E080281
	v_mov_b32_e32 v5, 0                                        // 000000006A74: 7E0A0280
	s_waitcnt lgkmcnt(0)                                       // 000000006A78: BF8CC07F
	flat_store_dwordx2 v[34:35], v[4:5]                        // 000000006A7C: DC740000 00000422
	s_or_b64 exec, exec, s[14:15]                              // 000000006A84: 87FE0E7E
	v_and_b32_e32 v4, 48, v55                                  // 000000006A88: 26086EB0
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000006A8C: 7D9A0880
	s_and_saveexec_b64 s[14:15], vcc                           // 000000006A90: BE8E206A
	s_cbranch_execz 64921                                      // 000000006A94: BF88FD99 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x39cc>
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000006A98: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000006A9C: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 000000006AA0: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 000000006AA4: DC740000 00001C06
	s_branch 64915                                             // 000000006AAC: BF82FD93 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x39cc>
	s_or_b64 exec, exec, s[34:35]                              // 000000006AB0: 87FE227E
	s_or_b64 exec, exec, s[30:31]                              // 000000006AB4: 87FE1E7E
	v_cmp_gt_i32_e32 vcc, 2, v14                               // 000000006AB8: 7D881C82
	s_and_saveexec_b64 s[30:31], vcc                           // 000000006ABC: BE9E206A
	s_cbranch_execz 64896                                      // 000000006AC0: BF88FD80 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x3994>
	s_mov_b64 s[34:35], 0                                      // 000000006AC4: BEA20180
	s_branch 9                                                 // 000000006AC8: BF820009 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x43c0>
	s_or_b64 exec, exec, s[14:15]                              // 000000006ACC: 87FE0E7E
	v_cmp_ne_u32_e32 vcc, 0, v14                               // 000000006AD0: 7D9A1C80
	v_or_b32_e32 v55, 0x800, v55                               // 000000006AD4: 286E6EFF 00000800
	v_add_u32_e32 v16, v115, v16                               // 000000006ADC: 68202173
	s_or_b64 s[34:35], vcc, s[34:35]                           // 000000006AE0: 87A2226A
	v_mov_b32_e32 v14, 1                                       // 000000006AE4: 7E1C0281
	s_andn2_b64 exec, exec, s[34:35]                           // 000000006AE8: 89FE227E
	s_cbranch_execz 282                                        // 000000006AEC: BF88011A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4828>
	v_and_b32_e32 v4, 8, v55                                   // 000000006AF0: 26086E88
	v_and_b32_e32 v5, 12, v55                                  // 000000006AF4: 260A6E8C
	v_cmp_eq_u32_e32 vcc, 0, v4                                // 000000006AF8: 7D940880
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000006AFC: D0CD000E 00020A80
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000006B04: BEA4200E
	s_cbranch_execz 116                                        // 000000006B08: BF880074 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x45ac>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006B0C: BF8C0070
	v_add_co_u32_e64 v12, s[14:15], v36, v4                    // 000000006B10: D1190E0C 00020924
	v_addc_co_u32_e64 v13, s[14:15], 0, v37, s[14:15]          // 000000006B18: D11C0E0D 003A4A80
	v_add_co_u32_e64 v10, s[14:15], 2, v28                     // 000000006B20: D1190E0A 00023882
	v_addc_co_u32_e64 v11, s[14:15], 0, v29, s[14:15]          // 000000006B28: D11C0E0B 003A3A80
	v_cmp_lt_u64_e64 s[14:15], v[12:13], v[10:11]              // 000000006B30: D0E9000E 0002150C
	s_and_saveexec_b64 s[38:39], s[14:15]                      // 000000006B38: BEA6200E
	s_cbranch_execz 101                                        // 000000006B3C: BF880065 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x45a4>
	v_add_u32_e32 v12, 2, v28                                  // 000000006B40: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 000000006B44: 221A189F
	s_mov_b64 s[40:41], 0                                      // 000000006B48: BEA80180
	v_mov_b32_e32 v5, 0                                        // 000000006B4C: 7E0A0280
	s_branch 14                                                // 000000006B50: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x445c>
	s_or_b64 exec, exec, s[42:43]                              // 000000006B54: 87FE2A7E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006B58: BF8C0070
	v_add_co_u32_e64 v18, s[14:15], v36, v4                    // 000000006B5C: D1190E12 00020924
	v_addc_co_u32_e64 v19, s[14:15], 0, v37, s[14:15]          // 000000006B64: D11C0E13 003A4A80
	v_cmp_ge_u64_e64 s[14:15], v[18:19], v[10:11]              // 000000006B6C: D0EE000E 00021512
	s_orn2_b64 s[42:43], s[14:15], exec                        // 000000006B74: 8AAA7E0E
	s_or_b64 exec, exec, s[16:17]                              // 000000006B78: 87FE107E
	s_and_b64 s[14:15], exec, s[42:43]                         // 000000006B7C: 868E2A7E
	s_or_b64 s[40:41], s[14:15], s[40:41]                      // 000000006B80: 87A8280E
	s_andn2_b64 exec, exec, s[40:41]                           // 000000006B84: 89FE287E
	s_cbranch_execz 81                                         // 000000006B88: BF880051 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x45a0>
	s_sleep 1                                                  // 000000006B8C: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006B90: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 000000006B94: DC550000 24000006
	v_add_u32_e32 v5, 1, v5                                    // 000000006B9C: 680A0A81
	v_and_b32_e32 v15, 64, v55                                 // 000000006BA0: 261E6EC0
	v_cmp_eq_u32_e64 s[14:15], 0, v15                          // 000000006BA4: D0CA000E 00021E80
	v_cmp_eq_u32_e64 s[16:17], s52, v5                         // 000000006BAC: D0CA0010 00020A34
	s_and_b64 s[14:15], s[14:15], s[16:17]                     // 000000006BB4: 868E100E
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000006BB8: BE90200E
	s_cbranch_execz 14                                         // 000000006BBC: BF88000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x44c8>
	ds_read_b64 v[18:19], v53 offset:1264                      // 000000006BC0: D8EC04F0 12000035
	s_waitcnt lgkmcnt(0)                                       // 000000006BC8: BF8CC07F
	flat_load_dword v5, v[18:19] glc                           // 000000006BCC: DC510000 05000012
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006BD4: BF8C0070
	v_cmp_ne_u32_e64 s[14:15], 0, v5                           // 000000006BD8: D0CD000E 00020A80
	v_cndmask_b32_e64 v5, 0, 1, s[14:15]                       // 000000006BE0: D1000005 00390280
	v_lshl_or_b32 v55, v5, 6, v55                              // 000000006BE8: D2000037 04DD0D05
	v_and_b32_e32 v15, 64, v55                                 // 000000006BF0: 261E6EC0
	v_mov_b32_e32 v5, 0                                        // 000000006BF4: 7E0A0280
	s_or_b64 exec, exec, s[16:17]                              // 000000006BF8: 87FE107E
	v_cmp_eq_u32_e64 s[14:15], 0, v15                          // 000000006BFC: D0CA000E 00021E80
	s_mov_b64 s[42:43], -1                                     // 000000006C04: BEAA01C1
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000006C08: BE90200E
	s_cbranch_execz 65498                                      // 000000006C0C: BF88FFDA <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4448>
	v_cmp_eq_u32_e64 s[14:15], 0, v5                           // 000000006C10: D0CA000E 00020A80
	s_and_saveexec_b64 s[42:43], s[14:15]                      // 000000006C18: BEAA200E
	s_cbranch_execz 65485                                      // 000000006C1C: BF88FFCD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4424>
	ds_read_b64 v[18:19], v53 offset:1288                      // 000000006C20: D8EC0508 12000035
	v_mov_b32_e32 v17, s12                                     // 000000006C28: 7E22020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006C2C: BF8C0070
	v_add_u32_e32 v20, v4, v36                                 // 000000006C30: 68284904
	v_ashrrev_i32_e32 v21, 31, v20                             // 000000006C34: 222A289F
	buffer_wbl2                                                // 000000006C38: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006C40: BF8C0070
	flat_atomic_add v15, v[18:19], v146 glc                    // 000000006C44: DD090000 0F009212
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006C4C: BF8C0070
	buffer_invl2                                               // 000000006C50: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 000000006C58: E0FC0000 00000000
	ds_read_b64 v[18:19], v53 offset:1280                      // 000000006C60: D8EC0500 12000035
	v_and_b32_e32 v15, 0x1fff, v15                             // 000000006C68: 261E1EFF 00001FFF
	v_lshlrev_b32_e32 v15, 5, v15                              // 000000006C70: 241E1E85
	s_waitcnt lgkmcnt(0)                                       // 000000006C74: BF8CC07F
	v_add_co_u32_e64 v22, s[14:15], v18, v15                   // 000000006C78: D1190E16 00021F12
	v_addc_co_u32_e64 v23, s[14:15], 0, v19, s[14:15]          // 000000006C80: D11C0E17 003A2680
	flat_store_byte v[22:23], v17 offset:1                     // 000000006C88: DC600001 00001116
	s_memrealtime s[14:15]                                     // 000000006C90: C0940380 00000000
	flat_store_short v[22:23], v147 offset:2                   // 000000006C98: DC680002 00009316
	flat_store_dword v[22:23], v24 offset:4                    // 000000006CA0: DC700004 00001816
	flat_store_dwordx2 v[22:23], v[12:13] offset:24            // 000000006CA8: DC740018 00000C16
	s_waitcnt lgkmcnt(0)                                       // 000000006CB0: BF8CC07F
	v_mov_b32_e32 v18, s14                                     // 000000006CB4: 7E24020E
	v_mov_b32_e32 v19, s15                                     // 000000006CB8: 7E26020F
	flat_store_dwordx4 v[22:23], v[18:21] offset:8             // 000000006CBC: DC7C0008 00001216
	flat_store_byte v[22:23], v148                             // 000000006CC4: DC600000 00009416
	s_branch 65441                                             // 000000006CCC: BF82FFA1 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4424>
	s_or_b64 exec, exec, s[40:41]                              // 000000006CD0: 87FE287E
	s_or_b64 exec, exec, s[38:39]                              // 000000006CD4: 87FE267E
	s_wakeup                                                   // 000000006CD8: BF830000
	s_or_b64 exec, exec, s[36:37]                              // 000000006CDC: 87FE247E
	v_and_b32_e32 v4, 12, v55                                  // 000000006CE0: 26086E8C
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000006CE4: D0CD000E 00020880
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000006CEC: BE90200E
	s_cbranch_execz 55                                         // 000000006CF0: BF880037 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x46a0>
	v_and_b32_e32 v4, 0x100, v55                               // 000000006CF4: 26086EFF 00000100
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000006CFC: D0CD000E 00020880
	s_xor_b64 s[36:37], vcc, -1                                // 000000006D04: 88A4C16A
	s_and_b64 s[14:15], s[36:37], s[14:15]                     // 000000006D08: 868E0E24
	v_and_b32_e32 v52, 7, v28                                  // 000000006D0C: 26683887
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000006D10: BEA4200E
	s_cbranch_execz 11                                         // 000000006D14: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4614>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000006D18: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v8, v4                      // 000000006D20: D1190E04 00020908
	v_addc_co_u32_e64 v5, s[14:15], v9, v5, s[14:15]           // 000000006D28: D11C0E05 003A0B09
	buffer_wbl2                                                // 000000006D30: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006D38: BF8C0070
	flat_store_dword v[4:5], v53                               // 000000006D3C: DC700000 00003504
	s_or_b64 exec, exec, s[36:37]                              // 000000006D44: 87FE247E
	v_and_b32_e32 v4, 0x80, v55                                // 000000006D48: 26086EFF 00000080
	v_cmp_ne_u32_e64 s[14:15], 0, v4                           // 000000006D50: D0CD000E 00020880
	s_and_saveexec_b64 s[36:37], s[14:15]                      // 000000006D58: BEA4200E
	s_xor_b64 s[36:37], exec, s[36:37]                         // 000000006D5C: 88A4247E
	s_cbranch_execz 12                                         // 000000006D60: BF88000C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4664>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000006D64: D28F0004 00026882
	v_add_co_u32_e64 v4, s[14:15], v30, v4                     // 000000006D6C: D1190E04 0002091E
	v_addc_co_u32_e64 v5, s[14:15], v31, v5, s[14:15]          // 000000006D74: D11C0E05 003A0B1F
	flat_load_dwordx2 v[4:5], v[4:5] glc                       // 000000006D7C: DC550000 04000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006D84: BF8C0070
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000006D88: 220A089F
	v_lshrrev_b64 v[4:5], 2, v[4:5]                            // 000000006D8C: D2900004 00020882
	s_andn2_saveexec_b64 s[14:15], s[36:37]                    // 000000006D94: BE8E2324
	v_mad_i64_i32 v[4:5], s[36:37], v52, s24, 0                // 000000006D98: D1E92404 02003134
	s_or_b64 exec, exec, s[14:15]                              // 000000006DA0: 87FE0E7E
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 000000006DA4: D28F0004 00020882
	v_cndmask_b32_e32 v10, v151, v147, vcc                     // 000000006DAC: 00152797
	v_add_co_u32_e32 v4, vcc, v38, v4                          // 000000006DB0: 32080926
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc                     // 000000006DB4: 380A0B01
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000006DB8: 32383882
	v_lshl_add_u32 v10, v3, 3, v10                             // 000000006DBC: D1FD000A 04290703
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000006DC4: 383A3A80
	ds_write_b64 v10, v[4:5]                                   // 000000006DC8: D89A0000 0000040A
	s_or_b64 exec, exec, s[16:17]                              // 000000006DD0: 87FE107E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000006DD4: 7D82402E
	s_mov_b64 s[16:17], 0                                      // 000000006DD8: BE900180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000006DDC: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000006DE0: 888E0E7E
	s_cbranch_execnz 6                                         // 000000006DE4: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x46d0>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000006DE8: BE8E230E
	s_cbranch_execnz 16                                        // 000000006DEC: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4700>
	s_or_b64 exec, exec, s[14:15]                              // 000000006DF0: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000006DF4: BE8E2010
	s_cbranch_execnz 20                                        // 000000006DF8: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x471c>
	s_branch 51                                                // 000000006DFC: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x479c>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000006E00: 7D944031
	s_mov_b64 s[36:37], -1                                     // 000000006E04: BEA401C1
	s_and_saveexec_b64 s[16:17], vcc                           // 000000006E08: BE90206A
	s_cbranch_execz 4                                          // 000000006E0C: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x46f0>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006E10: BF8C0070
	s_barrier                                                  // 000000006E14: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000006E18: BF8CC07F
	s_xor_b64 s[36:37], exec, -1                               // 000000006E1C: 88A4C17E
	s_or_b64 exec, exec, s[16:17]                              // 000000006E20: 87FE107E
	s_and_b64 s[16:17], s[36:37], exec                         // 000000006E24: 86907E24
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000006E28: BE8E230E
	s_cbranch_execz 65520                                      // 000000006E2C: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x46c0>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000006E30: 7D9A40C0
	s_andn2_b64 s[16:17], s[16:17], exec                       // 000000006E34: 89907E10
	s_and_b64 vcc, vcc, exec                                   // 000000006E38: 86EA7E6A
	s_or_b64 s[16:17], s[16:17], vcc                           // 000000006E3C: 87906A10
	s_or_b64 exec, exec, s[14:15]                              // 000000006E40: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000006E44: BE8E2010
	s_cbranch_execz 32                                         // 000000006E48: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x479c>
	s_and_b64 exec, exec, s[4:5]                               // 000000006E4C: 86FE047E
	s_cbranch_execz 30                                         // 000000006E50: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x479c>
	ds_read_b64 v[4:5], v130                                   // 000000006E54: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 000000006E5C: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000006E60: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000006E64: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000006E68: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000006E6C: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 000000006E70: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 000000006E78: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 000000006E80: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 000000006E88: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 000000006E8C: 7DD2090A
	s_and_saveexec_b64 s[16:17], vcc                           // 000000006E90: BE90206A
	s_cbranch_execz 11                                         // 000000006E94: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4794>
	s_mov_b64 s[36:37], 0                                      // 000000006E98: BEA40180
	s_sleep 1                                                  // 000000006E9C: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 000000006EA0: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 000000006EA8: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 000000006EB0: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000006EB4: 7DDC1504
	s_or_b64 s[36:37], vcc, s[36:37]                           // 000000006EB8: 87A4246A
	s_andn2_b64 exec, exec, s[36:37]                           // 000000006EBC: 89FE247E
	s_cbranch_execnz 65526                                     // 000000006EC0: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x476c>
	s_or_b64 exec, exec, s[16:17]                              // 000000006EC4: 87FE107E
	s_wakeup                                                   // 000000006EC8: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000006ECC: 87FE0E7E
	v_sub_u32_e32 v4, v114, v16                                // 000000006ED0: 6A082172
	v_min_i32_e32 v115, v115, v4                               // 000000006ED4: 18E60973
	v_and_b32_e32 v4, 16, v55                                  // 000000006ED8: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000006EDC: 7D9A0880
	v_cmp_lt_i32_e64 s[14:15], 0, v115                         // 000000006EE0: D0C1000E 0002E680
	s_and_b64 s[14:15], vcc, s[14:15]                          // 000000006EE8: 868E0E6A
	s_and_b64 s[16:17], s[14:15], s[6:7]                       // 000000006EEC: 8690060E
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000006EF0: BE8E2010
	s_cbranch_execz 1                                          // 000000006EF4: BF880001 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x47cc>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000006EF8: BF8C0070
	s_or_b64 exec, exec, s[14:15]                              // 000000006EFC: 87FE0E7E
	v_and_b32_e32 v4, 16, v55                                  // 000000006F00: 26086E90
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000006F04: 7D9A0880
	s_xor_b64 s[14:15], s[8:9], -1                             // 000000006F08: 888EC108
	s_and_b64 s[16:17], vcc, s[14:15]                          // 000000006F0C: 86900E6A
	s_and_saveexec_b64 s[14:15], s[16:17]                      // 000000006F10: BE8E2010
	s_cbranch_execz 5                                          // 000000006F14: BF880005 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x47fc>
	v_mov_b32_e32 v4, 1                                        // 000000006F18: 7E080281
	v_mov_b32_e32 v5, 0                                        // 000000006F1C: 7E0A0280
	s_waitcnt lgkmcnt(0)                                       // 000000006F20: BF8CC07F
	flat_store_dwordx2 v[34:35], v[4:5]                        // 000000006F24: DC740000 00000422
	s_or_b64 exec, exec, s[14:15]                              // 000000006F2C: 87FE0E7E
	v_and_b32_e32 v4, 48, v55                                  // 000000006F30: 26086EB0
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000006F34: 7D9A0880
	s_and_saveexec_b64 s[14:15], vcc                           // 000000006F38: BE8E206A
	s_cbranch_execz 65251                                      // 000000006F3C: BF88FEE3 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x439c>
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000006F40: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000006F44: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 000000006F48: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 000000006F4C: DC740000 00001C06
	s_branch 65245                                             // 000000006F54: BF82FEDD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x439c>
	s_or_b64 exec, exec, s[34:35]                              // 000000006F58: 87FE227E
	s_or_b64 exec, exec, s[30:31]                              // 000000006F5C: 87FE1E7E
	s_add_i32 s14, s53, 1                                      // 000000006F60: 810E8135
	s_cmp_eq_u32 s53, s50                                      // 000000006F64: BF063235
	s_cbranch_scc1 2                                           // 000000006F68: BF850002 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4844>
	s_mov_b32 s53, s14                                         // 000000006F6C: BEB5000E
	s_branch 64558                                             // 000000006F70: BF82FC2E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x38fc>
	v_mad_u64_u32 v[4:5], s[14:15], v112, v135, v[102:103]     // 000000006F74: D1E80E04 059B0F70
	v_mul_lo_u32 v10, v112, v144                               // 000000006F7C: D285000A 00032170
	v_mul_lo_u32 v11, v113, v135                               // 000000006F84: D285000B 00030F71
	v_add3_u32 v5, v11, v5, v10                                // 000000006F8C: D1FF0005 042A0B0B
	v_sub_co_u32_e32 v10, vcc, v26, v4                         // 000000006F94: 3414091A
	v_subb_co_u32_e32 v11, vcc, v27, v5, vcc                   // 000000006F98: 3A160B1B
	v_cmp_lt_i64_e32 vcc, v[112:113], v[10:11]                 // 000000006F9C: 7DC21570
	v_cndmask_b32_e32 v10, v10, v112, vcc                      // 000000006FA0: 0014E10A
	v_cmp_lt_i32_e32 vcc, 0, v10                               // 000000006FA4: 7D821480
	s_and_b64 s[14:15], s[28:29], vcc                          // 000000006FA8: 868E6A1C
	v_mov_b32_e32 v12, 0                                       // 000000006FAC: 7E180280
	s_and_saveexec_b64 s[16:17], s[14:15]                      // 000000006FB0: BE90200E
	s_cbranch_execz 531                                        // 000000006FB4: BF880213 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x50d4>
	v_max_i32_e32 v18, 0, v10                                  // 000000006FB8: 1A241480
	v_add_u32_e32 v10, 31, v18                                 // 000000006FBC: 6814249F
	v_ashrrev_i32_e32 v11, 31, v10                             // 000000006FC0: 2216149F
	v_lshrrev_b32_e32 v11, 27, v11                             // 000000006FC4: 2016169B
	v_add_u32_e32 v10, v10, v11                                // 000000006FC8: 6814170A
	v_ashrrev_i32_e32 v10, 5, v10                              // 000000006FCC: 22141485
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 000000006FD0: D28F0004 00020882
	v_lshlrev_b32_e32 v10, 4, v10                              // 000000006FD8: 24141484
	v_add_co_u32_e32 v20, vcc, v38, v4                         // 000000006FDC: 32280926
	v_max_i32_e32 v19, s48, v10                                // 000000006FE0: 1A261430
	v_addc_co_u32_e32 v21, vcc, v1, v5, vcc                    // 000000006FE4: 382A0B01
	s_mov_b32 s44, 1                                           // 000000006FE8: BEAC0081
	s_mov_b64 s[34:35], -1                                     // 000000006FEC: BEA201C1
	s_mov_b64 s[30:31], 0                                      // 000000006FF0: BE9E0180
	v_mov_b32_e32 v4, 0                                        // 000000006FF4: 7E080280
	s_branch 14                                                // 000000006FF8: BF82000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4904>
	s_or_b64 exec, exec, s[14:15]                              // 000000006FFC: 87FE0E7E
	v_add_u32_e32 v4, v19, v4                                  // 000000007000: 68080913
	v_cmp_ge_i32_e32 vcc, v4, v18                              // 000000007004: 7D8C2504
	s_xor_b64 s[14:15], s[34:35], -1                           // 000000007008: 888EC122
	s_or_b64 s[14:15], s[14:15], vcc                           // 00000000700C: 878E6A0E
	s_and_b64 s[14:15], exec, s[14:15]                         // 000000007010: 868E0E7E
	v_or_b32_e32 v55, 0x800, v55                               // 000000007014: 286E6EFF 00000800
	s_or_b64 s[30:31], s[14:15], s[30:31]                      // 00000000701C: 879E1E0E
	s_mov_b64 s[34:35], 0                                      // 000000007020: BEA20180
	v_mov_b32_e32 v12, s44                                     // 000000007024: 7E18022C
	s_mov_b32 s44, 2                                           // 000000007028: BEAC0082
	s_andn2_b64 exec, exec, s[30:31]                           // 00000000702C: 89FE1E7E
	s_cbranch_execz 499                                        // 000000007030: BF8801F3 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x50d0>
	v_and_b32_e32 v5, 2, v55                                   // 000000007034: 260A6E82
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000007038: 7D9A0A80
	s_and_saveexec_b64 s[14:15], vcc                           // 00000000703C: BE8E206A
	s_cbranch_execz 7                                          // 000000007040: BF880007 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4930>
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000007044: 220A089F
	v_lshlrev_b64 v[10:11], 2, v[4:5]                          // 000000007048: D28F000A 00020882
	v_add_co_u32_e32 v10, vcc, v20, v10                        // 000000007050: 32141514
	v_addc_co_u32_e32 v11, vcc, v21, v11, vcc                  // 000000007054: 38161715
	ds_write_b64 v53, v[10:11] offset:176                      // 000000007058: D89A00B0 00000A35
	s_or_b64 exec, exec, s[14:15]                              // 000000007060: 87FE0E7E
	v_and_b32_e32 v5, 4, v55                                   // 000000007064: 260A6E84
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000007068: 7D9A0A80
	s_mov_b64 s[14:15], -1                                     // 00000000706C: BE8E01C1
	s_and_saveexec_b64 s[36:37], vcc                           // 000000007070: BEA4206A
	s_cbranch_execz 102                                        // 000000007074: BF880066 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4ae0>
	v_add_co_u32_e32 v10, vcc, 2, v28                          // 000000007078: 32143882
	v_addc_co_u32_e32 v11, vcc, 0, v29, vcc                    // 00000000707C: 38163A80
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007080: BF8C0070
	v_cmp_lt_u64_e32 vcc, v[36:37], v[10:11]                   // 000000007084: 7DD21524
	v_mov_b32_e32 v5, 1                                        // 000000007088: 7E0A0281
	s_and_saveexec_b64 s[38:39], vcc                           // 00000000708C: BEA6206A
	s_cbranch_execz 91                                         // 000000007090: BF88005B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4ad0>
	v_add_u32_e32 v12, 2, v28                                  // 000000007094: 68183882
	v_ashrrev_i32_e32 v13, 31, v12                             // 000000007098: 221A189F
	s_mov_b64 s[40:41], 0                                      // 00000000709C: BEA80180
	v_mov_b32_e32 v5, 0                                        // 0000000070A0: 7E0A0280
	s_branch 9                                                 // 0000000070A4: BF820009 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x499c>
	s_or_b64 exec, exec, s[42:43]                              // 0000000070A8: 87FE2A7E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000070AC: BF8C0070
	v_cmp_ge_u64_e32 vcc, v[36:37], v[10:11]                   // 0000000070B0: 7DDC1524
	s_orn2_b64 s[42:43], vcc, exec                             // 0000000070B4: 8AAA7E6A
	s_or_b64 exec, exec, s[14:15]                              // 0000000070B8: 87FE0E7E
	s_and_b64 s[14:15], exec, s[42:43]                         // 0000000070BC: 868E2A7E
	s_or_b64 s[40:41], s[14:15], s[40:41]                      // 0000000070C0: 87A8280E
	s_andn2_b64 exec, exec, s[40:41]                           // 0000000070C4: 89FE287E
	s_cbranch_execz 75                                         // 0000000070C8: BF88004B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4ac8>
	s_sleep 1                                                  // 0000000070CC: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000070D0: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 0000000070D4: DC550000 24000006
	v_add_u32_e32 v5, 1, v5                                    // 0000000070DC: 680A0A81
	v_and_b32_e32 v14, 64, v55                                 // 0000000070E0: 261C6EC0
	v_cmp_eq_u32_e32 vcc, 0, v14                               // 0000000070E4: 7D941C80
	v_cmp_eq_u32_e64 s[14:15], s52, v5                         // 0000000070E8: D0CA000E 00020A34
	s_and_b64 vcc, vcc, s[14:15]                               // 0000000070F0: 86EA0E6A
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000070F4: BE8E206A
	s_cbranch_execz 13                                         // 0000000070F8: BF88000D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4a00>
	ds_read_b64 v[14:15], v53 offset:1264                      // 0000000070FC: D8EC04F0 0E000035
	s_waitcnt lgkmcnt(0)                                       // 000000007104: BF8CC07F
	flat_load_dword v5, v[14:15] glc                           // 000000007108: DC510000 0500000E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007110: BF8C0070
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000007114: 7D9A0A80
	v_cndmask_b32_e64 v5, 0, 1, vcc                            // 000000007118: D1000005 01A90280
	v_lshl_or_b32 v55, v5, 6, v55                              // 000000007120: D2000037 04DD0D05
	v_and_b32_e32 v14, 64, v55                                 // 000000007128: 261C6EC0
	v_mov_b32_e32 v5, 0                                        // 00000000712C: 7E0A0280
	s_or_b64 exec, exec, s[14:15]                              // 000000007130: 87FE0E7E
	v_cmp_eq_u32_e32 vcc, 0, v14                               // 000000007134: 7D941C80
	s_mov_b64 s[42:43], -1                                     // 000000007138: BEAA01C1
	s_and_saveexec_b64 s[14:15], vcc                           // 00000000713C: BE8E206A
	s_cbranch_execz 65501                                      // 000000007140: BF88FFDD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4988>
	v_cmp_eq_u32_e32 vcc, 0, v5                                // 000000007144: 7D940A80
	s_and_saveexec_b64 s[42:43], vcc                           // 000000007148: BEAA206A
	s_cbranch_execz 65494                                      // 00000000714C: BF88FFD6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4978>
	ds_read_b64 v[14:15], v53 offset:1288                      // 000000007150: D8EC0508 0E000035
	v_mov_b32_e32 v52, s12                                     // 000000007158: 7E68020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000715C: BF8C0070
	v_ashrrev_i32_e32 v17, 31, v36                             // 000000007160: 2222489F
	buffer_wbl2                                                // 000000007164: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 00000000716C: BF8C0070
	flat_atomic_add v16, v[14:15], v146 glc                    // 000000007170: DD090000 1000920E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007178: BF8C0070
	buffer_invl2                                               // 00000000717C: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 000000007184: E0FC0000 00000000
	ds_read_b64 v[14:15], v53 offset:1280                      // 00000000718C: D8EC0500 0E000035
	v_and_b32_e32 v16, 0x1fff, v16                             // 000000007194: 262020FF 00001FFF
	v_lshlrev_b32_e32 v16, 5, v16                              // 00000000719C: 24202085
	s_waitcnt lgkmcnt(0)                                       // 0000000071A0: BF8CC07F
	v_add_co_u32_e32 v22, vcc, v14, v16                        // 0000000071A4: 322C210E
	v_addc_co_u32_e32 v23, vcc, 0, v15, vcc                    // 0000000071A8: 382E1E80
	flat_store_byte v[22:23], v52 offset:1                     // 0000000071AC: DC600001 00003416
	s_memrealtime vcc                                          // 0000000071B4: C0941A80 00000000
	v_mov_b32_e32 v16, v36                                     // 0000000071BC: 7E200324
	flat_store_short v[22:23], v147 offset:2                   // 0000000071C0: DC680002 00009316
	flat_store_dword v[22:23], v24 offset:4                    // 0000000071C8: DC700004 00001816
	flat_store_dwordx2 v[22:23], v[12:13] offset:24            // 0000000071D0: DC740018 00000C16
	s_waitcnt lgkmcnt(0)                                       // 0000000071D8: BF8CC07F
	v_mov_b32_e32 v14, vcc_lo                                  // 0000000071DC: 7E1C026A
	v_mov_b32_e32 v15, vcc_hi                                  // 0000000071E0: 7E1E026B
	flat_store_dwordx4 v[22:23], v[14:17] offset:8             // 0000000071E4: DC7C0008 00000E16
	flat_store_byte v[22:23], v148                             // 0000000071EC: DC600000 00009416
	s_branch 65452                                             // 0000000071F4: BF82FFAC <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4978>
	s_or_b64 exec, exec, s[40:41]                              // 0000000071F8: 87FE287E
	v_and_b32_e32 v5, 4, v55                                   // 0000000071FC: 260A6E84
	s_or_b64 exec, exec, s[38:39]                              // 000000007200: 87FE267E
	v_cmp_eq_u32_e32 vcc, 0, v5                                // 000000007204: 7D940A80
	s_orn2_b64 s[14:15], vcc, exec                             // 000000007208: 8A8E7E6A
	s_wakeup                                                   // 00000000720C: BF830000
	s_or_b64 exec, exec, s[36:37]                              // 000000007210: 87FE247E
	s_xor_b64 vcc, s[14:15], -1                                // 000000007214: 88EAC10E
	s_and_saveexec_b64 s[14:15], vcc                           // 000000007218: BE8E206A
	s_cbranch_execz 29                                         // 00000000721C: BF88001D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4b64>
	v_and_b32_e32 v5, 0x80, v55                                // 000000007220: 260A6EFF 00000080
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 000000007228: 7D9A0A80
	v_and_b32_e32 v52, 7, v28                                  // 00000000722C: 26683887
	s_and_saveexec_b64 s[36:37], vcc                           // 000000007230: BEA4206A
	s_xor_b64 s[36:37], exec, s[36:37]                         // 000000007234: 88A4247E
	s_cbranch_execz 10                                         // 000000007238: BF88000A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4b34>
	v_lshlrev_b64 v[10:11], 2, v[52:53]                        // 00000000723C: D28F000A 00026882
	v_add_co_u32_e32 v10, vcc, v30, v10                        // 000000007244: 3214151E
	v_addc_co_u32_e32 v11, vcc, v31, v11, vcc                  // 000000007248: 3816171F
	flat_load_dwordx2 v[10:11], v[10:11] glc                   // 00000000724C: DC550000 0A00000A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007254: BF8C0070
	v_ashrrev_i32_e32 v11, 31, v10                             // 000000007258: 2216149F
	v_lshrrev_b64 v[10:11], 2, v[10:11]                        // 00000000725C: D290000A 00021482
	s_andn2_saveexec_b64 vcc, s[36:37]                         // 000000007264: BEEA2324
	v_mad_i64_i32 v[10:11], s[36:37], v52, s24, 0              // 000000007268: D1E9240A 02003134
	s_or_b64 exec, exec, vcc                                   // 000000007270: 87FE6A7E
	v_lshlrev_b64 v[10:11], 2, v[10:11]                        // 000000007274: D28F000A 00021482
	v_add_co_u32_e32 v10, vcc, v38, v10                        // 00000000727C: 32141526
	v_addc_co_u32_e32 v11, vcc, v1, v11, vcc                   // 000000007280: 38161701
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000007284: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000007288: 383A3A80
	ds_write_b64 v145, v[10:11]                                // 00000000728C: D89A0000 00000A91
	s_or_b64 exec, exec, s[14:15]                              // 000000007294: 87FE0E7E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000007298: 7D82402E
	s_mov_b64 s[36:37], 0                                      // 00000000729C: BEA40180
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000072A0: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 0000000072A4: 888E0E7E
	s_cbranch_execnz 6                                         // 0000000072A8: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4b94>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 0000000072AC: BE8E230E
	s_cbranch_execnz 16                                        // 0000000072B0: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4bc4>
	s_or_b64 exec, exec, s[14:15]                              // 0000000072B4: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[36:37]                      // 0000000072B8: BE8E2024
	s_cbranch_execnz 20                                        // 0000000072BC: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4be0>
	s_branch 51                                                // 0000000072C0: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4c60>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 0000000072C4: 7D944031
	s_mov_b64 s[38:39], -1                                     // 0000000072C8: BEA601C1
	s_and_saveexec_b64 s[36:37], vcc                           // 0000000072CC: BEA4206A
	s_cbranch_execz 4                                          // 0000000072D0: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4bb4>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000072D4: BF8C0070
	s_barrier                                                  // 0000000072D8: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 0000000072DC: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 0000000072E0: 88A6C17E
	s_or_b64 exec, exec, s[36:37]                              // 0000000072E4: 87FE247E
	s_and_b64 s[36:37], s[38:39], exec                         // 0000000072E8: 86A47E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 0000000072EC: BE8E230E
	s_cbranch_execz 65520                                      // 0000000072F0: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4b84>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 0000000072F4: 7D9A40C0
	s_andn2_b64 s[36:37], s[36:37], exec                       // 0000000072F8: 89A47E24
	s_and_b64 vcc, vcc, exec                                   // 0000000072FC: 86EA7E6A
	s_or_b64 s[36:37], s[36:37], vcc                           // 000000007300: 87A46A24
	s_or_b64 exec, exec, s[14:15]                              // 000000007304: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[36:37]                      // 000000007308: BE8E2024
	s_cbranch_execz 32                                         // 00000000730C: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4c60>
	s_and_b64 exec, exec, s[4:5]                               // 000000007310: 86FE047E
	s_cbranch_execz 30                                         // 000000007314: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4c60>
	ds_read_b64 v[10:11], v130                                 // 000000007318: D8EC0000 0A000082
	v_mov_b32_e32 v12, 1                                       // 000000007320: 7E180281
	v_mov_b32_e32 v13, 0                                       // 000000007324: 7E1A0280
	s_waitcnt lgkmcnt(0)                                       // 000000007328: BF8CC07F
	v_add_co_u32_e32 v10, vcc, v10, v0                         // 00000000732C: 3214010A
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 000000007330: 38161680
	ds_write_b64 v130, v[10:11]                                // 000000007334: D89A0000 00000A82
	ds_add_u64 v53, v[12:13] offset:248                        // 00000000733C: D88000F8 00000C35
	ds_read_b64 v[12:13], v53 offset:248                       // 000000007344: D8EC00F8 0C000035
	s_waitcnt lgkmcnt(0)                                       // 00000000734C: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]                   // 000000007350: 7DD2150C
	s_and_saveexec_b64 s[36:37], vcc                           // 000000007354: BEA4206A
	s_cbranch_execz 11                                         // 000000007358: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4c58>
	s_mov_b64 s[38:39], 0                                      // 00000000735C: BEA60180
	s_sleep 1                                                  // 000000007360: BF8E0001
	ds_read_b64 v[10:11], v53 offset:248                       // 000000007364: D8EC00F8 0A000035
	ds_read_b64 v[12:13], v130                                 // 00000000736C: D8EC0000 0C000082
	s_waitcnt lgkmcnt(0)                                       // 000000007374: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]                   // 000000007378: 7DDC190A
	s_or_b64 s[38:39], vcc, s[38:39]                           // 00000000737C: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 000000007380: 89FE267E
	s_cbranch_execnz 65526                                     // 000000007384: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4c30>
	s_or_b64 exec, exec, s[36:37]                              // 000000007388: 87FE247E
	s_wakeup                                                   // 00000000738C: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000007390: 87FE0E7E
	v_sub_u32_e32 v5, v18, v4                                  // 000000007394: 6A0A0912
	v_min_i32_e32 v19, v19, v5                                 // 000000007398: 18260B13
	v_cmp_lt_i32_e32 vcc, 0, v19                               // 00000000739C: 7D822680
	s_and_saveexec_b64 s[36:37], vcc                           // 0000000073A0: BEA4206A
	s_cbranch_execz 204                                        // 0000000073A4: BF8800CC <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4fa8>
	ds_read2_b64 v[10:13], v53 offset0:14 offset1:22           // 0000000073A8: D8EE160E 0A000035
	v_mov_b32_e32 v15, 0                                       // 0000000073B0: 7E1E0280
	s_mov_b64 s[38:39], -1                                     // 0000000073B4: BEA601C1
	v_mov_b32_e32 v16, v19                                     // 0000000073B8: 7E200313
	s_waitcnt lgkmcnt(0)                                       // 0000000073BC: BF8CC07F
	v_or_b32_e32 v5, v12, v10                                  // 0000000073C0: 280A150C
	v_and_b32_e32 v14, 3, v5                                   // 0000000073C4: 261C0A83
	v_cmp_ne_u64_e32 vcc, 0, v[14:15]                          // 0000000073C8: 7DDA1C80
	s_cbranch_vccz 3                                           // 0000000073CC: BF860003 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4cac>
	s_and_b64 exec, exec, s[38:39]                             // 0000000073D0: 86FE267E
	s_cbranch_execnz 102                                       // 0000000073D4: BF890066 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4e40>
	s_branch 191                                               // 0000000073D8: BF8200BF <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4fa8>
	v_lshrrev_b32_e32 v5, 2, v19                               // 0000000073DC: 200A2682
	v_and_b32_e32 v5, 0x3fffff00, v5                           // 0000000073E0: 260A0AFF 3FFFFF00
	v_cmp_lt_u32_e32 vcc, v66, v5                              // 0000000073E8: 7D920B42
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000073EC: BE8E206A
	s_cbranch_execz 36                                         // 0000000073F0: BF880024 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4d54>
	s_mov_b64 s[38:39], 0                                      // 0000000073F4: BEA60180
	v_pk_mov_b32 v[14:15], v[12:13], v[12:13] op_sel:[0,1]     // 0000000073F8: D3B3500E 1802190C
	v_pk_mov_b32 v[16:17], v[10:11], v[10:11] op_sel:[0,1]     // 000000007400: D3B35010 1802150A
	v_mov_b32_e32 v22, v66                                     // 000000007408: 7E2C0342
	v_add_co_u32_e32 v116, vcc, v16, v96                       // 00000000740C: 32E8C110
	v_addc_co_u32_e32 v117, vcc, 0, v17, vcc                   // 000000007410: 38EA2280
	flat_load_dwordx4 v[112:115], v[116:117] glc slc           // 000000007414: DC5F0000 70000074
	flat_load_dwordx4 v[160:163], v[116:117] offset:1024 glc slc// 00000000741C: DC5F0400 A0000074
	flat_load_dwordx4 v[164:167], v[116:117] offset:2048 glc slc// 000000007424: DC5F0800 A4000074
	flat_load_dwordx4 v[176:179], v[116:117] offset:3072 glc slc// 00000000742C: DC5F0C00 B0000074
	v_add_co_u32_e32 v116, vcc, v14, v96                       // 000000007434: 32E8C10E
	v_addc_co_u32_e32 v117, vcc, 0, v15, vcc                   // 000000007438: 38EA1E80
	v_add_co_u32_e32 v16, vcc, v16, v70                        // 00000000743C: 32208D10
	v_addc_co_u32_e32 v17, vcc, v17, v71, vcc                  // 000000007440: 38228F11
	v_add_co_u32_e32 v14, vcc, v14, v70                        // 000000007444: 321C8D0E
	v_add_u32_e32 v22, v22, v64                                // 000000007448: 682C8116
	v_addc_co_u32_e32 v15, vcc, v15, v71, vcc                  // 00000000744C: 381E8F0F
	v_cmp_ge_u32_e32 vcc, v22, v5                              // 000000007450: 7D9C0B16
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000007454: 87A6266A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007458: BF8C0070
	flat_store_dwordx4 v[116:117], v[112:115] glc slc          // 00000000745C: DC7F0000 00007074
	flat_store_dwordx4 v[116:117], v[160:163] offset:1024 glc slc// 000000007464: DC7F0400 0000A074
	flat_store_dwordx4 v[116:117], v[164:167] offset:2048 glc slc// 00000000746C: DC7F0800 0000A474
	flat_store_dwordx4 v[116:117], v[176:179] offset:3072 glc slc// 000000007474: DC7F0C00 0000B074
	s_andn2_b64 exec, exec, s[38:39]                           // 00000000747C: 89FE267E
	s_cbranch_execnz 65506                                     // 000000007480: BF89FFE2 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4cdc>
	s_or_b64 exec, exec, s[14:15]                              // 000000007484: 87FE0E7E
	v_lshlrev_b32_e32 v52, 2, v5                               // 000000007488: 24680A82
	v_cmp_ne_u32_e32 vcc, v19, v52                             // 00000000748C: 7D9A6913
	s_mov_b64 s[38:39], 0                                      // 000000007490: BEA60180
	v_mov_b32_e32 v16, 0                                       // 000000007494: 7E200280
	v_mov_b32_e32 v15, 0                                       // 000000007498: 7E1E0280
	s_and_saveexec_b64 s[14:15], vcc                           // 00000000749C: BE8E206A
	s_cbranch_execz 48                                         // 0000000074A0: BF880030 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4e34>
	v_sub_u32_e32 v5, v19, v52                                 // 0000000074A4: 6A0A6913
	v_ashrrev_i32_e32 v22, 2, v5                               // 0000000074A8: 222C0A82
	v_cmp_lt_i32_e32 vcc, v24, v22                             // 0000000074AC: 7D822D18
	s_and_saveexec_b64 s[38:39], vcc                           // 0000000074B0: BEA6206A
	s_cbranch_execz 30                                         // 0000000074B4: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4e00>
	v_lshlrev_b64 v[16:17], 2, v[52:53]                        // 0000000074B8: D28F0010 00026882
	v_add_co_u32_e32 v14, vcc, v12, v16                        // 0000000074C0: 321C210C
	v_addc_co_u32_e32 v15, vcc, v13, v17, vcc                  // 0000000074C4: 381E230D
	v_lshlrev_b64 v[112:113], 4, v[24:25]                      // 0000000074C8: D28F0070 00023084
	v_add_co_u32_e32 v14, vcc, v14, v112                       // 0000000074D0: 321CE10E
	v_addc_co_u32_e32 v15, vcc, v15, v113, vcc                 // 0000000074D4: 381EE30F
	v_add_co_u32_e32 v16, vcc, v10, v16                        // 0000000074D8: 3220210A
	v_addc_co_u32_e32 v17, vcc, v11, v17, vcc                  // 0000000074DC: 3822230B
	v_add_co_u32_e32 v16, vcc, v16, v112                       // 0000000074E0: 3220E110
	v_addc_co_u32_e32 v17, vcc, v17, v113, vcc                 // 0000000074E4: 3822E311
	s_mov_b64 s[40:41], 0                                      // 0000000074E8: BEA80180
	v_mov_b32_e32 v23, v24                                     // 0000000074EC: 7E2E0318
	flat_load_dwordx4 v[112:115], v[16:17] glc slc             // 0000000074F0: DC5F0000 70000010
	v_lshlrev_b64 v[116:117], 4, v[32:33]                      // 0000000074F8: D28F0074 00024084
	v_add_co_u32_e32 v16, vcc, v16, v116                       // 000000007500: 3220E910
	v_add_u32_e32 v23, v23, v32                                // 000000007504: 682E4117
	v_addc_co_u32_e32 v17, vcc, v17, v117, vcc                 // 000000007508: 3822EB11
	v_cmp_ge_i32_e32 vcc, v23, v22                             // 00000000750C: 7D8C2D17
	s_or_b64 s[40:41], vcc, s[40:41]                           // 000000007510: 87A8286A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007514: BF8C0070
	flat_store_dwordx4 v[14:15], v[112:115] glc slc            // 000000007518: DC7F0000 0000700E
	v_add_co_u32_e32 v14, vcc, v14, v116                       // 000000007520: 321CE90E
	v_addc_co_u32_e32 v15, vcc, v15, v117, vcc                 // 000000007524: 381EEB0F
	s_andn2_b64 exec, exec, s[40:41]                           // 000000007528: 89FE287E
	s_cbranch_execnz 65520                                     // 00000000752C: BF89FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4dc0>
	s_or_b64 exec, exec, s[38:39]                              // 000000007530: 87FE267E
	v_and_b32_e32 v14, 3, v5                                   // 000000007534: 261C0A83
	v_cmp_ne_u32_e32 vcc, 0, v14                               // 000000007538: 7D9A1C80
	s_mov_b64 s[38:39], 0                                      // 00000000753C: BEA60180
	v_mov_b32_e32 v16, 0                                       // 000000007540: 7E200280
	s_and_saveexec_b64 s[40:41], vcc                           // 000000007544: BEA8206A
	v_and_b32_e32 v5, -4, v5                                   // 000000007548: 260A0AC4
	s_mov_b64 s[38:39], exec                                   // 00000000754C: BEA6017E
	v_add_u32_e32 v52, v5, v52                                 // 000000007550: 68686905
	v_mov_b32_e32 v16, v14                                     // 000000007554: 7E20030E
	s_or_b64 exec, exec, s[40:41]                              // 000000007558: 87FE287E
	s_and_b64 s[38:39], s[38:39], exec                         // 00000000755C: 86A67E26
	v_mov_b32_e32 v15, v52                                     // 000000007560: 7E1E0334
	s_or_b64 exec, exec, s[14:15]                              // 000000007564: 87FE0E7E
	s_and_b64 exec, exec, s[38:39]                             // 000000007568: 86FE267E
	s_cbranch_execz 90                                         // 00000000756C: BF88005A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4fa8>
	v_and_b32_e32 v17, 0xfffffe00, v16                         // 000000007570: 262220FF FFFFFE00
	v_cmp_lt_i32_e32 vcc, v132, v17                            // 000000007578: 7D822384
	s_and_saveexec_b64 s[14:15], vcc                           // 00000000757C: BE8E206A
	s_cbranch_execz 52                                         // 000000007580: BF880034 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4f24>
	v_ashrrev_i32_e32 v23, 31, v15                             // 000000007584: 222E1E9F
	v_mov_b32_e32 v22, v15                                     // 000000007588: 7E2C030F
	v_lshlrev_b64 v[22:23], 2, v[22:23]                        // 00000000758C: D28F0016 00022C82
	v_add_co_u32_e32 v14, vcc, v98, v22                        // 000000007594: 321C2D62
	v_addc_co_u32_e32 v5, vcc, 0, v23, vcc                     // 000000007598: 380A2E80
	s_mov_b64 s[38:39], 0                                      // 00000000759C: BEA60180
	v_mov_b32_e32 v22, v132                                    // 0000000075A0: 7E2C0384
	v_add_co_u32_e32 v112, vcc, v10, v14                       // 0000000075A4: 32E01D0A
	v_addc_co_u32_e32 v113, vcc, v11, v5, vcc                  // 0000000075A8: 38E20B0B
	flat_load_dword v23, v[112:113] glc slc                    // 0000000075AC: DC530000 17000070
	flat_load_dword v52, v[112:113] offset:256 glc slc         // 0000000075B4: DC530100 34000070
	flat_load_dword v114, v[112:113] offset:512 glc slc        // 0000000075BC: DC530200 72000070
	flat_load_dword v115, v[112:113] offset:768 glc slc        // 0000000075C4: DC530300 73000070
	flat_load_dword v116, v[112:113] offset:1024 glc slc       // 0000000075CC: DC530400 74000070
	flat_load_dword v117, v[112:113] offset:1280 glc slc       // 0000000075D4: DC530500 75000070
	flat_load_dword v160, v[112:113] offset:1536 glc slc       // 0000000075DC: DC530600 A0000070
	flat_load_dword v161, v[112:113] offset:1792 glc slc       // 0000000075E4: DC530700 A1000070
	v_add_co_u32_e32 v112, vcc, v12, v14                       // 0000000075EC: 32E01D0C
	v_addc_co_u32_e32 v113, vcc, v13, v5, vcc                  // 0000000075F0: 38E20B0D
	v_add_co_u32_e32 v14, vcc, v14, v80                        // 0000000075F4: 321CA10E
	v_add_u32_e32 v22, v22, v131                               // 0000000075F8: 682D0716
	v_addc_co_u32_e32 v5, vcc, v5, v81, vcc                    // 0000000075FC: 380AA305
	v_cmp_ge_i32_e32 vcc, v22, v17                             // 000000007600: 7D8C2316
	s_or_b64 s[38:39], vcc, s[38:39]                           // 000000007604: 87A6266A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007608: BF8C0070
	flat_store_dword v[112:113], v23 glc slc                   // 00000000760C: DC730000 00001770
	flat_store_dword v[112:113], v52 offset:256 glc slc        // 000000007614: DC730100 00003470
	flat_store_dword v[112:113], v114 offset:512 glc slc       // 00000000761C: DC730200 00007270
	flat_store_dword v[112:113], v115 offset:768 glc slc       // 000000007624: DC730300 00007370
	flat_store_dword v[112:113], v116 offset:1024 glc slc      // 00000000762C: DC730400 00007470
	flat_store_dword v[112:113], v117 offset:1280 glc slc      // 000000007634: DC730500 00007570
	flat_store_dword v[112:113], v160 offset:1536 glc slc      // 00000000763C: DC730600 0000A070
	flat_store_dword v[112:113], v161 offset:1792 glc slc      // 000000007644: DC730700 0000A170
	s_andn2_b64 exec, exec, s[38:39]                           // 00000000764C: 89FE267E
	s_cbranch_execnz 65492                                     // 000000007650: BF89FFD4 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4e74>
	s_or_b64 exec, exec, s[14:15]                              // 000000007654: 87FE0E7E
	v_and_b32_e32 v16, 0x1ff, v16                              // 000000007658: 262020FF 000001FF
	v_cmp_ne_u32_e32 vcc, 0, v16                               // 000000007660: 7D9A2080
	v_cmp_lt_u32_e64 s[14:15], v24, v16                        // 000000007664: D0C9000E 00022118
	s_and_b64 s[14:15], vcc, s[14:15]                          // 00000000766C: 868E0E6A
	s_and_b64 exec, exec, s[14:15]                             // 000000007670: 86FE0E7E
	s_cbranch_execz 24                                         // 000000007674: BF880018 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4fa8>
	v_add_u32_e32 v14, v17, v15                                // 000000007678: 681C1F11
	v_ashrrev_i32_e32 v15, 31, v14                             // 00000000767C: 221E1C9F
	v_lshlrev_b64 v[14:15], 2, v[14:15]                        // 000000007680: D28F000E 00021C82
	v_add_co_u32_e32 v14, vcc, v100, v14                       // 000000007688: 321C1D64
	v_addc_co_u32_e32 v5, vcc, 0, v15, vcc                     // 00000000768C: 380A1E80
	s_mov_b64 s[14:15], 0                                      // 000000007690: BE8E0180
	v_mov_b32_e32 v15, v24                                     // 000000007694: 7E1E0318
	v_add_co_u32_e32 v22, vcc, v10, v14                        // 000000007698: 322C1D0A
	v_addc_co_u32_e32 v23, vcc, v11, v5, vcc                   // 00000000769C: 382E0B0B
	flat_load_dword v17, v[22:23] glc slc                      // 0000000076A0: DC530000 11000016
	v_add_co_u32_e32 v22, vcc, v12, v14                        // 0000000076A8: 322C1D0C
	v_addc_co_u32_e32 v23, vcc, v13, v5, vcc                   // 0000000076AC: 382E0B0D
	v_add_co_u32_e32 v14, vcc, v14, v64                        // 0000000076B0: 321C810E
	v_add_u32_e32 v15, v15, v32                                // 0000000076B4: 681E410F
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 0000000076B8: 380A0A80
	v_cmp_ge_u32_e32 vcc, v15, v16                             // 0000000076BC: 7D9C210F
	s_or_b64 s[14:15], vcc, s[14:15]                           // 0000000076C0: 878E0E6A
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000076C4: BF8C0070
	flat_store_dword v[22:23], v17 glc slc                     // 0000000076C8: DC730000 00001116
	s_andn2_b64 exec, exec, s[14:15]                           // 0000000076D0: 89FE0E7E
	s_cbranch_execnz 65520                                     // 0000000076D4: BF89FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4f68>
	s_or_b64 exec, exec, s[36:37]                              // 0000000076D8: 87FE247E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 0000000076DC: 7D82402E
	s_mov_b64 s[36:37], 0                                      // 0000000076E0: BEA40180
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000076E4: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 0000000076E8: 888E0E7E
	s_cbranch_execnz 6                                         // 0000000076EC: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4fd8>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 0000000076F0: BE8E230E
	s_cbranch_execnz 16                                        // 0000000076F4: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5008>
	s_or_b64 exec, exec, s[14:15]                              // 0000000076F8: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[36:37]                      // 0000000076FC: BE8E2024
	s_cbranch_execnz 20                                        // 000000007700: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5024>
	s_branch 51                                                // 000000007704: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x50a4>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000007708: 7D944031
	s_mov_b64 s[38:39], -1                                     // 00000000770C: BEA601C1
	s_and_saveexec_b64 s[36:37], vcc                           // 000000007710: BEA4206A
	s_cbranch_execz 4                                          // 000000007714: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4ff8>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007718: BF8C0070
	s_barrier                                                  // 00000000771C: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000007720: BF8CC07F
	s_xor_b64 s[38:39], exec, -1                               // 000000007724: 88A6C17E
	s_or_b64 exec, exec, s[36:37]                              // 000000007728: 87FE247E
	s_and_b64 s[36:37], s[38:39], exec                         // 00000000772C: 86A47E26
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000007730: BE8E230E
	s_cbranch_execz 65520                                      // 000000007734: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x4fc8>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000007738: 7D9A40C0
	s_andn2_b64 s[36:37], s[36:37], exec                       // 00000000773C: 89A47E24
	s_and_b64 vcc, vcc, exec                                   // 000000007740: 86EA7E6A
	s_or_b64 s[36:37], s[36:37], vcc                           // 000000007744: 87A46A24
	s_or_b64 exec, exec, s[14:15]                              // 000000007748: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[36:37]                      // 00000000774C: BE8E2024
	s_cbranch_execz 32                                         // 000000007750: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x50a4>
	s_and_b64 exec, exec, s[4:5]                               // 000000007754: 86FE047E
	s_cbranch_execz 30                                         // 000000007758: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x50a4>
	ds_read_b64 v[10:11], v130                                 // 00000000775C: D8EC0000 0A000082
	v_mov_b32_e32 v12, 1                                       // 000000007764: 7E180281
	v_mov_b32_e32 v13, 0                                       // 000000007768: 7E1A0280
	s_waitcnt lgkmcnt(0)                                       // 00000000776C: BF8CC07F
	v_add_co_u32_e32 v10, vcc, v10, v0                         // 000000007770: 3214010A
	v_addc_co_u32_e32 v11, vcc, 0, v11, vcc                    // 000000007774: 38161680
	ds_write_b64 v130, v[10:11]                                // 000000007778: D89A0000 00000A82
	ds_add_u64 v53, v[12:13] offset:248                        // 000000007780: D88000F8 00000C35
	ds_read_b64 v[12:13], v53 offset:248                       // 000000007788: D8EC00F8 0C000035
	s_waitcnt lgkmcnt(0)                                       // 000000007790: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[12:13], v[10:11]                   // 000000007794: 7DD2150C
	s_and_saveexec_b64 s[36:37], vcc                           // 000000007798: BEA4206A
	s_cbranch_execz 11                                         // 00000000779C: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x509c>
	s_mov_b64 s[38:39], 0                                      // 0000000077A0: BEA60180
	s_sleep 1                                                  // 0000000077A4: BF8E0001
	ds_read_b64 v[10:11], v53 offset:248                       // 0000000077A8: D8EC00F8 0A000035
	ds_read_b64 v[12:13], v130                                 // 0000000077B0: D8EC0000 0C000082
	s_waitcnt lgkmcnt(0)                                       // 0000000077B8: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[10:11], v[12:13]                   // 0000000077BC: 7DDC190A
	s_or_b64 s[38:39], vcc, s[38:39]                           // 0000000077C0: 87A6266A
	s_andn2_b64 exec, exec, s[38:39]                           // 0000000077C4: 89FE267E
	s_cbranch_execnz 65526                                     // 0000000077C8: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5074>
	s_or_b64 exec, exec, s[36:37]                              // 0000000077CC: 87FE247E
	s_wakeup                                                   // 0000000077D0: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 0000000077D4: 87FE0E7E
	v_and_b32_e32 v5, 32, v55                                  // 0000000077D8: 260A6EA0
	v_cmp_ne_u32_e32 vcc, 0, v5                                // 0000000077DC: 7D9A0A80
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000077E0: BE8E206A
	s_cbranch_execz 65029                                      // 0000000077E4: BF88FE05 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x48cc>
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 0000000077E8: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 0000000077EC: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 0000000077F0: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 0000000077F4: DC740000 00001C06
	s_branch 65023                                             // 0000000077FC: BF82FDFF <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x48cc>
	s_or_b64 exec, exec, s[30:31]                              // 000000007800: 87FE1E7E
	s_or_b64 exec, exec, s[16:17]                              // 000000007804: 87FE107E
	v_cmp_gt_i32_e32 vcc, 2, v12                               // 000000007808: 7D881882
	s_and_saveexec_b64 s[16:17], vcc                           // 00000000780C: BE90206A
	s_cbranch_execz 60766                                      // 000000007810: BF88ED5E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x65c>
	s_mov_b64 s[30:31], 0                                      // 000000007814: BE9E0180
	s_branch 8                                                 // 000000007818: BF820008 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x510c>
	s_or_b64 exec, exec, s[14:15]                              // 00000000781C: 87FE0E7E
	v_cmp_ne_u32_e32 vcc, 0, v12                               // 000000007820: 7D9A1880
	v_or_b32_e32 v55, 0x800, v55                               // 000000007824: 286E6EFF 00000800
	s_or_b64 s[30:31], vcc, s[30:31]                           // 00000000782C: 879E1E6A
	v_mov_b32_e32 v12, 1                                       // 000000007830: 7E180281
	s_andn2_b64 exec, exec, s[30:31]                           // 000000007834: 89FE1E7E
	s_cbranch_execz 60755                                      // 000000007838: BF88ED53 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x658>
	v_and_b32_e32 v4, 4, v55                                   // 00000000783C: 26086E84
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000007840: 7D9A0880
	s_mov_b64 s[14:15], -1                                     // 000000007844: BE8E01C1
	s_and_saveexec_b64 s[34:35], vcc                           // 000000007848: BEA2206A
	s_cbranch_execz 102                                        // 00000000784C: BF880066 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x52b8>
	v_add_co_u32_e32 v4, vcc, 2, v28                           // 000000007850: 32083882
	v_addc_co_u32_e32 v5, vcc, 0, v29, vcc                     // 000000007854: 380A3A80
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007858: BF8C0070
	v_cmp_lt_u64_e32 vcc, v[36:37], v[4:5]                     // 00000000785C: 7DD20924
	v_mov_b32_e32 v10, 1                                       // 000000007860: 7E140281
	s_and_saveexec_b64 s[36:37], vcc                           // 000000007864: BEA4206A
	s_cbranch_execz 91                                         // 000000007868: BF88005B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x52a8>
	v_add_u32_e32 v10, 2, v28                                  // 00000000786C: 68143882
	v_ashrrev_i32_e32 v11, 31, v10                             // 000000007870: 2216149F
	s_mov_b64 s[38:39], 0                                      // 000000007874: BEA60180
	v_mov_b32_e32 v13, 0                                       // 000000007878: 7E1A0280
	s_branch 9                                                 // 00000000787C: BF820009 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5174>
	s_or_b64 exec, exec, s[40:41]                              // 000000007880: 87FE287E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007884: BF8C0070
	v_cmp_ge_u64_e32 vcc, v[36:37], v[4:5]                     // 000000007888: 7DDC0924
	s_orn2_b64 s[40:41], vcc, exec                             // 00000000788C: 8AA87E6A
	s_or_b64 exec, exec, s[14:15]                              // 000000007890: 87FE0E7E
	s_and_b64 s[14:15], exec, s[40:41]                         // 000000007894: 868E287E
	s_or_b64 s[38:39], s[14:15], s[38:39]                      // 000000007898: 87A6260E
	s_andn2_b64 exec, exec, s[38:39]                           // 00000000789C: 89FE267E
	s_cbranch_execz 75                                         // 0000000078A0: BF88004B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x52a0>
	s_sleep 1                                                  // 0000000078A4: BF8E0001
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000078A8: BF8C0070
	flat_load_dwordx2 v[36:37], v[6:7] glc                     // 0000000078AC: DC550000 24000006
	v_add_u32_e32 v13, 1, v13                                  // 0000000078B4: 681A1A81
	v_and_b32_e32 v14, 64, v55                                 // 0000000078B8: 261C6EC0
	v_cmp_eq_u32_e32 vcc, 0, v14                               // 0000000078BC: 7D941C80
	v_cmp_eq_u32_e64 s[14:15], s52, v13                        // 0000000078C0: D0CA000E 00021A34
	s_and_b64 vcc, vcc, s[14:15]                               // 0000000078C8: 86EA0E6A
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000078CC: BE8E206A
	s_cbranch_execz 13                                         // 0000000078D0: BF88000D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x51d8>
	ds_read_b64 v[14:15], v53 offset:1264                      // 0000000078D4: D8EC04F0 0E000035
	s_waitcnt lgkmcnt(0)                                       // 0000000078DC: BF8CC07F
	flat_load_dword v13, v[14:15] glc                          // 0000000078E0: DC510000 0D00000E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 0000000078E8: BF8C0070
	v_cmp_ne_u32_e32 vcc, 0, v13                               // 0000000078EC: 7D9A1A80
	v_cndmask_b32_e64 v13, 0, 1, vcc                           // 0000000078F0: D100000D 01A90280
	v_lshl_or_b32 v55, v13, 6, v55                             // 0000000078F8: D2000037 04DD0D0D
	v_and_b32_e32 v14, 64, v55                                 // 000000007900: 261C6EC0
	v_mov_b32_e32 v13, 0                                       // 000000007904: 7E1A0280
	s_or_b64 exec, exec, s[14:15]                              // 000000007908: 87FE0E7E
	v_cmp_eq_u32_e32 vcc, 0, v14                               // 00000000790C: 7D941C80
	s_mov_b64 s[40:41], -1                                     // 000000007910: BEA801C1
	s_and_saveexec_b64 s[14:15], vcc                           // 000000007914: BE8E206A
	s_cbranch_execz 65501                                      // 000000007918: BF88FFDD <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5160>
	v_cmp_eq_u32_e32 vcc, 0, v13                               // 00000000791C: 7D941A80
	s_and_saveexec_b64 s[40:41], vcc                           // 000000007920: BEA8206A
	s_cbranch_execz 65494                                      // 000000007924: BF88FFD6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5150>
	ds_read_b64 v[14:15], v53 offset:1288                      // 000000007928: D8EC0508 0E000035
	v_mov_b32_e32 v20, s12                                     // 000000007930: 7E28020C
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007934: BF8C0070
	v_ashrrev_i32_e32 v17, 31, v36                             // 000000007938: 2222489F
	buffer_wbl2                                                // 00000000793C: E0A0C000 00000000
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007944: BF8C0070
	flat_atomic_add v16, v[14:15], v146 glc                    // 000000007948: DD090000 1000920E
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007950: BF8C0070
	buffer_invl2                                               // 000000007954: E0A40000 00000000
	buffer_wbinvl1_vol                                         // 00000000795C: E0FC0000 00000000
	ds_read_b64 v[14:15], v53 offset:1280                      // 000000007964: D8EC0500 0E000035
	v_and_b32_e32 v16, 0x1fff, v16                             // 00000000796C: 262020FF 00001FFF
	v_lshlrev_b32_e32 v16, 5, v16                              // 000000007974: 24202085
	s_waitcnt lgkmcnt(0)                                       // 000000007978: BF8CC07F
	v_add_co_u32_e32 v18, vcc, v14, v16                        // 00000000797C: 3224210E
	v_addc_co_u32_e32 v19, vcc, 0, v15, vcc                    // 000000007980: 38261E80
	flat_store_byte v[18:19], v20 offset:1                     // 000000007984: DC600001 00001412
	s_memrealtime vcc                                          // 00000000798C: C0941A80 00000000
	v_mov_b32_e32 v16, v36                                     // 000000007994: 7E200324
	flat_store_short v[18:19], v147 offset:2                   // 000000007998: DC680002 00009312
	flat_store_dword v[18:19], v24 offset:4                    // 0000000079A0: DC700004 00001812
	flat_store_dwordx2 v[18:19], v[10:11] offset:24            // 0000000079A8: DC740018 00000A12
	s_waitcnt lgkmcnt(0)                                       // 0000000079B0: BF8CC07F
	v_mov_b32_e32 v14, vcc_lo                                  // 0000000079B4: 7E1C026A
	v_mov_b32_e32 v15, vcc_hi                                  // 0000000079B8: 7E1E026B
	flat_store_dwordx4 v[18:19], v[14:17] offset:8             // 0000000079BC: DC7C0008 00000E12
	flat_store_byte v[18:19], v148                             // 0000000079C4: DC600000 00009412
	s_branch 65452                                             // 0000000079CC: BF82FFAC <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5150>
	s_or_b64 exec, exec, s[38:39]                              // 0000000079D0: 87FE267E
	v_and_b32_e32 v10, 4, v55                                  // 0000000079D4: 26146E84
	s_or_b64 exec, exec, s[36:37]                              // 0000000079D8: 87FE247E
	v_cmp_eq_u32_e32 vcc, 0, v10                               // 0000000079DC: 7D941480
	s_orn2_b64 s[14:15], vcc, exec                             // 0000000079E0: 8A8E7E6A
	s_wakeup                                                   // 0000000079E4: BF830000
	s_or_b64 exec, exec, s[34:35]                              // 0000000079E8: 87FE227E
	s_xor_b64 vcc, s[14:15], -1                                // 0000000079EC: 88EAC10E
	s_and_saveexec_b64 s[14:15], vcc                           // 0000000079F0: BE8E206A
	s_cbranch_execz 29                                         // 0000000079F4: BF88001D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x533c>
	v_and_b32_e32 v4, 0x80, v55                                // 0000000079F8: 26086EFF 00000080
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000007A00: 7D9A0880
	v_and_b32_e32 v52, 7, v28                                  // 000000007A04: 26683887
	s_and_saveexec_b64 s[34:35], vcc                           // 000000007A08: BEA2206A
	s_xor_b64 s[34:35], exec, s[34:35]                         // 000000007A0C: 88A2227E
	s_cbranch_execz 10                                         // 000000007A10: BF88000A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x530c>
	v_lshlrev_b64 v[4:5], 2, v[52:53]                          // 000000007A14: D28F0004 00026882
	v_add_co_u32_e32 v4, vcc, v30, v4                          // 000000007A1C: 3208091E
	v_addc_co_u32_e32 v5, vcc, v31, v5, vcc                    // 000000007A20: 380A0B1F
	flat_load_dwordx2 v[4:5], v[4:5] glc                       // 000000007A24: DC550000 04000004
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007A2C: BF8C0070
	v_ashrrev_i32_e32 v5, 31, v4                               // 000000007A30: 220A089F
	v_lshrrev_b64 v[4:5], 2, v[4:5]                            // 000000007A34: D2900004 00020882
	s_andn2_saveexec_b64 vcc, s[34:35]                         // 000000007A3C: BEEA2322
	v_mad_i64_i32 v[4:5], s[34:35], v52, s24, 0                // 000000007A40: D1E92204 02003134
	s_or_b64 exec, exec, vcc                                   // 000000007A48: 87FE6A7E
	v_lshlrev_b64 v[4:5], 2, v[4:5]                            // 000000007A4C: D28F0004 00020882
	v_add_co_u32_e32 v4, vcc, v38, v4                          // 000000007A54: 32080926
	v_addc_co_u32_e32 v5, vcc, v1, v5, vcc                     // 000000007A58: 380A0B01
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000007A5C: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000007A60: 383A3A80
	ds_write_b64 v145, v[4:5]                                  // 000000007A64: D89A0000 00000491
	s_or_b64 exec, exec, s[14:15]                              // 000000007A6C: 87FE0E7E
	v_cmp_lt_i32_e32 vcc, s46, v32                             // 000000007A70: 7D82402E
	s_mov_b64 s[34:35], 0                                      // 000000007A74: BEA20180
	s_and_saveexec_b64 s[14:15], vcc                           // 000000007A78: BE8E206A
	s_xor_b64 s[14:15], exec, s[14:15]                         // 000000007A7C: 888E0E7E
	s_cbranch_execnz 6                                         // 000000007A80: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x536c>
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000007A84: BE8E230E
	s_cbranch_execnz 16                                        // 000000007A88: BF890010 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x539c>
	s_or_b64 exec, exec, s[14:15]                              // 000000007A8C: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[34:35]                      // 000000007A90: BE8E2022
	s_cbranch_execnz 20                                        // 000000007A94: BF890014 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x53b8>
	s_branch 51                                                // 000000007A98: BF820033 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5438>
	v_cmp_eq_u32_e32 vcc, s49, v32                             // 000000007A9C: 7D944031
	s_mov_b64 s[36:37], -1                                     // 000000007AA0: BEA401C1
	s_and_saveexec_b64 s[34:35], vcc                           // 000000007AA4: BEA2206A
	s_cbranch_execz 4                                          // 000000007AA8: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x538c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007AAC: BF8C0070
	s_barrier                                                  // 000000007AB0: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000007AB4: BF8CC07F
	s_xor_b64 s[36:37], exec, -1                               // 000000007AB8: 88A4C17E
	s_or_b64 exec, exec, s[34:35]                              // 000000007ABC: 87FE227E
	s_and_b64 s[34:35], s[36:37], exec                         // 000000007AC0: 86A27E24
	s_andn2_saveexec_b64 s[14:15], s[14:15]                    // 000000007AC4: BE8E230E
	s_cbranch_execz 65520                                      // 000000007AC8: BF88FFF0 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x535c>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000007ACC: 7D9A40C0
	s_andn2_b64 s[34:35], s[34:35], exec                       // 000000007AD0: 89A27E22
	s_and_b64 vcc, vcc, exec                                   // 000000007AD4: 86EA7E6A
	s_or_b64 s[34:35], s[34:35], vcc                           // 000000007AD8: 87A26A22
	s_or_b64 exec, exec, s[14:15]                              // 000000007ADC: 87FE0E7E
	s_and_saveexec_b64 s[14:15], s[34:35]                      // 000000007AE0: BE8E2022
	s_cbranch_execz 32                                         // 000000007AE4: BF880020 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5438>
	s_and_b64 exec, exec, s[4:5]                               // 000000007AE8: 86FE047E
	s_cbranch_execz 30                                         // 000000007AEC: BF88001E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5438>
	ds_read_b64 v[4:5], v130                                   // 000000007AF0: D8EC0000 04000082
	v_mov_b32_e32 v10, 1                                       // 000000007AF8: 7E140281
	v_mov_b32_e32 v11, 0                                       // 000000007AFC: 7E160280
	s_waitcnt lgkmcnt(0)                                       // 000000007B00: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000007B04: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000007B08: 380A0A80
	ds_write_b64 v130, v[4:5]                                  // 000000007B0C: D89A0000 00000482
	ds_add_u64 v53, v[10:11] offset:248                        // 000000007B14: D88000F8 00000A35
	ds_read_b64 v[10:11], v53 offset:248                       // 000000007B1C: D8EC00F8 0A000035
	s_waitcnt lgkmcnt(0)                                       // 000000007B24: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[10:11], v[4:5]                     // 000000007B28: 7DD2090A
	s_and_saveexec_b64 s[34:35], vcc                           // 000000007B2C: BEA2206A
	s_cbranch_execz 11                                         // 000000007B30: BF88000B <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5430>
	s_mov_b64 s[36:37], 0                                      // 000000007B34: BEA40180
	s_sleep 1                                                  // 000000007B38: BF8E0001
	ds_read_b64 v[4:5], v53 offset:248                         // 000000007B3C: D8EC00F8 04000035
	ds_read_b64 v[10:11], v130                                 // 000000007B44: D8EC0000 0A000082
	s_waitcnt lgkmcnt(0)                                       // 000000007B4C: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[10:11]                     // 000000007B50: 7DDC1504
	s_or_b64 s[36:37], vcc, s[36:37]                           // 000000007B54: 87A4246A
	s_andn2_b64 exec, exec, s[36:37]                           // 000000007B58: 89FE247E
	s_cbranch_execnz 65526                                     // 000000007B5C: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5408>
	s_or_b64 exec, exec, s[34:35]                              // 000000007B60: 87FE227E
	s_wakeup                                                   // 000000007B64: BF830000
	s_or_b64 exec, exec, s[14:15]                              // 000000007B68: 87FE0E7E
	v_and_b32_e32 v4, 32, v55                                  // 000000007B6C: 26086EA0
	v_cmp_ne_u32_e32 vcc, 0, v4                                // 000000007B70: 7D9A0880
	s_and_saveexec_b64 s[14:15], vcc                           // 000000007B74: BE8E206A
	s_cbranch_execz 65320                                      // 000000007B78: BF88FF28 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x50ec>
	v_add_co_u32_e32 v28, vcc, 2, v28                          // 000000007B7C: 32383882
	v_addc_co_u32_e32 v29, vcc, 0, v29, vcc                    // 000000007B80: 383A3A80
	s_waitcnt lgkmcnt(0)                                       // 000000007B84: BF8CC07F
	flat_store_dwordx2 v[6:7], v[28:29]                        // 000000007B88: DC740000 00001C06
	s_branch 65314                                             // 000000007B90: BF82FF22 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x50ec>
	v_cmp_ne_u32_e32 vcc, -1, v1                               // 000000007B94: 7D9A02C1
	v_and_b32_e32 v5, 0x3f8, v24                               // 000000007B98: 260A30FF 000003F8
	v_cndmask_b32_e64 v1, 0, 1, vcc                            // 000000007BA0: D1000001 01A90280
	v_cmp_ne_u32_e32 vcc, 8, v5                                // 000000007BA8: 7D9A0A88
	s_mov_b64 s[4:5], 0                                        // 000000007BAC: BE840180
	s_and_saveexec_b64 s[8:9], vcc                             // 000000007BB0: BE88206A
	s_xor_b64 s[8:9], exec, s[8:9]                             // 000000007BB4: 8888087E
	s_cbranch_execz 23                                         // 000000007BB8: BF880017 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x54e8>
	v_lshlrev_b32_e32 v7, 3, v0                                // 000000007BBC: 240E0083
	v_lshrrev_b32_e32 v5, 3, v24                               // 000000007BC0: 200A3083
	v_add_u32_e32 v8, -2, v7                                   // 000000007BC4: 68100EC2
	v_cmp_ne_u32_e32 vcc, v5, v8                               // 000000007BC8: 7D9A1105
	s_mov_b64 s[4:5], 0                                        // 000000007BCC: BE840180
	s_and_saveexec_b64 s[10:11], vcc                           // 000000007BD0: BE8A206A
	s_xor_b64 s[10:11], exec, s[10:11]                         // 000000007BD4: 888A0A7E
	v_add_u32_e32 v6, -1, v7                                   // 000000007BD8: 680C0EC1
	v_cmp_eq_u32_e32 vcc, v5, v6                               // 000000007BDC: 7D940D05
	v_cmp_lt_u32_e64 s[4:5], v3, v1                            // 000000007BE0: D0C90004 00020303
	s_and_b64 s[4:5], vcc, s[4:5]                              // 000000007BE8: 8684046A
	s_and_b64 s[4:5], s[4:5], exec                             // 000000007BEC: 86847E04
	s_or_saveexec_b64 s[10:11], s[10:11]                       // 000000007BF0: BE8A210A
	v_mov_b32_e32 v5, 16                                       // 000000007BF4: 7E0A0290
	s_xor_b64 exec, exec, s[10:11]                             // 000000007BF8: 88FE0A7E
	v_cmp_lt_u32_e32 vcc, v3, v6                               // 000000007BFC: 7D920D03
	s_andn2_b64 s[4:5], s[4:5], exec                           // 000000007C00: 89847E04
	s_and_b64 s[14:15], vcc, exec                              // 000000007C04: 868E7E6A
	v_mov_b32_e32 v5, 32                                       // 000000007C08: 7E0A02A0
	s_or_b64 s[4:5], s[4:5], s[14:15]                          // 000000007C0C: 87840E04
	s_or_b64 exec, exec, s[10:11]                              // 000000007C10: 87FE0A7E
	s_and_b64 s[4:5], s[4:5], exec                             // 000000007C14: 86847E04
	s_or_saveexec_b64 s[8:9], s[8:9]                           // 000000007C18: BE882108
	v_mov_b32_e32 v20, 0                                       // 000000007C1C: 7E280280
	s_xor_b64 exec, exec, s[8:9]                               // 000000007C20: 88FE087E
	v_cmp_lt_u32_e32 vcc, v3, v1                               // 000000007C24: 7D920303
	v_cndmask_b32_e64 v5, 0, 1, vcc                            // 000000007C28: D1000005 01A90280
	v_lshlrev_b32_e32 v5, 3, v5                                // 000000007C30: 240A0A83
	v_or_b32_e32 v6, 2, v5                                     // 000000007C34: 280C0A82
	v_cmp_eq_u32_e32 vcc, v3, v1                               // 000000007C38: 7D940303
	v_cndmask_b32_e32 v5, v5, v6, vcc                          // 000000007C3C: 000A0D05
	v_cmp_le_u32_e32 vcc, v3, v1                               // 000000007C40: 7D960303
	s_andn2_b64 s[4:5], s[4:5], exec                           // 000000007C44: 89847E04
	s_and_b64 s[10:11], vcc, exec                              // 000000007C48: 868A7E6A
	s_or_b64 s[4:5], s[4:5], s[10:11]                          // 000000007C4C: 87840A04
	v_mov_b32_e32 v20, v5                                      // 000000007C50: 7E280305
	s_or_b64 exec, exec, s[8:9]                                // 000000007C54: 87FE087E
	s_and_b64 s[8:9], s[4:5], exec                             // 000000007C58: 86887E04
	s_andn2_saveexec_b64 s[4:5], s[6:7]                        // 000000007C5C: BE842306
	s_cbranch_execz 60176                                      // 000000007C60: BF88EB10 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x174>
	v_cmp_eq_u32_e32 vcc, v3, v6                               // 000000007C64: 7D940D03
	v_cndmask_b32_e64 v1, 0, 1, vcc                            // 000000007C68: D1000001 01A90280
	v_cmp_lt_u32_e32 vcc, v3, v6                               // 000000007C70: 7D920D03
	v_cndmask_b32_e64 v5, 0, 1, vcc                            // 000000007C74: D1000005 01A90280
	v_cmp_le_u32_e32 vcc, v3, v6                               // 000000007C7C: 7D960D03
	v_lshl_or_b32 v5, v5, 2, v1                                // 000000007C80: D2000005 04050505
	s_andn2_b64 s[6:7], s[8:9], exec                           // 000000007C88: 89867E08
	s_and_b64 s[8:9], vcc, exec                                // 000000007C8C: 86887E6A
	s_or_b64 s[8:9], s[6:7], s[8:9]                            // 000000007C90: 87880806
	v_mov_b32_e32 v20, v5                                      // 000000007C94: 7E280305
	s_or_b64 exec, exec, s[4:5]                                // 000000007C98: 87FE047E
	v_mov_b32_e32 v55, 0                                       // 000000007C9C: 7E6E0280
	s_and_saveexec_b64 s[4:5], s[8:9]                          // 000000007CA0: BE842008
	s_cbranch_execnz 60162                                     // 000000007CA4: BF89EB02 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x180>
	s_branch 60163                                             // 000000007CA8: BF82EB03 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x188>
	s_or_b64 exec, exec, s[20:21]                              // 000000007CAC: 87FE147E
	s_or_b64 exec, exec, s[18:19]                              // 000000007CB0: 87FE127E
	v_and_b32_e32 v1, 0x800, v55                               // 000000007CB4: 26026EFF 00000800
	v_cmp_eq_u32_e32 vcc, 0, v1                                // 000000007CBC: 7D940280
	s_and_saveexec_b64 s[4:5], vcc                             // 000000007CC0: BE84206A
	s_cbranch_execz 76                                         // 000000007CC4: BF88004C <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x56c8>
	s_movk_i32 s6, 0xff                                        // 000000007CC8: B00600FF
	v_cmp_lt_i32_e32 vcc, s6, v32                              // 000000007CCC: 7D824006
	s_mov_b64 s[8:9], 0                                        // 000000007CD0: BE880180
	s_and_saveexec_b64 s[6:7], vcc                             // 000000007CD4: BE86206A
	s_xor_b64 s[6:7], exec, s[6:7]                             // 000000007CD8: 8886067E
	s_cbranch_execnz 6                                         // 000000007CDC: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x55c8>
	s_andn2_saveexec_b64 s[6:7], s[6:7]                        // 000000007CE0: BE862306
	s_cbranch_execnz 17                                        // 000000007CE4: BF890011 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x55fc>
	s_or_b64 exec, exec, s[6:7]                                // 000000007CE8: 87FE067E
	s_and_saveexec_b64 s[6:7], s[8:9]                          // 000000007CEC: BE862008
	s_cbranch_execnz 21                                        // 000000007CF0: BF890015 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5618>
	s_branch 61                                                // 000000007CF4: BF82003D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x56bc>
	s_movk_i32 s8, 0x100                                       // 000000007CF8: B0080100
	v_cmp_eq_u32_e32 vcc, s8, v32                              // 000000007CFC: 7D944008
	s_mov_b64 s[10:11], -1                                     // 000000007D00: BE8A01C1
	s_and_saveexec_b64 s[8:9], vcc                             // 000000007D04: BE88206A
	s_cbranch_execz 4                                          // 000000007D08: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x55ec>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007D0C: BF8C0070
	s_barrier                                                  // 000000007D10: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000007D14: BF8CC07F
	s_xor_b64 s[10:11], exec, -1                               // 000000007D18: 888AC17E
	s_or_b64 exec, exec, s[8:9]                                // 000000007D1C: 87FE087E
	s_and_b64 s[8:9], s[10:11], exec                           // 000000007D20: 86887E0A
	s_andn2_saveexec_b64 s[6:7], s[6:7]                        // 000000007D24: BE862306
	s_cbranch_execz 65519                                      // 000000007D28: BF88FFEF <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x55b8>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000007D2C: 7D9A40C0
	s_andn2_b64 s[8:9], s[8:9], exec                           // 000000007D30: 89887E08
	s_and_b64 s[10:11], vcc, exec                              // 000000007D34: 868A7E6A
	s_or_b64 s[8:9], s[8:9], s[10:11]                          // 000000007D38: 87880A08
	s_or_b64 exec, exec, s[6:7]                                // 000000007D3C: 87FE067E
	s_and_saveexec_b64 s[6:7], s[8:9]                          // 000000007D40: BE862008
	s_cbranch_execz 41                                         // 000000007D44: BF880029 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x56bc>
	v_and_b32_e32 v1, 63, v24                                  // 000000007D48: 260230BF
	v_cmp_eq_u32_e32 vcc, 0, v1                                // 000000007D4C: 7D940280
	s_and_b64 exec, exec, vcc                                  // 000000007D50: 86FE6A7E
	s_cbranch_execz 37                                         // 000000007D54: BF880025 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x56bc>
	v_lshrrev_b32_e32 v1, 3, v24                               // 000000007D58: 20023083
	v_and_b32_e32 v1, 0x78, v1                                 // 000000007D5C: 260202FF 00000078
	ds_read_b64 v[4:5], v1 offset:256                          // 000000007D64: D8EC0100 04000001
	v_mov_b32_e32 v6, 1                                        // 000000007D6C: 7E0C0281
	v_mov_b32_e32 v8, 0                                        // 000000007D70: 7E100280
	v_mov_b32_e32 v7, 0                                        // 000000007D74: 7E0E0280
	s_waitcnt lgkmcnt(0)                                       // 000000007D78: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000007D7C: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000007D80: 380A0A80
	ds_write_b64 v1, v[4:5] offset:256                         // 000000007D84: D89A0100 00000401
	ds_add_u64 v8, v[6:7] offset:248                           // 000000007D8C: D88000F8 00000608
	ds_read_b64 v[6:7], v8 offset:248                          // 000000007D94: D8EC00F8 06000008
	s_waitcnt lgkmcnt(0)                                       // 000000007D9C: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[6:7], v[4:5]                       // 000000007DA0: 7DD20906
	s_and_saveexec_b64 s[8:9], vcc                             // 000000007DA4: BE88206A
	s_cbranch_execz 14                                         // 000000007DA8: BF88000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x56b4>
	v_or_b32_e32 v1, 0x100, v1                                 // 000000007DAC: 280202FF 00000100
	s_mov_b64 s[10:11], 0                                      // 000000007DB4: BE8A0180
	v_mov_b32_e32 v4, 0                                        // 000000007DB8: 7E080280
	s_sleep 1                                                  // 000000007DBC: BF8E0001
	ds_read_b64 v[6:7], v4 offset:248                          // 000000007DC0: D8EC00F8 06000004
	ds_read_b64 v[8:9], v1                                     // 000000007DC8: D8EC0000 08000001
	s_waitcnt lgkmcnt(0)                                       // 000000007DD0: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[6:7], v[8:9]                       // 000000007DD4: 7DDC1106
	s_or_b64 s[10:11], vcc, s[10:11]                           // 000000007DD8: 878A0A6A
	s_andn2_b64 exec, exec, s[10:11]                           // 000000007DDC: 89FE0A7E
	s_cbranch_execnz 65526                                     // 000000007DE0: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x568c>
	s_or_b64 exec, exec, s[8:9]                                // 000000007DE4: 87FE087E
	s_wakeup                                                   // 000000007DE8: BF830000
	s_or_b64 exec, exec, s[6:7]                                // 000000007DEC: 87FE067E
	v_or_b32_e32 v55, 0x800, v55                               // 000000007DF0: 286E6EFF 00000800
	s_or_b64 exec, exec, s[4:5]                                // 000000007DF8: 87FE047E
	v_and_b32_e32 v1, 48, v55                                  // 000000007DFC: 26026EB0
	v_cmp_ne_u32_e32 vcc, 0, v1                                // 000000007E00: 7D9A0280
	s_and_saveexec_b64 s[4:5], vcc                             // 000000007E04: BE84206A
	s_cbranch_execz 10                                         // 000000007E08: BF88000A <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5704>
	v_bfe_i32 v1, v55, 4, 1                                    // 000000007E0C: D1C90001 02050937
	v_and_b32_e32 v1, 56, v1                                   // 000000007E14: 260202B8
	v_lshl_add_u32 v1, v3, 3, v1                               // 000000007E18: D1FD0001 04050703
	ds_read_b64 v[4:5], v1                                     // 000000007E20: D8EC0000 04000001
	s_waitcnt lgkmcnt(0)                                       // 000000007E28: BF8CC07F
	flat_store_dwordx2 v[4:5], v[28:29] offset:80              // 000000007E2C: DC740050 00001C04
	s_or_b64 exec, exec, s[4:5]                                // 000000007E34: 87FE047E
	s_movk_i32 s4, 0xff                                        // 000000007E38: B00400FF
	v_cmp_lt_i32_e32 vcc, s4, v32                              // 000000007E3C: 7D824004
	s_mov_b64 s[6:7], 0                                        // 000000007E40: BE860180
	s_and_saveexec_b64 s[4:5], vcc                             // 000000007E44: BE84206A
	s_xor_b64 s[4:5], exec, s[4:5]                             // 000000007E48: 8884047E
	s_cbranch_execnz 6                                         // 000000007E4C: BF890006 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5738>
	s_andn2_saveexec_b64 s[4:5], s[4:5]                        // 000000007E50: BE842304
	s_cbranch_execnz 17                                        // 000000007E54: BF890011 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x576c>
	s_or_b64 exec, exec, s[4:5]                                // 000000007E58: 87FE047E
	s_and_saveexec_b64 s[4:5], s[6:7]                          // 000000007E5C: BE842006
	s_cbranch_execnz 21                                        // 000000007E60: BF890015 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5788>
	s_branch 61                                                // 000000007E64: BF82003D <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x582c>
	s_movk_i32 s6, 0x100                                       // 000000007E68: B0060100
	v_cmp_eq_u32_e32 vcc, s6, v32                              // 000000007E6C: 7D944006
	s_mov_b64 s[8:9], -1                                       // 000000007E70: BE8801C1
	s_and_saveexec_b64 s[6:7], vcc                             // 000000007E74: BE86206A
	s_cbranch_execz 4                                          // 000000007E78: BF880004 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x575c>
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000007E7C: BF8C0070
	s_barrier                                                  // 000000007E80: BF8A0000
	s_waitcnt lgkmcnt(0)                                       // 000000007E84: BF8CC07F
	s_xor_b64 s[8:9], exec, -1                                 // 000000007E88: 8888C17E
	s_or_b64 exec, exec, s[6:7]                                // 000000007E8C: 87FE067E
	s_and_b64 s[6:7], s[8:9], exec                             // 000000007E90: 86867E08
	s_andn2_saveexec_b64 s[4:5], s[4:5]                        // 000000007E94: BE842304
	s_cbranch_execz 65519                                      // 000000007E98: BF88FFEF <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5728>
	v_cmp_ne_u32_e32 vcc, 64, v32                              // 000000007E9C: 7D9A40C0
	s_andn2_b64 s[6:7], s[6:7], exec                           // 000000007EA0: 89867E06
	s_and_b64 s[8:9], vcc, exec                                // 000000007EA4: 86887E6A
	s_or_b64 s[6:7], s[6:7], s[8:9]                            // 000000007EA8: 87860806
	s_or_b64 exec, exec, s[4:5]                                // 000000007EAC: 87FE047E
	s_and_saveexec_b64 s[4:5], s[6:7]                          // 000000007EB0: BE842006
	s_cbranch_execz 41                                         // 000000007EB4: BF880029 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x582c>
	v_and_b32_e32 v1, 63, v24                                  // 000000007EB8: 260230BF
	v_cmp_eq_u32_e32 vcc, 0, v1                                // 000000007EBC: 7D940280
	s_and_b64 exec, exec, vcc                                  // 000000007EC0: 86FE6A7E
	s_cbranch_execz 37                                         // 000000007EC4: BF880025 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x582c>
	v_lshrrev_b32_e32 v1, 3, v24                               // 000000007EC8: 20023083
	v_and_b32_e32 v1, 0x78, v1                                 // 000000007ECC: 260202FF 00000078
	ds_read_b64 v[4:5], v1 offset:256                          // 000000007ED4: D8EC0100 04000001
	v_mov_b32_e32 v6, 1                                        // 000000007EDC: 7E0C0281
	v_mov_b32_e32 v3, 0                                        // 000000007EE0: 7E060280
	v_mov_b32_e32 v7, 0                                        // 000000007EE4: 7E0E0280
	s_waitcnt lgkmcnt(0)                                       // 000000007EE8: BF8CC07F
	v_add_co_u32_e32 v4, vcc, v4, v0                           // 000000007EEC: 32080104
	v_addc_co_u32_e32 v5, vcc, 0, v5, vcc                      // 000000007EF0: 380A0A80
	ds_write_b64 v1, v[4:5] offset:256                         // 000000007EF4: D89A0100 00000401
	ds_add_u64 v3, v[6:7] offset:248                           // 000000007EFC: D88000F8 00000603
	ds_read_b64 v[6:7], v3 offset:248                          // 000000007F04: D8EC00F8 06000003
	s_waitcnt lgkmcnt(0)                                       // 000000007F0C: BF8CC07F
	v_cmp_lt_u64_e32 vcc, v[6:7], v[4:5]                       // 000000007F10: 7DD20906
	s_and_saveexec_b64 s[6:7], vcc                             // 000000007F14: BE86206A
	s_cbranch_execz 14                                         // 000000007F18: BF88000E <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x5824>
	v_or_b32_e32 v0, 0x100, v1                                 // 000000007F1C: 280002FF 00000100
	s_mov_b64 s[8:9], 0                                        // 000000007F24: BE880180
	v_mov_b32_e32 v1, 0                                        // 000000007F28: 7E020280
	s_sleep 1                                                  // 000000007F2C: BF8E0001
	ds_read_b64 v[4:5], v1 offset:248                          // 000000007F30: D8EC00F8 04000001
	ds_read_b64 v[6:7], v0                                     // 000000007F38: D8EC0000 06000000
	s_waitcnt lgkmcnt(0)                                       // 000000007F40: BF8CC07F
	v_cmp_ge_u64_e32 vcc, v[4:5], v[6:7]                       // 000000007F44: 7DDC0D04
	s_or_b64 s[8:9], vcc, s[8:9]                               // 000000007F48: 8788086A
	s_andn2_b64 exec, exec, s[8:9]                             // 000000007F4C: 89FE087E
	s_cbranch_execnz 65526                                     // 000000007F50: BF89FFF6 <_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem+0x57fc>
	s_or_b64 exec, exec, s[6:7]                                // 000000007F54: 87FE067E
	s_wakeup                                                   // 000000007F58: BF830000
	s_or_b64 exec, exec, s[4:5]                                // 000000007F5C: 87FE047E
	v_readlane_b32 s30, v2, 21                                 // 000000007F60: D289001E 00012B02
	v_readlane_b32 s31, v2, 22                                 // 000000007F68: D289001F 00012D02
	v_readlane_b32 s54, v2, 20                                 // 000000007F70: D2890036 00012902
	v_readlane_b32 s53, v2, 19                                 // 000000007F78: D2890035 00012702
	v_readlane_b32 s52, v2, 18                                 // 000000007F80: D2890034 00012502
	v_readlane_b32 s51, v2, 17                                 // 000000007F88: D2890033 00012302
	v_readlane_b32 s50, v2, 16                                 // 000000007F90: D2890032 00012102
	v_readlane_b32 s49, v2, 15                                 // 000000007F98: D2890031 00011F02
	v_readlane_b32 s48, v2, 14                                 // 000000007FA0: D2890030 00011D02
	v_readlane_b32 s47, v2, 13                                 // 000000007FA8: D289002F 00011B02
	v_readlane_b32 s46, v2, 12                                 // 000000007FB0: D289002E 00011902
	v_readlane_b32 s45, v2, 11                                 // 000000007FB8: D289002D 00011702
	v_readlane_b32 s44, v2, 10                                 // 000000007FC0: D289002C 00011502
	v_readlane_b32 s43, v2, 9                                  // 000000007FC8: D289002B 00011302
	v_readlane_b32 s42, v2, 8                                  // 000000007FD0: D289002A 00011102
	v_readlane_b32 s41, v2, 7                                  // 000000007FD8: D2890029 00010F02
	v_readlane_b32 s40, v2, 6                                  // 000000007FE0: D2890028 00010D02
	v_readlane_b32 s39, v2, 5                                  // 000000007FE8: D2890027 00010B02
	v_readlane_b32 s38, v2, 4                                  // 000000007FF0: D2890026 00010902
	v_readlane_b32 s37, v2, 3                                  // 000000007FF8: D2890025 00010702
	v_readlane_b32 s36, v2, 2                                  // 000000008000: D2890024 00010502
	v_readlane_b32 s35, v2, 1                                  // 000000008008: D2890023 00010302
	v_readlane_b32 s34, v2, 0                                  // 000000008010: D2890022 00010102
	s_or_saveexec_b64 s[4:5], -1                               // 000000008018: BE8421C1
	buffer_load_dword v2, off, s[0:3], s32                     // 00000000801C: E0500000 20000200
	s_mov_b64 exec, s[4:5]                                     // 000000008024: BEFE0104
	s_waitcnt vmcnt(0) lgkmcnt(0)                              // 000000008028: BF8C0070
	s_setpc_b64 s[30:31]                                       // 00000000802C: BE801D1E
.Lfunc_end_call_graph2:
	.size	_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem, .Lfunc_end_call_graph2-_ZN12_GLOBAL__N_17runRingIf7FuncSumIfE11ProtoSimpleILi2ELi2ELi2EEEEvP12ncclWorkElem

