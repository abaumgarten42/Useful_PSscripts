# Add PTR record to DNS server

$file = "./serversPTRrecords.csv"
Import-Csv -Path $file | ForEach-Object {
    $name = (($_.IPAddress).Split("."))[3]
    # Modify the -ZoneNAme to your needs (name of the reverse lookup zone in DNS)
    Add-DnsServerResourceRecordPtr -Name "$name" -ZoneName "0.168.192.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "$_.HostName.contoso.com"
    }
