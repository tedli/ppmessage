FROM ppmessage

RUN apk update && apk upgrade
RUN apk add dropbear dropbear-scp openssh-sftp-server
RUN mkdir /etc/dropbear
RUN dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
RUN dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key
RUN dropbearkey -t ecdsa -f /etc/dropbear/dropbear_ecdsa_host_key
RUN echo -e "123456\n123456\n" | passwd
RUN touch /var/log/lastlog

RUN echo $'\n\
ppmessage development environment\n' > /etc/motd

EXPOSE 8822

ENTRYPOINT ["dropbear"]
CMD ["-j", "-k", "-E", "-F", "-p", "0.0.0.0:8822"]
