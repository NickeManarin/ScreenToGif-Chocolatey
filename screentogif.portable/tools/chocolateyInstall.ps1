$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.4/ScreenToGif.2.35.4.Portable.x86.zip' `
    -Url64bit  'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.4/ScreenToGif.2.35.4.Portable.x64.zip' `
    -Checksum '56BA53C7CE8D02C11EDCED6B0707AFF51EBAC413FBBC7EE2D2EC100173F50F8E' `
    -Checksum64 '8996B5D8731528CE1B6ED2488A1AC34BDFD35EBBF42D0005CD1FC46042AB60F6' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe