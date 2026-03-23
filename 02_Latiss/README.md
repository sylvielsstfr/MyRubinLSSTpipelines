# README.md

- author : Sylvie Dagoret-Campagne
- creation date : 2026-03-23

## Initialize Rubin pipeline

>    source /sdf/group/rubin/sw/w_latest/loadLSST.sh
> 
>    setup lsst_distrib 

## Get list of Visits

Ask the butler interactively to get the list of wanted visitd:

> butler query-datasets main raw \
>    --collections LATISS/raw/all \
>    --where "instrument='LATISS' AND day_obs >= 20260130 AND day_obs <= 20260131 AND physical_filter = 'empty~holo4_003'" \
>    | awk '{print $6}' | sort -u > visitIds.txt


## Launch the processing

I use `simpleisrtask.yaml` extracted from `processStar.yaml`instead of generic commands for DRP.
Note there is no Flat subtraction (need to hack atmospec by removing Spectractor)

- Note the quantum graph are available here https://tigress-web.princeton.edu/~lkelvin/pipelines/current/drp_pipe/LATISS/DRP/

- Note transformPreSourceTable in the DRP #step1 has a crash on our data : https://tigress-web.princeton.edu/~lkelvin/pipelines/current/drp_pipe/LATISS/DRP/pipeline_drp_pipe_LATISS_DRP.yaml


### launch interactively using `pipetask`:

> sh run_pipetask_perso.sh 

(*run_pipetask.sh* with standard DRP pipeline does not work on Holo-Spectro data)


### launch in batch using `bps`:

- 1) `allocate nodes:`
     
     > allocateNodes.py -v --dynamic -n 128 -c 32 -m 1-00:00:00 -q milano -g 900 s3df --account rubin:developers 
 
- 2) `bps submit:`:
 
      > run_bps_perso.sh 

## Notebooks


- `ViewImagesInFirefly.ipynb`: View images from the written in the butler collection in a Firefly Client

- `PostISRCCDtoFits.ipynb` : Save PostISRCCD from the butler collection inside fits file using the postISRCCD function.

- `OpenFireflyWindow.ipynb` : Only open a Firefly , then drag the Fits image file into the Firefly window.


