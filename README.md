# MAMD-TOD
This is the code and data of paper "Retrieve & Memorize: Dialog Policy Learning with Multi-Action Memory".
We have provided the retrieved candidate system actions in data/multi-woz-processed of multiwoz-2.0, so you can directly run run20.sh to reproduce the results.

## Abstract
Dialogue policy learning, a subtask that determines the content of system response generation and then the degree of task completion, is essential for task-oriented dialogue systems. However, the unbalanced distribution of system actions in dialogue datasets often causes a system difficulty in learning to generate desired actions and responses. In this paper, we propose a retrieve-and-memorize framework to enhance the learning of system actions. Specially, we first design a neural context-aware retrieval module to retrieve multiple candidate system actions from the training set given a dialogue context. Then, we propose a memory-augmented multi-decoder network to generate the system actions conditioned on the candidate actions, which allows the network to adaptively select key information in the candidate actions and neglect noise. We conduct experiments on the large-scale multi-domain task-oriented dialogue dataset MultiWOZ 2.0 and  MultiWOZ 2.1. Experimental results show that our method achieves competitive performance among several state-of-the-art models in the context-to-response generation task.

***

## Requirements
- Python 3.6
- PyTorch 1.4.0
- spaCy

We use the tokenization tool in SpaCy which can be installed through:
```
python -m spacy download en_core_web_sm
```

## Data Preprocessing
The original data files are put under data/multi-woz, which includes:
- data.json: The orignal MultiWOZ 2.0 data released by researchers in University of Cambridge available [here](https://github.com/budzianowski/multiwoz)
- annotated_user_da_with_span_full.json: A preprocessed and fully annotated version of MultiWOZ 2.0 data released by developers of Convlab available [here](https://github.com/ConvLab/ConvLab/tree/master/data/multiwoz/annotation)

Get ready for preprocessng:
```
python data_analysis.py
python preprocess.py
```
You can also use the proccessed data directly in the source code.
## Training

### Training on MultiWOZ2.0
```
bash run20.sh
```
### Training on MultiWOZ2.1
```
bash run21.sh
```
## Evaluation
### Evaluating on MultiWOZ2.0
```
bash run20_test.sh
```
### Evaluating on MultiWOZ2.1
```
bash run21_test.sh
```
### Evaluation settings
- use_true_pv_resp: use the ground truth previous turn's response as model input.
- use_true_prev_bspn: use the ground truth previous turn's belief span as model input.
- use_true_prev_aspn: use the ground truth previous turn's action span as model input.
- use_true_curr_bspn: use the ground truth current turn's belief span to guide belief span generation, by feeding the oracle token instead of the generated token to predict the next token. 
- use_true_curr_aspn: use the ground truth current turn's belief span to guide action span generation, by feeding the oracle token instead of the generated token to predict the next token. 
- use_true_bspn_for_ctr_eval: use the ground truth belief state to perform database search.
- use_true_db_pointer: use the ground truth database search results as model input.
- rs: whether to use random sampling
- rs_p: the random sampling probability

## CARM
### Pretraining
 ```
 bash CARM_pretrain.sh
 ```

### Candidate Actions Retrieval
```
python my_act_mapping.py
```

***
# Acknowledgement
This code is modified upon the open-sourcing code of AAAI 2020 paper  ["Task-Oriented Dialog Systems that Consider Multiple Appropriate Responses under the Same Context"](https://arxiv.org/abs/1911.10484). We sincerely thank the authors to developing it.