#!/bin/bash
docker run -itd -P --name openid_op --add-host="rp.legogris.se:127.0.0.1" --add-host="idp.legogris.se:127.0.0.1" legogris/openid_op
docker run -itd -P --name openid_rp --net container:openid_op legogris/openid_rp
echo -e "`docker inspect openid_op | grep IPAddress | grep -oEi [0-9.]*`\tidp.legogris.se rp.legogris.se"
echo "Open https://rp.legogris.se:13337/"
echo "https://idp.legogris.se:13338/test"
docker run -it  --rm -P --name openid_capturer --net container:openid_op legogris/openid_capturer bash
docker stop openid_op
docker stop openid_rp
docker rm openid_op
docker rm openid_rp
exit
docker run -it --rm -P --name openid_op --add-host="rp.legogris.se:127.0.0.1" --add-host="idp.legogris.se:127.0.0.1" legogris/openid_op
docker run -it --rm -P --name openid_rp  --net container:openid_op legogris/openid_rp
