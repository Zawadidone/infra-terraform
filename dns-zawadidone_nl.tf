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

resource "transip_dns_record" "CNAME_DKIM_1" {
  domain  = data.transip_domain.zawadidone_nl.id
  name    = "protonmail._domainkey"
  expire  = 86400
  type    = "CNAME"
  content = ["protonmail.domainkey.dbglrncyhdb6b2i73arqvbtncir6cirou3fyhunwoxxfzcwifgcua.domains.proton.ch."]
}

resource "transip_dns_record" "CNAME_DKIM_2" {
  domain  = data.transip_domain.zawadidone_nl.id
  name    = "protonmail2._domainkey"
  expire  = 86400
  type    = "CNAME"
  content = ["protonmail2.domainkey.dbglrncyhdb6b2i73arqvbtncir6cirou3fyhunwoxxfzcwifgcua.domains.proton.ch."]
}

resource "transip_dns_record" "CNAME_DKIM_3" {
  domain  = data.transip_domain.zawadidone_nl.id
  name    = "protonmail3._domainkey"
  expire  = 86400
  type    = "CNAME"
  content = ["protonmail3.domainkey.dbglrncyhdb6b2i73arqvbtncir6cirou3fyhunwoxxfzcwifgcua.domains.proton.ch."]
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

resource "transip_dns_record" "AAAA" {
  domain = data.transip_domain.zawadidone_nl.id
  name   = "@"
  expire = 86400
  type   = "AAAA"
  content = [
    "2606:50c0:8000::153",
    "2606:50c0:8001::153",
    "2606:50c0:8002::153",
    "2606:50c0:8003::153",
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

resource "transip_dns_record" "TXT_DMARC" {
  domain  = data.transip_domain.zawadidone_nl.id
  name    = "_dmarc"
  expire  = 86400
  type    = "TXT"
  content = ["v=DMARC1; p=reject;"]
}
