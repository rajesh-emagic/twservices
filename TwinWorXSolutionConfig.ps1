
param(
      [string]$iothubname,
      [string]$iothubCompatibleEndpoint,
      [string]$iothubCompatiblePath,
      [string]$iothubs_iotHubSasKey,
      [string]$s_iotHubSasKeyName,
      [string]$ConsumerGroup,
      [string]$eventhubname,
      [string]$eventHubConnectionString
     
  )

#----------------------get parameter---------------------

# ----------------------iis installation---------------
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# ------------------hosting environment------------------------
$temp_path = "C:\temp\"

if( ![System.IO.Directory]::Exists( $temp_path ) )
{

   New-Item -ItemType Directory -Force -Path $temp_path
  # Write-Output "Path not found ($temp_path), create the directory and try again"


}


#
# Download the Windows Hosting Bundle Installer for ASP.NET Core 3.1 Runtime (v3.1.0)
#
# The installer URL was obtained from:
# https://dotnet.microsoft.com/download/dotnet-core/thank-you/runtime-aspnetcore-3.1.0-windows-hosting-bundle-installer
#

$whb_installer_url = "https://download.visualstudio.microsoft.com/download/pr/fa3f472e-f47f-4ef5-8242-d3438dd59b42/9b2d9d4eecb33fe98060fd2a2cb01dcd/dotnet-hosting-3.1.0-win.exe"

$whb_installer_file = $temp_path + [System.IO.Path]::GetFileName( $whb_installer_url )

Try
{

   Invoke-WebRequest -Uri $whb_installer_url -OutFile $whb_installer_file

   Write-Output ""
   Write-Output "Windows Hosting Bundle Installer downloaded"
   Write-Output "- Execute the $whb_installer_file to install the ASP.Net Core Runtime"
   Write-Output ""
   C:\temp\dotnet-hosting-3.1.0-win.exe  /quiet /install
}
Catch
{

   Write-Output ( $_.Exception.ToString() )

   Break

}

#----------end hosting environment-----------------------

#---------------Download TwinWorX solution---------------
$url= "https://github.com/rajesh-emagic/twservices/blob/master/TwinWorXServicesPublish.zip?raw=true"
#$output = "D:\psfile\master.zip"
# TwinWorXPublish
$output = "C:\TwinWorXServicesPublish.zip"
$start_time = Get-Date

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)" 

expand-archive -path $output -destinationpath 'C:\TwinWorXServicesPublish'


#-------------End-------------------------

#--------------------Change appsetting----------------------
$TwinWorXDTPath = 'C:\TwinWorXServicesPublish\8.TwinWorXDT\appsettings.json'
$TwinWorXDataResourceMangaerPath = 'C:\TwinWorXServicesPublish\2.TwinWorXDataResourceMangaer\appsettings.json'

#----------------------------------------------rsmgr----------------------------------
(Get-Content $TwinWorXDataResourceMangaerPath).replace('ehcon',$eventHubConnectionString) | Set-Content $TwinWorXDataResourceMangaerPath
(Get-Content $TwinWorXDataResourceMangaerPath).replace('ehn',$eventhubname) | Set-Content $TwinWorXDataResourceMangaerPath
(Get-Content $TwinWorXDataResourceMangaerPath).replace('cg',$consumerGroup) | Set-Content $TwinWorXDataResourceMangaerPath
#--------------------------------------------DT---------------------------------------------
(Get-Content $TwinWorXDTPath).replace('iothcep',$iothubCompatibleEndpoint) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('iothcp',$iothubCompatiblePath) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('iothsk',$iothubs_iotHubSasKey) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('iothsaskeyn',$s_iotHubSasKeyName) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('cg',$ConsumerGroup) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('ehcon',$eventHubConnectionString) | Set-Content $TwinWorXDTPath
(Get-Content $TwinWorXDTPath).replace('ehn',$eventhubname) | Set-Content $TwinWorXDTPath
#--------------------End------------------------------------
#----------------install microservices--------------

& C:\TwinWorXServicesPublish\twxautodeployscript.ps1

#-----------------------End---------------------------