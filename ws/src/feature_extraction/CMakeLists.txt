cmake_minimum_required( VERSION 3.1 )
project( featureExtraction )

find_package(OpenCV 4.8.0 REQUIRED)
find_package(yoloInference)

add_executable(feature_extraction feature_extraction.cpp)
target_link_libraries(feature_extraction PUBLIC ${OpenCV_LIBS} yoloInference::yoloInference)

target_include_directories(feature_extraction PUBLIC
    ${OpenCV_INCLUDE_DIRS}
    ${G2O_INCLUDE_DIRS}
    ${CSPARSE_INCLUDE_DIR}
    "/usr/include/eigen3/"
)