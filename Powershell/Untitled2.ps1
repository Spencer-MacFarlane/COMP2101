param(
    [parameter(Mandatory = $true)]
    [ValidateSet("dosomething", "dosomethingelse")]
    [ValidateNotNull()]
    [string]$WhichNotification
)

#Variables
$mailTo = "user@something.com"
$mailFrom = "user@somethingelse.com"
$smtpServer = "x.x.x.x"
$mailSubject1 = "Do Something"
$MailSubject2 = "do something else"

function Send-dosomething
{

    Send-MailMessage -To $mailTo -From $mailFrom -SmtpServer $smtpServer -Subject $mailSubject1 -Body "message1"
}


function Send-dosomethingelse
{
    Send-MailMessage -To $mailTo -From $mailFrom -SmtpServer $smtpServer -Subject $MailSubject2 -Body "message2"
}


if ($WhichNotification -eq "dosomething") {

    Send-dosomething

}
elseif ($WhichNotification -eq "dosomethingelse") {

    Send-dosomethingelse

}
else {

    Write-Host "Invalid"

}

param ([parameter(Mandatory=$false,
                  Position=0,
                  ParameterSetName="-System",
                  ValueFromPipeline=$true,
                  ValueFromPipelineByPropertyName=$true,
                  HelpMessage="Displays the cpu, OS, RAM, Video reports ony")]                  $system){
                           $sysoutput=($out2,$out2,$out3,$out6)
                           Write-Host $sysoutput
                            }
 ([parameter(Mandatory=$false,
                  Position=1,
                  ParameterSetName="Disks",
                  ValueFromPipeline=$true,
                  ValueFromPipelineByPropertyName=$true,
                  HelpMessage="Displays Disk report")]                  $Disks)
 ([parameter(Mandatory=$false,
                  Position=2,
                  ParameterSetName="Network",
                  ValueFromPipeline=$true,
                  ValueFromPipelineByPropertyName=$true,
                  HelpMessage="Displays the Network report")]                  $Network)