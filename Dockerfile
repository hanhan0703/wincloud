# Indicates that the Windows 10 (20H2) image will be used as the base image.
FROM mcr.microsoft.com/windows:20H2

# Metadata indicating an image maintainer.
LABEL maintainer="byhanhan@outlook.com"

# Install all dev tools
RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco install -y git cmake kb2999226 visualstudio2019buildtools visualstudio2019-workload-vctools powershell-core vcredist-all
EXPOSE 8900
RUN cd C:\ & git clone https://github.com/microsoft/vcpkg & .\vcpkg\bootstrap-vcpkg.bat
