#!/bin/sh
# Baut aus page.html eine eigenständige Seite für Cloudflare Pages: dist/index.html + dist/img/
set -e
cd "$(dirname "$0")"
rm -rf dist && mkdir -p dist/img
cp img/*.png dist/img/
{
  printf '<!doctype html>\n<html lang="de">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<link rel="icon" href="img/zenbai-logo.png">\n'
  sed '/<!-- \/head -->/,$d' page.html
  printf '</head>\n<body>\n'
  sed '1,/<!-- \/head -->/d' page.html
  printf '</body>\n</html>\n'
} > dist/index.html
# Kein Indexieren, auch auf Header-Ebene
printf '/*\n  X-Robots-Tag: noindex, nofollow\n' > dist/_headers
echo "dist/index.html gebaut"
