# Building KFR Lib for Android

The [prepare_kfr_src.ps1](prepare_kfr_src.ps1) script is a Powershell script which will automatically download and extract the KFR Lib source code.
The [build_kfr_host.bat](build_kfr_host.bat) script is a Batch script which will automatically build KFR Lib for the Host Architecture using Visual Studio.
The [build_kfr_android.ps1](build_kfr_android.ps1) script is a PowerShell script which will automatically build KFR Lib using Android SDK.

## Steps
  - Execute the [prepare_kfr_src.ps1](prepare_kfr_src.ps1) script in any Powershell Prompt
  - Install any Edition of Visual Studio with C++ Support
  - Install Clang Support for Visual Studio
  - Install LLVM [https://github.com/llvm/llvm-project/releases](https://github.com/llvm/llvm-project/releases)
  - Execute the [build_kfr_host.bat](build_kfr_host.bat) script in the Visual Studio Native Developer Command Prompt (either x86 or x64 depending on your target build)
  - Execute the [build_kfr_android.ps1](build_kfr_android.ps1) script in any Powershell Prompt
  - Resulting files are in /out/ directory
