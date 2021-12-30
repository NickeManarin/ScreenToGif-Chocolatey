$ErrorActionPreference = 'Stop'

$softwareName = 'ScreenToGif'
$version = '2.35.3'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "ScreenToGif $version is already installed."
  return
}

#(Get-WMIObject win32_operatingsystem).OSArchitecture

$packageArgs = @{
  packageName    = 'screentogif.install'
  fileType       = 'msi'
  url            = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.3/ScreenToGif.2.35.3.Setup.x86.msi'
  url64bit       = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.3/ScreenToGif.2.35.3.Setup.x64.msi'

  softwareName   = "$softwareName"

  checksum       = '233335071F79F8DE25E38B5928AF7387B7B7D06F294E1715C2AD35DC58F24399'
  checksumType   = 'sha256'
  checksum64     = '0BFBD1243395F80EF70616967D067718ACF19E60E1EBA86D600FDD69646A4F39'
  checksumType64 = 'sha256'

  silentArgs     = '/qn'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs