$toDisable = @(
    "MediaPlayback"
    "NetFx3"
    "NetFx4-AdvSrvs"
    "SmbDirect"
    "WindowsMediaPlayer"
)

$toEnable = @(
    "Microsoft-Windows-Subsystem-Linux"
    "VirtualMachinePlatform"
)

foreach ($feature in $toDisable) {
    Write-Output "Disabling $feature..."
    Disable-WindowsOptionalFeature -FeatureName $feature -Online -NoRestart
}

foreach ($feature in $toEnable) {
    Write-Output "Enabling $feature..."
    Enable-WindowsOptionalFeature -FeatureName $feature -Online -NoRestart
}