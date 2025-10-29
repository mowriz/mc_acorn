#!/bin/bash

# Acorn Resource Pack Update Script
# This script recreates the ZIP file and updates the SHA1 hash

set -e

echo "🌰 Updating Acorn Resource Pack..."
echo ""

# Remove old ZIP file
if [ -f "acorn_resourcepack.zip" ]; then
    echo "📦 Removing old ZIP file..."
    rm acorn_resourcepack.zip
fi

# Create new ZIP file
echo "📦 Creating new ZIP file..."
cd acorn_resourcepack
zip -r ../acorn_resourcepack.zip . -x "*.DS_Store" -q
cd ..
echo "✅ ZIP file created: acorn_resourcepack.zip"
echo ""

# Calculate SHA1 hash
echo "🔐 Calculating SHA1 hash..."
SHA1=$(shasum -a 1 acorn_resourcepack.zip | awk '{print $1}')
echo "✅ SHA1: $SHA1"
echo ""

# Update SERVER_INSTALLATION.md with new SHA1
echo "📝 Updating SERVER_INSTALLATION.md..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/resource-pack-sha1=.*/resource-pack-sha1=$SHA1/" SERVER_INSTALLATION.md
else
    # Linux
    sed -i "s/resource-pack-sha1=.*/resource-pack-sha1=$SHA1/" SERVER_INSTALLATION.md
fi
echo "✅ SERVER_INSTALLATION.md updated"
echo ""

# Create SHA1 file for reference
echo "$SHA1" > acorn_resourcepack.sha1
echo "✅ SHA1 saved to acorn_resourcepack.sha1"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✨ Resource Pack Update Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Summary:"
echo "   ZIP: acorn_resourcepack.zip"
echo "   SHA1: $SHA1"
echo ""
echo "🚀 Next steps:"
echo "   1. git add acorn_resourcepack.zip acorn_resourcepack.sha1 SERVER_INSTALLATION.md"
echo "   2. git commit -m \"Update resource pack\""
echo "   3. git push"
echo ""
echo "🎮 Server Configuration:"
echo "   resource-pack=https://github.com/mowriz/mc_acorn/raw/main/acorn_resourcepack.zip"
echo "   resource-pack-sha1=$SHA1"
echo ""
