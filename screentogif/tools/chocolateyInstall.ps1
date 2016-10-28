$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.3.exe'
$exe2 = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.3/ScreenToGif.2.3.zip' `
    -Checksum 'FD8187CD76F499A020C3120F09BE01F642A08DCAFAC50FC61DC822D5E8FB680B' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Move-Item $exe $exe2 -force

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe2
