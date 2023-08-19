# PingSweep.psm1

function New-PingSweep {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$BaseIP
    )

    $results = @()

    for ($i = 0; $i -le 254; $i++) {
        $targetIP = "$BaseIP.$i"
        $pingResult = Test-Connection -ComputerName $targetIP -Count 1 -ErrorAction SilentlyContinue

        if ($pingResult -ne $null -and $pingResult.StatusCode -eq 0) {
            $results += [PSCustomObject]@{
                IPAddress = $targetIP
                ResponseTime = $pingResult.ResponseTime
                Status = "Online"
            }
        } else {
            $results += [PSCustomObject]@{
                IPAddress = $targetIP
                ResponseTime = $null
                Status = "Offline"
            }
        }
    }

    return $results
}
