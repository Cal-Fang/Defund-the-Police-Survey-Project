#!/bin/bash
# run an toy example for BTM

K=12   # number of topics

alpha=`echo "scale=3;50/$K"|bc`
beta=0.005
niter=5
save_step=501

input_dir=../sample-data/
output_dir=../output/
model_dir=${output_dir}model/
mkdir -p $output_dir/model

# the input docs for training
doc_pt=${input_dir}p_change_3305.txt

echo "=============== Index Docs ============="
# docs after indexing
dwid_pt=${output_dir}p_change_3305.txt
# vocabulary file
voca_pt=${output_dir}voca.txt
python indexDocs.py $doc_pt $dwid_pt $voca_pt

## learning parameters p(z) and p(w|z)
echo "=============== Topic Learning ============="
W=`wc -l < $voca_pt` # vocabulary size
make -C ../src
echo "../src/btm est $K $W $alpha $beta $niter $save_step $dwid_pt $model_dir"
../src/btm est $K $W $alpha $beta $niter $save_step $dwid_pt $model_dir

## infer p(z|d) for each doc
echo "================ Infer P(z|d)==============="
echo "../src/btm inf sum_b $K $dwid_pt $model_dir"
../src/btm inf sum_b $K $dwid_pt $model_dir

## output top words of each topic
echo "================ Topic Display ============="
python topicDisplay.py $model_dir $K $voca_pt
