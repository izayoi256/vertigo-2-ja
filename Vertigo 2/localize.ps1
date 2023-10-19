$isWin = [System.Environment]::OSVersion.Platform -eq 'Win32NT'

$baseDir = './Vertigo 2/vertigo2_Data/StreamingAssets/Localization/'
$srcPath = "${baseDir}V2_localization.dist.csv"
$dstPath = "${baseDir}V2_localization.csv"
$jaPath = "${baseDir}V2_localization.ja.csv"

if ($isWin) {
    $srcPath = $srcPath -replace '/', '\'
    $dstPath = $dstPath -replace '/', '\'
    $jaPath = $jaPath -replace '/', '\'
}

if (-not (Test-Path -Path $dstPath)) {
    Write-Warning "Error: 元の言語ファイルが見つかりません。Vertigo 2のインストールディレクトリに設置してください。";
    Read-Host "Enterを押して終了";
    exit 1
}

if (-not (Test-Path -Path $jaPath)) {
    Write-Warning "Error: 日本語の言語ファイルが見つかりません。導入手順に従ってください。";
    Read-Host "Enterを押して終了";
    exit 1
}

if (-not (Test-Path -Path $srcPath)) {
    Copy-Item -Path $dstPath -Destination $srcPath
}

$src = Import-CSV -Delimiter "," -Path $srcPath
$ja = Import-CSV -Delimiter "," -Path $jaPath

for ($i=0; $i -lt $src.Length; $i++) {
    $src[$i].en = $ja[$i].ja
}

$src | Export-Csv -Delimiter "," -NoTypeInformation -Force -Path $dstPath

Read-Host "日本語化が完了しました。Enterを押して終了";
