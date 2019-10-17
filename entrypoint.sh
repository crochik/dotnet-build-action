#!/bin/bash
set -e

echo "Building: ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH}"

if [[ -f "nuput.config" && -n "$GITHUB_TOKEN" ]]
then
    echo "Injecting GITHUB_TOKEN in nuget.config..."
    REGEX="s/\${{GITHUB_TOKEN}}/${GITHUB_TOKEN}/"
    sed $REGEX nuget.config > nuget.config
fi

export DOTNET_CLI_TELEMETRY_OPTOUT=1

dotnet publish ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH} -o ${GITHUB_WORKSPACE}/build -c ${INPUT_CONFIGURATION}
dotnet pack

if [[ -n "$INPUT_SOURCE" ]]
then 
    echo "Publishing to NuGet: ${INPUT_SOURCE}..."
    dotnet nuget push bin/${INPUT_CONFIGURATION}/*.nupkg -s ${INPUT_SOURCE}
fi
