function Get-WebrootStatisticsEndpointProtection {
    #https://unityapi.webrootcloudav.com/Docs/en/APIDoc/Api/GET-api-console-gsm-gsmKey-sites-siteId-statistics-endpointprotection
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        $KeyCode,
        $siteId
    )

    if($siteId)
	{
        $url = "https://unityapi.webrootcloudav.com/service/api/console/gsm/$($keyCode)/sites/$($siteId)/statistics/endpointprotection"
    } else {
        $url = "https://unityapi.webrootcloudav.com/service/api/console/gsm/$($keyCode)/statistics/endpointprotection"
	}


    Connect-WebrootUnity

    try{
        $Obj = Invoke-RestMethod -Method Get -Uri $url -ContentType "application/json" -Headers @{"Authorization" = "Bearer $($WebrootAuthToken.access_token)"}
        $Obj
    }
    catch{
        Write-Error "Error: $($_)"
    }

}