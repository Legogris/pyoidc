#!/bin/bash
docker run -itd -P --name openid_op --add-host="rp.legogris.se:127.0.0.1" --add-host="idp.legogris.se:127.0.0.1" legogris/openid_op
docker run -itd -P --name openid_rp --net container:openid_op legogris/openid_rp
exit
docker run -it --rm -P --name openid_op --add-host="rp.legogris.se:127.0.0.1" --add-host="idp.legogris.se:127.0.0.1" legogris/openid_op
docker run -it --rm -P --name openid_rp  --net container:openid_op legogris/openid_rp
