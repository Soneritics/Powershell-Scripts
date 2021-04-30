clear

# Settings
$mailbox = "mail@domain.com"
$aliasDomain = "@domain.com"
$adminPrincipal = "admin@admindomain.com"

# Connecting to Exchange Online
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName $adminPrincipal -ShowProgress $false
clear

# Main loop
$proceed = $true
while ($proceed) {
    # GHet the alias from user input
    $alias = Read-Host "Name of the alias (...$aliasDomain)"
    clear

    # Add the alias
    Set-Mailbox "$mailbox" -EmailAddresses @{add=$alias+$aliasDomain}
    Write-Host "Alias $alias$aliasDomain has been added."
    Write-Host "---------------------------------------------------------"
    Write-Host

    # Showing the total list of aliases
    $reloadList = $true
    while ($reloadList) {
        Write-Host "Current list of aliases for $mailbox"
        Write-Host "---------------------------------------------------------"
        Get-EXOMailbox $mailbox | select -expand emailaddresses alias | Sort-Object | % {$_.replace("smtp:", "")} | % {$_.replace("SMTP:", "")}
        Write-Host
        Write-Host

        # Check if we need to add another alias
        Write-Host "[q] = quit"
        Write-Host "[n] = new alias"
        Write-Host "everything else will refresh the alias list"
        $userInput = Read-Host "Action"
        
        if ($userInput -eq "q") {
            $reloadList = $false
            $proceed = $false
        } elseif ($userInput -eq "n") {
            $reloadList = $false
        }
        
        clear
    }
}

# Disconnect
Disconnect-ExchangeOnline -confirm:$false
