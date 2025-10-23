#include "MockCan.h"
#include <cmath>
#include <QTime>

MockCan::MockCan(QObject *parent)
    : QObject(parent)
    , m_speed(0.0)
    , m_rpm(0.0)
    , m_targetSpeed(0.0)
    , m_targetRpm(0.0)
    , m_fuel(75.0)
    , m_temperature(90.0)
    , m_gear("P")
    , m_odometer(12345.6)
    , m_tripMeter(0.0)
    , m_leftBlinker(false)
    , m_rightBlinker(false)
    , m_highBeam(false)
    , m_blinkerState(false)
    , m_leftBlinkerEnabled(false)
    , m_rightBlinkerEnabled(false)
    , m_engineWarning(false)
    , m_oilWarning(false)
    , m_batteryWarning(false)
{
    // Update timer at ~30Hz (33ms interval)
    m_updateTimer = new QTimer(this);
    connect(m_updateTimer, &QTimer::timeout, this, &MockCan::updateValues);
    m_updateTimer->start(33);

    // Blinker timer at ~2Hz (500ms interval)
    m_blinkerTimer = new QTimer(this);
    connect(m_blinkerTimer, &QTimer::timeout, this, &MockCan::toggleBlinkers);
    m_blinkerTimer->start(500);
}

MockCan::~MockCan()
{
    m_updateTimer->stop();
    m_blinkerTimer->stop();
}

void MockCan::updateValues()
{
    // Smooth interpolation towards target values
    const double speedSmoothFactor = 0.05;
    const double rpmSmoothFactor = 0.08;

    double newSpeed = m_speed + (m_targetSpeed - m_speed) * speedSmoothFactor;
    double newRpm = m_rpm + (m_targetRpm - m_rpm) * rpmSmoothFactor;

    // Add small oscillations for realism
    newSpeed += (std::sin(QTime::currentTime().msecsSinceStartOfDay() * 0.001) * 0.5);
    newRpm += (std::sin(QTime::currentTime().msecsSinceStartOfDay() * 0.002) * 10.0);

    // Clamp values
    newSpeed = qBound(0.0, newSpeed, 240.0);
    newRpm = qBound(0.0, newRpm, 8000.0);

    bool speedChangedFlag = false;
    if (std::abs(newSpeed - m_speed) > 0.01) {
        m_speed = newSpeed;
        speedChangedFlag = true;
        emit speedChanged();
        
        // Update odometer and trip meter
        double distance = (m_speed / 3600.0) * 0.033; // km traveled in 33ms
        m_odometer += distance;
        m_tripMeter += distance;
        emit odometerChanged();
        emit tripMeterChanged();
    }

    if (std::abs(newRpm - m_rpm) > 1.0) {
        m_rpm = newRpm;
        emit rpmChanged();
    }

    // Update gear based on speed
    if (speedChangedFlag) {
        updateGear();
    }

    // Simulate fuel consumption
    if (m_speed > 0) {
        m_fuel -= 0.0008; // Slow consumption
        if (m_fuel < 0) m_fuel = 0;
        emit fuelChanged();
    }

    // Temperature varies based on RPM
    double targetTemp = 90.0 + (m_rpm / 800.0);
    m_temperature += (targetTemp - m_temperature) * 0.01;
    m_temperature = qBound(70.0, m_temperature, 120.0);
    emit temperatureChanged();

    // Update warnings
    updateWarnings();
}

void MockCan::updateGear()
{
    QString newGear;
    if (m_speed < 0.5) {
        newGear = "P";
    } else if (m_speed < 20) {
        newGear = "1";
    } else if (m_speed < 40) {
        newGear = "2";
    } else if (m_speed < 60) {
        newGear = "3";
    } else if (m_speed < 90) {
        newGear = "4";
    } else if (m_speed < 120) {
        newGear = "5";
    } else {
        newGear = "6";
    }

    if (newGear != m_gear) {
        m_gear = newGear;
        emit gearChanged();
    }
}

void MockCan::updateWarnings()
{
    // Engine warning if RPM too high
    bool newEngineWarning = m_rpm > 7000;
    if (newEngineWarning != m_engineWarning) {
        m_engineWarning = newEngineWarning;
        emit engineWarningChanged();
    }

    // Oil warning if temperature too high
    bool newOilWarning = m_temperature > 110;
    if (newOilWarning != m_oilWarning) {
        m_oilWarning = newOilWarning;
        emit oilWarningChanged();
    }

    // Battery/Fuel warning if fuel low
    bool newBatteryWarning = m_fuel < 10;
    if (newBatteryWarning != m_batteryWarning) {
        m_batteryWarning = newBatteryWarning;
        emit batteryWarningChanged();
    }
}

void MockCan::toggleBlinkers()
{
    m_blinkerState = !m_blinkerState;

    bool newLeftBlinker = m_leftBlinkerEnabled && m_blinkerState;
    bool newRightBlinker = m_rightBlinkerEnabled && m_blinkerState;

    if (newLeftBlinker != m_leftBlinker) {
        m_leftBlinker = newLeftBlinker;
        emit leftBlinkerChanged();
    }

    if (newRightBlinker != m_rightBlinker) {
        m_rightBlinker = newRightBlinker;
        emit rightBlinkerChanged();
    }
}

void MockCan::setTargetSpeed(double speed)
{
    if (qFuzzyCompare(m_targetSpeed, speed))
        return;

    m_targetSpeed = qBound(0.0, speed, 240.0);
    emit targetSpeedChanged();
}

void MockCan::setTargetRpm(double rpm)
{
    if (qFuzzyCompare(m_targetRpm, rpm))
        return;

    m_targetRpm = qBound(0.0, rpm, 8000.0);
    emit targetRpmChanged();
}

void MockCan::setLeftBlinker(bool enabled)
{
    if (m_leftBlinkerEnabled == enabled)
        return;

    m_leftBlinkerEnabled = enabled;
    if (!enabled) {
        m_leftBlinker = false;
        emit leftBlinkerChanged();
    }
}

void MockCan::setRightBlinker(bool enabled)
{
    if (m_rightBlinkerEnabled == enabled)
        return;

    m_rightBlinkerEnabled = enabled;
    if (!enabled) {
        m_rightBlinker = false;
        emit rightBlinkerChanged();
    }
}

void MockCan::setHighBeam(bool enabled)
{
    if (m_highBeam == enabled)
        return;

    m_highBeam = enabled;
    emit highBeamChanged();
}
