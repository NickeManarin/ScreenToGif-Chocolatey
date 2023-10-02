$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'https://github.com/NickeManarin/ScreenToGif/releases/download/2.39/ScreenToGif.2.39.Portable.x86.zip' `
    -Url64bit  'https://github.com/NickeManarin/ScreenToGif/releases/download/2.39/ScreenToGif.2.39.Portable.x64.zip' `
    -Checksum 'B4B8467A7A708D6C7DE58DE641D3695E5BD63B2918AA9220BED6A20A34F069DE' `
    -Checksum64 '53CFDFF0D43B10FE2E36090DDBFCB621D117FEA3DD926931DEDBF221A3159ED1' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe
