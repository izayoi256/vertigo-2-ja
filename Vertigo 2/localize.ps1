$isWin = [System.Environment]::OSVersion.Platform -eq 'Win32NT'

$baseDir = './vertigo2_Data/StreamingAssets/Localization/'
$srcPath = "${baseDir}V2_localization.dist.csv"
$dstPath = "${baseDir}V2_localization.csv"
$jaPath = "${baseDir}V2_localization.ja.csv"

if ($isWin) {
    $srcPath = $srcPath -replace '/', '\'
    $dstPath = $dstPath -replace '/', '\'
    $jaPath = $jaPath -replace '/', '\'
}

if (-not (Test-Path -Path $jaPath)) {
    Write-Warning "Error: 日本語の言語ファイルが見つかりません。導入手順に従ってください。";
    Read-Host "Enterを押して終了";
    exit 1
}

if (-not (Test-Path -Path $srcPath)) {
    if (Test-Path -Path $dstPath) {
        Copy-Item -Path $dstPath -Destination $srcPath
    }
}

if (-not (Test-Path -Path $srcPath)) {
    Write-Warning "Error: 元の言語ファイルが見つかりません。Vertigo 2のインストールディレクトリに設置してください。";
    Read-Host "Enterを押して終了";
    exit 1
}

$src = Import-CSV -Delimiter "," -Path $srcPath -Encoding UTF8
$ja = Import-CSV -Delimiter "," -Path $jaPath -Encoding UTF8

$jaMap = @{}
foreach ($row in $ja) {
    $key = $($row.PSObject.Properties)[0].Value
    $jaMap[$key] = $row.ja
}

foreach ($row in $src) {
    $key = $($row.PSObject.Properties)[0].Value
    if ($jaMap.ContainsKey($key)) {
        $row.en = $jaMap[$key]
    }
}

$src | Export-Csv -Delimiter "," -NoTypeInformation -Force -Path $dstPath -Encoding UTF8

Read-Host "日本語化が完了しました。Enterを押して終了";
