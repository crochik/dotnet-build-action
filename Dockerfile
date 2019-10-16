# FROM mcr.microsoft.com/dotnet/core/sdk:3.0-bionic AS build
FROM microsoft/dotnet:2.2-sdk AS build

LABEL "com.github.actions.name"=".Net Build"
LABEL "com.github.actions.description"="Build .net app"
LABEL "com.github.actions.icon"="layers"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/crochik/dotnet-build-action"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Felipe Crochik <felipe@crochik.com>"

# RUN apt-get update \
#   && apt-get upgrade -y \
#   && apt-get install nuget -y

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]