FROM smartlab/flask
LABEL maintainer="smartlab-dev@mpt.mp.br"

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN apk --update --no-cache add build-base libffi-dev openssl-dev libffi openssl ca-certificates&& \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip3 install -r /app/requirements.txt && \
    apk del build-base libffi-dev openssl-dev libffi openssl ca-certificates

ENV LANG C.UTF-8
ENV DEBUG 0
ENV FLASK_APP /app/main.py

EXPOSE 5000

ENTRYPOINT ["sh", "/start.sh"]
