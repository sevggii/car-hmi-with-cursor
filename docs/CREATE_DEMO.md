# How to Create Demo Screenshots and GIFs

## 📸 Taking Screenshots (macOS)

### Method 1: Built-in Screenshot Tool
```bash
# Take screenshot of entire screen
Cmd + Shift + 3

# Take screenshot of selected area
Cmd + Shift + 4

# Take screenshot of specific window
Cmd + Shift + 4, then press Spacebar, click window
```

Screenshots are saved to `~/Desktop` by default.

### Method 2: Using screencapture command
```bash
# Capture the car HMI window after 5 seconds
sleep 5 && screencapture -w docs/images/screenshot-main.png
# Then click on the car-hmi-with-cursor window
```

## 🎬 Creating Animated GIFs

### Method 1: Using QuickTime + ffmpeg (Recommended)

#### Step 1: Record with QuickTime
1. Open **QuickTime Player**
2. **File → New Screen Recording**
3. Click the red record button
4. Select the car HMI window area
5. Perform your demo (move sliders, toggle indicators)
6. Stop recording (Click stop in menu bar)
7. Save as `demo.mov` to project folder

#### Step 2: Convert to GIF with ffmpeg

Install ffmpeg:
```bash
# If you have Homebrew
brew install ffmpeg

# If not, download from: https://ffmpeg.org/download.html
```

Convert to optimized GIF:
```bash
cd /Users/sevgi/car-hmi-with-cursor

# High quality GIF (may be large)
ffmpeg -i demo.mov -vf "fps=30,scale=800:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 docs/images/demo.gif

# Smaller file size (lower fps)
ffmpeg -i demo.mov -vf "fps=15,scale=640:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 docs/images/demo-small.gif
```

### Method 2: Using Kap (Easy, Free)

1. Download **Kap** from https://getkap.co/ (free, open-source)
2. Install and open Kap
3. Select the car HMI window area
4. Click record
5. Perform your demo
6. Click stop
7. Export as GIF → Save to `docs/images/demo.gif`

### Method 3: Using LICEcap (Simple)

1. Download **LICEcap** from https://www.cockos.com/licecap/
2. Open LICEcap
3. Resize the recording frame over the car HMI window
4. Click "Record"
5. Save to `docs/images/demo.gif`
6. Perform your demo
7. Click "Stop"

## 📝 Recommended Demo Sequence

### For the Main GIF (30-45 seconds):
1. **Start** - Cluster at idle (speed = 0, RPM = 0, gear = P)
2. **Accelerate** - Move speed slider from 0 → 120 km/h
   - Shows needle animation
   - Shows gear changes (P → 1 → 2 → 3 → 4 → 5)
   - Shows odometer increasing
3. **RPM Demo** - Move RPM slider to 7000+
   - Shows RPM bar color change
   - Shows engine warning blinking
4. **Turn Signals** - Toggle left blinker
   - Shows animated pulsing green arrow
5. **High Beam** - Toggle high beam
   - Shows blue indicator
6. **Slow Down** - Return to 0

### For Screenshots:

#### screenshot-main.png
- Speed: 120 km/h
- RPM: 3500
- Gear: 5
- All gauges visible
- No warnings active

#### screenshot-warnings.png
- Speed: 180 km/h
- RPM: 7500
- Low fuel (< 10%)
- High temperature
- All warnings blinking

#### screenshot-controls.png
- Full view showing both cluster and control panel
- Mid-range values

## 🎨 Optimal Settings for Recording

### Window Size
- Recommended: 1280x720 (16:9 ratio)
- Minimum: 800x600

### Recording Settings
- **Frame Rate**: 30 fps (for smooth animations)
- **Duration**: 30-45 seconds (GitHub limits ~10MB for GIFs)
- **Resolution**: 800px width for README (scales well)

### GIF Optimization
```bash
# If GIF is too large (> 10MB), optimize it:
# Install gifsicle
brew install gifsicle

# Optimize GIF
gifsicle -O3 --lossy=80 -o docs/images/demo-optimized.gif docs/images/demo.gif
```

## 📤 After Creating Media

1. **Move files** to `docs/images/` folder:
   ```bash
   mv screenshot-main.png docs/images/
   mv demo.gif docs/images/
   ```

2. **Verify** they're referenced in README.md:
   ```markdown
   ![Demo](docs/images/demo.gif)
   ![Screenshot](docs/images/screenshot-main.png)
   ```

3. **Commit** to git:
   ```bash
   git add docs/images/
   git commit -m "Add demo screenshots and GIF"
   git push
   ```

## 💡 Tips

- **Good lighting**: Record in well-lit environment
- **Clean background**: Close unnecessary windows
- **Smooth movements**: Move sliders slowly for better demo
- **Pause briefly**: Hold each state for 2-3 seconds
- **File size**: Keep GIF under 10MB for GitHub (compress if needed)
- **Alt text**: Always add descriptive alt text for accessibility

## 🎯 Quick Start

**Fastest method** (using built-in tools):
```bash
# 1. Start your app
cd /Users/sevgi/car-hmi-with-cursor/build
./car-hmi-with-cursor.app/Contents/MacOS/car-hmi-with-cursor

# 2. Take screenshot (in another terminal)
sleep 3 && screencapture -w docs/images/screenshot-main.png
# Then click the car HMI window

# 3. For GIF: Use QuickTime → Screen Recording
# Then convert with the ffmpeg command above
```

---

**Need help?** Check the ffmpeg documentation: https://ffmpeg.org/ffmpeg.html

