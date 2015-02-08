FROM legogris/openid

RUN ln -s /pyoidc/oidc_example/rp2 /srv/rp
COPY ./conf.py /srv/rp/
COPY ./certs/*.* /srv/rp/certs/

CMD cd /srv/rp && python rp2.py
EXPOSE 443

