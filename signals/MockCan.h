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

private slots:
    void updateValues();
    void toggleBlinkers();

private:
    QTimer *m_updateTimer;
    QTimer *m_blinkerTimer;
    
    double m_speed;
    double m_rpm;
    double m_targetSpeed;
    double m_targetRpm;
    bool m_leftBlinker;
    bool m_rightBlinker;
    bool m_highBeam;
    bool m_blinkerState;
    bool m_leftBlinkerEnabled;
    bool m_rightBlinkerEnabled;
};

#endif // MOCKCAN_H

