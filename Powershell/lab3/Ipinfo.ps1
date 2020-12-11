 get-ciminstance win32_networkadapterconfiguration |
>> where-object ipenabled |
>>  Select-Object description,
>>               index,
>>               ipaddress,
>>               ipsubnet,
>>               dnsdomain,
>>               dnsserversearchorder|
>> format-table * -autosize