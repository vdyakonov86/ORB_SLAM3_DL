# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /ros_ws/pangolin_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /ros_ws/pangolin_test/build

# Include any dependencies generated for this target.
include CMakeFiles/HelloPangolin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/HelloPangolin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/HelloPangolin.dir/flags.make

CMakeFiles/HelloPangolin.dir/main.o: CMakeFiles/HelloPangolin.dir/flags.make
CMakeFiles/HelloPangolin.dir/main.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/ros_ws/pangolin_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/HelloPangolin.dir/main.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/HelloPangolin.dir/main.o -c /ros_ws/pangolin_test/main.cpp

CMakeFiles/HelloPangolin.dir/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloPangolin.dir/main.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /ros_ws/pangolin_test/main.cpp > CMakeFiles/HelloPangolin.dir/main.i

CMakeFiles/HelloPangolin.dir/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloPangolin.dir/main.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /ros_ws/pangolin_test/main.cpp -o CMakeFiles/HelloPangolin.dir/main.s

# Object files for target HelloPangolin
HelloPangolin_OBJECTS = \
"CMakeFiles/HelloPangolin.dir/main.o"

# External object files for target HelloPangolin
HelloPangolin_EXTERNAL_OBJECTS =

HelloPangolin: CMakeFiles/HelloPangolin.dir/main.o
HelloPangolin: CMakeFiles/HelloPangolin.dir/build.make
HelloPangolin: /usr/local/lib/libpango_python.so.0.9.2
HelloPangolin: /usr/local/lib/libpango_plot.so.0.9.2
HelloPangolin: /usr/local/lib/libpango_display.so.0.9.2
HelloPangolin: /usr/local/lib/libpango_windowing.so.0.9.2
HelloPangolin: /usr/local/lib/libpango_opengl.so.0.9.2
HelloPangolin: /usr/lib/x86_64-linux-gnu/libEGL.so
HelloPangolin: /usr/lib/x86_64-linux-gnu/libOpenGL.so
HelloPangolin: /usr/lib/x86_64-linux-gnu/libepoxy.so
HelloPangolin: /usr/local/lib/libpango_vars.so.0.9.2
HelloPangolin: /usr/local/lib/libpango_video.so.0.9.2
HelloPangolin: /usr/local/lib/libpango_image.so.0.9.2
HelloPangolin: /usr/local/lib/libpango_packetstream.so.0.9.2
HelloPangolin: /usr/local/lib/libpango_core.so.0.9.2
HelloPangolin: CMakeFiles/HelloPangolin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/ros_ws/pangolin_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable HelloPangolin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HelloPangolin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/HelloPangolin.dir/build: HelloPangolin

.PHONY : CMakeFiles/HelloPangolin.dir/build

CMakeFiles/HelloPangolin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/HelloPangolin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/HelloPangolin.dir/clean

CMakeFiles/HelloPangolin.dir/depend:
	cd /ros_ws/pangolin_test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /ros_ws/pangolin_test /ros_ws/pangolin_test /ros_ws/pangolin_test/build /ros_ws/pangolin_test/build /ros_ws/pangolin_test/build/CMakeFiles/HelloPangolin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/HelloPangolin.dir/depend

