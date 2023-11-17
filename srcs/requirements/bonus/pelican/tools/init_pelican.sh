#!/bin/sh

cp /md/article.md /static/content/article.md
cd /static/
pelican content
cp -r /static/output /oe
cd /
exec python3 -m http.server