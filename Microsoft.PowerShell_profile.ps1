Import-Module posh-git
$env:POSH_GIT_ENABLED = $true

Import-Module oh-my-posh
oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/jandedobbeleer.omp.json | Invoke-Expression

Import-Module -Name Terminal-Icons

# Load up everything in the scripts folder
foreach ($scriptFile in (Get-ChildItem -Path $PSScriptRoot\scripts -Recurse -Include *.ps1))
{
  . $scriptFile.FullName
}
. $PSScriptRoot\aliases.ps1

$Env:PYTHONIOENCODING='utf-8'
iex "$(thefuck --alias)"