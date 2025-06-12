function Log-Message {
    param (
        [string]$Message
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Use PSScriptRoot to get the folder of the current script
    $logDir = Join-Path -Path $PSScriptRoot -ChildPath "logs"
    $logFile = Join-Path -Path $logDir -ChildPath "activity.log"

    # Create the logs directory if it doesn't exist
    if (-not (Test-Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir -Force | Out-Null
    }

    # Write to the log file
    Add-Content -Path $logFile -Value "$timestamp - $Message"
    Write-Host "$timestamp - $Message"
}




function Invoke-ScimApi {
    param (
        [string]$Uri,
        [string]$Method,
        [hashtable]$Headers,
        [hashtable]$Body = $null
    )

    try {
        if ($Body) {
            $jsonBody = $Body | ConvertTo-Json -Depth 10
            Write-Host "sending  JSON: $jsonBody"
            return Invoke-RestMethod -Uri $Uri -Method $Method -Headers $Headers -Body $jsonBody -ContentType "application/json"
       } else {
        return Invoke-RestMethod -Uri $Uri -Method $Method -Headers $Headers
       }
    }  catch {
        Log-Message "ERROR calling ${Uri}: $($_.Exception.Message)"
        return $null
    }
}


