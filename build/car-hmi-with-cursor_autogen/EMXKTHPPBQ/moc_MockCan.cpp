/****************************************************************************
** Meta object code from reading C++ file 'MockCan.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.9.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../signals/MockCan.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'MockCan.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.9.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN7MockCanE_t {};
} // unnamed namespace

template <> constexpr inline auto MockCan::qt_create_metaobjectdata<qt_meta_tag_ZN7MockCanE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "MockCan",
        "speedChanged",
        "",
        "rpmChanged",
        "leftBlinkerChanged",
        "rightBlinkerChanged",
        "highBeamChanged",
        "targetSpeedChanged",
        "targetRpmChanged",
        "fuelChanged",
        "temperatureChanged",
        "gearChanged",
        "odometerChanged",
        "tripMeterChanged",
        "engineWarningChanged",
        "oilWarningChanged",
        "batteryWarningChanged",
        "updateValues",
        "toggleBlinkers",
        "setTargetSpeed",
        "speed",
        "setTargetRpm",
        "rpm",
        "setLeftBlinker",
        "enabled",
        "setRightBlinker",
        "setHighBeam",
        "leftBlinker",
        "rightBlinker",
        "highBeam",
        "targetSpeed",
        "targetRpm",
        "fuel",
        "temperature",
        "gear",
        "odometer",
        "tripMeter",
        "engineWarning",
        "oilWarning",
        "batteryWarning"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'speedChanged'
        QtMocHelpers::SignalData<void()>(1, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'rpmChanged'
        QtMocHelpers::SignalData<void()>(3, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'leftBlinkerChanged'
        QtMocHelpers::SignalData<void()>(4, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'rightBlinkerChanged'
        QtMocHelpers::SignalData<void()>(5, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'highBeamChanged'
        QtMocHelpers::SignalData<void()>(6, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'targetSpeedChanged'
        QtMocHelpers::SignalData<void()>(7, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'targetRpmChanged'
        QtMocHelpers::SignalData<void()>(8, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'fuelChanged'
        QtMocHelpers::SignalData<void()>(9, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'temperatureChanged'
        QtMocHelpers::SignalData<void()>(10, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'gearChanged'
        QtMocHelpers::SignalData<void()>(11, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'odometerChanged'
        QtMocHelpers::SignalData<void()>(12, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'tripMeterChanged'
        QtMocHelpers::SignalData<void()>(13, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'engineWarningChanged'
        QtMocHelpers::SignalData<void()>(14, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'oilWarningChanged'
        QtMocHelpers::SignalData<void()>(15, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'batteryWarningChanged'
        QtMocHelpers::SignalData<void()>(16, 2, QMC::AccessPublic, QMetaType::Void),
        // Slot 'updateValues'
        QtMocHelpers::SlotData<void()>(17, 2, QMC::AccessPrivate, QMetaType::Void),
        // Slot 'toggleBlinkers'
        QtMocHelpers::SlotData<void()>(18, 2, QMC::AccessPrivate, QMetaType::Void),
        // Method 'setTargetSpeed'
        QtMocHelpers::MethodData<void(double)>(19, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 20 },
        }}),
        // Method 'setTargetRpm'
        QtMocHelpers::MethodData<void(double)>(21, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 22 },
        }}),
        // Method 'setLeftBlinker'
        QtMocHelpers::MethodData<void(bool)>(23, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 24 },
        }}),
        // Method 'setRightBlinker'
        QtMocHelpers::MethodData<void(bool)>(25, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 24 },
        }}),
        // Method 'setHighBeam'
        QtMocHelpers::MethodData<void(bool)>(26, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 24 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'speed'
        QtMocHelpers::PropertyData<double>(20, QMetaType::Double, QMC::DefaultPropertyFlags, 0),
        // property 'rpm'
        QtMocHelpers::PropertyData<double>(22, QMetaType::Double, QMC::DefaultPropertyFlags, 1),
        // property 'leftBlinker'
        QtMocHelpers::PropertyData<bool>(27, QMetaType::Bool, QMC::DefaultPropertyFlags, 2),
        // property 'rightBlinker'
        QtMocHelpers::PropertyData<bool>(28, QMetaType::Bool, QMC::DefaultPropertyFlags, 3),
        // property 'highBeam'
        QtMocHelpers::PropertyData<bool>(29, QMetaType::Bool, QMC::DefaultPropertyFlags, 4),
        // property 'targetSpeed'
        QtMocHelpers::PropertyData<double>(30, QMetaType::Double, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 5),
        // property 'targetRpm'
        QtMocHelpers::PropertyData<double>(31, QMetaType::Double, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 6),
        // property 'fuel'
        QtMocHelpers::PropertyData<double>(32, QMetaType::Double, QMC::DefaultPropertyFlags, 7),
        // property 'temperature'
        QtMocHelpers::PropertyData<double>(33, QMetaType::Double, QMC::DefaultPropertyFlags, 8),
        // property 'gear'
        QtMocHelpers::PropertyData<QString>(34, QMetaType::QString, QMC::DefaultPropertyFlags, 9),
        // property 'odometer'
        QtMocHelpers::PropertyData<double>(35, QMetaType::Double, QMC::DefaultPropertyFlags, 10),
        // property 'tripMeter'
        QtMocHelpers::PropertyData<double>(36, QMetaType::Double, QMC::DefaultPropertyFlags, 11),
        // property 'engineWarning'
        QtMocHelpers::PropertyData<bool>(37, QMetaType::Bool, QMC::DefaultPropertyFlags, 12),
        // property 'oilWarning'
        QtMocHelpers::PropertyData<bool>(38, QMetaType::Bool, QMC::DefaultPropertyFlags, 13),
        // property 'batteryWarning'
        QtMocHelpers::PropertyData<bool>(39, QMetaType::Bool, QMC::DefaultPropertyFlags, 14),
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<MockCan, qt_meta_tag_ZN7MockCanE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject MockCan::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN7MockCanE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN7MockCanE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN7MockCanE_t>.metaTypes,
    nullptr
} };

void MockCan::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<MockCan *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->speedChanged(); break;
        case 1: _t->rpmChanged(); break;
        case 2: _t->leftBlinkerChanged(); break;
        case 3: _t->rightBlinkerChanged(); break;
        case 4: _t->highBeamChanged(); break;
        case 5: _t->targetSpeedChanged(); break;
        case 6: _t->targetRpmChanged(); break;
        case 7: _t->fuelChanged(); break;
        case 8: _t->temperatureChanged(); break;
        case 9: _t->gearChanged(); break;
        case 10: _t->odometerChanged(); break;
        case 11: _t->tripMeterChanged(); break;
        case 12: _t->engineWarningChanged(); break;
        case 13: _t->oilWarningChanged(); break;
        case 14: _t->batteryWarningChanged(); break;
        case 15: _t->updateValues(); break;
        case 16: _t->toggleBlinkers(); break;
        case 17: _t->setTargetSpeed((*reinterpret_cast< std::add_pointer_t<double>>(_a[1]))); break;
        case 18: _t->setTargetRpm((*reinterpret_cast< std::add_pointer_t<double>>(_a[1]))); break;
        case 19: _t->setLeftBlinker((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        case 20: _t->setRightBlinker((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        case 21: _t->setHighBeam((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::speedChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::rpmChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::leftBlinkerChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::rightBlinkerChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::highBeamChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::targetSpeedChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::targetRpmChanged, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::fuelChanged, 7))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::temperatureChanged, 8))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::gearChanged, 9))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::odometerChanged, 10))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::tripMeterChanged, 11))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::engineWarningChanged, 12))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::oilWarningChanged, 13))
            return;
        if (QtMocHelpers::indexOfMethod<void (MockCan::*)()>(_a, &MockCan::batteryWarningChanged, 14))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<double*>(_v) = _t->speed(); break;
        case 1: *reinterpret_cast<double*>(_v) = _t->rpm(); break;
        case 2: *reinterpret_cast<bool*>(_v) = _t->leftBlinker(); break;
        case 3: *reinterpret_cast<bool*>(_v) = _t->rightBlinker(); break;
        case 4: *reinterpret_cast<bool*>(_v) = _t->highBeam(); break;
        case 5: *reinterpret_cast<double*>(_v) = _t->targetSpeed(); break;
        case 6: *reinterpret_cast<double*>(_v) = _t->targetRpm(); break;
        case 7: *reinterpret_cast<double*>(_v) = _t->fuel(); break;
        case 8: *reinterpret_cast<double*>(_v) = _t->temperature(); break;
        case 9: *reinterpret_cast<QString*>(_v) = _t->gear(); break;
        case 10: *reinterpret_cast<double*>(_v) = _t->odometer(); break;
        case 11: *reinterpret_cast<double*>(_v) = _t->tripMeter(); break;
        case 12: *reinterpret_cast<bool*>(_v) = _t->engineWarning(); break;
        case 13: *reinterpret_cast<bool*>(_v) = _t->oilWarning(); break;
        case 14: *reinterpret_cast<bool*>(_v) = _t->batteryWarning(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 5: _t->setTargetSpeed(*reinterpret_cast<double*>(_v)); break;
        case 6: _t->setTargetRpm(*reinterpret_cast<double*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *MockCan::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MockCan::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN7MockCanE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MockCan::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 22)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 22;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 22)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 22;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    }
    return _id;
}

// SIGNAL 0
void MockCan::speedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void MockCan::rpmChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void MockCan::leftBlinkerChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void MockCan::rightBlinkerChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void MockCan::highBeamChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void MockCan::targetSpeedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void MockCan::targetRpmChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void MockCan::fuelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void MockCan::temperatureChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void MockCan::gearChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void MockCan::odometerChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void MockCan::tripMeterChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void MockCan::engineWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void MockCan::oilWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}

// SIGNAL 14
void MockCan::batteryWarningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 14, nullptr);
}
QT_WARNING_POP
