FROM openid

RUN ln -s /pyoidc/oidc_examples/rp2 /srv/rp
COPY ./config.py /srv/op/
COPY ./certs/*.* /srv/certs/

CMD cd /srv/rp && python rp2.py
EXPOSE 443

