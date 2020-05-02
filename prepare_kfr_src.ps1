. ./variables.ps1

$RepoUrl = "https://github.com/kfrlib/kfr/archive/master.zip"
$RepoZipFile = "./kfr-master.zip"
$RootZipFolder = "kfr-master"

Write-Output "Preparing KFR Lib Source Code Directory..."
if (Test-Path $RepoZipFile) {
    Write-Output "Removing existing KFR Lib Repo Zip File..."
    Remove-Item $RepoZipFile -Force
}
Write-Output "Downloading KFR Lib Repo Zip File..."
Invoke-WebRequest -Uri $RepoUrl -OutFile $RepoZipFile

if (Test-Path $RootSourcePath) {
    Write-Output "Removing KFR Lib Source Code Directory..."
    Remove-Item $RootSourcePath -Recurse -Force
}
Write-Output "Unzipping KFR Lib Repo to KFR Lib Source Code Directory..."
7z x "$RepoZipFile" -r
mv ./$RootZipFolder $RootSourcePath
Write-Output "Successfully prepared KFR Lib Source Code!"
