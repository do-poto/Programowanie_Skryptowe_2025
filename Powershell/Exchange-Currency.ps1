<#
function Request-Rates(){
    param([Parameter(Position=0; mandatory=$true)][String]$startCurrency, 
    [String]$endCurrency)
    $URI = "https://api.currencybeacon.com/v1/historical?"
    $apiKey = ""
    $URI = $URI + $apiKey

    $dateCall = Get-Date
    $currentDate = $dateCall -Format "dd/mm/yyyy"
    $pastDate = $dateCall.AddDays(-5) | -Format "dd/mm/yyyy"
    
    $headers = @{}
    $headers.add("Content-Type", "application/json")
    
    $body = @{}
    $body.add("base", "PLN")
    $body.add("stat_date", "")
    $body.add("end_date", "")

    $request = Invoke-WebRequest -URI $URI -Headers $headers -Body $body

    Write-Host $request
}
#>

$currentDate = Get-Date -Format "dd/mm/yyyy"
$pastDate = (Get-Date).AddDays(-5) | -Format "dd/mm/yyyy"

Write-Host $currentDate
Write-Host $pastDate