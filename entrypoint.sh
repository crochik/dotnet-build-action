#!/bin/bash
set -e

echo "Building: ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH}"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

dotnet publish ${GITHUB_WORKSPACE}/${INPUT_PROJECT_PATH} -o ${GITHUB_WORKSPACE}/build -c ${INPUT_CONFIGURATION}
dotnet pack

if [[ -n "$INPUT_SOURCE" && -f "nuput.config" && -n "$INPUT_GITHUB_TOKEN" ]]
then
    echo "Injecting GITHUB_TOKEN in nuget.config: ${INPUT_GITHUB_TOKEN}"
    REGEX="s/\${{GITHUB_TOKEN}}/${INPUT_GITHUB_TOKEN}/"
    sed $REGEX nuput.config > build/nuget.config

    cat build/nuget.config

    # echo "Publishing to NuGet: ${INPUT_SOURCE}..."
    # dotnet nuget push bin/${INPUT_CONFIGURATION}/*.nupkg -s ${INPUT_SOURCE}
fi
