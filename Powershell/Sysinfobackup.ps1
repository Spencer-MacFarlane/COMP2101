param(
    [parameter(Mandatory = $false)]
    [ValidateSet("-System", "-Disk","-Network")]
    [ValidateNotNull()]
    [string]$searchparam
)

Get-Hardwaredesc  = $out0 |out-null 
Get-OSinfo        = $out1 |out-null 
Get-ProcessorInfo = $out2 |out-null 
Get-MemoryInfo    = $out3 |out-null 
Get-DiskInfo      = $out4 |out-null 
Get-NetworkInfo   = $out5 |out-null 
Get-VideoCardInfo = $out6 |out-null 
$Sysinfo=($out0,$out1,$out2,$out3,$out4,$out5,$out6)
if ($searchparam -eq "-System") {

   Get-ProcessorInfo
   Get-OSinfo
   Get-MemoryInfo
   Get-VideoCardInfo

}
elseif ($searchparam -eq "-Disk") {

   Write-Host $sysinfo[4]

}
elseif ($searchparam -eq "-Network") {

   Write-Host $sysinfo[5]
}
else {

    get-SystemSummary


}
