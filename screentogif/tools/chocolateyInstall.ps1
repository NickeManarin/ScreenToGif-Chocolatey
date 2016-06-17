$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 1.4.2.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=screentogif&DownloadId=1480830&FileTime=130851210516500000&Build=21031' `
    -Checksum '825964A156FC30710CF5A98EBAB9E354016E8A4DDEB52936C08D51E92CA3E193' `
    -ChecksumType 'SHA256'
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe

New-Item -Type 'File' -Force -Path "$exe.ignore" | Out-Null
