FROM phusion/passenger-full
# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]
#Install pyoidc + deps. Tox runs test + installs their deps
RUN apt-get update
RUN apt-get install -y python-pip python-setuptools python-dev libsasl2-dev libffi-dev libldap2-dev
RUN pip install tox pysaml2
RUN pip install -I --no-use-wheel cherrypy==3.2.6
RUN git clone https://github.com/legogris/pyoidc.git
RUN cd pyoidc && python setup.py install && tox
