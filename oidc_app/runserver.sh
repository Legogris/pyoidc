#!/bin/bash
docker run -it -P --name op --add-host="rp.legogris.se:127.0.01" legogris/openid_op
docker run -it -P --name rp --add-host="idp.legogris.se:127.0.01" --net container:op legogris/openid_rp
