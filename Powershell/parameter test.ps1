    function Test-Remainder
    {
         param(
             [string]
             [Parameter(Mandatory = $true, Position=0)]
             $Value,
             [string[]]
             [Parameter(Position=1, ValueFromRemainingArguments)]
             $Remaining)
         "Found $($Remaining.Count) elements"
         for ($i = 0; $i -lt $Remaining.Count; $i++)
         {
            "${i}: $($Remaining[$i])"
         }
    }
    Test-Remainder first one,two

 