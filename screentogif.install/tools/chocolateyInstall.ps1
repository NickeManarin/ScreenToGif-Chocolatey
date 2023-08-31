$ErrorActionPreference = 'Stop'

$softwareName = 'ScreenToGif'
$version = '2.38.1'
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
  url            = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.38.1/ScreenToGif.2.38.1.Setup.x86.msi'
  url64bit       = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.38.1/ScreenToGif.2.38.1.Setup.x64.msi'

  softwareName   = "$softwareName"

  checksum       = 'C34F34CCEB74E970FD4477E888AAB6DB7A92CA9B0C1EE99B278071D8576E36F6'
  checksumType   = 'sha256'
  checksum64     = '969897125DA184EA7073AB6C50309EBADEEB93784B4EEB331AE575997CAD64DD'
  checksumType64 = 'sha256'

  silentArgs     = '/qn'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs