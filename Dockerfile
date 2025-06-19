# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy the exact csproj file
COPY HelloWorldAspNetCore.csproj ./
RUN dotnet restore HelloWorldAspNetCore.csproj

# Copy everything else
COPY . ./
RUN dotnet publish -c Release -o /app/out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 80
ENTRYPOINT ["dotnet", "HelloWorldAspNetCore.dll"]
