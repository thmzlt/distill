if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {  
    Write-Error "Must run with elevated privileges"
    exit 1
}

$ErrorActionPreference = "Stop"

& ".\scripts\apps.ps1"
& ".\scripts\keyboard.ps1"
& ".\scripts\windows-features.ps1"