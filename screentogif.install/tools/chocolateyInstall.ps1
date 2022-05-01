$ErrorActionPreference = 'Stop'

$softwareName = 'ScreenToGif'
$version = '2.37'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "ScreenToGif $version is already installed."
  return
}

#(Get-WMIObject win32_operatingsystem).OSArchitecture
#Should I shim this?
#https://docs.chocolatey.org/en-us/features/shim
#https://docs.chocolatey.org/en-us/create/functions/install-binfile
#https://docs.chocolatey.org/en-us/create/functions/uninstall-binfile

$packageArgs = @{
  packageName    = 'screentogif.install'
  fileType       = 'msi'
  url            = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.37/ScreenToGif.2.37.Setup.x86.msi'
  url64bit       = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.37/ScreenToGif.2.37.Setup.x64.msi'

  softwareName   = "$softwareName"

  checksum       = '8A144639D3F13E14BBB25FC1F9CEFE8AC03C48284AFFE6BCC409837B72C4F0C1'
  checksumType   = 'sha256'
  checksum64     = 'C76E12EF9052CA8A163DA6385D75914E64203419ABF56AE3A417670EEDFAB868'
  checksumType64 = 'sha256'

  silentArgs     = '/qn'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs