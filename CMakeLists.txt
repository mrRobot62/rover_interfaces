cmake_minimum_required(VERSION 3.5)
project(rover_interfaces)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/LEDMessage.msg"
  "msg/Battery.msg"
  "msg/I2CWrite.msg"
  "msg/I2CReadResult.msg"
  "srv/I2CReadRequest.srv"
)

ament_package()