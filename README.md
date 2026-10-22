# Jarvis-Anleitung Frank & Daniel

Klickbare One-Page-Anleitung („Speisekarte“) zum Jarvis für Frank Weisgerber (First Choice Immo) und Daniel Lacherdinger (Finanzpapa). Inhalt aus Playbook v1, Vorstufe zu T04 „Fähigkeiten-Karte“ und T07 „Tutorial-Bereich“.

## Dateien
- `page.html`: Quelle (Inhalt, Styles, Script)
- `build.sh`: baut daraus `dist/`
- `dist/`: fertige statische Seite (`index.html`, `img/`, `_headers` mit noindex)

## Ändern und bauen
```sh
sh build.sh
python3 -m http.server 4321 -d dist
```

## Hosting
Cloudflare Pages, Build-Ausgabe `dist`, kein Build-Befehl nötig (oder `sh build.sh`). Vorschlag: `jarvis.zenbai.de/frank-daniel`, optional hinter Cloudflare Access.

Iframe-tauglich, keine festen Höhen, kein Tracking. Fortschritt und Formular liegen nur im localStorage des Geräts.
