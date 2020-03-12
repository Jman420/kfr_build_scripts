. ./variables.ps1

$SourceIncludeDir = "$RootSourcePath/include"

# Remove Include output directory
if (Test-Path $IncludeDir) {
    Write-Output "Removing existing Output Include directory..."
    Remove-Item $IncludeDir -Force -Recurse
}

# Make the Include output directory
Write-Output "Creating output Include directory..."
New-Item -ItemType directory -Force -Path $IncludeDir
$includeFileDest = Resolve-Path $IncludeDir

# Copy Include directory from Source Code Folder to Output Folder
Copy-Item -Force $SourceIncludeDir/* -Destination $IncludeDir -Recurse
Write-Output "Successfully copied KFR Lib Include Files to $includeFileDest !"
