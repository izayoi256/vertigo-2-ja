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

if (-not (Test-Path -Path $dstPath)) {
    Write-Warning "Error: ���̌���t�@�C����������܂���BVertigo 2�̃C���X�g�[���f�B���N�g���ɐݒu���Ă��������B";
    Read-Host "Enter�������ďI��";
    exit 1
}

if (-not (Test-Path -Path $jaPath)) {
    Write-Warning "Error: ���{��̌���t�@�C����������܂���B�����菇�ɏ]���Ă��������B";
    Read-Host "Enter�������ďI��";
    exit 1
}

if (-not (Test-Path -Path $srcPath)) {
    Copy-Item -Path $dstPath -Destination $srcPath
}

$src = Import-CSV -Delimiter "," -Path $srcPath -Encoding UTF8
$ja = Import-CSV -Delimiter "," -Path $jaPath -Encoding UTF8

for ($i=0; $i -lt $src.Length; $i++) {
    $src[$i].en = $ja[$i].ja
}

$src | Export-Csv -Delimiter "," -NoTypeInformation -Force -Path $dstPath -Encoding UTF8

Read-Host "���{�ꉻ���������܂����BEnter�������ďI��";
