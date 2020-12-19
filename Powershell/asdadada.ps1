Function get-SystemSummary{
param(
    [parameter(Mandatory = $false)]
    [ValidateNotNull()]
    [string]$System = "System",
    [parameter(Mandatory = $false)]
    [ValidateNotNull()]
    [string]$Disk= "Disk",
    [parameter(Mandatory = $false)]
 
    [ValidateNotNull()]
    [string]$Network = "Newtwork"

)

 
# $Sysinfo=($out0,$out1,$out2,$out3,$out4,$out5,$out6)



if ([string]$system -eq $true) {

   Get-ProcessorInfo
   Get-OSinfo
   Get-MemoryInfo
   Get-VideoCardInfo

}
elseif ($Narrowsearch -eq "-Disk") {

   Get-DiskInfo

}
elseif ($Narrowsearch -eq "-Network") {

   Get-NetworkInfo
}
else {
 Get-Hardwaredesc
Get-OSinfo
Get-ProcessorInfo
Get-MemoryInfo
Get-DiskInfo
Get-NetworkInfo
Get-VideoCardInfo

}
}