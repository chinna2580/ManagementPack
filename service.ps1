param($sourceId,$managedEntityId,$computerName,$ServiceName)
$api= New-Object -ComObject 'MOM.ScriptAPI'
$discoveryData=$api.CreateDiscoveryData(0,$sourceId,$managedEntityId)
$proxy = New-WebServiceProxy -Uri $ServiceName
$subFolders=$proxy.GetEmployees();
foreach($subFolder in $subFolders)
{
$instance=$discoveryData.CreateClassInstance("$MPElement[Name='Krithika.Service.Methods']$")
$instance.AddProperty("$MPElement[Name='Windows!Microsoft.Windows.Computer']/PrincipalName$",$computerName)
$instance.AddProperty("$MPElement[Name='Krithika.Service.Methods']/ServiceE$",$subFolder.EmpName)
$instance.AddProperty("$MPElement[Name='Krithika.Service.Methods']/ServiceD$",$subFolder.DeptName)

$discoveryData.AddInstance($instance)
}
#$api.Return($discoveryData)
$discoveryData
