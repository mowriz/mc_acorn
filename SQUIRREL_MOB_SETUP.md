# Squirrel Mob Setup Guide

This guide explains how to add custom squirrel mobs to your Paper MC server that spawn under oak trees and hide acorns.

## Required Plugins

### 1. MythicMobs (Free Version)
- **Download**: https://www.spigotmc.org/resources/5702/
- **Purpose**: Custom mob behavior, AI, and spawning
- **Version**: Compatible with Paper 1.21+

### 2. ModelEngine (Premium - ~$15)
- **Download**: https://mythiccraft.io/ or https://polymart.org/
- **Purpose**: Custom 3D models for mobs
- **Version**: R4.0+ for MC 1.21+

## Installation Steps

### Step 1: Install Plugins

1. Download MythicMobs and ModelEngine JAR files
2. Place both in your server's `plugins/` folder
3. Restart server
4. Check that folders were created:
   ```
   plugins/MythicMobs/
   plugins/ModelEngine/
   ```

### Step 2: Add Squirrel Model to Resource Pack

1. Copy squirrel model files to resource pack:
   ```
   acorn_resourcepack/assets/minecraft/models/item/squirrel.json
   acorn_resourcepack/assets/minecraft/textures/entity/squirrel.png
   ```

2. Run update script:
   ```bash
   ./update_resourcepack.sh
   ```

3. Commit and push to GitHub:
   ```bash
   git add .
   git commit -m "Add squirrel model"
   git push
   ```

### Step 3: Configure ModelEngine

1. Copy squirrel model configuration to:
   ```
   plugins/ModelEngine/models/squirrel.json
   ```

2. Reload ModelEngine:
   ```
   /meg reload
   ```

### Step 4: Configure MythicMobs

1. Add squirrel mob configuration to:
   ```
   plugins/MythicMobs/Mobs/squirrel.yml
   ```

2. Add spawn configuration to:
   ```
   plugins/MythicMobs/RandomSpawns/squirrel_spawns.yml
   ```

3. Reload MythicMobs:
   ```
   /mm reload
   ```

## Squirrel Features

- **Base Mob**: Rabbit (small, fast, passive)
- **Spawning**: Under oak trees in forest biomes
- **Behavior**:
  - Runs around near oak trees
  - Occasionally "digs" and hides acorns (drops golden carrot)
  - Scared of players (runs away)
  - Can climb trees (jump boost near oak logs)

## Testing

1. Spawn a squirrel manually:
   ```
   /mm mobs spawn squirrel 1
   ```

2. Check squirrel spawns:
   ```
   /mm spawners list
   ```

3. Debug mode:
   ```
   /mm debug 3
   ```

## Updating the Squirrel

After making changes to models or configurations:

1. Update resource pack (if model/texture changed):
   ```bash
   ./update_resourcepack.sh
   git push
   ```

2. Update server.properties with new SHA1

3. Reload plugins:
   ```
   /meg reload
   /mm reload
   ```

4. Players reconnect to get updated resource pack

## File Structure

```
acorn/
├── acorn_resourcepack/
│   └── assets/
│       └── minecraft/
│           ├── models/
│           │   └── entity/
│           │       └── squirrel.json
│           └── textures/
│               └── entity/
│                   └── squirrel.png
│
└── mythicmobs_configs/
    ├── Mobs/
    │   └── squirrel.yml
    └── RandomSpawns/
        └── squirrel_spawns.yml
```

## Troubleshooting

### Squirrel doesn't appear
- Check `/mm mobs list` - is squirrel registered?
- Check `/meg models` - is squirrel model loaded?
- Check resource pack loaded on client (F3+T to reload)

### Model doesn't show correctly
- Verify resource pack SHA1 updated
- Check ModelEngine console for errors
- Ensure players downloaded new resource pack

### Squirrels don't spawn naturally
- Check spawn configuration biomes
- Verify oak trees exist in area
- Use `/mm spawners list` to see active spawners

## Commands Reference

### MythicMobs
- `/mm reload` - Reload all configurations
- `/mm mobs spawn <mob> <amount>` - Spawn mob manually
- `/mm mobs list` - List all custom mobs
- `/mm spawners list` - List active spawners
- `/mm debug <level>` - Enable debug mode (0-5)

### ModelEngine
- `/meg reload` - Reload models
- `/meg models` - List all models
- `/meg debug` - Toggle debug mode
