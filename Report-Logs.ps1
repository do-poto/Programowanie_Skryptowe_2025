

function Report-Suspicious{
    param([Parameter(position = 0, mandatory = $true)][String]$hostName)
    $credentials = Get-Credential -UserName "dominik" 
    $script={sudo journalctl -u ssh --grep "Failed password" | wc -l}
    
    $scriptStartValue = Invoke-Command -SSHTransport -HostName $hostName `
    -ScriptBlock $script -KeyFilePath C:\Users\cgdpp\.ssh\id_rsa `
    -Credential $credentials
    
    1..1 | ForEach-Object -Parallel {
    
        while($true){
    
        $scriptResult = Invoke-Command -SSHTransport -HostName $hostName `
        -ScriptBlock $script -KeyFilePath C:\Users\cgdpp\.ssh\id_rsa `
        -Credential $credentials
    
            if($scriptResult -ne $scriptStartValue){
            Write-Host "Failed login attempt detected!"
            } 
            Start-Sleep -Seconds 10
        }
    } -ThrottleLimit 1
}


$arg1 = Read-Host "Provide host name"
Report-Suspicious -hostName $arg1