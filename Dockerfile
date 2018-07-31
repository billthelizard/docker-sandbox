FROM python:3.6

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.17
WORKDIR /app
COPY app /app

EXPOSE 9090 9091
USER uwsgi

CMD ["python", "identidock.py"]
CMD [ "uwsgi", "--http",      "0.0.0.0:9090", \
               "--wsgi-file", "/app/identidock.py", \
               "--callable",  "app", \
               "--stats",     "0.0.0.0:9091" ]
