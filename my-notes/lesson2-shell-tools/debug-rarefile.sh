#!/usr/bin/env bash

runTimes=0
./rarely-fail-file.sh
state=$?
while [ $state -ne 1 ]; do
    # output to log file
    ./rarely-fail-file.sh &> log
    # update state to track
    state=$?
    runTimes=$(( runTimes+1 ))
    echo "No.$runTimes is running"
done
echo "Run $runTimes times before crash"
cat log
