#!/bin/sh

echo "First one"
echo ${INPUT_BUILD_CONTEXT}

# docker build -f dotnet.Dockerfile ${INPUT_BUILD_CONTEXT}
dotnet publish ${INPUT_PROJECT_PATH} -c Debug -f netcoreapp3.0}
