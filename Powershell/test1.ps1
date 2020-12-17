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
  #@{n="PROTERTYNAME"; e={if ($_.PROPERTY -eq $null) {"No data"} else {$_.PROPERTY}}}