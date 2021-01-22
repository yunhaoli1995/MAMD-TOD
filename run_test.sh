# #TEST
path='experiments/all_sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_sd777_lr0.007_bs80_sp60_dc25'
CUDA_VISIBLE_DEVICES=0 python model.py -mode test -cfg cuda_device=0 eval_load_path=$path aspn_decode_mode=greedy batch_size=512 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=9 \
    model=MAMD \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 \
    cuda=False