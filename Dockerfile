FROM microsoft/dotnet:3.0-sdk
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
EXPOSE 8080
RUN dotnet publish -c Release -o out
USER 1001
ENTRYPOINT ["dotnet", "out/locationms.dll"]