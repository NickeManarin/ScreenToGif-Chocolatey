$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.1.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=screentogif&DownloadId=1597782&FileTime=131144970380730000&Build=21031' `
    -Checksum '2EC4F2FB087EC08E2EAB600CCDE04445081D7F197FC5C4EC424C54CCA90687FB' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe

New-Item -Type 'File' -Force -Path "$exe.ignore" | Out-Null
