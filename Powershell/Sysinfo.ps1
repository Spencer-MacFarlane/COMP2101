
$hardwareinfo = Get-CimInstance win32_computersystem|
                       Select-Object description
$osinfo = Get-CimInstance win32_operatingsystem|
                          Select-Object name, 
                          version
$processorinfo =  Get-wmiobject win32_processor|
                  Select-Object  description,
                  speed, 
                  L2cachesize,
                  L3cachesize
$memoryinfo = Get-WmiObject win32_physicalmemory 