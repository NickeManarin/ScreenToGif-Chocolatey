$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.41/ScreenToGif.2.41.Portable.x86.zip' `
    -Url64bit  'https://github.com/NickeManarin/ScreenToGif/releases/download/2.41/ScreenToGif.2.41.Portable.x64.zip' `
    -Checksum '8A2520512CB2B7917BDD05EBA5FD70D223525F016DDE9766EB886EC6B7AD35CA' `
    -Checksum64 '33081F0565D7DD5C4A6D0BF47FB8B8F76B06EFD26B6564F0B6FEFA837BF81C05' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe