#!/bin/bash
# Usage:
# ./experiments/scripts/default_faster_rcnn.sh GPU NET [--set ...]
# Example:
# ./experiments/scripts/test_faster_rcnn_end2end_imagenet.sh 1 VGG_CNN_M_1024 vgg_cnn_m_1024_faster_rcnn_iter_200000.caffemodel \
#   --set EXP_DIR foobar RNG_SEED 42 TRAIN.SCALES "[400,500,600,700]"
set -x
set -e

export PYTHONUNBUFFERED="True"

GPU_ID=$1
NET=$2
NET_FINAL=$3

NET_lc=${NET,,}
ITERS=300000
DATASET_TRAIN=imagenet_val1
DATASET_TEST=imagenet_val2

array=( $@ )
len=${#array[@]}
EXTRA_ARGS=${array[@]:2:$len}
EXTRA_ARGS_SLUG=${EXTRA_ARGS// /_}

LOG="experiments/logs/faster_rcnn_${NET}_${EXTRA_ARGS_SLUG}.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"


set +x
NET_FINAL=`grep -B 1 "done solving" ${LOG} | grep "Wrote snapshot" | awk '{print $4}'`
set -x

time ./tools/test_net_imagenet.py --gpu ${GPU_ID} \
  --def models/imagenet/${NET}/faster_rcnn_end2end_imagenet/test.prototxt \
  --net output/faster_rcnn_end2end/val1/${net_final} \
#  --net ${net_final} \
  --imdb ${DATASET_TEST} \
  --cfg experiments/cfgs/faster_rcnn_end2end.yml \
  ${EXTRA_ARGS}
