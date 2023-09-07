$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.38.1/ScreenToGif.2.38.1.Portable.x86.zip' `
    -Url64bit  'https://github.com/NickeManarin/ScreenToGif/releases/download/2.38.1/ScreenToGif.2.38.1.Portable.x64.zip' `
    -Checksum '855032B53AE6BEAFBD63DDFEB47C53634062E7E31A97FA9041B24E368318D6A7' `
    -Checksum64 '400FAB6E5709250AF464AE8B8D0696EB4B60A8D22F7B9454496E0FD263ED144F' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe