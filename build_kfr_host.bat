@ECHO OFF

SET BuildDir=build
SET OutputDir=out
SET RootSourcePath=./src

SET HostBuildDir=%BuildDir%\host
SET HostOutputDir=%OutputDir%\host

SET KfrDftLibName=kfr_dft.lib
SET KfrIoLibName=kfr_io.lib

ECHO Removing Existing Build ^& Output Directories...
IF EXIST "%HostBuildDir%" (
    ECHO Removing existing Host Build Directory...
    RMDIR /S /Q "%HostBuildDir%"
)
IF EXIST "%HostOutputDir%" (
    ECHO Removing existing Host Output Directory...
    RMDIR /S /Q "%HostOutputDir%"
)

ECHO Creating Build Directories for Host...
MKDIR %HostBuildDir%
MKDIR %HostOutputDir%

ECHO Building KFR Lib for Host Architecture...
PUSHD %HostBuildDir%
cmake ^
    -DENABLE_TESTS=OFF ^
    -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang-cl.exe" ^
    -DCMAKE_CXX_FLAGS=-m64 ^
    -DCMAKE_BUILD_TYPE=Release ^
    -G "Ninja" ^
    ..\..\src\

ninja
POPD
ECHO Successfully built KFR Lib for Host Architecture!

ECHO Copying Host Libraries to Output Directories...
copy "%HostBuildDir%\%KfrDftLibName%" "%HostOutputDir%\%KfrDftLibName%"
copy "%HostBuildDir%\%KfrIoLibName%" "%HostOutputDir%\%KfrIoLibName%"
ECHO Succesfully Copied Host Libraries to Output Directories!
ECHO Execute copy_include_headers.ps1 in Powershell to copy the KFR Lib Include Headers.
