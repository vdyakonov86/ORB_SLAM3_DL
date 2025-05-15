USERNAME_IMG=ubuntu # docker container user
# BUILD_CONTEXT_PATH="$(dirname ${BASH_SOURCE[0]})" # relative path to the directory from which script has been run
BUILD_CONTEXT_PATH="./docker"

# docker build -t orbslam3:base -f ${BUILD_CONTEXT_PATH}/Dockerfile.base --build-arg USERNAME=$USERNAME_IMG .
# docker build -t orbslam3:main -f ${BUILD_CONTEXT_PATH}/Dockerfile.main --build-arg USERNAME=$USERNAME_IMG --build-arg BUILD_CONTEXT_PATH=$BUILD_CONTEXT_PATH .
# docker build -t orbslam3:feature_extraction -f ${BUILD_CONTEXT_PATH}/Dockerfile.feature_extraction --build-arg USERNAME=$USERNAME_IMG .
# docker build -t orbslam3:dev -f ${BUILD_CONTEXT_PATH}/Dockerfile.dev --build-arg USERNAME=$USERNAME_IMG --build-arg BUILD_CONTEXT_PATH=$BUILD_CONTEXT_PATH .
# 
docker build -t orbslam3_dyakonov -f ${BUILD_CONTEXT_PATH}/Dockerfile --build-arg USERNAME=$USERNAME_IMG --build-arg BUILD_CONTEXT_PATH=$BUILD_CONTEXT_PATH .


# docker build --no-cache -t test -f ${BUILD_CONTEXT_PATH}/Dockerfile.test --build-arg USERNAME_IMG=$USERNAME_IMG --build-arg BUILD_CONTEXT_PATH=$BUILD_CONTEXT_PATH .
