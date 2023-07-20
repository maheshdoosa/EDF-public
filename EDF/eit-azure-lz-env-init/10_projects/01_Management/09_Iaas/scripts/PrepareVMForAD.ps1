   <#
  .SYNOPSIS
    This build prepares the Operating System at build time. A registry key is created to determine what has been installed in case the script is run multiple times.

    .DESCRIPTION
    This runbook  removes any existing tags on a particular VM then updates the VM with the new tags identified within the CSV

    .REQUIREMENTS
    GBRegion.xml is required for GB Regional Settings

    .AUTHOR: Sean McDonnell

    .EXAMPLES: .\vmPostBuildScript.ps1
#>

# Define registry key settings
$registryPath = "HKLM:\Software\AzureVM\vmBuildPrep"
$regkeyName = "ScriptVersion"
$value = "0"
$LogFile = "C:\Temp\PostInstallScript.log"

# First function to run once a VM has been created. This sets the Regional Settings, TimeZone, Labels C drive and
function stageOneConfig
{
    $regNumber = Get-ItemProperty -Path $registryPath -Name $regkeyName
    $regVariable = $regNumber.$regKeyName

    if($regVariable -lt 1)
    {
        Add-Content -Value "$(Get-Date): Registry Key value = $($regVariable)" -Path $LogFile
        Add-Content -Value "$(Get-Date): Running Stage One Configuration." -Path $LogFile

		# Create C:\Temp directory
		New-Item -ItemType Directory -Path "C:\Temp" -Force

        # Get Content for the Regional Settings
        Get-content -Path C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.10.9\Downloads\0\GBRegion.xml | Out-File C:\Temp\GBRegion.xml

        # Change Timezone
        tzutil /s "GMT Standard Time"

        # Move CDROM to Z:\
        #(gwmi Win32_cdromdrive).drive | %{$a = mountvol $_ /l;mountvol $_ /d;$a = $a.Trim();mountvol z: $a}

        # Change System Locale & Language
        Set-WinSystemLocale en-GB
        Set-WinHomeLocation -GeoId 242
        Set-Culture en-GB
        & $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"C:\Temp\GBRegion.xml`""

        # Label C:\
        $systemDrive = Get-Volume -DriveLetter C
        if($systemDrive.FriendlyName -ne 'SYSTEM')
        {
            Set-Volume -DriveLetter C -NewFileSystemLabel "SYSTEM"
        }

        # Disable IE Enhanced Security Configuration for Administrators
        $AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
        Set-ItemProperty -Path $AdminKey -Name IsInstalled -Value 0

        # Unbind IPv6 from the Network Adapter
        $NIC = Get-NetAdapterBinding | where-object {$_.ComponentID -eq "ms_tcpip6"}
        Disable-NetAdapterBinding -Name $NIC.Name -ComponentID "ms_tcpip6"

		# Setup Disk Drives
		Add-Content -Value "Setting up drives " -Path $LogFile
		try {
		$NewDisk = @(Get-Disk | Sort-Object Number | Where-Object partitionstyle -eq 'raw')
		$DiskLetter = @('F')
		$DiskLabel = @('NTDS')

		for($i = 0; $i -lt $NewDisk.Count ; $i++)
		{
		$DiskNum = $NewDisk[$i].Number
		Get-Disk $DiskNum | Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -DriveLetter $DiskLetter[$i] -UseMaximumSize
		Format-Volume -DriveLetter $DiskLetter[$i] -FileSystem NTFS -NewFileSystemLabel $DiskLabel[$i] -Confirm:$false
		Add-Content -Value "Format Drive $DiskNum - $($DiskLetter[$i]) - $($DiskLabel[$i])" -Path $LogFile
		}
	}
	catch {
	Add-Content -Value "Drive Setup Failed" -Path $LogFile
	Add-Content -Value $Error[0] -Path $LogFile
	Exit
}

        # After configuration is completed, index the
        $value = "1"
        Set-ItemProperty -Path $registryPath -Name $regkeyName -Value $value
        Add-Content -Value "$(Get-Date): Stage One Configuration Complete" -Path $LogFile
    }
    elseif($regVariable -gt 0)
    {
       Add-Content -Value "$(Get-Date): Stage One Configuration has previously been run, skipping this step" -Path $LogFile
    }
}

function stageTwoConfig
{
    $regNumber = Get-ItemProperty -Path $registryPath -Name $regkeyName
    $regVariable = $regNumber.$regKeyName

    if($regVariable -lt 2)
    {
        # After configuration is completed, index the
        Add-Content -Value "$(Get-Date): Stage Two Configuration Complete" -Path $LogFile
        $value = "2"
        Set-ItemProperty -Path $registryPath -Name $regkeyName -Value $value
    }
    elseif($regVariable -gt 0)
    {
       Add-Content -Value "$(Get-Date): Stage Two Configuration has previously been run, skipping this step" -Path $LogFile
    }
}

# Test that the registry Key exists, if not one will be created. On second run the else statement will obtain the value of the regkey.
If(!(Test-Path $registryPath))
  {
    try {
        Add-Content -Value "$(Get-Date): Registry Key doesn't currenlty, adding a new key in the following path: $($registryPath)" -Path $LogFile
        New-Item -Path $registryPath -Force | Out-Null
        New-ItemProperty -Path $registryPath -Name $regkeyName -Value $value -PropertyType DWORD -Force | Out-Null
        $regVariable = "0"
    }
    catch {
        Add-Content -Value "$(Get-Date): An error occurred when attempting to Add the Registry Key" -Path $LogFile
    }
  }

 else {
    $regNumber = Get-ItemProperty -Path $registryPath -Name $regkeyName
    $regVariable = $regNumber.$regKeyName
    Add-Content -Value "$(Get-Date): Registry Key already exists, checking value. Value = $($regVariable)" -Path $LogFile
  }

stageOneConfig
#stageTwoConfig
