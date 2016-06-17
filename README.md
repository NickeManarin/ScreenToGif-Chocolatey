# Chocolatey Package

Welcome to the Chocolatey package for Screen to Gif.

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
PS> Get-FileHash '.\ScreenToGif x.y.z.jar'

Algorithm   Hash                                                               Path
---------   ----                                                               ----
SHA256      AAAAABBBBBCCCCCDDDDDEEEEEFFFFFGGGGGHHHHHIIIIIJJJJJKKKKKLLLLLMMMM   C:\Users\anthony\Downloads\Sc...
```

## Infrequently Updated

The package icon is a bit of a pain to update. Update the icon by overwriting
the file in this repository. It may help to run it through an optimizer.

```
PS> pngout .\screentogif.png
```

Commit and push this. We need to get the canonical URL for this file before we
can update or publish the package.

 1. On GitHub, navigate to the file.
 2. Press 'y' to view the [canonical URL](https://help.github.com/articles/getting-permanent-links-to-files/).
 3. Click the "Raw" button to view the raw file.
 4. Copy this URL into the field at http://rawgit.com.
 5. Use the "production" URL in the package.

## Pack and Publish

Pack.

```
PS> choco pack .\screentogif\screentogif.nuspec
```

Publish.

```
PS> choco push .\screentogif.x.y.z.nupkg
```
