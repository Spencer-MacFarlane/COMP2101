function Get-Hardwaredesc{
"---------------------------------------
|                                     |
|      Hardware Description           |
|                                     |
---------------------------------------"
 Get-CimInstance win32_computersystem|
                       Select-Object @{n="Description"; e={if ($_.description -eq $null) {"No data"} else {$_.description}}} |
                       Format-list
}

function Get-OSinfo{
"---------------------------------------
|                                     |
|         OS Information              |
|                                     |
---------------------------------------"

Get-CimInstance win32_operatingsystem|
                          Select-Object @{n="Os Name"; e={if ($_.name -eq $null) {"No data"} else {$_.name}}},                                         
                                        @{n="Version"; e={if ($_.Version -eq $null) {"No data"} else {$_.Version}}}|
                          format-list
}
function Get-ProcessorInfo{
"---------------------------------------
|                                     |
|       Processor Information         |
|                                     |
 --------------------------------------"

  Get-wmiobject win32_processor|
                  Select-Object  description,
                  @{n="Max Speed (MHz)"; e={$_.Maxclockspeed}},
                  @{n="L1 Cache(Bytes)"; e={if ($_.L1cachesize -eq $null) {"No data"} else {$_.L1cachesize}}}, 
                  @{n="L2 Cache(Bytes)"; e={if ($_.L2cachesize -eq $null) {"No data"} else {$_.L2cachesize}}},
                  @{n="L3 Cache(Bytes)"; e={if ($_.L3cachesize -eq $null) {"No data"} else {$_.L3cachesize}}}
                  format-list
}
function Get-MemoryInfo{
"---------------------------------------
|                                     |
|    Physical Memory Information      |
|                                     |
---------------------------------------"
$totalMemory =0
 Get-WmiObject win32_physicalmemory|
      foreach{
              New-object -typename psobject -property @{
                            Manufacturer = $_.manufacturer
                            Description = $_.description
                           "Size(GB)" = $_.capacity/1gb
                            Bank = $_.banklabel
                            Slot = $_.devicelocator
            }
            $totalMemory +=$_.capacity/1gb
  }| ft -auto @{n="Manufacturer"; e={if ($_.Manufacturer -eq $null) {"No data"} else {$_.Manufacturer}}},
              @{n="Description"; e={if ($_.Description -eq $null) {"No data"} else {$_.Description}}},
              @{n="Size(GB)"; e={if ($_."Size(GB)" -eq $null) {"No data"} else {$_."Size(GB)"}}},
              @{n="Bank"; e={if ($_.Bank -eq $null) {"No data"} else {$_.Bank}}},
              @{n="Slot"; e={if ($_.Slot -eq $null) {"No data"} else {$_.Slot}}}
}
function Get-DiskInfo{  
"---------------------------------------
|                                     |
|         Disk Information            |
|                                     |
---------------------------------------"     

$diskdrives = Get-CimInstance cim_diskdrive 
foreach ($disk in $diskdrives){ 
            $partitions = $disk|Get-CimAssociatedInstance -ResultClassName CIM_diskpartition 
                foreach($partition in $partitions){
                    $logicaldisks = $partition | Get-CimAssociatedInstance -ResultClassName Cim_logicaldisk 
                        foreach ( $logicaldisk in $logicaldisks){
                            New-Object -TypeName psobject -Property @{Manufacturer=$disk.Manufacturer
                                                                        Model=$disk.Model
                                                                        Drive=$logicaldisk.deviceid
                                                                       "Size(GB)"=$logicaldisk.size/1gb -as[int]
                                                                       "Free Space(GB)"=$logicaldisk.FreeSpace/1gb -as [int]
                                                                       "%Free"=100*($logicaldisk.Freespace/$logicaldisk.size) -as [int]
                                                                       }|Format-Table @{n="Manufacturer"; e={if ($_.Manufacturer -eq $null) {"No data"} else {$_.Manufacturer}}},
                                                                                      @{n="Model"; e={if ($_.Model -eq $null) {"No data"} else {$_.Model}}},
                                                                                      @{n="drive"; e={if ($_.drive -eq $null) {"No data"} else {$_.drive}}},
                                                                                      @{n="Size(GB)"; e={if ($_."Size(GB)" -eq $null) {"No data"} else {$_."Size(GB)"}}},
                                                                                      @{n="Free space(GB)"; e={if ($_."Free space(GB)" -eq $null) {"No data"} else {$_."Free space(GB)"}}},
                                                                                      @{n="%Free"; e={if ($_."%Free" -eq $null) {"No data"} else {$_."%Free"}}}
        }
     }
}
}
Function Get-NetworkInfo{
"--------------------------------------
|                                    |
|          Network Adapters          |
|                                    |
--------------------------------------"
                                                                     
get-ciminstance win32_networkadapterconfiguration |
 where-object ipenabled |
  Select-Object @{n="Description"; e={if ($_.Description -eq $null) {"No data"} else {$_.Description}}},
                @{n="Index"; e={if ($_.index -eq $null) {"No data"} else {$_.index}}},
                @{n="Ipaddress v4, v6";e={if ($_.ipaddress -eq $null) {"No data"} else {$_.ipaddress}}},
                @{n="Ipsubnet"; e={if ($_.ipsubnet -eq $null) {"No data"} else {$_.ipsubnet}}},
                @{n="Snsdomain"; e={if ($_.dnsdomain -eq $null) {"No data"} else {$_.dnsdomain}}},
                @{n="DNS Addresses";e={if ($_.dnsserversearchorder -eq $null) {"No data"} else {$_.dnsserversearchorder}}}|
 format-table * -autosize -wrap
 }
function Get-VideoCardInfo{
"---------------------------------------
|                                     |
|       Video Card Information        |
|                                     |
---------------------------------------"
Get-wmiobject win32_videocontroller |
                     Select-Object @{n="Name"; e={if ($_.Name -eq $null) {"No data"} else {$_.Name}}},
                                   @{n="description"; e={if ($_.description -eq $null) {"No data"} else {$_.description}}},
                                   @{n="Resolution";e={if (($_.CurrentHorizontalResolution) -eq $null) {"No data"} elseif 
                                                                                                                         (($_.CurrentVerticalResolution) -eq $null) {"No data"} else 
                                                                                                                                            {$_.CurrentHorizontalResolution, "x", $_.CurrentVerticalResolution}}}|
                                    Format-List
}
function get-SystemSummary{
Get-Hardwaredesc
Get-OSinfo
Get-ProcessorInfo
Get-MemoryInfo
Get-DiskInfo
Get-NetworkInfo
Get-VideoCardInfo
}
