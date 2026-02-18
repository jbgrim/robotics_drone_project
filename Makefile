.PHONY: build

build:
	colcon build
	cd src/PX4-Autopilot && make px4_sitl

.PHONY: setup

setup:
	git submodule update --init
	cd src/PX4-Autopilot && make submodulesclean && ./Tools/setup/ubuntu.sh

.PHONY: launch

launch:
	ros2 launch drone_flock_controler simple_mission.launch.xml