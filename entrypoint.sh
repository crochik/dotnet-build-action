#!/bin/sh
set -e

echo "Building: ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH}"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

# docker build -f dotnet.Dockerfile ${INPUT_BUILD_CONTEXT}
dotnet publish ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH} -o ${GITHUB_WORKSPACE}/build -c Debug
dotnet pack

nuget sources Add -Name "Github" \
     -Source "https://nuget.pkg.github.com/crochik/index.json" \
     -UserName crochik -Password ${GITHUB_TOKEN} \

nuget push ${GITHUB_WORKSPACE}/bin/Debug/Crochik.NET.1.0.0.nupkg -Source "Github"

find ${GITHUB_WORKSPACE}/build
