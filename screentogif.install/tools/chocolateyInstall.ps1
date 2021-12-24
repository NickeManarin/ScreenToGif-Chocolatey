$ErrorActionPreference = 'Stop'

$softwareName = 'ScreenToGif'
$version = '2.35.2'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "ScreenToGif $version is already installed."
  return
}

#(Get-WMIObject win32_operatingsystem).OSArchitecture

$packageArgs = @{
  packageName    = 'screentogif.install'
  fileType       = 'msi'
  url            = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.2/ScreenToGif.2.35.2.Setup.x86.msi'
  url64bit       = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.2/ScreenToGif.2.35.2.Setup.x64.msi'

  softwareName   = "$softwareName"

  checksum       = '6EDF9F846A9F96BAB2F27E7353E5263014807029DDFDBDFFB73775039E00B970'
  checksumType   = 'sha256'
  checksum64     = '9D718BAF2C2116DDD2ED9F08F4A2F8C63B55B52FD05C39D9D08C1F6D21498BD1'
  checksumType64 = 'sha256'

  silentArgs     = '/qn'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs