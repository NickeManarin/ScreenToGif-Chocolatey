$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'
$exe = Join-Path $content 'ScreenToGif 2.exe'

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=screentogif&DownloadId=1572748&FileTime=131101759333270000&Build=21031' `
    -Checksum '8f9db5b99c1c95ced26886992be0ec44d9512b7ab46bef3f18d5a29c7fb5e3ca' `
    -ChecksumType 'SHA256'
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $exe

New-Item -Type 'File' -Force -Path "$exe.ignore" | Out-Null
