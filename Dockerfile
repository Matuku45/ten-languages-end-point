# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy the .csproj file explicitly from the subfolder
COPY HelloWorldAspNetCore/*.csproj ./HelloWorldAspNetCore/
RUN dotnet restore ./HelloWorldAspNetCore/HelloWorldAspNetCore.csproj

# Copy the rest of the app
COPY . ./
WORKDIR /src/HelloWorldAspNetCore
RUN dotnet publish -c Release -o /app/out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

# Expose the port your app listens on
EXPOSE 80

# Start the application
ENTRYPOINT ["dotnet", "HelloWorldAspNetCore.dll"]
