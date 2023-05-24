@echo off
pushd %~dp0

for %%X in (dotnet.exe) do (set FOUND=%%~$PATH:X)
if defined FOUND (goto dotNetFound) else (goto dotNetNotFound)

:dotNetNotFound
echo .NET Core is not found or not installed,
echo download and install from https://www.microsoft.com/net/download/windows/run
goto end

:dotNetFound
:startMiner
DEL /F /Q SoliditySHA3Miner.conf

SoliditySHA3Miner.exe ^
allowCPU=false ^
allowIntel=true ^
allowAMD=true ^
allowCUDA=true ^
abiFile=0xBTC.abi ^
pool=http://eticapool.com:8080 ^
overrideMaxTarget=0x100000000000000000000000000000000000000000000000000000000 ^
address=0x9172ff7884CEFED19327aDaCe9C470eF1796105c

if %errorlevel% EQU 22 (
  goto startMiner
)
:end
pause