kivy-android-vagrant
====================

Vagrant file to set up a VM with the tools required to compile python+kivy apps for android

The directories *android* and *jnius* are not required for the system to operate. They are included to allow IDEs which perform code completion to detect the android and jnius classes employed by python_for_android

The *Vagrantfile* sets up a basic VM and call the *bootstrap.sh* file at start. This installs the required tools on the VM - read the content of the file for more information

Usage
-----

First install vagrant, and install the precise32 box

    vagrant box add precise32 http://files.vagrantup.com/precise32.box
	
Then simply run

	vagrant up
		
The virtual box will be initialised, and the *bootstrap.sh* script executed to install all the stuff - this will take a **long** time

	vagrant ssh
	
You now have a console to the virtual machine. Follow the instructions [here](http://kivy.org/docs/guide/packaging-android.html) and [here](http://python-for-android.readthedocs.org/en/latest/toolchain/) to build you application.

Remember to copy your apk into the /vagrant dir to allow access from the host

	cp my_app.apk /vagrant
