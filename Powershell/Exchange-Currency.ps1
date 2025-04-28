function Request-Rates(){
    #param([Parameter(Position=0; mandatory=$true)][String]$startCurrency)
    
    $URI = "https://api.currencybeacon.com/v1/historical?"
    $apiKey = "api_key="
    $URI = $URI + $apiKey

    $currentDate = Get-Date -Format "dd/mm/yyyy"
    $pastDate = (Get-Date).AddDays(-5).toString("dd/mm/yyyy")
    
    $headers = @{}
    $headers.add("Content-Type", "application/json")
    
    $body = @{}
    $body.add("base", "PLN")
    $body.add("symbols", "EUR, USD")
    $body.add("stat_date", $currentDate)
    $body.add("end_date", $pastDate)

    $request = Invoke-WebRequest -URI $URI -Headers $headers -Body $body

    Write-Host $request
}

Request-Rates