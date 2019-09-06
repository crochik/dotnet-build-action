#!/bin/sh

echo "Second"
echo ${GITHUB_WORKSPACE}
echo ${INPUT_PROJECT_PATH}

ls ${INPUT_PROJECT_PATH}

# docker build -f dotnet.Dockerfile ${INPUT_BUILD_CONTEXT}
dotnet publish ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH} -c Debug -f netcoreapp3.0}
