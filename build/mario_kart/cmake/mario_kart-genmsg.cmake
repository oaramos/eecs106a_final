# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mario_kart: 1 messages, 0 services")

set(MSG_I_FLAGS "-Imario_kart:/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mario_kart_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg" NAME_WE)
add_custom_target(_mario_kart_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mario_kart" "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg" "std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose:geometry_msgs/PoseStamped"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mario_kart
  "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mario_kart
)

### Generating Services

### Generating Module File
_generate_module_cpp(mario_kart
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mario_kart
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mario_kart_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mario_kart_generate_messages mario_kart_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg" NAME_WE)
add_dependencies(mario_kart_generate_messages_cpp _mario_kart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mario_kart_gencpp)
add_dependencies(mario_kart_gencpp mario_kart_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mario_kart_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mario_kart
  "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mario_kart
)

### Generating Services

### Generating Module File
_generate_module_eus(mario_kart
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mario_kart
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mario_kart_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mario_kart_generate_messages mario_kart_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg" NAME_WE)
add_dependencies(mario_kart_generate_messages_eus _mario_kart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mario_kart_geneus)
add_dependencies(mario_kart_geneus mario_kart_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mario_kart_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mario_kart
  "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mario_kart
)

### Generating Services

### Generating Module File
_generate_module_lisp(mario_kart
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mario_kart
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mario_kart_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mario_kart_generate_messages mario_kart_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg" NAME_WE)
add_dependencies(mario_kart_generate_messages_lisp _mario_kart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mario_kart_genlisp)
add_dependencies(mario_kart_genlisp mario_kart_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mario_kart_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mario_kart
  "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mario_kart
)

### Generating Services

### Generating Module File
_generate_module_nodejs(mario_kart
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mario_kart
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mario_kart_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mario_kart_generate_messages mario_kart_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg" NAME_WE)
add_dependencies(mario_kart_generate_messages_nodejs _mario_kart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mario_kart_gennodejs)
add_dependencies(mario_kart_gennodejs mario_kart_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mario_kart_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mario_kart
  "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mario_kart
)

### Generating Services

### Generating Module File
_generate_module_py(mario_kart
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mario_kart
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mario_kart_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mario_kart_generate_messages mario_kart_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fa22/class/ee106a-acd/Documents/eecs106a_final/src/mario_kart/msg/positions.msg" NAME_WE)
add_dependencies(mario_kart_generate_messages_py _mario_kart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mario_kart_genpy)
add_dependencies(mario_kart_genpy mario_kart_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mario_kart_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mario_kart)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mario_kart
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(mario_kart_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mario_kart)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mario_kart
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(mario_kart_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mario_kart)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mario_kart
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(mario_kart_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mario_kart)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mario_kart
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(mario_kart_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mario_kart)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mario_kart\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mario_kart
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(mario_kart_generate_messages_py geometry_msgs_generate_messages_py)
endif()
