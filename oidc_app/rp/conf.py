PORT = 8666
#BASE = "http://lingon.catalogix.se:" + str(PORT) + "/"
#BASE = "http://hashog.umdc.umu.se:" + str(PORT) + "/"
BASE = "https://rp.legogris.se:" + str(PORT) + "/"

# If BASE is https these has to be specified
SERVER_KEY = 'certs/server.key'
SERVER_CERT = 'certs/server.crt'
CA_BUNDLE = None

# information used when registering the client
ME = {
    "application_type": "web",
    "application_name": "idpproxy",
    "contacts": ["ops@example.com"],
}

# Which scopes to use
SCOPE = ["openid", "profile", "email", "address", "phone"]