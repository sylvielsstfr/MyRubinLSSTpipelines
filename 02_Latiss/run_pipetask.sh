#!/bin/bash        

# Be carefull : NEED to allocate nodes before running this script 
# allocate nodes
# allocateNodes.py -v --dynamic -n 128 -c 32 -m 1-00:00:00 -q milano -g 900 s3df --account rubin:developers 

# Note before I better had allocated machine for an interactive run:
#srun --pty --cpus-per-task=4 --mem=16GB --nodes=1 --time=02:00:00 --partition=milano --account=rubin:commissioning bash

visitids=$(paste -sd, visitIds_short.txt)

pipetask run -b /repo/main \
    -i LATISS/raw/all,refcats,LATISS/calib/legacy,LATISS/calib \
    -o u/dagoret/2026_test_isrlatiss_v0 \
    -p ${DRP_PIPE_DIR}/pipelines/LATISS/DRP.yaml#step1 \
    -c isr:doFlat=False \
    -d "instrument='LATISS' AND exposure IN (${visitids})"
