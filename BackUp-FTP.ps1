 
function Send-FTPArchive(){
    #setting parameters of the function
    param([Parameter(position=0, mandatory=$true)][String]$archiveFilePath,
    [Parameter(position=1, mandatory=$true)][String]$FTPServerName)
    <#
    [Parameter(position=2, mandatory=$true)][String]$FTPServerUsername,
    [Parameter(position=3, mandatory=$true)][SecureString]$FTPUserPassword)
    #>
    
    #archive files before transfer
    $compress = @{
        Path = $archiveFilePath
        CompressionLevel = "Fastest"
        DestinationPath = "./FTPReadyArchive.zip"
    }
    #compress chosen files
    Compress-Archive @compress -Force

    
}


#file archive source and local save destination
$arg1 = Read-Host "Provide file path of files"

#prompting user for the credentials
$arg2 = Read-Host "Provide FTP server name"


#starting the function
Send-FTPArchive -archiveFilePath $arg1 -FTPServerName $arg2 