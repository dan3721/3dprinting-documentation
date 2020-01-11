#!/bin/bash

# target directory
if [ $# -eq 0 ]; then
    echo "Please specify target directory!"
    exit 1
fi

# for each .scad gen the .stl
for i in $1/*.scad; do
    dir=$(dirname $i)
    name=$(basename $i .scad)
    stl_file="$dir/$name.stl"
    echo "Generating $stl_file ... "
    /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -q -o "$stl_file" $i & pid=$!
    PID_LIST+=" $pid";
done

# support kill
trap "kill $PID_LIST" SIGINT

# await completion
echo "Awaiting completion ..."
wait $PID_LIST
echo "DONE"
