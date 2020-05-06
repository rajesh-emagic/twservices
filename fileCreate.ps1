param(
      [string]$iothubname,
      [string]$iothubCompatiblePath
    
     
  )
New-Item -ItemType File -path C:\test1.txt
$value=$iothubname+$iothubCompatiblePath

Set-Content -Path C:\test1.txt -Value $value

