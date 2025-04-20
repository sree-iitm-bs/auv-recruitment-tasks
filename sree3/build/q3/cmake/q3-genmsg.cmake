# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "q3: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iq3:/home/invictus/sree3/src/q3/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(q3_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/bot_pose.msg" NAME_WE)
add_custom_target(_q3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "q3" "/home/invictus/sree3/src/q3/msg/bot_pose.msg" "std_msgs/String:geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/fsm_custom.msg" NAME_WE)
add_custom_target(_q3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "q3" "/home/invictus/sree3/src/q3/msg/fsm_custom.msg" "std_msgs/Float64:std_msgs/String"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(q3
  "/home/invictus/sree3/src/q3/msg/bot_pose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/q3
)
_generate_msg_cpp(q3
  "/home/invictus/sree3/src/q3/msg/fsm_custom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/q3
)

### Generating Services

### Generating Module File
_generate_module_cpp(q3
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/q3
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(q3_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(q3_generate_messages q3_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/bot_pose.msg" NAME_WE)
add_dependencies(q3_generate_messages_cpp _q3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/fsm_custom.msg" NAME_WE)
add_dependencies(q3_generate_messages_cpp _q3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(q3_gencpp)
add_dependencies(q3_gencpp q3_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS q3_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(q3
  "/home/invictus/sree3/src/q3/msg/bot_pose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/q3
)
_generate_msg_eus(q3
  "/home/invictus/sree3/src/q3/msg/fsm_custom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/q3
)

### Generating Services

### Generating Module File
_generate_module_eus(q3
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/q3
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(q3_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(q3_generate_messages q3_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/bot_pose.msg" NAME_WE)
add_dependencies(q3_generate_messages_eus _q3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/fsm_custom.msg" NAME_WE)
add_dependencies(q3_generate_messages_eus _q3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(q3_geneus)
add_dependencies(q3_geneus q3_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS q3_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(q3
  "/home/invictus/sree3/src/q3/msg/bot_pose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/q3
)
_generate_msg_lisp(q3
  "/home/invictus/sree3/src/q3/msg/fsm_custom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/q3
)

### Generating Services

### Generating Module File
_generate_module_lisp(q3
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/q3
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(q3_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(q3_generate_messages q3_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/bot_pose.msg" NAME_WE)
add_dependencies(q3_generate_messages_lisp _q3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/fsm_custom.msg" NAME_WE)
add_dependencies(q3_generate_messages_lisp _q3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(q3_genlisp)
add_dependencies(q3_genlisp q3_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS q3_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(q3
  "/home/invictus/sree3/src/q3/msg/bot_pose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/q3
)
_generate_msg_nodejs(q3
  "/home/invictus/sree3/src/q3/msg/fsm_custom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/q3
)

### Generating Services

### Generating Module File
_generate_module_nodejs(q3
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/q3
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(q3_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(q3_generate_messages q3_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/bot_pose.msg" NAME_WE)
add_dependencies(q3_generate_messages_nodejs _q3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/fsm_custom.msg" NAME_WE)
add_dependencies(q3_generate_messages_nodejs _q3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(q3_gennodejs)
add_dependencies(q3_gennodejs q3_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS q3_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(q3
  "/home/invictus/sree3/src/q3/msg/bot_pose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/q3
)
_generate_msg_py(q3
  "/home/invictus/sree3/src/q3/msg/fsm_custom.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/q3
)

### Generating Services

### Generating Module File
_generate_module_py(q3
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/q3
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(q3_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(q3_generate_messages q3_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/bot_pose.msg" NAME_WE)
add_dependencies(q3_generate_messages_py _q3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/invictus/sree3/src/q3/msg/fsm_custom.msg" NAME_WE)
add_dependencies(q3_generate_messages_py _q3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(q3_genpy)
add_dependencies(q3_genpy q3_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS q3_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/q3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/q3
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(q3_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(q3_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/q3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/q3
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(q3_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(q3_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/q3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/q3
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(q3_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(q3_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/q3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/q3
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(q3_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(q3_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/q3)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/q3\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/q3
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(q3_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(q3_generate_messages_py std_msgs_generate_messages_py)
endif()
