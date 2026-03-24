# README.md

- author : Sylvie Dagoret-Campagne
- creation date : 2026-03-24

## Initialize Rubin pipeline

>    source /sdf/group/rubin/sw/w_latest/loadLSST.sh
> 
>    setup lsst_distrib 

## Get list of Visits


From Rubin and detector visits found in Fink-broker alerts , I can retrieve 


## Launch the processing

I use `simpleisrtask.yaml` extracted from `processStar.yaml`instead of generic commands for DRP.
Note there is no Flat subtraction (need to hack atmospec by removing Spectractor)

- Note the quantum graph are available https://tigress-web.princeton.edu/~lkelvin/pipelines/current/drp_pipe/LSSTCam/DRP/



### launch interactively using `pipetask`:

> sh run_pipetask.sh 

(Crash, I don't know why)


### launch in batch using `bps`:

- 1) `allocate nodes:`
     
     > allocateNodes.py -v --dynamic -n 128 -c 32 -m 1-00:00:00 -q milano -g 900 s3df --account rubin:developers 
 
- 2) `bps submit:`:
 
      > sh run_bps_pipeline.sh

## Notebooks




