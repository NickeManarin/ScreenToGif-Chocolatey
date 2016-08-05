$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.1.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=screentogif&DownloadId=1597782&FileTime=131148424757600000&Build=21031' `
    -Checksum '2589B43A22A6A610BADA5C974DA5093E93D4DC8388981C66C00309FE01619150' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe

New-Item -Type 'File' -Force -Path "$exe.ignore" | Out-Null
