# Squirrel 3D Model Guide

## Overview

The squirrel mob uses a custom 3D model created in Blockbench and applied via ModelEngine plugin.

## Required Software

- **Blockbench** (Free): https://www.blockbench.net/

## Squirrel Model Specifications

### Base Mob
- Type: RABBIT
- Dimensions: Small (similar to rabbit size)
- Animation: Rabbit animations (hopping, idle, etc.)

### Model Parts

The squirrel model should have these parts (based on rabbit model):

1. **Head** (8x8x8)
   - Contains: Eyes, nose, ears
   - Pivot: Center of body

2. **Body** (10x12x6)
   - Main torso
   - Pivot: Ground level, center

3. **Front Left Leg** (3x10x3)
4. **Front Right Leg** (3x10x3)
5. **Back Left Leg** (4x10x4) - slightly thicker
6. **Back Right Leg** (4x10x4)

7. **Tail** (16x12x4) - **UNIQUE TO SQUIRREL**
   - Bushy, curves upward
   - Pivot: Back of body
   - Should be larger than rabbit tail

8. **Ears** (2x5x1) - Two separate parts
   - Pointy, upright
   - Attached to top of head

### Texture Mapping

Use the provided texture: `acorn_resourcepack/assets/minecraft/textures/entity/squirrel.png`

- Texture size: 64x32 pixels
- UV mapping follows rabbit layout with modifications for tail

## Creating the Model in Blockbench

### Option 1: Modify Rabbit Model (Recommended)

1. **Open Blockbench**
2. **File → New → Java Entity**
3. **Import vanilla rabbit model** as reference:
   - You can find rabbit model in Minecraft assets or online

4. **Modify for squirrel:**
   - Make tail much bushier and larger
   - Adjust ears to be more pointed
   - Keep body proportions similar to rabbit

5. **Apply texture:**
   - Load `squirrel.png` texture
   - Map UVs to match texture layout

6. **Export for ModelEngine:**
   - File → Export → Export as .bbmodel
   - Save as `squirrel.bbmodel`

### Option 2: Build from Scratch

1. **Create new Java Entity model**
2. **Add cubes for each body part:**
   ```
   - head: 8x8x8
   - body: 10x12x6
   - leg1: 3x10x3
   - leg2: 3x10x3
   - leg3: 4x10x4
   - leg4: 4x10x4
   - tail: 16x12x4 (or larger for bushiness)
   - ear1: 2x5x1
   - ear2: 2x5x1
   ```

3. **Position parts correctly:**
   - Body at ground level
   - Legs attached to body corners
   - Head in front of body
   - Tail at back, angled upward
   - Ears on top of head

4. **Set pivot points** for animation:
   - Legs: Top of leg (where it attaches to body)
   - Head: Base of neck
   - Tail: Where it attaches to body
   - Ears: Base

5. **Apply texture** and map UVs

6. **Test animations** (use rabbit animations as reference)

## ModelEngine Configuration

After creating the model in Blockbench, you need to configure it for ModelEngine.

### Export from Blockbench

1. **File → Export → Export ModelEngine Model**
   - If this option isn't available, export as `.bbmodel` first

2. **Save to server:**
   ```
   plugins/ModelEngine/models/squirrel.bbmodel
   ```

### ModelEngine Model Config

Create `plugins/ModelEngine/models/squirrel/model.yml`:

```yaml
model_id: squirrel
model_file: squirrel.bbmodel
texture: squirrel.png
transparent: false
glow: false
damaged: false
hitbox:
  width: 0.6
  height: 0.7
base_entity: RABBIT
animations:
  idle: rabbit_idle
  walk: rabbit_walk
  hop: rabbit_jump
```

### Resource Pack Integration

The texture must also be in the resource pack so players can see it:

```
acorn_resourcepack/
└── assets/
    └── minecraft/
        └── textures/
            └── entity/
                └── squirrel.png
```

After adding the texture, run:
```bash
./update_resourcepack.sh
git push
```

## Testing the Model

1. **Install plugins** (MythicMobs + ModelEngine)

2. **Copy files to server:**
   ```
   plugins/ModelEngine/models/squirrel.bbmodel
   plugins/ModelEngine/models/squirrel/model.yml
   plugins/MythicMobs/Mobs/squirrel.yml
   ```

3. **Reload plugins:**
   ```
   /meg reload
   /mm reload
   ```

4. **Spawn test squirrel:**
   ```
   /mm mobs spawn Squirrel 1
   ```

5. **Check model loaded:**
   ```
   /meg models
   ```

## Troubleshooting

### Model doesn't appear
- Check `/meg models` - is squirrel listed?
- Check console for errors when loading model
- Verify .bbmodel file is in correct folder
- Ensure model.yml syntax is correct

### Model appears as rabbit with no texture
- Resource pack not loaded on client
- Texture path incorrect in model.yml
- Run `./update_resourcepack.sh` and push to GitHub
- Players need to reconnect to download updated pack

### Model is wrong size
- Adjust hitbox in model.yml
- Modify scale in ModelEngine config
- Rebuild model in Blockbench with different dimensions

### Animations don't work
- Verify base_entity is RABBIT
- Check animation names match Minecraft's rabbit animations
- ModelEngine uses vanilla rabbit animations by default

## Advanced Customization

### Custom Animations

To add custom animations (requires Animation plugin or manual work):

1. Create animations in Blockbench
2. Export animation data
3. Configure in ModelEngine's animation system
4. Reference in squirrel.yml MythicMobs config

### Multiple Squirrel Variants

Create different textures for variety:
- `squirrel_gray.png` - Gray squirrel
- `squirrel_red.png` - Red squirrel
- `squirrel_black.png` - Black squirrel

Then create multiple mob configs that reference different texture variants.

## Resources

- **Blockbench**: https://www.blockbench.net/
- **ModelEngine Wiki**: https://git.mythiccraft.io/mythiccraft/MythicMobs/-/wikis/Model-Engine
- **MythicMobs Wiki**: https://git.mythiccraft.io/mythiccraft/MythicMobs/-/wikis/home
- **Minecraft Entity Models**: https://minecraft.wiki/w/Model
