FROM smartlab/flask:development
LABEL maintainer="smartlab-dev@mpt.mp.br"

USER root

ENV MPLLOCALFREETYPE 1

COPY requirements.txt /app/requirements.txt

RUN apt-get install -y libsasl2-dev gcc firefox-esr && \
    pip3 install -r /app/requirements.txt && \
    webdrivermanager firefox chrome --linkpath /usr/local/bin && \
    apt-get remove gcc -y libsasl2-dev && \
    apt-get clean

USER uwsgi

ENTRYPOINT ["sh", "/start.sh"]
