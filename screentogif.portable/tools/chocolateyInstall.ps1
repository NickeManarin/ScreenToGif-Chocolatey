$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.37/ScreenToGif.2.37.Portable.x86.zip' `
    -Url64bit  'https://github.com/NickeManarin/ScreenToGif/releases/download/2.37/ScreenToGif.2.37.Portable.x64.zip' `
    -Checksum '04158A428FD366FE7D0B6B4C26542C85E5F9FD9F2C08B43E23E14776F3EEAB3F' `
    -Checksum64 '7319888631F5B747EDB90A44B83DC594C2A6D14FF3DB5D32830F9DD7ECDD0ABA' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe