# The simulation rules are checked without Qt: node tests/sim.test.js (registered as a ctest when node exists).
find_program(NODE_EXECUTABLE NAMES node)
if(NODE_EXECUTABLE)
    add_test(NAME node_sim_rules COMMAND "${NODE_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/sim.test.js")
    add_test(NAME node_mission_data COMMAND "${NODE_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/data.test.js")
    add_test(NAME node_mall_rules COMMAND "${NODE_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/mall.test.js")
    add_test(NAME node_school_rules COMMAND "${NODE_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/school.test.js")
    add_test(NAME node_office_rules COMMAND "${NODE_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/office.test.js")
endif()

# Headless wiring check of the QML side: walks the menus, starts a mission, wins it, checks persistence.
add_test(NAME qml_autotest
         COMMAND "$<TARGET_FILE:bite_by_bite>" --autotest)
set_tests_properties(qml_autotest PROPERTIES
    ENVIRONMENT "QT_QPA_PLATFORM=minimal;QT_QUICK_BACKEND=software"
    PASS_REGULAR_EXPRESSION "AUTOTEST OK"
    FAIL_REGULAR_EXPRESSION "AUTOTEST FAIL;TypeError;ReferenceError"
    TIMEOUT 120)
add_test(NAME qml_autotest_mall
         COMMAND "$<TARGET_FILE:bite_by_bite>" --autotest --mission=mall_after_closing)
set_tests_properties(qml_autotest_mall PROPERTIES
    ENVIRONMENT "QT_QPA_PLATFORM=minimal;QT_QUICK_BACKEND=software"
    PASS_REGULAR_EXPRESSION "AUTOTEST OK"
    FAIL_REGULAR_EXPRESSION "AUTOTEST FAIL;TypeError;ReferenceError"
    TIMEOUT 120)
add_test(NAME qml_autotest_school
         COMMAND "$<TARGET_FILE:bite_by_bite>" --autotest --mission=school_detention)
set_tests_properties(qml_autotest_school PROPERTIES
    ENVIRONMENT "QT_QPA_PLATFORM=minimal;QT_QUICK_BACKEND=software"
    PASS_REGULAR_EXPRESSION "AUTOTEST OK"
    FAIL_REGULAR_EXPRESSION "AUTOTEST FAIL;TypeError;ReferenceError"
    TIMEOUT 120)
add_test(NAME qml_autotest_office
         COMMAND "$<TARGET_FILE:bite_by_bite>" --autotest --mission=office_graveyard_shift)
set_tests_properties(qml_autotest_office PROPERTIES
    ENVIRONMENT "QT_QPA_PLATFORM=minimal;QT_QUICK_BACKEND=software"
    PASS_REGULAR_EXPRESSION "AUTOTEST OK"
    FAIL_REGULAR_EXPRESSION "AUTOTEST FAIL;TypeError;ReferenceError"
    TIMEOUT 120)
