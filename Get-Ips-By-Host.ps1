clear

if ($args.count -lt 1) {
    Write-Host "Call this script with the domain name(s) you want to get the IP address of."
    Write-Host "Example:"
    Write-Host "  .\Get-Ips-By-Host.ps1 google.com microsoft.com azure.com"
    Write-Host
} else {
    Write-Host "$(("IP").PadRight(20, ' '))| Hostname"
    Write-Host "$(("-").PadRight(20, '-'))+$(("-").PadRight(30, '-'))"

    for ( $i = 0; $i -lt $args.count; $i++ ) {
        $hostAddress=[System.Net.Dns]::GetHostAddresses($args[$i])[0]
        Write-Host "$(($hostAddress.IPAddressToString).PadRight(20, ' '))| $($args[$i])"
    }

    Write-Host
}
