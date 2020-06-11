
param(
      [string]$iothubname,
      [string]$iothubCompatibleEndpoint,
      [string]$iothubCompatiblePath,
      [string]$iothubs_iotHubSasKey,
      [string]$s_iotHubSasKeyName,
      [string]$ConsumerGroup,
      [string]$eventhubname,
      [string]$eventHubConnectionString,
      [string]$postgreHost,
      [string]$postgreUserName,
      [string]$postgrePassword,
      [string]$postgreDbName,
      [string]$postgrePort,
      [string]$vmIP
      
     
  )


#-------------End-------------------------

#--------------------Change appsetting----------------------
$TwinWorxUrl='http://'+$vmIP+':1009'
$ApiGatewayUrl='http://'+$vmIP+':1007'
$TwinWorXServiceRegisteryPath = 'C:\Emagic\TwinWorXApps\1.TwinWorXServiceRegistery\appsettings.json'
$TwinWorXDataResourceMangaerPath = 'C:\Emagic\TwinWorXApps\2.TwinWorXDataResourceMangaer\appsettings.json'
$TwinWorXDataAccessServicePath = 'C:\Emagic\TwinWorXApps\3.TwinWorXDataAccessService\appsettings.json'
$TwinWorxDataAlarmingServicePath = 'C:\Emagic\TwinWorXApps\4.TwinWorxDataAlarmingService\appsettings.json'
$TwinWorXHistoricalDataAccessServicePath = 'C:\Emagic\TwinWorXApps\5.TwinWorXHistoricalDataAccessService\appsettings.json'
$TwinWorXAlarmingLoggerServicePath = 'C:\Emagic\TwinWorXApps\6.TwinWorXAlarmingLoggerService\appsettings.json'
$TwinWorXApiGatewayPath = 'C:\Emagic\TwinWorXApps\7.TwinWorXApiGateway\appsettings.json'
$TwinWorXDTPath = 'C:\Emagic\TwinWorXApps\8.TwinWorXDT\appsettings.json'
$TwinWorXExplorerPath = 'C:\Emagic\TwinWorXSolution\wwwroot\ClientApp\assets\config\configuration.json'
#----------------------------------------------rsmgr----------------------------------
(Get-Content $TwinWorXDataResourceMangaerPath).replace('{eventhubconstring}',$eventHubConnectionString) | Set-Content $TwinWorXDataResourceMangaerPath
(Get-Content $TwinWorXDataResourceMangaerPath).replace('{eventhubname}',$eventhubname) | Set-Content $TwinWorXDataResourceMangaerPath
(Get-Content $TwinWorXDataResourceMangaerPath).replace('{cgp}',$consumerGroup) | Set-Content $TwinWorXDataResourceMangaerPath
#--------------------------------------------DT---------------------------------------------
(Get-Content $TwinWorXDTPath).replace('{iothubcomendpoint}',$iothubCompatibleEndpoint) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{iothubcompath}',$iothubCompatiblePath) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{iothubskey}',$iothubs_iotHubSasKey) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{iothubskname}',$s_iotHubSasKeyName) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{cgp}',$ConsumerGroup) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{eventhubconstring}',$eventHubConnectionString) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('{eventhubname}',$eventhubname) | Set-Content $TwinWorXDTPath

