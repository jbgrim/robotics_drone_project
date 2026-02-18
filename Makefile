.PHONY: build

build:
	colcon build --symlink-install --packages-ignore px4
	cd src/PX4-Autopilot && make px4_sitl

.PHONY: setup

setup:
	sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y
	sudo apt install libfuse2 -y
	sudo apt install libxcb-xinerama0 libxkbcommon-x11-0 libxcb-cursor-dev -y
	curl https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl-x86_64.AppImage --output QGroundControl-x86_64.AppImage
	chmod +x QGroundControl-x86_64.AppImage
	git submodule update --init
	cd src/PX4-Autopilot && make submodulesclean && ./Tools/setup/ubuntu.sh

.PHONY: launch

launch:
	ros2 launch drone_flock_controler simple_mission.launch.xml