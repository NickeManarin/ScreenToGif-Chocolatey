$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.1.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=screentogif&DownloadId=1597782&FileTime=131144970380730000&Build=21031' `
    -Checksum '65BF9F9B8F17B2C2B85720F6F4DD4A35561A9554A217183A3F8D95E390114F14' `
    -ChecksumType 'SHA256'
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe

New-Item -Type 'File' -Force -Path "$exe.ignore" | Out-Null
