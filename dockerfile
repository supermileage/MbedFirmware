FROM ubuntu:20.04

# Install necessary packages
RUN apt update && apt -y install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt update && apt -y install gawk wget git-core diffstat gcc-multilib \
    build-essential chrpath socat libsdl1.2-dev python python3.7 tar locales cpio git libncurses5-dev \
    pkg-config curl sudo libncursesw5-dev vim mercurial\
	scons bzr lib32z1 cowsay python3-pip python3.7-dev 

# RUN apt-get install gcc-arm-none-eabi -y


# use python3 for repo
RUN rm /usr/bin/python
RUN ln -s /usr/bin/python3.7 /usr/bin/python
RUN python --version

# install Mbed CLI
RUN python -m pip install mbed-cli

RUN mkdir -p /temp
WORKDIR /temp
RUN wget https://raw.githubusercontent.com/ARMmbed/mbed-os/master/requirements.txt
RUN python -m pip install -r requirements.txt

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2
RUN tar xvf gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2
RUN rm gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2
RUN mv gcc-arm-none-eabi-6-2017-q2-update /opt/gcc-arm-none-eabi-6-2017-q2-update
ENV PATH=/opt/gcc-arm-none-eabi-6-2017-q2-update/bin:$PATH
RUN rm -rf *

# Set default shell to BASH for source
RUN rm /bin/sh && ln -s bash /bin/sh

# Set locale
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# misc utils
RUN echo "something here"
COPY create_user /usr/local/bin
RUN chmod a+x /usr/local/bin/create_user

# Default UID and GID values - set in docker run using '-e' flag (i.e. docker run -e UID=$(id -u) yocto-build-env:latest)
ENV UID=1001
ENV GID=1001

ENV USERNAME=mbed
ENV GROUP=mbed

# enable the COWSAY <-- extremely important. Nothing will work if this is not set.
ENV PATH="$PATH:/usr/games"

ENV MBEDDIR=/code
WORKDIR ${MBEDDIR}
RUN git clone https://github.com/supermileage/MbedFirmware
ENV MBEDDIR=${MBEDDIR}/MbedFirmware
WORKDIR ${MBEDDIR}
RUN mbed deploy
RUN python -m pip install -r mbed-os/requirements.txt


# build command
CMD \
    # New user creation and permission changes
    create_user; \
    # Run rest of commands as new user
    runuser ${USERNAME} -p -c " \
        clear; \
        cowsay 'placeholder command'; \
        sleep 5; \
        clear; \
        cowsay 'success!'; \
        "