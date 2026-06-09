#!/bin/bash

command=$1

if [ "$command" = "build_generator" ]; then
    docker build -t hw3-generator ./generator

elif [ "$command" = "run_generator" ]; then
    docker run --rm --mount type=bind,source="$(pwd)/data",target=/data hw3-generator

elif [ "$command" = "create_local_data" ]; then
    py ./generator/generate.py ./local_data

else
    echo "Доступные команды:"
    echo "./run.sh build_generator"
    echo "./run.sh run_generator"
    echo "./run.sh create_local_data"
fi