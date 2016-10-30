$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.3.exe'
$exe2 = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.3/ScreenToGif.2.3.zip' `
    -Checksum 'E5AFFC768A5A12B91281225B7A6A2D741CA97B0AD7F1FE1AB402C7B0773CC23B' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Move-Item $exe $exe2 -force

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe2
