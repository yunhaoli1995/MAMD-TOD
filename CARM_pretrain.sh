python action_pretrasined.py \
    --do_train \
    --data_dir /data/multi-woz-processed/action/ \
    --train_batch_size 6 --eval_batch_size 6 --max_seq_length 400 \
    --load_dir bert-base-uncased \