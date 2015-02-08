FROM legogris/openid

RUN ln -s /pyoidc/oidc_example/op2 /srv/op
COPY ./config.py /srv/op/
COPY ./certs/*.* /srv/op/certs/

CMD cd /srv/op && python server.py -p 13338 -d config
EXPOSE 443
