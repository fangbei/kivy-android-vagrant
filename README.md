kivy-android-vagrant
====================

Vagrant file to set up a VM with the tools required to compile python+kivy apps for android

The directories *android* and *jnius* are not required for the system to operate. They are included to allow IDEs which perform code completion to detect the android and jnius classes employed by python_for_android

The *Vagrantfile* sets up a basic VM and call the *bootstrap.sh* file at start. This installs the required tools on the VM - read the content of the file for more information
