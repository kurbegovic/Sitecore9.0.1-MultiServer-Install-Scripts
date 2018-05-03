#define parameters
$prefix = "sc9demo"
$PSScriptRoot = “C:\sc9u1_resources”
$SolrUrl = "https://localhost:8994/solr"
$SolrRoot = "C:\solr-6.6.2"
$SolrService = "SOLR 662"
#install solr cores for xdb
$solrParams = @{
 Path = "$PSScriptRoot\xconnect-solr.json"
 SolrUrl = $SolrUrl
 SolrRoot = $SolrRoot
 SolrService = $SolrService
 CorePrefix = $prefix
}
Install-SitecoreConfiguration @solrParams
#install solr cores for sitecore
$solrParams = @{
 Path = "$PSScriptRoot\sitecore-solr.json"
 SolrUrl = $SolrUrl
 SolrRoot = $SolrRoot
 SolrService = $SolrService
 CorePrefix = $prefix
}
Install-SitecoreConfiguration @solrParams