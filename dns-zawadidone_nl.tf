data "transip_domain" "zawadidone_nl" {
  name = "zawadidone.nl"
}

resource "transip_dns_record" "CNAME" {
  domain  = data.transip_domain.zawadidone_nl.id
  name    = "www"
  expire  = 86400
  type    = "CNAME"
  content = ["@"]
}

resource "transip_dns_record" "A" {
  domain = data.transip_domain.zawadidone_nl.id
  name   = "@"
  expire = 86400
  type   = "A"
  content = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}

resource "transip_dns_record" "MX" {
  domain = data.transip_domain.zawadidone_nl.id
  name   = "@"
  expire = 86400
  type   = "MX"
  content = [
    "10 mail.protonmail.ch.",
    "20 mailsec.protonmail.ch.",
  ]
}

resource "transip_dns_record" "TXT" {
  domain = data.transip_domain.zawadidone_nl.id
  name   = "@"
  expire = 86400
  type   = "TXT"
  content = [
    "protonmail-verification=bae59d179d326bd43900fd5fd19ecc0d2b9f2fce",
    "v=spf1 include:_spf.protonmail.ch mx ~all"
  ]
}

resource "transip_dns_record" "TXT_DKIM" {
  domain  = data.transip_domain.zawadidone_nl.id
  name    = "protonmail._domainkey"
  expire  = 86400
  type    = "TXT"
  content = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDbXZpWe+npm/U8F6CGwCambQtg7jeqlrTTZxy1hp9zU04TLBPKMEURt7sWqtBFu6ka2RVmDZ6n5ODO8wE0PEOVEXIJEpUEe+e3N0Ebsk79ZlOv6hvCyDG44JzJ2BYXldV70I8w/UxIU1pxJT6TD9/dQkPtWCcYFI+zLHp0x8gt1QIDAQAB"]
}

resource "transip_dns_record" "TXT_DMARC" {
  domain  = data.transip_domain.zawadidone_nl.id
  name    = "_dmarc"
  expire  = 86400
  type    = "TXT"
  content = ["v=DMARC1; p=reject;"]
}