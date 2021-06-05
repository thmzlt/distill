###
Write-Output "Setting keyboard repeat rate and delay..."

Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard\" -Name KeyboardSpeed -Value 31
Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard\" -Name KeyboardDelay -Value 0


###
Write-Output "Mapping Caps Lock key to Control..."

$key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout';
$value = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_" };

if (Get-ItemProperty -Path $key -Name "Scancode Map") {
    Set-ItemProperty -Path $key -Name "Scancode Map" -Value ([byte[]]$value)
}
else {
    New-ItemProperty -Path $key -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$value)
}