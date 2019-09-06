#!/bin/sh
set -e
set -o pipefail

echo "Building: ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH}"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

# docker build -f dotnet.Dockerfile ${INPUT_BUILD_CONTEXT}
dotnet publish ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH} -c Debug
