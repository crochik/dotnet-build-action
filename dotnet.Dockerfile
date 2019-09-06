# FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-bionic as base 
FROM mcr.microsoft.com/dotnet/core/sdk:3.0-bionic AS build

# WORKDIR /src

# COPY ["./src", "."]

FROM build AS publish
# RUN dotnet publish "./FOLDER/project.csproj" -c Debug -o /app -f netcoreapp3.0
RUN dotnet --version

# FROM base AS final

# # copy built files
# WORKDIR /app
# COPY --from=publish /app .

# EXPOSE 80
# ENTRYPOINT ["dotnet", "project.dll"]