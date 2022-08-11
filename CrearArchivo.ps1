param (
    [Parameter(Mandatory, HelpMessage = "Please Provide a valid path")]
    [string]$Path
)

New-Item $Path
Write-Host "File created at path $Path"