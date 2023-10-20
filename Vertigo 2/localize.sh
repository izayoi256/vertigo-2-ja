tempFile=$(mktemp)
iconv -f windows-31j -t utf-8 localize.ps1 > "$tempFile"

pwsh -File "$tempFile"

rm "$tempFile"
