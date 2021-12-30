$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.3/ScreenToGif.2.35.3.Portable.x86.zip' `
    -Url64bit  'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.3/ScreenToGif.2.35.3.Portable.x64.zip' `
    -Checksum '4C7E6355C8085014D3062154662FD820F1F5278CF905D8E0FEDF71E81A02192E' `
    -Checksum64 'DADA66BBA884B3957FD9F3EAA6F19BE8E1CC105DDDE17D34D3CB7C70243607D9' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe