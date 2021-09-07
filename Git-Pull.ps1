Clear-Host
$Directories = Get-ChildItem -Directory

Write-Host "-----------"
foreach ($dir in $Directories) {
    Write-Host $dir.Name
    Set-Location $dir.FullName;
    git pull
    Write-Host "-----------"
}

Set-Location ..
