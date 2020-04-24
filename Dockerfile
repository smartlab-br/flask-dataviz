FROM smartlab/flask:development
LABEL maintainer="smartlab-dev@mpt.mp.br"

ENV MPLLOCALFREETYPE 1

COPY requirements.txt /app/requirements.txt

RUN apt-get install -y libsasl2-dev gcc firefox-esr wget && \
    webdrivermanager firefox chrome --linkpath /usr/local/bin

ENTRYPOINT ["sh", "/start.sh"]
