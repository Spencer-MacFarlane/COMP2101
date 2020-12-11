get-ciminstance win32_networkadapterconfiguration |
 where-object ipenabled |
  Select-Object description,
               index,
               @{n="ipaddress v4, v6"; e={$_.ipaddress}},
               ipsubnet,
               dnsdomain,
               dnsserversearchorder|
 format-table * -autosize