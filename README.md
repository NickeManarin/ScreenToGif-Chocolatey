# Chocolatey Package

[![Chocolatey](https://img.shields.io/chocolatey/v/screentogif.svg)](https://chocolatey.org/packages/screentogif) [![Chocolatey](https://img.shields.io/chocolatey/dt/screentogif.svg)](https://chocolatey.org/packages/screentogif)

Welcome to the Chocolatey package for ScreenToGif.

## Frequently Updated

Every package version requires the following changes, at least, in the nuspec
and probably in the install/uninstall scripts:

 * Version
 * Release notes (if this is a version-specific URL)
 * URL
 * Checksum

You can get the checksum using the built-in PowerShell cmdlet. The Chocolatey
default is MD5, but a stronger/longer checksum is preferred. PowerShell defaults
to SHA256, which is fine.

```
PS> Get-FileHash '.\ScreenToGif.Version.Type.Architecture.zip'

Algorithm   Hash                                                               Path
---------   ----                                                               ----
SHA256      AAAAABBBBBCCCCCDDDDDEEEEEFFFFFGGGGGHHHHHIIIIIJJJJJKKKKKLLLLLMMMM   C:\Users\Nicke\Downloads\Sc...
```

## Infrequently Updated

The package icon is a bit of a pain to update. Update the icon by overwriting
the file in this repository. It may help to run it through an optimizer.

```
PS> pngout .\screentogif.png
```

Commit and push this. We need to get the canonical URL for this file before we
can update or publish the package.

Visit [jsDelivr](https://cdn.jsdelivr.net/gh/NickeManarin/ScreenToGif-Chocolatey@master) and copy the url of the image.

## Pack and Publish

Pack.

```
PS> choco pack .\screentogif\screentogif.nuspec
```

Publish.

```
PS> choco push .\screentogif.x.y.z.nupkg
```
