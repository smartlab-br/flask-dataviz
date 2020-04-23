FROM smartlab/flask:development
LABEL maintainer="smartlab-dev@mpt.mp.br"

WORKDIR /app

ENV PYTHONPATH /app:/usr/lib/python3.8/site-packages

COPY requirements.txt /app/requirements.txt

RUN apk --update --no-cache add build-base libffi-dev openssl-dev libffi openssl ca-certificates && \
    apk --update --no-cache add cyrus-sasl-dev libstdc++ gfortran openblas-dev libxml2 libxslt-dev libpng-dev uwsgi jpeg-dev zlib-dev && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip3 install -r /app/requirements.txt && \
    apk del build-base libffi-dev openssl-dev libffi openssl ca-certificates

ENV LANG C.UTF-8
ENV DEBUG 0
ENV FLASK_APP /app/main.py

EXPOSE 5000

ENTRYPOINT ["sh", "/start.sh"]
