# Server Installation Guide - Acorn Datapack

Diese Anleitung zeigt, wie du das Acorn Datapack auf deinem Paper MC Server installierst, sodass **alle Spieler automatisch beim Login** die Eichel statt der goldenen Karotte sehen.

## Schritt 1: Datapack auf Server installieren

1. Kopiere den Ordner `acorn_datapack/` in dein Server-Verzeichnis:
   ```
   [dein-server]/world/datapacks/acorn_datapack/
   ```

2. Führe auf dem Server den Befehl aus:
   ```
   /reload
   ```

## Schritt 2: Resource Pack automatisch verteilen

Bearbeite die `server.properties` Datei auf deinem Server und füge folgende Zeilen hinzu:

```properties
# Resource Pack Download URL (GitHub Raw Link)
resource-pack=https://github.com/mowriz/mc_acorn/raw/main/acorn_resourcepack.zip

# Optional: SHA1 Hash zur Verifikation (kann leer bleiben)
resource-pack-sha1=dd2084629f19eac51db66e7681ee328615352ec0

# Nachricht die Spieler beim Download sehen
resource-pack-prompt=Lade Eichel Resource Pack... Bitte akzeptieren!

# WICHTIG: Spieler MÜSSEN das Resource Pack akzeptieren
require-resource-pack=true
```

**Wichtige Einstellungen:**

- `require-resource-pack=true` - Spieler müssen das Pack akzeptieren, sonst werden sie gekickt
- `require-resource-pack=false` - Spieler können ablehnen (dann sehen sie keine Eichel)

## Schritt 3: Server neustarten

Starte deinen Paper MC Server neu, damit die Änderungen wirksam werden.

## Was passiert jetzt?

- Spieler verbinden sich zum Server
- Automatisch startet der Download des Resource Packs
- Spieler sehen eine Nachricht: "Lade Eichel Resource Pack... Bitte akzeptieren!"
- Nach Akzeptieren sehen sie die Eichel statt der goldenen Karotte
- Name wird zu "Eichel" (Deutsch) bzw. "Acorn" (Englisch)

## Fehlerbehebung

### Spieler sehen keine Eichel
- Resource Pack wurde abgelehnt → `require-resource-pack=true` setzen
- Überprüfe, ob der Download-Link funktioniert
- Server-Neustart durchführen

### Download-Link funktioniert nicht
- Stelle sicher, dass das GitHub Repository öffentlich ist
- Nutze den **raw** Link: `https://github.com/mowriz/mc_acorn/raw/main/acorn_resourcepack.zip`
- Teste den Link im Browser

### Spieler werden gekickt
- Das ist normal wenn `require-resource-pack=true` und sie ablehnen
- Spieler müssen das Pack akzeptieren

## Alternative: Resource Pack lokal hosten

Wenn du einen eigenen Webserver hast, kannst du die `acorn_resourcepack.zip` auch dort hochladen:

```properties
resource-pack=https://deine-website.de/acorn_resourcepack.zip
```

Der Server muss direkten Download-Zugriff haben (kein Google Drive Viewer, etc.)!

## GitHub Repository

- Repository: https://github.com/mowriz/mc_acorn
- Direct Download: https://github.com/mowriz/mc_acorn/raw/main/acorn_resourcepack.zip

## Support

Bei Problemen erstelle ein Issue auf GitHub: https://github.com/mowriz/mc_acorn/issues
