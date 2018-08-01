FROM python:3.6

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.17 requests==2.19.1
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9091
USER uwsgi

CMD ["/cmd.sh"]
