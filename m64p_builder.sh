#!/bin/bash

# stop Kodi to free up resources
sudo systemctl stop mediacenter

# install typical building suite
sudo apt-get update
sudo apt-get install -y vero3-userland-dev-osmc build-essential git

# set flags useful to all of the builds on our Amlogic S905x based Vero 4K
export CFLAGS="-I/opt/vero3/include -L/opt/vero3/lib -O3 -march=armv8-a+crc -mtune=cortex-a53 -funsafe-math-optimizations"
export CPPFLAGS=$CFLAGS
export CXXFLAGS=$CFLAGS

# install specific packages for building  SDL2
sudo apt-get install -y libasound2-dev libdbus-1-dev

# pull a fork of SDL2 v.2.0.2 that includes MALI-fbdev support
cd
git clone https://github.com/mihailescu2m/libsdl2-2.0.2-dfsg1.git

# build/install SDL2 - a major dependancy of the project
cd libsdl2-2.0.2-dfsg1
./configure --enable-video-directfb
sudo make -j4
sudo make install

# install specific packages for building Mupen64Plus and the additional video plugin "mupen64plus-video-gles2n64"
sudo apt-get install -y libpng12-dev libboost-all-dev

# setup a workspace to build the emulator
cd
mkdir mupen64plus
cd mupen64plus
mkdir source
cd source

# pull the official Mupen64Plus-core repository
git clone https://github.com/mupen64plus/mupen64plus-core.git
# extract/run the supplied scripts for pulling and building all of the needed mudules
cp mupen64plus-core/tools/m64p_helper_scripts.tar.gz ..
cd ..
tar xvf m64p_helper_scripts.tar.gz
rm m64p_helper_scripts.tar.gz
./m64p_get.sh

# pull additional video plugin
cd source
git clone https://github.com/ricrpi/mupen64plus-video-gles2n64.git
cd ..
# add the plugin to the list of jobs in the build tool
sed -i 's/video-glide64mk2/video-glide64mk2 video-gles2n64/' m64p_build.sh

# rename the output direct directory to something sexier
sed -i 's/\/test\//\/emulator\//g' m64p_build.sh

# multithread the builds because we haven't got all day
sed -i 's/"$MAKE" -C/"$MAKE" -j4 -C/' m64p_build.sh

# set useful Mupen64Plus specific flags and build it 
export HOST_CPU=armv8 USE_GLES=1 NEON=1
./m64p_build.sh

# copy the ALSA config into the home directory, albeit hidden for now
cd ~/mupen64plus-vero4k
cp asound.conf ~/.asoundrc.hidden

# restart Kodi - it's like nothing happened...
cd
sudo systemctl start mediacenter
