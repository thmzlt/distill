$source = 'Iosevka.zip'
$fontsFolder = 'Iosevka'

Expand-Archive -Path $source -DestinationPath $fontsFolder

foreach ($font in Get-ChildItem -Path $fontsFolder -File) {
    $dest = "C:\Windows\Fonts\$font"
    if (Test-Path -Path $dest) {
        "Font $font already installed."
    }
    else {
        $font | Copy-Item -Destination $dest
    }
}