Clear-Host

if ($args.count -ne 1) {
    $branch = Read-Host "Name of the branch"
} else {
    $branch = $args[0];
}

$Directories = Get-ChildItem -Directory

Write-Host "-----------"
foreach ($dir in $Directories) {
    Write-Host $dir.Name
    Set-Location $dir.FullName;
    git checkout $branch
    Write-Host "-----------"
}

Set-Location ..
