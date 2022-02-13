$ErrorActionPreference = 'Stop'

$softwareName = 'ScreenToGif'
$version = '2.36'
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
  url            = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.36/ScreenToGif.2.36.Setup.x86.msi'
  url64bit       = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.36/ScreenToGif.2.36.Setup.x64.msi'

  softwareName   = "$softwareName"

  checksum       = '91DCE0BACD0F6F099CA8CEFE70801A5C574B987AFF03BF3F0E9A58C6D702F8CD'
  checksumType   = 'sha256'
  checksum64     = '5FFFA01A642B9C43255D7D5E6E20086247D5F4C4DBC8A11FB066C8DC732CDF18'
  checksumType64 = 'sha256'

  silentArgs     = '/qn'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs