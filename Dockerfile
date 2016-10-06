FROM ppmessage-base

COPY ppmessage /ppmessage
COPY ppmessage.py /

RUN apk update && apk upgrade
RUN chmod 755 /ppmessage.py

EXPOSE 8945

ENTRYPOINT ["/ppmessage.py"]
