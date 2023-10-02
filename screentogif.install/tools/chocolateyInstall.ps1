$ErrorActionPreference = 'Stop'

$softwareName = 'ScreenToGif'
$version = '2.39'
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

  checksum       = '36427753B5EA4D853689565218CB5D1DCE6BA99EA75AEF584946C1EFF25E6F97'
  checksumType   = 'sha256'
  checksum64     = 'E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855'
  checksumType64 = 'sha256'

  silentArgs     = '/qn'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
