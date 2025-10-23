#!/bin/bash

# Car HMI Demo Creation Script
# This script helps you create demo GIF and screenshots

echo "🎬 Car HMI Demo Creator"
echo "======================="
echo ""

# Check if app is running
if pgrep -f "car-hmi-with-cursor" > /dev/null; then
    echo "✅ Car HMI app is running"
else
    echo "❌ Car HMI app is NOT running!"
    echo "Please start it first:"
    echo "  cd build && ./car-hmi-with-cursor.app/Contents/MacOS/car-hmi-with-cursor"
    exit 1
fi

echo ""
echo "Choose an option:"
echo "1. Take screenshot (current state)"
echo "2. Record with QuickTime (manual)"
echo "3. Convert existing video to GIF"
echo "4. Take multiple screenshots for gallery"
echo ""
read -p "Enter option (1-4): " option

case $option in
    1)
        echo ""
        echo "📸 Taking screenshot in 5 seconds..."
        echo "   Position the car HMI window now!"
        sleep 5
        screencapture -w docs/images/screenshot-main.png
        echo "✅ Screenshot saved to: docs/images/screenshot-main.png"
        open docs/images/screenshot-main.png
        ;;
    
    2)
        echo ""
        echo "🎥 Opening QuickTime Player..."
        echo ""
        echo "Steps:"
        echo "1. In QuickTime: File → New Screen Recording"
        echo "2. Click record and select car HMI window"
        echo "3. Perform your demo (30-45 seconds):"
        echo "   - Move speed slider 0 → 120 km/h"
        echo "   - Move RPM slider to 7000+"
        echo "   - Toggle left blinker"
        echo "   - Toggle high beam"
        echo "4. Stop recording and save as 'demo.mov' in project folder"
        echo "5. Run this script again and choose option 3"
        open -a "QuickTime Player"
        ;;
    
    3)
        if [ ! -f "demo.mov" ]; then
            echo "❌ demo.mov not found!"
            echo "Please record with QuickTime first (option 2)"
            exit 1
        fi
        
        echo ""
        echo "🔄 Converting demo.mov to GIF..."
        
        # Check if ffmpeg is installed
        if ! command -v ffmpeg &> /dev/null; then
            echo "❌ ffmpeg not found!"
            echo ""
            echo "Install ffmpeg first:"
            echo "  brew install ffmpeg"
            echo ""
            echo "Or download from: https://ffmpeg.org/download.html"
            exit 1
        fi
        
        echo "Creating optimized GIF (this may take a minute)..."
        ffmpeg -i demo.mov -vf "fps=20,scale=800:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 docs/images/demo.gif -y
        
        echo ""
        echo "✅ GIF created: docs/images/demo.gif"
        
        # Check file size
        size=$(du -h docs/images/demo.gif | cut -f1)
        echo "   File size: $size"
        
        if [ -f docs/images/demo.gif ]; then
            open docs/images/demo.gif
        fi
        ;;
    
    4)
        echo ""
        echo "📸 Taking multiple screenshots..."
        echo ""
        
        screenshots=(
            "screenshot-main:Normal driving view (120 km/h, 3500 RPM)"
            "screenshot-warnings:High speed with warnings (180 km/h, 7500 RPM)"
            "screenshot-idle:Idle state (0 km/h, 0 RPM, P gear)"
        )
        
        for item in "${screenshots[@]}"; do
            name="${item%%:*}"
            desc="${item##*:}"
            
            echo ""
            echo "Next: $desc"
            read -p "Press Enter when ready, then click the car HMI window..."
            sleep 1
            screencapture -w "docs/images/$name.png"
            echo "✅ Saved: docs/images/$name.png"
            sleep 2
        done
        
        echo ""
        echo "✅ All screenshots saved!"
        open docs/images/
        ;;
    
    *)
        echo "Invalid option"
        exit 1
        ;;
esac

echo ""
echo "📝 Next steps:"
echo "1. Check the generated files in docs/images/"
echo "2. Commit to git:"
echo "   git add docs/images/"
echo "   git commit -m 'Add demo screenshots and GIF'"
echo ""

