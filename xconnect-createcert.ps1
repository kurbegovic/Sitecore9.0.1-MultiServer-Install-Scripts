#define parameters
$prefix = "sc9demo"
$PSScriptRoot = “C:\sc9u1_resources”
#install client certificate for xconnect
$certParams = @{
 Path = "$PSScriptRoot\xconnect-createcert.json"
 CertificateName = "$prefix.xconnect_client"
}
Install-SitecoreConfiguration @certParams -Verbose