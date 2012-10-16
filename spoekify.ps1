import-module ".\JSON"
$a = [System.Net.WebRequest]::Create("http://ws.spotify.com/search/1/track.json?q=artist:spökligan")
$a.Method = "GET"
$resp = $a.GetResponse()
$strm = $resp.GetResponseStream()
$read = new-object System.IO.StreamReader $strm
$json = $read.ReadToEnd()
$strm.Close()
$resp.Close()
$data = $json | ConvertFrom-json -Type PSObject
$trck = $data.tracks | Get-Random
start $trck.href