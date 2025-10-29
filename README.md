# Acorn Datapack & Resource Pack

Dieses Paket ersetzt die goldene Karotte durch eine Eichel in Minecraft.

## Installation

### Datapack Installation:
1. Kopiere den Ordner `acorn_datapack` in deinen Minecraft-Welt-Ordner unter `datapacks/`
   - Pfad: `.minecraft/saves/[Weltname]/datapacks/`
2. Lade die Welt neu oder nutze den Befehl `/reload`

### Resource Pack Installation:
1. Kopiere den Ordner `acorn_resourcepack` in deinen Minecraft Resource Packs Ordner
   - Pfad: `.minecraft/resourcepacks/`
2. Aktiviere das Resource Pack in den Minecraft-Einstellungen unter "Resource Packs"

## Fertig zum Installieren!

Die Eichel-Textur ist bereits enthalten und einsatzbereit!

## Was das Paket macht:

- Die goldene Karotte wird visuell durch eine Eichel ersetzt
- Der Name wird zu "Eichel" (Deutsch) bzw. "Acorn" (Englisch) geändert
- Alle Eigenschaften (Hunger, Sättigung, etc.) bleiben gleich
- Alle Rezepte und Verwendungen funktionieren weiterhin

## Minecraft Version:

- Datapack Format: 48 (Minecraft 1.21.2+)
- Resource Pack Format: 34 (Minecraft 1.20.5 - 1.21.4)

## Struktur:

```
acorn/
├── acorn_datapack/
│   ├── pack.mcmeta
│   └── data/
│       └── minecraft/
│           └── item/
│               └── golden_carrot.json
├── acorn_resourcepack/
│   ├── pack.mcmeta
│   └── assets/
│       └── minecraft/
│           ├── models/
│           │   └── item/
│           │       └── acorn.json
│           ├── textures/
│           │   └── item/
│           │       └── acorn.png
│           └── lang/
│               ├── de_de.json
│               └── en_us.json
└── README.md
```
