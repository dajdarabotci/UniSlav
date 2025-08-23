$baseDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$exePath = Join-Path $baseDir "..\AutoHotkey64_UniSlav.exe"
$ahkPath = Join-Path $baseDir "config.ahk"
Start-Process -FilePath $exePath -ArgumentList "`"$ahkPath`""