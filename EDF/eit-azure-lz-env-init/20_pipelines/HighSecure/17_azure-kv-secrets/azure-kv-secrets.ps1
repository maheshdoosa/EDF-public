
param (

    [string]$storageAccount,

    [string]$storageAccountKey,

    [string]$shareName,

    [string]$sourcefile,

    [string]$kvname
    )

    # Creating Azure Secrets #####

    $context = New-AzStorageContext -StorageAccountName $storageAccount -StorageAccountKey $storageAccountKey

    Get-AzStorageFileContent -ShareName $shareName -Path $sourcefile -Context $context -Destination "."

    import-csv .\$sourcefile | ForEach {

    $secretToSearch = Get-AzKeyVaultSecret -VaultName $kvname -Name $_.Name -ErrorAction SilentlyContinue

    if($secretToSearch -ne $null)
    {
        $names = $_.Name.Split('-')

       echo "The secret $names already exists !"

    }
    Else
    {

        $keyvault= Get-AzKeyVault -VaultName $kvname

        $NewSecret = Set-AzKeyVaultSecret -VaultName $kvname -Name $_.Name -SecretValue (ConvertTo-SecureString $_.Secret -AsPlainText -Force ) -ErrorAction Stop

        $names = $_.Name.Split('-')

        echo "The secret $names created Successfully !"
    }
    }
