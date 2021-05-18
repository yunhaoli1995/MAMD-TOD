python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_act3_data21_multi_acts9_shuffle0.1 batch_size=80 \
    multi_acts_path=data/multi-woz-2.1-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=9 \
    model=GateFlowNet \
    rs=True rs_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=True \
    grandient_accumulation_steps=1 early_stop_count=60 weight_decay_count=25 lr=0.005 epoch_num=60 \
    data_path=data/multi-woz-2.1-processed/ vocab_path_train=data/multi-woz-2.1-processed/vocab