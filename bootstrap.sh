echo "WARNING: this vagrant file can take a *long* time to execute"

#To understand the rationale of the processes used here, please refer to: http://python-for-android.readthedocs.org/en/latest/prerequisites/

echo "Downloading Android SDK"
wget -q http://dl.google.com/android/android-sdk_r14-linux.tgz # It is reccomended that SDK version 14 is used
tar -xzf android-sdk_r14-linux.tgz

echo "Downloading Android NDK"
wget -q http://dl.google.com/android/ndk/android-ndk-r7-linux-x86.tar.bz2 # It is reccomended that NDK version 7 is used
tar -xjf android-ndk-r7-linux-x86.tar.bz2

# These commands block use of the old awk version in the NDK
# See http://stackoverflow.com/questions/8384213/android-ndk-revision-7-host-awk-tool-is-outdated-error
cd android-ndk-r7/prebuilt/linux-x86/bin
mv awk awk_
cd /home/vagrant

# These must be exported for each shell instance
export ANDROIDSDK="/home/vagrant/android-sdk-linux"
export ANDROIDAPI=14
export ANDROIDNDK="/home/vagrant/android-ndk-r7"
export ANDROIDNDKVER=r7
export PATH=$ANDROIDNDK:$ANDROIDSDK/platform-tools:$ANDROIDSDK/tools:$PATH


# Install the prerequisites listed in the python-for-android documentation
apt-get update
apt-get install -y build-essential patch git-core ccache ant python-pip python-dev git unzip openjdk-6-jdk
pip install --upgrade cython

#Update the android SDK
cd /home/vagrant/android-sdk-linux/tools
./android update sdk --no-ui #Update the SDK
./android update sdk --no-ui --filter android-14 #For some reason you need to run this twice ...
cd /home/vagrant


echo "Getting python-for-android"
git clone git://github.com/kivy/python-for-android
cd python-for-android

echo "Building a distribution for python-for-android"
./distribute.sh -m "kivy"

# Moving a copy of the default distribute into the /vagrant directory, to allow inspection on the host machine
# This directory should NOT be used for building the application
mkdir /vagrant/default
cp -r ./dist/default/* /vagrant/default/
echo "DON'T USE THE DEFAULT DIRECTORY IN THE SHARED VAGRANT DIR"