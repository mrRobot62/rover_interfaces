cmake_minimum_required(VERSION 3.5)
project(rover_interfaces)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/LEDMessage.msg"
  "msg/Battery.msg"
  "msg/BatteryRaw.msg"
  "msg/ACS712.msg"
  "msg/I2CWrite.msg"
  "msg/I2CRead.msg"
  "srv/I2CReadRequest.srv"
  "srv/I2CESP32Communication.srv"
  "srv/I2Cesp32ReadRequest.srv"
)

ament_package()