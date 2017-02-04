$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.4.exe'
$exe2 = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.4/ScreenToGif.2.4.zip' `
    -Checksum '63EB8F9367323942FF17DB99C7980542796C4D35E92099E526223E45CE137B41' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Move-Item $exe $exe2 -force

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe2
