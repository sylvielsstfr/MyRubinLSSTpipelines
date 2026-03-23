# README.md

- author : Sylvie Dagoret-Campagne
- creation date : 2026-03-23

## Get list of Visits


> butler query-datasets main raw \
>    --collections LATISS/raw/all \
>    --where "instrument='LATISS' AND day_obs >= 20260130 AND day_obs <= 20260131 AND physical_filter = 'empty~holo4_003'" \
>    | awk '{print $6}' | sort -u > visitIds.txt

## Launch the processing

I use `simpleisrtask.yaml` extracted from `processStar.yaml`instead of generic commands for DRP.
Note there is no Flat subtraction (need to hack atmospec by removing Spectractor)

> sh run_pipetask_perso.sh 
