# The simulation rules are checked without Qt: node tests/sim.test.js (registered as a ctest when node exists).
find_program(NODE_EXECUTABLE NAMES node)
if(NODE_EXECUTABLE)
    add_test(NAME node_sim_rules COMMAND "${NODE_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/sim.test.js")
    add_test(NAME node_mission_data COMMAND "${NODE_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/data.test.js")
endif()

# Headless wiring check of the QML side: walks the menus, starts a mission, wins it, checks persistence.
add_test(NAME qml_autotest
         COMMAND "$<TARGET_FILE:bite_by_bite>" --autotest)
set_tests_properties(qml_autotest PROPERTIES
    ENVIRONMENT "QT_QPA_PLATFORM=minimal;QT_QUICK_BACKEND=software"
    PASS_REGULAR_EXPRESSION "AUTOTEST OK"
    FAIL_REGULAR_EXPRESSION "AUTOTEST FAIL;TypeError;ReferenceError"
    TIMEOUT 120)
