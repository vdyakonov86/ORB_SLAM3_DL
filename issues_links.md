# Opencv
- introduction tutorial: https://docs.opencv.org/4.x/df/d65/tutorial_table_of_content_introduction.html
- gcc/make on linux tutorial: https://docs.opencv.org/4.x/db/df5/tutorial_linux_gcc_cmake.html

- Failed to load module "canberra-gtk-module": https://askubuntu.com/questions/208431/failed-to-load-module-canberra-gtk-module
- [CMakeFiles/Makefile2:15960: modules/gapi/CMakeFiles/opencv_test_gapi.dir/all] Error 2: https://github.com/opencv/opencv/issues/19244
- error: (-2:Unspecified error) The function is not implemented: https://stackoverflow.com/questions/67120450/error-2unspecified-error-the-function-is-not-implemented-rebuild-the-libra

# ORB-SLAM3
- setting up guide: https://blog.csdn.net/G_C_H/article/details/136907206

- libpango_windowing.so: cannot open shared object file: https://github.com/UZ-SLAMLab/ORB_SLAM3/issues/399
- QStandardPaths: XDG_RUNTIME_DIR not set: https://stackoverflow.com/questions/59790350/qstandardpaths-xdg-runtime-dir-not-set-defaulting-to-tmp-runtime-aadithyasb
- error: ‘slots_reference’ was not declared in this scope: https://github.com/UZ-SLAMLab/ORB_SLAM3/issues/387

- setting up guide: https://github.com/aryaman-patel/orb_slam3_implementation
https://github.com/Mauhing/ORB_SLAM3?tab=readme-ov-file#1-installation-of-orb-slam-3-on-a-fresh-installed-ubuntu-2004

- image_io_exr.cpp:62:30: error: ‘Imf::Int64’ has not been declared (Pangolin build): https://github.com/stevenlovegrove/Pangolin/issues/649

- Cannot find -lboost_serialization: https://github.com/UZ-SLAMLab/ORB_SLAM3/issues/702
- fatal error: boost/serialization/serialization.hpp: No such file or directory: https://github.com/UZ-SLAMLab/ORB_SLAM3/issues/342


# Yolo inference
- OpenCV DNN failing to load an ONNX file: computeShapeByReshapeMask issue: https://github.com/opencv/opencv/issues/23365

# ONNX
Test #7: onnxruntime_logging_apis_test ...........   Passed    0.01 sec

86% tests passed, 1 tests failed out of 7

Total Test time (real) =  82.53 sec

The following tests FAILED:
          1 - onnxruntime_test_all (Failed)
Errors while running CTest
Output from these tests are in: /dl_ws/onnxruntime/build/Linux/RelWithDebInfo/Testing/Temporary/LastTest.log
Use "--rerun-failed --output-on-failure" to re-run the failed cases verbosely.
Traceback (most recent call last):
  File "/dl_ws/onnxruntime/tools/ci_build/build.py", line 3312, in <module>
    sys.exit(main())
             ^^^^^^
  File "/dl_ws/onnxruntime/tools/ci_build/build.py", line 3214, in main
    run_onnxruntime_tests(args, source_dir, ctest_path, build_dir, configs)
  File "/dl_ws/onnxruntime/tools/ci_build/build.py", line 2355, in run_onnxruntime_tests
    run_subprocess(ctest_cmd, cwd=cwd, dll_path=dll_path)
  File "/dl_ws/onnxruntime/tools/ci_build/build.py", line 906, in run_subprocess
    return run(*args, cwd=cwd, capture_stdout=capture_stdout, shell=shell, env=my_env)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/dl_ws/onnxruntime/tools/python/util/run.py", line 50, in run
    completed_process = subprocess.run(
                        ^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['/home/ubuntu/.local/bin/ctest', '--build-config', 'RelWithDebInfo', '--verbose', '--timeout', '10800']' returned non-zero exit status 8.