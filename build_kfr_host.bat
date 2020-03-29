@ECHO OFF

SET BuildType=%1
IF "%BuildType%"=="" (
    SET BuildType=Debug
    ECHO Build Type not specified.  Using Debug configuration.
)

SET LlvmRoot=C:/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/VC/Tools/Llvm

SET BuildDir=build
SET OutputDir=out

SET HostBuildDir=%BuildDir%\host\%BuildType%
SET HostOutputDir=%OutputDir%\host\%BuildType%

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
    -DCMAKE_CXX_COMPILER="%LlvmRoot%/bin/clang-cl.exe" ^
    -DCMAKE_CXX_FLAGS=-m64 ^
    -DCMAKE_BUILD_TYPE=%BuildType% ^
    -DCMAKE_INSTALL_PREFIX=..\..\..\%HostOutputDir% ^
    -G "Ninja" ^
    ..\..\..\src\

cmake --build . --target install
POPD
ECHO Successfully built KFR Lib for Host Architecture!
