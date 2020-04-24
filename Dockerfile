FROM smartlab/flask:development
LABEL maintainer="smartlab-dev@mpt.mp.br"

ENV MPLLOCALFREETYPE 1

COPY requirements.txt /app/requirements.txt

RUN apt-get install -y libsasl2-dev gcc firefox-esr firefox-geckodriver && \
    pip3 install -r /app/requirements.txt && \
    webdrivermanager firefox chrome --linkpath /usr/local/bin && \
    apt-get clean

ENV PATH $PATH:/etc/geckodriver/.

ENTRYPOINT ["sh", "/start.sh"]
