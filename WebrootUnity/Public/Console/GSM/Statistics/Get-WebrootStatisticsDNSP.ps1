function Get-WebrootStatisticsDNSP {
    #https://unityapi.webrootcloudav.com/Docs/en/APIDoc/Api/GET-api-console-gsm-gsmKey-sites-siteId-statistics-dnsp
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        $KeyCode,
        $siteId
    )

    if($siteId)
	{
	    $url = "https://unityapi.webrootcloudav.com/service/api/console/gsm/$($keyCode)/sites/$($SiteId)/statistics/dnsp"
    } else {
        $url = "https://unityapi.webrootcloudav.com/service/api/console/gsm/$($keyCode)/statistics/dnsp"
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