$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.3.1.exe'
$exe2 = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.3.1/ScreenToGif.2.3.1.zip' `
    -Checksum '7EBE9BEF6EBF951B088D069351D96056EE5F606D37ACD13E650749FBFF737306' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Move-Item $exe $exe2 -force

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe2
