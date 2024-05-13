$ErrorActionPreference = 'Stop'

$softwareName = 'ScreenToGif'
$version = '2.41'

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
  url            = "https://github.com/NickeManarin/ScreenToGif/releases/download/${version}/ScreenToGif.${version}.Setup.x86.msi"
  url64bit       = "https://github.com/NickeManarin/ScreenToGif/releases/download/${version}/ScreenToGif.${version}.Setup.x64.msi"

  softwareName   = "$softwareName"

  checksum       = '9DAE1E073AC89ED80943D9CC853163DC26B76492A884850D00B071ACE05D143B'
  checksumType   = 'sha256'
  checksum64     = 'F8B6B568314DD7E739501F8A11E9D6A0A7B7259110B8055E9C3E17BF5A1AAF81'
  checksumType64 = 'sha256'

  silentArgs     = '/qn'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs