#!/bin/bash   

# creation  date : 2028/03:28 
# process diaObject alerts from Fink : diaObj313853517449658448 

#source /sdf/group/rubin/sw/w_latest/loadLSST.sh
#setup lsst_distrib

# Be carefull : NEED to allocate nodes before running this script 
# allocate nodes
# allocateNodes.py -v --dynamic -n 128 -c 32 -m 1-00:00:00 -q milano -g 900 s3df --account rubin:developers 


visitids=$(paste -sd, diaObj313853517449658448_tract9813.txt)
tractid=9813

echo "visitids = $visitids"
echo "tractid  = $tractid"

bps submit bps_generic_main.yaml \
    -b /repo/main \
    -i LSSTCam/defaults \
    -o u/dagoret/test_runbps_2026_test_lc_fromalertsFink_diaobj313853517449658448 \
    -p ${DRP_PIPE_DIR}/pipelines/LSSTCam/DRP.yaml#stage1-single-visit,stage2-recalibrate \
    -d "instrument='LSSTCam' AND skymap='lsst_cells_v2' AND visit IN (${visitids}) AND tract=${tractid}"
