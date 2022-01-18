$ErrorActionPreference = 'Stop'

$softwareName = 'ScreenToGif'
$version = '2.35.4'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "ScreenToGif $version is already installed."
  return
}

#(Get-WMIObject win32_operatingsystem).OSArchitecture

$packageArgs = @{
  packageName    = 'screentogif.install'
  fileType       = 'msi'
  url            = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.4/ScreenToGif.2.35.4.Setup.x86.msi'
  url64bit       = 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.4/ScreenToGif.2.35.4.Setup.x64.msi'

  softwareName   = "$softwareName"

  checksum       = '1234D3750769CE978742D88D0818B9B54BE4CBB0DCBE4C63A407DDFB67B18028'
  checksumType   = 'sha256'
  checksum64     = 'B0B0CAB00100518F13E43B396DCE9C4B0DE60D85BCD526C5BEBE7C04FFC08A2D'
  checksumType64 = 'sha256'

  silentArgs     = '/qn'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs