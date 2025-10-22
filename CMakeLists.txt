cmake_minimum_required(VERSION 3.16)

project(car-hmi-with-cursor VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Gui Qml Quick)

qt_standard_project_setup()

qt_add_executable(car-hmi-with-cursor
    app/main.cpp
    signals/MockCan.h
    signals/MockCan.cpp
)

qt_add_qml_module(car-hmi-with-cursor
    URI CarHMI
    VERSION 1.0
    QML_FILES
        ui/Main.qml
        ui/components/SpeedCluster.qml
)

target_link_libraries(car-hmi-with-cursor PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
)

set_target_properties(car-hmi-with-cursor PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS car-hmi-with-cursor
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

