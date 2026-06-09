#!/bin/bash

command=$1

if [ "$command" = "build_generator" ]; then
    docker build -t hw3-generator ./generator

elif [ "$command" = "run_generator" ]; then
    mkdir -p data
    docker run --rm --mount type=bind,source="$(pwd)/data",target=/data hw3-generator

elif [ "$command" = "create_local_data" ]; then
    mkdir -p local_data
    py ./generator/generate.py ./local_data

elif [ "$command" = "build_reporter" ]; then
    docker build -t hw3-reporter ./reporter

elif [ "$command" = "run_reporter" ]; then
    mkdir -p data
    docker run --rm --mount type=bind,source="$(pwd)/data",target=/data hw3-reporter

elif [ "$command" = "structure" ]; then
    find . -path "./.git" -prune -o -print

elif [ "$command" = "clear_data" ]; then
    mkdir -p data
    find data -maxdepth 1 -type f \( -name "*.csv" -o -name "*.html" \) -delete

elif [ "$command" = "inside_generator" ]; then
    mkdir -p data
    docker run --rm --entrypoint ls --mount type=bind,source="$(pwd)/data",target=/data hw3-generator -la //data

elif [ "$command" = "inside_reporter" ]; then
    mkdir -p data
    docker run --rm --entrypoint ls --mount type=bind,source="$(pwd)/data",target=/data hw3-reporter -la //data

else
    echo "Доступные команды:"
    echo "./run.sh build_generator"
    echo "./run.sh run_generator"
    echo "./run.sh create_local_data"
    echo "./run.sh build_reporter"
    echo "./run.sh run_reporter"
    echo "./run.sh structure"
    echo "./run.sh clear_data"
    echo "./run.sh inside_generator"
    echo "./run.sh inside_reporter"
    exit 1
fi