FROM docker:19.03.2 as runtime

LABEL "com.github.actions.name"=".Net Build"
LABEL "com.github.actions.description"="Build .net app"
LABEL "com.github.actions.icon"="layers"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/crochik/dotnet-build-action"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Felipe Crochik <felipe@crochik.com>"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]