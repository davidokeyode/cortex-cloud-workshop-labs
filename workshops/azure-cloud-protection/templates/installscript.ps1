##############################################################################
# installscript.ps1 — Windows Server post-deployment configuration
# Runs via Azure Custom Script Extension on the Windows VM.
# Installs common tools needed for the Cortex Cloud workshop labs.
##############################################################################

$ErrorActionPreference = "SilentlyContinue"

# --- Enable Windows features for container labs ---
Write-Host ">>> Enabling Windows features..."
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart:$false
Install-WindowsFeature -Name Containers

# --- Install Chocolatey package manager ---
Write-Host ">>> Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Refresh PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# --- Install common tools via Chocolatey ---
Write-Host ">>> Installing tools via Chocolatey..."
choco install -y git
choco install -y vscode
choco install -y azure-cli
choco install -y kubernetes-cli
choco install -y kubernetes-helm
choco install -y docker-desktop
choco install -y dotnet-sdk
choco install -y python3
choco install -y jq
choco install -y curl

# --- Install Azure PowerShell module ---
Write-Host ">>> Installing Azure PowerShell module..."
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name Az -Force -AllowClobber -Scope AllUsers

# --- Create temp directory for workshop files ---
Write-Host ">>> Creating workshop directories..."
New-Item -ItemType Directory -Path "C:\workshop" -Force
New-Item -ItemType Directory -Path "C:\temp" -Force

# --- Download sample files for the workshop ---
Write-Host ">>> Downloading workshop sample files..."
Invoke-WebRequest -Uri "https://secure.eicar.org/eicar.com.txt" -OutFile "C:\temp\eicar-test.txt" -ErrorAction SilentlyContinue

# --- Configure Windows Firewall for lab traffic ---
Write-Host ">>> Configuring Windows Firewall..."
New-NetFirewallRule -DisplayName "Allow HTTP Inbound" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow
New-NetFirewallRule -DisplayName "Allow HTTPS Inbound" -Direction Inbound -Protocol TCP -LocalPort 443 -Action Allow
New-NetFirewallRule -DisplayName "Allow 8080 Inbound" -Direction Inbound -Protocol TCP -LocalPort 8080 -Action Allow

# --- Set time zone ---
Set-TimeZone -Id "UTC"

Write-Host ">>> Windows VM configuration complete."
Write-Host ">>> A restart may be required to complete feature installation."
