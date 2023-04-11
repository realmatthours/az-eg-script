try
{
    "Logging in to Azure..."
    Connect-AzAccount -Identity
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}

$tokenAuthURI = $env:MSI_ENDPOINT + “?resource=https://graph.microsoft.com/&api-version=2017-09-01"
$tokenResponse = Invoke-RestMethod -Method Get -Headers @{“Secret”=”$env:MSI_SECRET”} -Uri $tokenAuthURI
$tokenResponse.access_token
