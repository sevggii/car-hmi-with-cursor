#ifndef MOCKCAN_H
#define MOCKCAN_H

#include <QObject>
#include <QTimer>

class MockCan : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double speed READ speed NOTIFY speedChanged)
    Q_PROPERTY(double rpm READ rpm NOTIFY rpmChanged)
    Q_PROPERTY(bool leftBlinker READ leftBlinker NOTIFY leftBlinkerChanged)
    Q_PROPERTY(bool rightBlinker READ rightBlinker NOTIFY rightBlinkerChanged)
    Q_PROPERTY(bool highBeam READ highBeam NOTIFY highBeamChanged)
    Q_PROPERTY(double targetSpeed READ targetSpeed WRITE setTargetSpeed NOTIFY targetSpeedChanged)
    Q_PROPERTY(double targetRpm READ targetRpm WRITE setTargetRpm NOTIFY targetRpmChanged)
    Q_PROPERTY(double fuel READ fuel NOTIFY fuelChanged)
    Q_PROPERTY(double temperature READ temperature NOTIFY temperatureChanged)
    Q_PROPERTY(QString gear READ gear NOTIFY gearChanged)
    Q_PROPERTY(double odometer READ odometer NOTIFY odometerChanged)
    Q_PROPERTY(double tripMeter READ tripMeter NOTIFY tripMeterChanged)
    Q_PROPERTY(bool engineWarning READ engineWarning NOTIFY engineWarningChanged)
    Q_PROPERTY(bool oilWarning READ oilWarning NOTIFY oilWarningChanged)
    Q_PROPERTY(bool batteryWarning READ batteryWarning NOTIFY batteryWarningChanged)

public:
    explicit MockCan(QObject *parent = nullptr);
    ~MockCan() override;

    double speed() const { return m_speed; }
    double rpm() const { return m_rpm; }
    bool leftBlinker() const { return m_leftBlinker; }
    bool rightBlinker() const { return m_rightBlinker; }
    bool highBeam() const { return m_highBeam; }
    double targetSpeed() const { return m_targetSpeed; }
    double targetRpm() const { return m_targetRpm; }
    double fuel() const { return m_fuel; }
    double temperature() const { return m_temperature; }
    QString gear() const { return m_gear; }
    double odometer() const { return m_odometer; }
    double tripMeter() const { return m_tripMeter; }
    bool engineWarning() const { return m_engineWarning; }
    bool oilWarning() const { return m_oilWarning; }
    bool batteryWarning() const { return m_batteryWarning; }

    Q_INVOKABLE void setTargetSpeed(double speed);
    Q_INVOKABLE void setTargetRpm(double rpm);
    Q_INVOKABLE void setLeftBlinker(bool enabled);
    Q_INVOKABLE void setRightBlinker(bool enabled);
    Q_INVOKABLE void setHighBeam(bool enabled);

signals:
    void speedChanged();
    void rpmChanged();
    void leftBlinkerChanged();
    void rightBlinkerChanged();
    void highBeamChanged();
    void targetSpeedChanged();
    void targetRpmChanged();
    void fuelChanged();
    void temperatureChanged();
    void gearChanged();
    void odometerChanged();
    void tripMeterChanged();
    void engineWarningChanged();
    void oilWarningChanged();
    void batteryWarningChanged();

private slots:
    void updateValues();
    void toggleBlinkers();

private:
    void updateGear();
    void updateWarnings();

    QTimer *m_updateTimer;
    QTimer *m_blinkerTimer;
    
    double m_speed;
    double m_rpm;
    double m_targetSpeed;
    double m_targetRpm;
    double m_fuel;
    double m_temperature;
    QString m_gear;
    double m_odometer;
    double m_tripMeter;
    bool m_leftBlinker;
    bool m_rightBlinker;
    bool m_highBeam;
    bool m_blinkerState;
    bool m_leftBlinkerEnabled;
    bool m_rightBlinkerEnabled;
    bool m_engineWarning;
    bool m_oilWarning;
    bool m_batteryWarning;
};

#endif // MOCKCAN_H

