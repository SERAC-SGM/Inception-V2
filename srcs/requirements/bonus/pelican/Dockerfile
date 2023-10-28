FROM debian:bullseye

RUN apt-get update -y && apt-get install python pip -y
RUN pip install "pelican[markdown]"

RUN mkdir -p /static_website

WORKDIR /static_website

RUN mkdir -p content

COPY conf/pelicanconf.py /static_website/pelicanconf.py
COPY conf/publishconf.py /static_website/publishconf.py
COPY conf/TO_REMOVE.md content/sample.md

RUN pelican content

EXPOSE 8000

STOPSIGNAL SIGKILL

ENTRYPOINT [ "bash" ]
# ENTRYPOINT [ "python3", "-m", "http.server" ]