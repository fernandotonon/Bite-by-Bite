# Application target, declared through Clayground's clay_app() helper (entry point: Main.qml).
include(clayapp)

# Runtime assets (balsam output under assets/runtime, audio) live outside app/; each file gets an alias
# that keeps the "../assets/..." path Qt.resolvedUrl() expects from the app directory.
file(GLOB_RECURSE BITE_RUNTIME_ASSETS CONFIGURE_DEPENDS "${CMAKE_SOURCE_DIR}/assets/runtime/*")
file(GLOB BITE_AUDIO_ASSETS CONFIGURE_DEPENDS "${CMAKE_SOURCE_DIR}/assets/audio/*.wav")
file(GLOB BITE_UI_ASSETS CONFIGURE_DEPENDS "${CMAKE_SOURCE_DIR}/assets/ui/*.png")
set(BITE_RES_FILES ${BITE_AUDIO_ASSETS} ${BITE_UI_ASSETS})
if(NOT EMSCRIPTEN)
    list(APPEND BITE_RES_FILES ${BITE_RUNTIME_ASSETS})
endif()
list(FILTER BITE_RES_FILES EXCLUDE REGEX "\\.DS_Store$")
foreach(_f IN LISTS BITE_RES_FILES)
    file(RELATIVE_PATH _rel "${CMAKE_SOURCE_DIR}" "${_f}")
    set_source_files_properties("${_f}" PROPERTIES QT_RESOURCE_ALIAS "${_rel}")
endforeach()

file(GLOB BITE_QML_FILES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/*.qml")
file(GLOB BITE_JS_FILES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/scripts/*.js" "${CMAKE_CURRENT_SOURCE_DIR}/config/*.js")
foreach(_q IN LISTS BITE_QML_FILES)
    get_filename_component(_n "${_q}" NAME)
    list(APPEND BITE_QML_NAMES "${_n}")
endforeach()
foreach(_j IN LISTS BITE_JS_FILES)
    file(RELATIVE_PATH _rel "${CMAKE_CURRENT_SOURCE_DIR}" "${_j}")
    list(APPEND BITE_QML_NAMES "${_rel}")
endforeach()

set_source_files_properties(Theme.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

# physical gamepads: Apple's GameController framework on macOS, the browser Gamepad API on WebAssembly
if(APPLE AND NOT IOS)
    set(BITE_GAMEPAD_SOURCE src/gamepadbridge.mm)
else()
    set(BITE_GAMEPAD_SOURCE src/gamepadbridge.cpp)
endif()

clay_app(bite_by_bite
    VERSION 0.1.0

    SOURCES
        src/gamepadbridge.h ${BITE_GAMEPAD_SOURCE}
        src/savestore.h src/savestore.cpp
        src/webaudio.h src/webaudio.cpp

    LINK_LIBS
        Qt::Core
        Qt::Qml
        Qt::Quick
        Qt::Quick3D
        Qt::Quick3DHelpers
        Qt::Quick3DAssetUtils
        Qt::QuickTimeline
        Qt::Multimedia

    QML_FILES
        ${BITE_QML_NAMES}

    RES_FILES
        ${BITE_RES_FILES}
)

# the generated QML type registration includes <gamepadbridge.h> etc. by bare name
target_include_directories(bite_by_bite PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/src")
if(APPLE AND NOT IOS)
    target_link_libraries(bite_by_bite PRIVATE "-framework GameController" "-framework Foundation")
endif()
if(EMSCRIPTEN)
    # Qt Quick 3D plus the preloaded assets need more than Clayground's 64 MB default heap;
    # it still grows on demand (ALLOW_MEMORY_GROWTH).
    set_target_properties(bite_by_bite PROPERTIES QT_WASM_INITIAL_MEMORY "256MB")
endif()
