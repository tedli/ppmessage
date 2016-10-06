FROM alpine

COPY requirements.txt /tmp/

ENV LANG C.UTF-8

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN echo $'[global]\n\
index-url = http://mirrors.aliyun.com/pypi/simple/\n\
\n\
[install]\n\
trusted-host=mirrors.aliyun.com' > /etc/pip.conf
RUN apk update && apk upgrade
RUN apk add --no-cache tzdata python py-pip gcc musl-dev python-dev jpeg-dev zlib-dev
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install -r /tmp/requirements.txt && rm -rf /tmp/requirements.txt
