sleep 1h
CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act1 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=1 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007

CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act2 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=2 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007

CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act3 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=3 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007

CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act4 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=4 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007

CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act5 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=5 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007

CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act6 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=6 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007

CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act7 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=7 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007

CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act8 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=8 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007

CUDA_VISIBLE_DEVICES=6 python model.py -mode train -cfg seed=777 cuda_device=0 exp_no=sd777FTTFFFT_an5_bs80_eopch60_lr7e-3_shuffle_0.2_act10 batch_size=80 \
    multi_acts_path=data/multi-woz-processed/multi_act_reference_rank_50.json \
    multi_act_fusion=True multi_act_sampling_num=10 \
    model=GateFlowNet \
    shuffle=True shuffle_p=0.2 \
    cand_act_gate=False \
    generate_bspn=True copy_bspn=True copy_act=False copy_usdx=False copy_cand_act=False \
    use_pvaspn=False use_pv_resp=True \
    use_true_bspn_for_ctr_eval=True use_true_curr_bspn=True \
    use_true_pv_resp=False use_true_prev_bspn=False \
    grandient_accumulation_steps=1 epoch_num=60 early_stop_count=60 weight_decay_count=25 lr=0.007