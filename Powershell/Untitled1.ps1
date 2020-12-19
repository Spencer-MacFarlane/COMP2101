param (
    [Parameter( ValueFromPipeline=$true,
                ValueFromPipelineByPropertyName=$true,
                ParameterSetName="ServerNames",
                HelpMessage="List of computer names separated by commas.")]
    [Alias('hosts')] 
    [string[]]$computers = 'localhost',    
    [Parameter( ParameterSetName="FileName",
                HelpMessage="Name of txt file with list of servers. Txt file should be in 01servers folder.")] 
    [string]$filename,
    [Parameter( Mandatory=$false,
                HelpMessage="Write to error log file or not.")]
    [switch]$errorlog,
    [Parameter(Mandatory=$true, 
                HelpMessage="Client for example OK = O client, BK = B client")]
    [string]$client,
    [Parameter(Mandatory=$true,
                HelpMessage="Solution, for example FIN = Financial, HR = Human Resource")]
    [string]$solution 
) 