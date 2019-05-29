# preqrequisites
#Java 
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk

cd ../..
catkin_make
cd src
source ../devel/setup.bash
rosdep update --include-eol-distros
rm .rosinstall
rm .rosinstall.bak
wstool init .
wstool merge https://raw.github.com/knowrob/knowrob/master/rosinstall/knowrob-base.rosinstall
wstool update
rosdep install --ignore-src --from-paths .
cd ..
catkin_make
source devel/setup.bash


# install additional dependencies
sudo apt-get install ros-indigo-rosbridge-suite

