#!/bin/bash
docker run -it -P --name op legogris/openid_op
docker run -it -P --name rp idp.legogris.se -v legogris/openid_rp
