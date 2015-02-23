# -*- coding: utf-8 -*-

# issuer= "https://www.kodtest.se/rolandsOP"
baseurl = "https://idp.legogris.se"
#baseurl = "https://lingon.ladok.umu.se"
issuer = "%s:%%d" % baseurl

keys = [
    {"type": "RSA", "key": "cp_keys/key.pem", "use": ["enc", "sig"]},
    {"type": "EC", "crv": "P-256", "use": ["sig"]},
    {"type": "EC", "crv": "P-256", "use": ["enc"]}
]

SERVICE_URL = "%s/verify" % issuer

#Only Username and password.
AUTHENTICATION = {
    "UserPassword": {"ACR": "PASSWORD", "WEIGHT": 1, "URL": SERVICE_URL,
                     "END_POINTS": ["verify"]}
}

COOKIENAME = 'pyoic'
COOKIETTL = 4 * 60  # 4 hours
SYM_KEY = "SoLittleTime,Got"

SERVER_CERT = "certs/server.crt"
SERVER_KEY = "certs/server.key"
#CERT_CHAIN="certs/chain.pem"
CERT_CHAIN = None

# =======  SIMPLE DATABASE ==============

USERINFO = "SIMPLE"

USERDB = {
    "diana": {
        "sub": "robeds0001",
        "name": "Robert Edstrom",
        "given_name": "Robert",
        "family_name": "Edstrom",
        "nickname": "legogris",
        "email": "legogris@legogris.se",
        "email_verified": True,
        "phone_number": "+48180736690",
        "address": {
            "street_address": "Komaba 4-5-29",
            "locality": "Tokyo",
            "postal_code": "JP-90187",
            "country": "JP"
        },
    },
    "babs": {
        "sub": "babs0001",
        "name": "Barbara J Jensen",
        "given_name": "Barbara",
        "family_name": "Jensen",
        "nickname": "babs",
        "email": "babs@example.com",
        "email_verified": True,
        "address": {
            "street_address": "100 Universal City Plaza",
            "locality": "Hollywood",
            "region": "CA",
            "postal_code": "91608",
            "country": "USA",
        },
    },
    "upper": {
        "sub": "uppe0001",
        "name": "Upper Crust",
        "given_name": "Upper",
        "family_name": "Crust",
        "email": "uc@example.com",
        "email_verified": True,
    }
}

