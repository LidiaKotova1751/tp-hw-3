#!/bin/bash

command=$1

if [ "$command" = "build_generator" ]; then
    docker build -t hw3-generator ./generator

elif [ "$command" = "run_generator" ]; then
    mkdir -p data
    docker run --rm --mount type=bind,source="$(pwd)/data",target=/data hw3-generator

elif [ "$command" = "create_local_data" ]; then
    py ./generator/generate.py ./local_data

elif [ "$command" = "build_reporter" ]; then
    docker build -t hw3-reporter ./reporter

elif [ "$command" = "run_reporter" ]; then
    docker run --rm --mount type=bind,source="$(pwd)/data",target=/data hw3-reporter

else
    echo "Доступные команды:"
    echo "./run.sh build_generator"
    echo "./run.sh run_generator"
    echo "./run.sh create_local_data"
    echo "./run.sh build_reporter"
    echo "./run.sh run_reporter"
fi