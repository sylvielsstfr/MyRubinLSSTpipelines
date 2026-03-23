#!/bin/bash

# ALLOCATE_NODES="$CTRL_EXECUTE_DIR/bin/allocateNodes.py --auto --account rubin:commissioning -n 100 -m 3-00:00:00 -q milano -g 300 s3df"
#ALLOCATE_NODES="$CTRL_EXECUTE_DIR/bin/allocateNodes.py --auto --account rubin:default -n 100 -m 3-00:00:00 -q milano -g 300 s3df"
# ALLOCATE_NODES="$CTRL_EXECUTE_DIR/bin/allocateNodes.py --auto --account rubin:default -n 100 -m 3-00:00:00 -q roma -g 300 s3df"

# IF A DRP RUN CANNOT USE MILANO OR ROMA BUT NEED TO USE TORINO
#ALLOCATE_NODES="$CTRL_EXECUTE_DIR/bin/allocateNodes.py --auto --account rubin:default -n 400 -c 30 -m 3-00:00:00 -q roma -g 300 s3df"

ALLOCATE_NODES="$CTRL_EXECUTE_DIR/bin/allocateNodes.py --auto --account rubin:developers -n 400 -c 30 -m 3-00:00:00 -q torino -g 300 s3df"

# need to be default.
# use roma if need an answer NOW.
# need to exclusive user ??. -n 8 -c 30 need to be a multiply of 120.

# ADDED FOR OR5
# ALLOCATE_NODES="$CTRL_EXECUTE_DIR/bin/allocateNodes.py --auto --account rubin:commissioning -n 100 -m 3-00:00:00 -q roma -g 300 s3df"

# Loop "forever", executing "allocateNodes auto" every 5 minutes.

for i in {1..1440}; do
    echo -e "\n##### NEW GLIDEIN LOOP #####\n"
    $ALLOCATE_NODES
    # Print a BPS report every 30 seconds, if an ID has been given
    if [ -n "$1" ]; then
        for j in {1..10}; do
            echo -e "\n##### BPS Report #####\n"
            bps report --id "$1"
            sleep 30
            # Run allocateNodes again for the first 2 iterations
            if [[ "$i" -eq 1 && "$j" -lt 3 ]]; then
                echo -e "\n##### ALLOCATE NODES RAMP #####\n"
                $ALLOCATE_NODES
            fi
        done
    else
        echo -e "\nSleeping for 300 seconds..."
        sleep 100
    fi
done
