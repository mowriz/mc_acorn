# Acorn Datapack & Resource Pack

This package replaces the golden carrot with an acorn in Minecraft.

## Installation

### Datapack Installation:
1. Copy the `acorn_datapack` folder to your Minecraft world folder under `datapacks/`
   - Path: `.minecraft/saves/[WorldName]/datapacks/`
2. Reload the world or use the command `/reload`

### Resource Pack Installation:
1. Copy the `acorn_resourcepack` folder to your Minecraft Resource Packs folder
   - Path: `.minecraft/resourcepacks/`
2. Activate the Resource Pack in Minecraft settings under "Resource Packs"

## Ready to Install!

The acorn texture is already included and ready to use!

## What This Package Does:

- Visually replaces the golden carrot with an acorn
- Changes the name to "Acorn"
- All properties (hunger, saturation, etc.) remain the same
- All recipes and uses continue to work
- Adds acorn drops from oak leaves (2.5% base chance, increases with Fortune enchantment up to 12.5%)

## Minecraft Version:

- Datapack Format: 48 (Minecraft 1.21.2+)
- Resource Pack Format: 34 (Minecraft 1.20.5 - 1.21.4)

## Structure:

```
acorn/
├── acorn_datapack/
│   ├── pack.mcmeta
│   └── data/
│       └── minecraft/
│           ├── item/
│           │   └── golden_carrot.json
│           └── loot_table/
│               └── blocks/
│                   └── oak_leaves.json
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
│               └── en_us.json
└── README.md
```

## Server Installation

For automatic distribution to all players on a Paper MC server, see [SERVER_INSTALLATION.md](SERVER_INSTALLATION.md).
