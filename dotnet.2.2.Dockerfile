# FROM mcr.microsoft.com/dotnet/core/sdk:3.0-bionic AS build
FROM microsoft/dotnet:2.2-sdk AS build

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install nuget -y

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]