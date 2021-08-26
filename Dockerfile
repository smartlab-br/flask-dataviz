FROM mptrabalho/flask:latest
LABEL maintainer="smartlab-dev@mpt.mp.br"

ENV MPLLOCALFREETYPE 1

COPY requirements.txt /app/requirements.txt

RUN apt-get install -y libsasl2-dev g++ gcc firefox-esr && \
    pip3 install -r /app/requirements.txt && \
    webdrivermanager firefox --linkpath /usr/local/bin && \
    apt-get remove -y gcc g++ libsasl2-dev && \
    apt-get clean

ENTRYPOINT ["sh", "/start.sh"]
