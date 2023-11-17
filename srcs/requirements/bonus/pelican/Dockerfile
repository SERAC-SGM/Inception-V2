FROM debian:bullseye

RUN apt-get update -y && apt-get install python pip -y
RUN pip install "pelican[markdown]"

RUN mkdir -p /static/content/ /md

COPY conf/pelicanconf.py /static/pelicanconf.py
COPY conf/publishconf.py /static/publishconf.py
COPY tools/init_pelican.sh /usr/local/bin/init_pelican.sh

STOPSIGNAL SIGKILL
WORKDIR /
ENTRYPOINT [ "sh", "/usr/local/bin/init_pelican.sh" ]\