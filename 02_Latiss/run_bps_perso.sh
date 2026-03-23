#!/bin/bash                                                                                             

# Be carefull : NEED to allocate nodes before running this script 
# allocate nodes
# allocateNodes.py -v --dynamic -n 128 -c 32 -m 1-00:00:00 -q milano -g 900 s3df --account rubin:developers 


#visitids=$(paste -sd, visitIds_short.txt)
visitids=$(paste -sd, visitIds.txt)

bps submit bps_generic_main.yaml \
    -b /repo/main \
    -i LATISS/raw/all,refcats,LATISS/calib/legacy,LATISS/calib \
    -o u/dagoret/2026_test_isrlatiss_v1 \
    -p simpleisrtask.yaml \
    -d "instrument='LATISS' AND exposure IN (${visitids})"
