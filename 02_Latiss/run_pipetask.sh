#!/bin/bash                                                                                                                                            

visitids=$(paste -sd, visitIds_short.txt)

pipetask run -b /repo/main \
    -i LATISS/raw/all,refcats,LATISS/calib/legacy,LATISS/calib \
    -o u/dagoret/2026_test_isrlatiss_v0 \
    -p ${DRP_PIPE_DIR}/pipelines/LATISS/DRP.yaml#step1 \
    -c isr:doFlat=False \
    -d "instrument='LATISS' AND exposure IN (${visitids})"
