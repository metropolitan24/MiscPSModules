# ScheduledRestart.psm1

function Schedule-Restart {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [DateTime]$RestartTime
    )

    $currentTime = Get-Date
    $timeUntilRestart = $RestartTime - $currentTime

    if ($timeUntilRestart.TotalSeconds -le 0) {
        Write-Error "The specified restart time must be in the future."
        return
    }
    $delaySeconds = [math]::Round($timeUntilRestart.TotalSeconds)
    $shutdownCommand = "shutdown.exe -r -t $delaySeconds -f -c 'Scheduled restart.'"
    Invoke-Expression -Command $shutdownCommand
}
