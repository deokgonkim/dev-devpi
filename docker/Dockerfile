FROM python:3.8

# install required packages
# RUN apt update && apt install -y supervisor nginx tcpdump
# RUN apt update && apt install -y supervisor nginx
RUN apt update && apt install -y nginx gettext-base

# install devpi server
# RUN pip install devpi-server devpi-web devpi-client devpi-semantic-ui
RUN pip install devpi-server devpi-web devpi-client

# configure supervisor
# COPY ./supervisor/etc/supervisor/conf.d/supervisor-devpi.conf /etc/supervisor/conf.d/
# COPY ./supervisor/etc/supervisor/conf.d/supervisor-nginx.conf /etc/supervisor/conf.d/
# COPY ./supervisor/etc/supervisor/conf.d/* /etc/supervisor/conf.d/
# COPY ./supervisor/etc/supervisor/supervisord.conf /etc/supervisor/

# configuration parameters for devpi server
# ENV DEVPI_THEME semantic-ui
ENV DEVPI_PORT 3141
ENV DEVPISERVER_SERVERDIR /data


# install devpi-ldap
RUN pip install devpi-ldap
COPY ./devpi-ldap.yml /

# prepare server
COPY ./entrypoint.sh /
# RUN mkdir /data

# configure nginx for proxy
# RUN apt update && apt install -y nginx
# COPY ./nginx/etc/nginx/conf.d/backend.conf /etc/nginx/conf.d/
COPY ./nginx/etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/

# for devpi direct
EXPOSE $DEVPI_PORT

# for nginx
EXPOSE 80

# RUN apt install -y openssh-server
# COPY ./ssh-config.sh /
# COPY ./authorized_keys /root/.ssh/authorized_keys
# RUN ./ssh-config.sh

# run server
CMD ["/entrypoint.sh"]
# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
