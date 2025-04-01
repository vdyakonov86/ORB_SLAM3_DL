cmake_minimum_required(VERSION 3.23)
project(featureExtraction LANGUAGES C CXX)

# find_package(OpenCV REQUIRED)
find_package(yoloInference REQUIRED)

add_executable(feature_extraction feature_extraction.cpp)
# target_link_libraries(feature_extraction PUBLIC ${OpenCV_LIBS} yoloInference::yoloInference)
target_link_libraries(feature_extraction PUBLIC yoloInference::yoloInference)

target_include_directories(feature_extraction PUBLIC
    ${OpenCV_INCLUDE_DIRS}
    ${G2O_INCLUDE_DIRS}
    ${CSPARSE_INCLUDE_DIR}
    "/usr/include/eigen3/"
)