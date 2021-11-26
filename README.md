# Powershell scripts
This repo contains some PS scripts that i often use.
This readme contains the explanation of how to use.

Currently, this repo contains the following scripts:

* Add alias for Office 365 email
* Get IP addresses by host name(s)
* Multiple Git operations
* Unzip all files directly into the current working directory

## Adding to the PATH environment variable
Powershell's PATH environment variable works a little different than the old command line.
To add the scripts to the PATH environment, add the path to the registry:
* HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment
* Key: Path

## Add alias for Office 365 email
Add a mail alias for an Office 365 mail account using a simple Powershell script

### Settings
Set the following settings in the script:
```ps
$mailbox = "mail@domain.com"
$aliasDomain = "@domain.com"
$adminPrincipal = "admin@admindomain.com"
```

**mailbox**
The mailbox is where to create the alias for.

**aliasDomain**
The domain that the alias will be created for.
This will be the domain that is used for the $mailbox.

**adminPrincipal**
The email address of the administrator account that you will use to create the alias.
This can of course be the same as the $mailbox, but it can also be a different one.

---

## Get IP addresses by host name(s)
Get IP addresses for hostnames.

### Usage
Call this script with the domain name(s) you want to get the IP address of.
Example:
```.\Get-Ips-By-Host.ps1 google.com microsoft.com azure.com```

This will give you the following output:
```
IP                  | Hostname
--------------------+------------------------------
142.250.179.174     | google.com
40.113.200.201      | microsoft.com
13.94.192.98        | azure.com
```

---

## Git Checkout
Executes ```git checkout``` in all subdirectories of the current working dir.

### Usage
Call this script from within a directory that contains (multiple) git repos, each in
their own (sub)directory.
```.\Git-Checkout.ps1```

You can also specify the branch you want to checkout directly by running:
```.\Git-Checkout.ps1 branchname```

### Note
The branch must exist locally, it does not create it from a remote branch when not
checked out earlier.

---

## Git Fetch
Executes ```git fetch``` in all subdirectories of the current working dir.

### Usage
Call this script from within a directory that contains (multiple) git repos, each in
their own (sub)directory.
```.\Git-Fetch.ps1```

---

## Git Pull
Executes ```git pull``` in all subdirectories of the current working dir.

### Usage
Call this script from within a directory that contains (multiple) git repos, each in
their own (sub)directory.
```.\Git-Pull.ps1```

---

## Unzip all zip files into the current directory
Extract all the zip files in a directory, straight into the directory.
So if there is no folder structure inside the zip file, all the files will
go directly to the working directory.

### Usage
Call this script from within a directory that contains multiple zip files.
```.\Unzip-All.ps1```
