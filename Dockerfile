FROM smartlab/flask
LABEL maintainer="smartlab-dev@mpt.mp.br"

WORKDIR /app

RUN pip3 install -r /app/requirements.txt

ENV LANG C.UTF-8
ENV DEBUG 0
ENV FLASK_APP /app/main.py

EXPOSE 5000

ENTRYPOINT ["sh", "/start.sh"]
