#!/bin/bash   

#source /sdf/group/rubin/sw/w_latest/loadLSST.sh
#setup lsst_distrib

# Be carefull : NEED to allocate nodes before running this script 
# allocate nodes
# allocateNodes.py -v --dynamic -n 128 -c 32 -m 1-00:00:00 -q milano -g 900 s3df --account rubin:developers 


#visitids=$(paste -sd, visitIds.txt)

#tract = 5063
bps submit bps_generic_main.yaml \
    -b /repo/main \
    -i LSSTCam/defaults \
    -o u/dagoret/test_runbps_2026_06_ecdfs_28_t5063 \
    -p ${DRP_PIPE_DIR}/pipelines/LSSTCam/DRP.yaml#stage1-single-visit,stage2-recalibrate \
    -d "instrument='LSSTCam' AND skymap='lsst_cells_v2' AND tract=5063 AND patch IN (24,34,35)"
