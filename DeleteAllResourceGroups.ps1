# A simple script to delete all Azure resources recursively

$AzureRmAccount = Login-AzureRmAccount -EnvironmentName AzureCloud

# List of resource groups which should not be deleted. It is comma separated.

$noDelRes = "Important1", "Important2"
  
$rgName = Get-AzureRmResourceGroup 

Foreach($name in $rgName)
{
    Write-Host $name.ResourceGroupName
    if ($noDelRes -notcontains $name.ResourceGroupName) {
        Remove-AzureRmResourceGroup -Name $name.ResourceGroupName -Verbose -Force
    }
}