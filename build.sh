#!/bin/sh
# Baut aus page.html die statische Seite in docs/ (GitHub Pages, auch für Cloudflare Pages nutzbar):
#   docs/index.html         mit Profil-Umschalter
#   docs/frank/index.html   startet mit First Choice
#   docs/daniel/index.html  startet mit Finanzpapa
set -e
cd "$(dirname "$0")"
rm -rf docs && mkdir -p docs/img docs/frank docs/daniel
cp img/*.png docs/img/

# $1 = Zieldatei, $2 = Profil (leer, fc, fp), $3 = Pfad-Präfix zu img/
page() {
  {
    printf '<!doctype html>\n<html lang="de">\n<head>\n<meta charset="utf-8">\n'
    printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
    printf '<link rel="icon" href="%simg/zenbai-logo.png">\n' "$3"
    [ -n "$2" ] && printf '<script>window.JARVIS_PROFILE="%s"</script>\n' "$2"
    sed '/<!-- \/head -->/,$d' page.html
    printf '</head>\n<body>\n'
    sed '1,/<!-- \/head -->/d' page.html | sed "s#src=\"img/#src=\"$3img/#g"
    printf '</body>\n</html>\n'
  } > "$1"
}
page docs/index.html "" ""
page docs/frank/index.html fc "../"
page docs/daniel/index.html fp "../"

# Nicht indexieren
printf 'User-agent: *\nDisallow: /\n' > docs/robots.txt
printf '/*\n  X-Robots-Tag: noindex, nofollow\n' > docs/_headers
touch docs/.nojekyll
echo "docs/ gebaut"
