# preqrequisites
#Java 
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get install openjdk-8-jdk

cd ..
source ../devel/setup.bash
rosdep update --include-eol-distros
wstool init .
wstool merge https://raw.github.com/knowrob/knowrob/indigo/rosinstall/knowrob-base.rosinstall
wstool update
rosdep install --ignore-src --from-paths . --rosdistro indigo
cd ..
catkin_make


# install additional dependencies
sudo apt-get install ros-indigo-rosbridge-suite

