#!/bin/bash

visitids=$(paste -sd, visitIds.txt)

bps submit /sdf/group/rubin/user/leget/batch/bps_generic_main.yaml \
    -b dp2_prep \
    -i LSSTCam/runs/DRP/DP2/v30_0_0/DM-53881/stage3 \
    -o u/cdoux/testBlending \ 
    -p ${DRP_PIPE_DIR}/pipelines/LSSTCam/DRP.yaml#stage3-coadd
    -d "instrument='LSSTCam' AND visit IN (${visitids})"
