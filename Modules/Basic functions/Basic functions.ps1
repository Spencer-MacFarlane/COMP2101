Function welcome {write-output "welcome to Site: $env:computername Master $env:username"
$now= get-date -format 'HH:MM tt on ddd'
write-output "It is $now"}

Function get-cpuinfo {Get-CimInstance cim_processor | format-list -property name,manufacturer,model,currentclockspeed,maxclockspeed,numberoflogicalprocessors}

Function get-mydisks {get-physicaldisk | format-list -property manufacturer,model,serialnumber,size}
