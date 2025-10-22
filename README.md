# Car HMI with Cursor

A modern automotive cluster HMI simulation built with Qt 6 and QML, featuring a speedometer, tachometer (RPM), turn signals, and high beam indicators.

## Features

- **Circular Speed Gauge**: 0-240 km/h with animated needle and scale markings
- **Digital Speed Display**: Real-time speed readout
- **RPM Bar**: Color-coded tachometer (green → yellow → red)
- **Turn Signal Indicators**: Animated left/right blinkers
- **High Beam Indicator**: Visual feedback for high beam status
- **Control Panel**: Interactive sliders for speed/RPM and checkboxes for indicators
- **Dark Automotive Theme**: Modern UI with cyan accents

## Technical Details

- **Framework**: Qt 6.5+
- **Build System**: CMake
- **Language**: C++ (backend), QML (UI)
- **Update Rate**: ~30 Hz for smooth animations
- **MockCan Class**: Simulates CAN bus data with smooth interpolation

## Project Structure

```
car-hmi-with-cursor/
├── CMakeLists.txt           # CMake build configuration
├── app/
│   └── main.cpp             # Application entry point
├── signals/
│   ├── MockCan.h            # Mock CAN bus header
│   └── MockCan.cpp          # Mock CAN bus implementation
└── ui/
    ├── Main.qml             # Main window with control panel
    └── components/
        └── SpeedCluster.qml # Speedometer cluster component
```

## Requirements

- Qt 6.5 or later
- CMake 3.16 or later
- C++17 compatible compiler
- Qt modules: Core, Gui, Qml, Quick

## Building

### macOS/Linux

```bash
mkdir build
cd build
cmake ..
cmake --build .
./car-hmi-with-cursor
```

### Windows

```bash
mkdir build
cd build
cmake ..
cmake --build . --config Release
.\Release\car-hmi-with-cursor.exe
```

## Usage

1. **Launch the application**: Run the executable after building
2. **Control Speed**: Use the speed slider (0-240 km/h)
3. **Control RPM**: Use the RPM slider (0-8000)
4. **Toggle Indicators**:
   - Left/Right Blinker: Check the corresponding boxes (blinks at ~2 Hz)
   - High Beam: Check the high beam box

The gauges will smoothly animate to the target values with realistic oscillations.

## MockCan Class

The `MockCan` class provides:
- **Q_PROPERTY**: Exposes speed, rpm, blinker, and high beam states to QML
- **30 Hz Updates**: Smooth value interpolation with realistic oscillations
- **Blinker Animation**: 500ms toggle rate for turn signals
- **Value Clamping**: Ensures values stay within realistic ranges

## Customization

### Modify Speed Range

Edit `SpeedCluster.qml`:
```qml
var normalizedSpeed = Math.min(Math.max(root.speed, 0), 240);
```

### Change Update Rate

Edit `MockCan.cpp`:
```cpp
m_updateTimer->start(33); // 33ms = ~30Hz
```

### Adjust Colors

Colors are defined in QML files using hex values:
- Cyan accent: `#00d4ff`
- Speed needle: `#ff0044`
- Background: `#0a0a0a`

## License

This is a demonstration project created for educational purposes.

