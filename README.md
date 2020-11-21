# UBC Supermileage MBED projects
[Getting Started](#Getting-started)
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
$ git clone https://github.com/spennyp/mbedStm32.git
$ cd git
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
git clone https://github.com/spennyp/mbedStm32.git
cd git
```
Create and activate virtual environment:
```cmd
py -3.7 -m venv mbed-os-env
mbed-os-env\Scripts\activate.bat
```
Anytime you need to activate the virtual environment, run the second line from inside the root directory of the cloned repository.

After activating your virtual envrionment, your terminal should look something like this (with a different path):
```cmd
(mbed-os-env) c:\Users\supermileage\Documents\mbed-os>
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
### Compiling Code
```sh
$ mbed compile --source ./mbed-os --source ./[project directory]
```
drag .bin file into the microcontroller(⁨..\mbedStm32⁩\BUILD⁩\NUCLEO_L432KC⁩\GCC_ARM\mbedStm32.bin)
