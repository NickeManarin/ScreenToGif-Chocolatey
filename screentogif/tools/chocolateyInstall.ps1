$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.2.exe'
$exe2 = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.2/ScreenToGif.2.2.zip' `
    -Checksum '72C2E66B2EA2DC7770E4A7F224C77CCA7CBA1AFFF21D342B2E85FDE09FB72E15' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Move-Item $exe $exe2 -force

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe2
