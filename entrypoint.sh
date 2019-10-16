#!/bin/sh
set -e

echo "Building: ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH}"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

dotnet publish ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH} -o ${GITHUB_WORKSPACE}/build -c ${INPUT_CONFIGURATION}
dotnet pack
dotnet nuget push bin/${INPUT_CONFIGURATION}/*.nupkg -s "Github"

find ${GITHUB_WORKSPACE}/build
