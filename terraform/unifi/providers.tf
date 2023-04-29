provider "unifi" {
  api_url = "https://192.168.10.1"

  # you may need to allow insecure TLS communications unless you have configured
  # certificates for your controller
  allow_insecure = true
}

provider "onepassword" {
  url = "http://localhost:8080"
}
