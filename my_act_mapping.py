import numpy as np
import faiss           
import json
from tqdm import tqdm
from ontology import *
from reader import MultiWozReader
reader = MultiWozReader()

def search_candidate(dials,dials2,dials3,k,path,dmad_data):
    idx2pos = {}    #index到(file_name)到的映射
    def build_xb():
        xb = []     #储存每个turn的向量表示
        xqs = {}    #储存每个session的向量表示作查询
        for file_name in dials:
            q = []
            for turn_id, turn in enumerate(dials[file_name]):
                vec = dials[file_name][turn]
                # norm2 = np.linalg.norm(vec,ord=2)
                # vec = vec / norm2
                # vec = np.random.rand(len(vec))
                xb.append(vec)
                q.append(vec)
                idx2pos[len(idx2pos)] = {'file_name': file_name, 'turn_id':turn_id}
            q = np.array(q,dtype=np.float32())
            xqs[file_name] = q

        for file_name in dials2:
            q = []
            for turn_id, turn in enumerate(dials2[file_name]):
                vec = dials2[file_name][turn]
                # norm2 = np.linalg.norm(vec,ord=2)
                # vec = vec / norm2
                # vec = np.random.rand(len(vec))
                q.append(vec)
            q = np.array(q,dtype=np.float32())
            xqs[file_name] = q
        
        for file_name in dials3:
            q = []
            for turn_id, turn in enumerate(dials3[file_name]):
                vec = dials3[file_name][turn]
                # norm2 = np.linalg.norm(vec,ord=2)
                # vec = vec / norm2
                # vec = np.random.rand(len(vec))
                q.append(vec)
            q = np.array(q,dtype=np.float32())
            xqs[file_name] = q
        
        xb = np.array(xb,dtype=np.float32())
        #建立索引
        index = faiss.IndexFlatL2(xb.shape[1]) #内积是IndexFlatIP L2是IndexFlatL2 cosine需要将向量归一化
        index.add(xb)
        return index, xqs

    index, xqs = build_xb()
    
    dic = {}    #储存act到index的映射
    for domain in dialog_acts:
        for action in dialog_acts[domain]:
            a = '[' + action + ']'
            if a not in dic:
                dic[a] = len(dic)
    mapping = {}
    def search(dials):
        for idx, file_name in enumerate(tqdm(dials)):
            D,I = index.search(xqs[file_name],k)
            mapping[file_name] = {}
            for turn_id, turn in enumerate(dials[file_name]):
                mapp = set()
                source_turn = dmad_data[file_name]['log'][turn_id]
                turn_domain = source_turn['turn_domain']
                cons_delex = source_turn['cons_delex'].split()
                pointer = source_turn['pointer']
                slot = []
                for idx,tk in enumerate(cons_delex):
                    if tk == turn_domain:
                        i = idx+1
                        while i < len(cons_delex) and '[' not in cons_delex[i]:
                            slot.append(cons_delex[i])
                            i+=1
                slot.sort()
                mapping[file_name][str(turn_id)] = []
                if file_name == 'mul0784':
                        c = 1
                reference = [idx2pos[x] for x in I[turn_id]]
                for idx,ref in enumerate(reference):
                    
                    if idx == 0:
                        #最接近的是自身
                        continue
                    #过滤
                    cand_turn = dmad_data[ref['file_name']]['log'][ref['turn_id']]
                    cand_aspn = cand_turn['sys_act']
                    if len(cand_aspn) == 0:
                        continue
                    act_list = reader.aspan_to_act_list(cand_aspn)
                    cand_pointer = cand_turn['pointer']
                    if len(cand_aspn) == 0 or cand_turn['turn_domain'] != turn_domain or cand_pointer != pointer:
                        continue
                    cand_cons_delex = cand_turn['cons_delex'].split()
                    FLAG = False
                    for act in act_list:
                        d,f,s = act.split('-')
                        if f == 'request' and s in slot:
                            FLAG = True
                            break
                    if FLAG:
                        continue
                    labels = ['0']*len(dic)
                    for act in cand_aspn.split():
                        if act in dic:
                            labels[dic[act]] = '1'
                    labels = ''.join(labels)
                    if labels not in mapp:      #Avoid repeated aspn
                        mapping[file_name][str(turn_id)].append(cand_aspn)
                        mapp.add(labels)


    search(dials)
    search(dials2)    
    search(dials3)    
                
    
    json.dump(mapping, open(path+'multi_act_reference_rank_50_V6.json','w'),indent=2)

if __name__ == "__main__":

    dials = json.load(open("/data/lyh/MultiWOZ/MAMD/data/multi-woz-processed/BERT_train_encoded_context.json",'r'))
    dials2 = json.load(open("/data/lyh/MultiWOZ/MAMD/data/multi-woz-processed/BERT_train_encoded_context_dev.json",'r'))
    dials3 = json.load(open("/data/lyh/MultiWOZ/MAMD/data/multi-woz-processed/BERT_train_encoded_context_test.json",'r'))

    dmad_data = json.load(open("/data/lyh/MultiWOZ/MAMD/data/multi-woz-processed/data_for_damd.json",'r'))
    path = "/data/lyh/MultiWOZ/MAMD/data/multi-woz-processed/"

    search_candidate(dials,dials2,dials3,50,path,dmad_data)