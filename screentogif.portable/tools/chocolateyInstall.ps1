$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.2/ScreenToGif.2.35.2.Portable.x86.zip' `
    -Url64bit  'https://github.com/NickeManarin/ScreenToGif/releases/download/2.35.2/ScreenToGif.2.35.2.Portable.x64.zip' `
    -Checksum '39778FF239EDC84725CC57CEE58CF0568606C76AFF059A792D6740808A337E47' `
    -Checksum64 'C03420BCFA883D2B3518C9574EFE250790AA27001C3428C2232B59D4B51857AC' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe