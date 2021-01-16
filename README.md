# UBC Supermileage MBED projects
A consolidated repo containing all required mbed resources and  mbed-os related projects from the UBC Supermileage team
## Table of Contents
* [Getting Started](#Getting-started)
* [Working With Project Submodules](#Working-With-Project-Submodules)
  * [Intializing Project Submodules](#Intializing-Project-Submodules)
  * [Updating Project Submodules](#Updating-Project-Submodules)
  * [Adding Project Submodules](#Adding-Project-Submodules)
  * [Pushing Changes Within Submodules](#Pushing-Changes-Within-Submodules)
* [Notes](#Notes)
* [Maintainers](#Maintainers)

## Getting started:
### Install Prerequisites
##### Windows / MacOSX
1. Python 3.7 [(Windows)](https://www.python.org/downloads/windows/) [(MaxOSX)](https://www.python.org/downloads/mac-osx/)
2. Git [(Windows/MacOSX)](https://git-scm.com/downloads)
3. Mercurial [(Windows/MacOSX)](https://www.mercurial-scm.org/downloads)
##### Linux
Install Python, Git, and Mercurial with
```sh
$ sudo apt update
$ sudo apt install python3.7 git mercurial -y
```
##### All
[Install the GNU ARM Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) (version 6-2017-q2-update)
### Virtual Environment Setup
We setup a virtual environment in order to easily access mbed-os and its dependencies without installing any packages globally. Anytime you require mbed-cli, activate the virtual environment before starting to work/
##### Linux / MacOSX
Clone and enter the repository:
```sh
$ git clone https://github.com/supermileage/mbedStm32
$ cd mbedStm32
```
Create and activate virtual environment:
```sh
$ python3.7 -m venv mbed-os-env
$ source mbed-os-env/bin/activate
```
Anytime you need to activate the virtual environment, run the second line from inside the root directory of the cloned repository.

After activating your virtual envrionment, your terminal should look something like this:
```sh
(mbed-os-env) $
```
##### Windows
Clone and enter the repository:
```cmd
git clone https://github.com/supermileage/mbedStm32
cd mbedStm32
```
Create and activate virtual environment:
```cmd
py -3.7 -m venv mbed-os-env
mbed-os-env\Scripts\activate.bat
```
Anytime you need to activate the virtual environment, run the second line from inside the root directory of the cloned repository.

After activating your virtual envrionment, your terminal should look something like this (with a different path):
```cmd
(mbed-os-env) c:\Users\supermileage\Documents\mbedStm32>
```
### Installing and deploying Mbed CLI
*Make sure your virtual environment is activated before continuing!*

Install Mbed CLI:
```sh
python -m pip install mbed-cli 
```
Get mbed libraries by deploying mbed in the root directory of the repository:
```sh
mbed deploy
```
Install the required packages if you dont have them
```sh
python -m pip install -r mbed-os/requirements.txt
```
### Compiling Code with Mbed CLI
```sh
mbed compile --source ./mbed-os --source ./[project directory]
```
drag .bin file into the microcontroller(⁨..\mbedStm32⁩\BUILD⁩\NUCLEO_L432KC⁩\GCC_ARM\mbedStm32.bin)

<!--
Compile AND flash *at the same time* with the -f flag!
```sh
mbed compile -f --source ./mbed-os --source ./[project directory]
```
-->

### Compiling and Flashing with Make
Alternativly, and more easily, you can use a make command to compile and flash in one step:
```sh
make compile project=<UrbanSteering|UrbanAccessories|Examples>
```
Note: On windows you will need to download GNU make for this to work, the easiest way is to use the package manager [Chocolatatey](https://chocolatey.org/install), and run the command
```cmd
choco install make
```
See the Makefile for details on how this is handled

## Working with project submodules

#### Intializing Project Submodules
To initialize a submodudle:
```sh
git submodule update --init [project directory]
```
For example:
```sh
git submodule update --init CAN-Accessories
```
Alternatively, leave out the project directory to initialize all available submodules:
```sh
git submodule update --init
```

#### Updating Project Submodules
To update a submodule:
```sh
git submodule update --remote [project directory]
```
For example:
```sh
git submodule update --remote CAN-Accessories
```
Alternatively, leave out the project directory to update all available submodules:
```sh
git submodule update --remote
```
*Note that this updates the submodules to the HEAD of their remote branches, but does change the reference within this 
repository. You will need to commit and push from mbedStm32 repository to update the referenced commit as well.*

#### Adding Project Submodules
Add a project repo as a submodule:
```sh
git submodule add  -b [branch] [repo URL]
```
For example, adding the *main* branch of the *supermileage/CAN-Accessories* Repo:
```sh
git submodule add -b main https://github.com/supermileage/CAN-Accessories.git
```

#### Pushing Changes Within Submodules
Submodules act the same as normal repositories, so simply change your working directory to inside the 
correct submodule, checkout the correct branch and push/pull as usual, then update the mbedStm32 repo as well.

For example:
```sh
cd CAN-Accessories
touch new_file
git add new_file
git commit -m "new commit"
git checkout main
git push
cd ..
git add CAN-Accessories
git commit -m "Update CAN-Accessories submodule"
git push
```

## Notes
#### Updating the repository
Please fork the repo and submit a pull request if you need to update settings in this repo. Feel free to push submodule 
changes directly to the repository.

## Maintainers
[@spennyp](https://github.com/spennyp)

[@yoruio](https://github.com/yoruio) :unicorn:
