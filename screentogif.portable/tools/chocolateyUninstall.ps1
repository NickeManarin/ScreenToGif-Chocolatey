$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ScreenToGif.lnk'

Remove-Item -Force -Path $shortcut | Out-Null
