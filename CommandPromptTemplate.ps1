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

$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

function Get-VenvName {
    if (-not $env:VIRTUAL_ENV) { return $null }

    $cfg = Join-Path $env:VIRTUAL_ENV "pyvenv.cfg"
    if (Test-Path $cfg) {
        $line = Select-String -Path $cfg -Pattern '^\s*prompt\s*=\s*(.+?)\s*$' |
            Select-Object -First 1
        if ($line) { return $line.Matches[0].Groups[1].Value }
    }

    if ($env:VIRTUAL_ENV_PROMPT) { return $env:VIRTUAL_ENV_PROMPT.Trim('() ') }

    return "venv"
}

function prompt {
    #  $ \dir >        (without venv)
    #  $ projectName > (venv active)
    #  $ venv >        (venv active, name is not recognized)

    $venv = Get-VenvName
    $label = if ($venv) { $venv } else { "\" + (Split-Path -Leaf (Get-Location)) }

    $color = if ($env:TERM_PROGRAM -eq "vscode") { "DarkGray" } else { "White" }

    Write-Host ""
    Write-Host "$ " -NoNewline -ForegroundColor Green
    Write-Host $label -NoNewline -ForegroundColor $color
    Write-Host " >" -NoNewline -ForegroundColor Green
    return " "
}
