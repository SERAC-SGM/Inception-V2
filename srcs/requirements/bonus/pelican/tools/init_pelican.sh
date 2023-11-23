#!/bin/sh

cp /md/article.md /static/content/article.md
cd /static/

# generate the files using the .md files inside the 'content' directory
pelican content

# move the files generated to /oe (path set up in nginx container)
cp -r /static/output /oe
cd /
exec python3 -m http.server