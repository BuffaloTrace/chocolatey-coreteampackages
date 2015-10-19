﻿$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/S'
$validExitCodes = @(0)

$unfile = "${Env:ProgramFiles}\Freeciv-{{PackageVersion}}-gtk2\uninstall.exe"
$unfilex86 = "${Env:ProgramFiles(x86)}\Freeciv-{{PackageVersion}}-gtk2\uninstall.exe"

if (Test-Path "$unfile") {$file = "$unfile"}
if (Test-Path "$unfilex86") {$file = "$unfilex86"}

if ((Test-Path "$unfile") -or (Test-Path "$unfilex86")) {
  Uninstall-ChocolateyPackage $packageName $fileType `
    $silentArgs $file -validExitCodes $validExitCodes
}

