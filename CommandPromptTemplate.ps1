cls
$host.UI.RawUI.WindowTitle = "Terminal"

# For change command prompt type 'code $PROFILE' or 'notepad $PROFILE'
Write-Host "For change command prompt type '" -NoNewline -ForegroundColor DarkGray
Write-Host "code " -NoNewline -ForegroundColor Yellow 
Write-Host "$" -NoNewline -ForegroundColor Green
Write-Host "PROFILE" -NoNewline -ForegroundColor Green
Write-Host "' or '" -NoNewLine -ForegroundColor DarkGray
Write-Host "notepad " -NoNewline -ForegroundColor Yellow 
Write-Host "$" -NoNewline -ForegroundColor Green
Write-Host "PROFILE" -NoNewline -ForegroundColor Green
Write-Host "'" -ForegroundColor DarkGray

# Command prompt by Collappo
Write-Host "Command prompt by " -NoNewline -ForegroundColor DarkGray
Write-Host "Collappo" -ForegroundColor Green

function prompt {
    #  $ \dir >

    $dir = (Split-Path -Leaf (Get-Location))

    Write-Host ""
    Write-Host "$ " -NoNewline -ForegroundColor Green
    if ($env:TERM_PROGRAM -eq "vscode") {
        Write-Host "\$dir" -NoNewline -ForegroundColor DarkGray
    }
    else {
        Write-Host "\$dir" -NoNewline -ForegroundColor Gray
    }
    Write-Host " >" -NoNewline -ForegroundColor Green
    return " "
}
