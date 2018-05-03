#define parameters
$prefix = "sc9demo"
$PSScriptRoot = “C:\sc9u1_resources”
$XConnectCollectionService = "$prefix.xconnect"
$sitecoreSiteName = "$prefix.sc"
$SolrUrl = "https://localhost:8994/solr"
$SqlServer = "localhost"
$SqlAdminUser = "sitecore"
$SqlAdminPassword="secret"

#install client certificate for xconnect
$certParams = @{
 CertificateName = "$prefix.xconnect_client"
}

#deploy xconnect instance
$xconnectParams = @{
 Path = "$PSScriptRoot\xconnect-xp0.json"
 Package = "$PSScriptRoot\Sitecore 9.0.1 rev. 171219 (OnPrem)_xp0xconnect.scwdp.zip"
 LicenseFile = "$PSScriptRoot\license.xml"
 Sitename = $XConnectCollectionService
 XConnectCert = $certParams.CertificateName
 SqlDbPrefix = $prefix
 SqlServer = $SqlServer
 SqlAdminUser = $SqlAdminUser
 SqlAdminPassword = $SqlAdminPassword
 SolrCorePrefix = $prefix
 SolrURL = $SolrUrl

}
Install-SitecoreConfiguration @xconnectParams

#install sitecore instance
$xconnectHostName = "$prefix.xconnect"
$sitecoreParams = @{
 Path = "$PSScriptRoot\sitecore-XP0.json"
 Package = "$PSScriptRoot\Sitecore 9.0.1 rev. 171219 (OnPrem)_single.scwdp.zip"
 LicenseFile = "$PSScriptRoot\license.xml"
 SqlDbPrefix = $prefix
 SqlServer = $SqlServer
 SqlAdminUser = $SqlAdminUser
 SqlAdminPassword = $SqlAdminPassword
 SolrCorePrefix = $prefix
 SolrUrl = $SolrUrl
 XConnectCert = $certParams.CertificateName
 Sitename = $sitecoreSiteName
 XConnectCollectionService = "https://$XConnectCollectionService"
}
Install-SitecoreConfiguration @sitecoreParams