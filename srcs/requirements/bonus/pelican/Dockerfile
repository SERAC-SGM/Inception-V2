FROM debian:bullseye

RUN apt-get update -y && apt-get install python pip -y
RUN pip install "pelican[markdown]"

RUN mkdir /static

COPY conf/pelicanconf.py /static/pelicanconf.py
COPY conf/publishconf.py /static/publishconf.py

COPY conf/TO_REMOVE.md /static/content/article.md

WORKDIR /static

RUN pelican content

RUN cp -r /static/output /oe

RUN chown -R www-data:www-data /oe

STOPSIGNAL SIGKILL
WORKDIR /
ENTRYPOINT [ "python3", "-m", "http.server" ]