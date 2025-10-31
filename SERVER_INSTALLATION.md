# Server Installation Guide - Acorn Datapack

This guide shows how to install the Acorn Datapack on your Paper MC Server so that **all players automatically** see the acorn instead of the golden carrot when they log in.

## Step 1: Install Datapack on Server

1. Copy the `acorn_datapack/` folder to your server directory:
   ```
   [your-server]/world/datapacks/acorn_datapack/
   ```

2. Run the following command on the server:
   ```
   /reload
   ```

## Step 2: Automatically Distribute Resource Pack

Edit the `server.properties` file on your server and add the following lines:

```properties
# Resource Pack Download URL (GitHub Raw Link)
resource-pack=https://github.com/mowriz/mc_acorn/raw/main/acorn_resourcepack.zip

# Optional: SHA1 Hash for verification (can be left empty)
resource-pack-sha1=da1970a3645ab5655b0797f45b7edd2b98b01d89

# Message players see when downloading
resource-pack-prompt=Loading Acorn Resource Pack... Please accept!

# IMPORTANT: Players MUST accept the Resource Pack
require-resource-pack=true
```

**Important Settings:**

- `require-resource-pack=true` - Players must accept the pack or they will be kicked
- `require-resource-pack=false` - Players can decline (but won't see the acorn)

## Step 3: Restart Server

Restart your Paper MC Server for the changes to take effect.

## What Happens Now?

- Players connect to the server
- The Resource Pack download starts automatically
- Players see a message: "Loading Acorn Resource Pack... Please accept!"
- After accepting, they see the acorn instead of the golden carrot
- Name changes to "Acorn"

## Troubleshooting

### Players Don't See the Acorn
- Resource Pack was declined → Set `require-resource-pack=true`
- Check if the download link works
- Restart the server

### Download Link Doesn't Work
- Make sure the GitHub repository is public
- Use the **raw** link: `https://github.com/mowriz/mc_acorn/raw/main/acorn_resourcepack.zip`
- Test the link in your browser

### Players Get Kicked
- This is normal when `require-resource-pack=true` and they decline
- Players must accept the pack

## Alternative: Host Resource Pack Locally

If you have your own web server, you can upload `acorn_resourcepack.zip` there:

```properties
resource-pack=https://your-website.com/acorn_resourcepack.zip
```

The server must have direct download access (no Google Drive viewer, etc.)!

## Updating the Resource Pack

After making changes to the resource pack, run:

```bash
./update_resourcepack.sh
```

This script will:
- Recreate the ZIP file
- Calculate the new SHA1 hash
- Update this file with the new hash

Then commit and push the changes to GitHub.

## GitHub Repository

- Repository: https://github.com/mowriz/mc_acorn
- Direct Download: https://github.com/mowriz/mc_acorn/raw/main/acorn_resourcepack.zip

## Support

For issues, create an issue on GitHub: https://github.com/mowriz/mc_acorn/issues
