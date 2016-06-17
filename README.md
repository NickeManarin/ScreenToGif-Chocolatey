# Chocolatey Package

Update the file hash using the built-in PowerShell cmdlet. A stronger/longer
checksum is preferred.

```
PS> Get-FileHash '.\ScreenToGif x.y.z.zip'

Algorithm   Hash                                                               Path
---------   ----                                                               ----
SHA256      AAAAABBBBBCCCCCDDDDDEEEEEFFFFFGGGGGHHHHHIIIIIJJJJJKKKKKLLLLLMMMM   C:\Users\anthony\Downloads\Sc...
```

Pack the updates.

```
PS> choco pack .\screentogif\screentogif.nuspec
```

Publish the resulting package.

```
PS> choco push .\screentogif.x.y.z.nupkg
```
