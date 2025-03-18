cmake_minimum_required(VERSION 3.23)
project(yoloInference LANGUAGES C CXX VERSION 1.0.0)

option(WITH_OPENCV "build _YOLO_OPENCV" ON)
add_compile_options(-w)
add_compile_options(-D_YOLO_OPENCV)

find_package(OpenCV REQUIRED)

add_library(yoloInference SHARED ${CMAKE_CURRENT_SOURCE_DIR}/src/yolo.cpp ${CMAKE_CURRENT_SOURCE_DIR}/src/utils.cpp)
target_include_directories(yoloInference PRIVATE ${OpenCV_INCLUDE_DIRS} "${PROJECT_SOURCE_DIR}" "${PROJECT_SOURCE_DIR}/include")
add_subdirectory("yolo-opencv")
target_link_libraries(yoloInference ${OpenCV_LIBRARIES})

# For installing package
install(TARGETS yoloInference 
    EXPORT yoloInferenceTargets
    FILE_SET HEADERS
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include)

install(DIRECTORY include/ DESTINATION include)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "yoloInferenceConfigVersion.cmake"
    VERSION ${yoloInference_VERSION}
    COMPATIBILITY AnyNewerVersion)

install(EXPORT yoloInferenceTargets
    FILE yoloInferenceTargets.cmake
    NAMESPACE yoloInference::
    DESTINATION lib/cmake/yoloInference)

install(FILES "yoloInferenceConfig.cmake" "${CMAKE_CURRENT_BINARY_DIR}/yoloInferenceConfigVersion.cmake"
    DESTINATION lib/cmake/yoloInference)

# uninstall target
if(NOT TARGET uninstall)
configure_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
  IMMEDIATE @ONLY)

add_custom_target(uninstall
  COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake)
endif()