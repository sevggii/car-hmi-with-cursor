# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/car-hmi-with-cursor_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/car-hmi-with-cursor_autogen.dir/ParseCache.txt"
  "car-hmi-with-cursor_autogen"
  )
endif()
