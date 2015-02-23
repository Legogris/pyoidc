capturer: base Dockerfile capturer/Dockerfile
	docker build -t legogris/openid_capturer capturer

op: base op/Dockerfile op/config.py
	docker build --no-cache -t legogris/openid_op op

rp: base rp/Dockerfile rp/conf.py
	docker build --no-cache -t legogris/openid_rp rp

base: Dockerfile
	docker build --no-cache -t legogris/openid .

all: base op rp capturer