#------------------------------------pgsql---------------------------------------------------#
(Get-Content $TwinWorXServiceRegisteryPath).replace('{host}',$postgreHost) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{port}',$postgrePort) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXServiceRegisteryPath
(Get-Content $TwinWorXServiceRegisteryPath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXServiceRegisteryPath

(Get-Content $TwinWorXDataAccessServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorXDataAccessServicePath
(Get-Content $TwinWorXDataAccessServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorXDataAccessServicePath
(Get-Content $TwinWorXDataAccessServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXDataAccessServicePath
(Get-Content $TwinWorXDataAccessServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXDataAccessServicePath
(Get-Content $TwinWorXDataAccessServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXDataAccessServicePath

(Get-Content $TwinWorxDataAlarmingServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorxDataAlarmingServicePath
(Get-Content $TwinWorxDataAlarmingServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorxDataAlarmingServicePath
(Get-Content $TwinWorxDataAlarmingServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorxDataAlarmingServicePath
(Get-Content $TwinWorxDataAlarmingServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorxDataAlarmingServicePath
(Get-Content $TwinWorxDataAlarmingServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorxDataAlarmingServicePath

(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorXHistoricalDataAccessServicePath
(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorXHistoricalDataAccessServicePath
(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXHistoricalDataAccessServicePath
(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXHistoricalDataAccessServicePath
(Get-Content $TwinWorXHistoricalDataAccessServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXHistoricalDataAccessServicePath

(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{host}',$postgreHost) | Set-Content $TwinWorXAlarmingLoggerServicePath
(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{port}',$postgrePort) | Set-Content $TwinWorXAlarmingLoggerServicePath
(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{username}',$postgreUserName) | Set-Content $TwinWorXAlarmingLoggerServicePath
(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{password}',$postgrePassword) | Set-Content $TwinWorXAlarmingLoggerServicePath
(Get-Content $TwinWorXAlarmingLoggerServicePath).replace('{database}',$postgreDbName) | Set-Content $TwinWorXAlarmingLoggerServicePath

(Get-Content $TwinWorXApiGatewayPath).replace('{clientUrl}',$TwinWorxUrl) | Set-Content $TwinWorXApiGatewayPath

(Get-Content $TwinWorXExplorerPath).replace('{apiGatewayUrl}',$ApiGatewayUrl) | Set-Content $TwinWorXExplorerPath

#--------------------End------------------------------------
#------------------Firewall-----------------------------

Import-Module NetSecurity
New-NetFirewallRule -DisplayName "twcustomRule1" -Direction Inbound -LocalPort Any -Protocol TCP -Action Allow

#-----------------------------------end--------------------
#-----------------------restart pgserver---------------------
<#

Write-host "Grabbing Service Principal..."

$response = Invoke-WebRequest -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fmanagement.azure.com%2F' -Method GET -UseBasicParsing -Headers @{Metadata="true"}

$content = $response.Content | ConvertFrom-Json

$ArmToken = $content.access_token

Write-host "The managed identities for Azure resources access token is $ArmToken"

$subscriptions='4ddcea5c-502f-4395-b3dc-5b2e28da9cc4'
$resourceGroup='emagic'
$pgServer='pgdemo'
$token='Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IkN0VHVoTUptRDVNN0RMZHpEMnYyeDNRS1NSWSIsImtpZCI6IkN0VHVoTUptRDVNN0RMZHpEMnYyeDNRS1NSWSJ9.eyJhdWQiOiJodHRwczovL21hbmFnZW1lbnQuYXp1cmUuY29tLyIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0LzMyNzE3ZWZlLThmY2ItNDQ4Ni05MDExLTI3N2MyNjVjMGFjMi8iLCJpYXQiOjE1ODk5NzQwNTUsIm5iZiI6MTU4OTk3NDA1NSwiZXhwIjoxNTkwMDYwNzU1LCJhaW8iOiI0MmRnWUZoeFRTbDhQV2ZoazhoLzU1TlRGbmd2QXdBPSIsImFwcGlkIjoiMzdhYTgwYWItYTNmYS00OGQyLWI5ZmItNmU5N2Q0ZjZkYzg1IiwiYXBwaWRhY3IiOiIyIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvMzI3MTdlZmUtOGZjYi00NDg2LTkwMTEtMjc3YzI2NWMwYWMyLyIsIm9pZCI6IjZmYmFmZTYwLTJiNmMtNDg3ZS04YThiLWE3NGFlZTcyNjA3NCIsInN1YiI6IjZmYmFmZTYwLTJiNmMtNDg3ZS04YThiLWE3NGFlZTcyNjA3NCIsInRpZCI6IjMyNzE3ZWZlLThmY2ItNDQ4Ni05MDExLTI3N2MyNjVjMGFjMiIsInV0aSI6Ik1nZ2ZuZ0NXV1V1X1NuMnluMHhBQUEiLCJ2ZXIiOiIxLjAiLCJ4bXNfbWlyaWQiOiIvc3Vic2NyaXB0aW9ucy80ZGRjZWE1Yy01MDJmLTQzOTUtYjNkYy01YjJlMjhkYTljYzQvcmVzb3VyY2Vncm91cHMvZW1hZ2ljL3Byb3ZpZGVycy9NaWNyb3NvZnQuQ29tcHV0ZS92aXJ0dWFsTWFjaGluZXMvaXp0aWR0d1dpblZNIn0.PHXH44XmX2vIZNEqrtnSCPYoz022BQjQMzO4XcZxtUFTJ4g4ZXNrwsOaEJR_l4NmThvsTprQfreeT-w2qwJMX2jlUbRQjEUGv0Na2BCiBIjNSSUhnSTtHu4E1S06ayHjF3xvxrQWuZqtaVKVWnwwH9FzGwtM6PNVI6KWrCXGYn7U_RX7_FYcB7TcfJPmRZlr1TcqoXQXfTdh8SmD9s_DpmvypUxf6b5bcxRD2x_3wGk9DY3uaDLRWCMs1sIpIMQr2-ZaViNljqVhZiQKF36rIDyKU6tGxgHZsD-7gHQyNxDRmFERZyhFH0AwFzyYMINvyX2d12l9C320wqgQx6ANRA'
$Header = @{
    'Content-type' = 'application/json'
     Authorization = $token
}
$uri='https://management.azure.com/subscriptions/'+$subscriptions+'/resourceGroups/'+$resourceGroup+'/providers/Microsoft.DBforPostgreSQL/servers/'+$pgServer+'/restart?api-version=2017-12-01'


$restartResponse = Invoke-WebRequest $uri  -Headers $Header -Method 'POST'

Start-Sleep -s 30
Write-Host $restartResponse

#>

#--------------------------invoke services-------------------------------------
<#
Invoke-WebRequest -Uri 'http://localhost:1001/default'
Invoke-WebRequest -Uri 'http://localhost:1002/default'
Invoke-WebRequest -Uri 'http://localhost:1003/default'
Invoke-WebRequest -Uri 'http://localhost:1004/default'
Invoke-WebRequest -Uri 'http://localhost:1005/default'
Invoke-WebRequest -Uri 'http://localhost:1006/default'
Invoke-WebRequest -Uri 'http://localhost:1007/default'
Invoke-WebRequest -Uri 'http://localhost:1008/default'
#>


#-----------------------End---------------------------