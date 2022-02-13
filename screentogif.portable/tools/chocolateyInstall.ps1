$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.36/ScreenToGif.2.36.Portable.x86.zip' `
    -Url64bit  'https://github.com/NickeManarin/ScreenToGif/releases/download/2.36/ScreenToGif.2.36.Portable.x64.zip' `
    -Checksum '8523FBA14E5E3F33DB965A81AA3C6F4CAF7DD25F920F5E3475B4FA3A4F95E729' `
    -Checksum64 '1FC6DF21FB0ADE800CA6AC13ECF2912A08525FF2D859302EB155B5E3D16A65FA' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe