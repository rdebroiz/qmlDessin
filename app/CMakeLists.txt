cmake_minimum_required(VERSION 2.8.11)
project(qmldessin)

## #############################################################################
## List Sources
## #############################################################################

list_source_files(${PROJECT_NAME}
  ${CMAKE_CURRENT_SOURCE_DIR}
  qml
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
  Qt5::Widgets
  Qt5::Qml
  Qt5::Quick
#  Qt5::QuickWidgets
  )
