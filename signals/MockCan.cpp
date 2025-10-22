#include "MockCan.h"
#include <cmath>

MockCan::MockCan(QObject *parent)
    : QObject(parent)
    , m_speed(0.0)
    , m_rpm(0.0)
    , m_targetSpeed(0.0)
    , m_targetRpm(0.0)
    , m_leftBlinker(false)
    , m_rightBlinker(false)
    , m_highBeam(false)
    , m_blinkerState(false)
    , m_leftBlinkerEnabled(false)
    , m_rightBlinkerEnabled(false)
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

    if (std::abs(newSpeed - m_speed) > 0.01) {
        m_speed = newSpeed;
        emit speedChanged();
    }

    if (std::abs(newRpm - m_rpm) > 1.0) {
        m_rpm = newRpm;
        emit rpmChanged();
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

