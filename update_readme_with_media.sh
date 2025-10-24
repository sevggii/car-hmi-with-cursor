#!/bin/bash

# Update README with actual screenshots/GIF

echo "🔄 Updating README with media files..."

# Check what exists
has_gif=false
has_screenshot=false

if [ -f "docs/images/demo.gif" ]; then
    has_gif=true
    echo "✅ Found: demo.gif"
fi

if [ -f "docs/images/screenshot-main.png" ]; then
    has_screenshot=true
    echo "✅ Found: screenshot-main.png"
fi

if [ "$has_gif" = false ] && [ "$has_screenshot" = false ]; then
    echo "❌ No media files found!"
    echo ""
    echo "Please create them first:"
    echo "  ./create_demo.sh"
    exit 1
fi

# Backup README
cp README.md README.md.backup

# Update README based on what we have
if [ "$has_gif" = true ]; then
    echo "Uncommenting GIF in README..."
    sed -i '' 's/<!-- Uncomment when you have created the demo GIF://' README.md
    sed -i '' 's/-->//' README.md
fi

if [ "$has_screenshot" = true ]; then
    echo "Replacing placeholder with real screenshot..."
    sed -i '' 's|https://via.placeholder.com/800x450/0a0a0a/00d4ff?text=Run+the+app+to+see+the+live+demo!|docs/images/screenshot-main.png|' README.md
    sed -i '' 's|Demo Placeholder - Run ./create_demo.sh to create screenshots|Main Cluster View - Real Screenshot|' README.md
    sed -i '' 's|👆 \*Screenshot will appear here after you run .*|👆 \*Actual screenshot from the running application\*|' README.md
fi

echo ""
echo "✅ README updated!"
echo ""
echo "📝 Next: Commit the changes"
echo "   git add README.md docs/images/"
echo "   git commit -m 'Add demo screenshots and GIF'"
echo "   git push"
echo ""


