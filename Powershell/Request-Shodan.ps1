function Search-Shodan{
    param([Parameter(Position=0, mandatory=$true)][String]$ipAddress)

    $URI = "https://api.shodan.io/shodan/host/"
    $apiKey = "?key=7GYa0kxr8Lq4fjsqDH6Uc3HLWpLLoz1x"
    $URI = $URI + $ipAddress + $apiKey
    
    $headers = @{}
    $headers.add("Content-Type", "application/json")
    
    $body = @{}
    $body.add("minify", $true)

    $request = Invoke-WebRequest -URI $URI -Headers $headers -Body $body
    $response = $request | ConvertFrom-Json
    Write-Host "Open ports for $ipAddress are: "$response.ports
}

Search-Shodan