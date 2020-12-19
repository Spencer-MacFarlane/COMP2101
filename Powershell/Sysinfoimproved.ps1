Function Get-Systeminfo{
param(
    [parameter(Mandatory = $false)]
    [ValidateSet("-System", "-Disk","-Network")]
    [ValidateNotNull()]
    [string]$NarrowSearch
)

 
# $Sysinfo=($out0,$out1,$out2,$out3,$out4,$out5,$out6)



if ([string]$Narrowsearch -eq "-System") {

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

    get-SystemSummary


}
}