function Get-ShortenedUrl {
    param (
        [Parameter(Mandatory = $true)]
        [string]$AccessToken,

        [Parameter(Mandatory = $true)]
        [string]$LongUrl
    )

    $headers = @{
        'Authorization' = "Bearer $AccessToken"
        'Content-Type'  = 'application/json'
    }

    $body = @{
        long_url = $LongUrl
    }

    $response = Invoke-RestMethod -Uri "https://api-ssl.bitly.com/v4/shorten" -Method Post -Headers $headers -Body ($body | ConvertTo-Json -Depth 10)

    $shortenedUrl = $response.id
    Write-Output $shortenedUrl
}
