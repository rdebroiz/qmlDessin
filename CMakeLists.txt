cmake_minimum_required(VERSION 2.8.11)
project(qmlDessin)


## #############################################################################
## Version number.
## #############################################################################

set(${PROJECT_NAME}_VERSION_MAJOR 1)
set(${PROJECT_NAME}_VERSION_MINOR 0)
set(${PROJECT_NAME}_VERSION_PATCH 0)
set(${PROJECT_NAME}_VERSION
    ${PROJECT_NAME}_VERSION_MAJOR.${PROJECT_NAME}_VERSION_MINOR.${PROJECT_NAME}_VERSION_PATCH
    )
add_definitions(-D${PROJECT_NAME}_VERSION="${${PROJECT_NAME}_VERSION}")


## #############################################################################
## Additionals modules
## #############################################################################

set(${PROJECT_NAME}_CMAKE_DIR
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/module
  )

set(CMAKE_MODULE_PATH
  ${${PROJECT_NAME}_CMAKE_DIR}
  ${CMAKE_MODULE_PATH}
  )

include(list_source_files)
include(list_header_directories_to_include)


## #############################################################################
## Find packages.
## #############################################################################

# Find the QtWidgets library
#find_package(Qt5Core REQUIRED)
#find_package(Qt5Widgets REQUIRED)
#find_package(Qt5Qml REQUIRED)
find_package(Qt5Quick REQUIRED)
#find_package(Qt5QuickWidgets REQUIRED)


## #############################################################################
## Qt Automoc
## #############################################################################

set(CMAKE_AUTOMOC ON)
#   Find includes in corresponding build (and source) directories
#   (nedded for generated files)
set(CMAKE_INCLUDE_CURRENT_DIR ON)


## #############################################################################
## List Sources
## #############################################################################

list_source_files(${PROJECT_NAME}
  ${CMAKE_CURRENT_SOURCE_DIR}
  app
  app/qml
  )

## #############################################################################
## include directorie.
## #############################################################################

list_header_directories_to_include(${PROJECT_NAME}
  ${${PROJECT_NAME}_HEADERS}
  )

include_directories(${${PROJECT_NAME}_INCLUDE_DIRS})

## #############################################################################
## Exe definition.
## #############################################################################

qt5_add_resources(${PROJECT_NAME}_QRC
    ${${PROJECT_NAME}_QRC}
    )

add_executable(${PROJECT_NAME}
  ${${PROJECT_NAME}_CFILES}
  ${${PROJECT_NAME}_QRC}
  ${${PROJECT_NAME}_QML}
  )


## #############################################################################
## Exe definition.
## #############################################################################

target_link_libraries(${PROJECT_NAME}
#  Qt5::Core
#  Qt5::Widgets
#  Qt5::Qml
  Qt5::Quick
#  Qt5::QuickWidgets
  )


