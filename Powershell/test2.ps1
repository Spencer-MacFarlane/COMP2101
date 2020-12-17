$diskdrives = Get-CimInstance cim_diskdrive 
foreach ($disk in $disksdrives){ 
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
                                                                       }|
                                                                          Format-Table Manufacturer,Model,drive,"Size(GB)","Free space(GB)","%Free"
                                                                                      #@{n="Manufacturer"; e={if ($_.Manufacturer -eq $null) {"No data"} else {$_.Manufacturer}}},
                                                                                      #@{n="Model"; e={if ($_.Model -eq $null) {"No data"} else {$_.Model}}},
                                                                                      #@{n="drive"; e={if ($_.drive -eq $null) {"No data"} else {$_.drive}}},
                                                                                      #@{n="Size(GB)"; e={if ($_."Size(GB)" -eq $null) {"No data"} else {$_."Size(GB)"}}},
                                                                                      #@{n="Free space(GB)"; e={if ($_."Free space(GB)" -eq $null) {"No data"} else {$_."Free space(GB)"}}},
                                                                                      #@{n="%Free"; e={if ($_."%Free" -eq $null) {"No data"} else {$_."%Free"}}}
        }
     }
}
"Bascoopity"