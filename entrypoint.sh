#!/bin/sh
set -e

echo "Building: ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH}"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

dotnet publish ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH} -o ${GITHUB_WORKSPACE}/build -c Debug
dotnet pack
dotnet push bin/Debug/Crochik.NET.1.0.1.nupkg -Source "crochik"

find ${GITHUB_WORKSPACE}/build
