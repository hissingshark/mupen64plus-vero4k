

## mupen64plus-vero4k
Automated building of the N64 emulator Mupen64Plus for the OSMC device Vero 4k.  
This would not have been possible without the addition of mali-fbdev support by mihailescu2m to SDL2 - THANK YOU

Retropie on the RPi3 is brilliant.  
RetrOSMC on the RPi3 is brilliant++  
The Vero 4K is faster than the RPi3, but has no emulation support. Oh, wait a minute…

#### The purpose of this tool is to get Mupen64Plus onto your Vero 4K.
I know Kodi 18 (Leia) promises RetroPlayer, but that as far as I can see is:

* A long way off;
* Limited to Retroarch cores - which is what I use mostly, but some emulators such as Mupen64Plus perform better as a standalone;
* Running from within Kodi, perhaps diminishing some of the performance gains from the RPi3 to Vero4K upgrade.

#### This guide assumes:

* NO RESPONSIBILITY FOR DATA LOSS!! Backup backup backup;
* You have git installed - `sudo apt-get install git`
* You can use SSH and have some familiarity working in a linux console;
* You are familiar with Mupen64Plus and the miriad of settings/plugins to get various ROMs to work;
* You have migrated from an RPi running RetrOSMC or Retropie and therefore have already got config files for your controllers.

#### This guide DOES NOT currently provide a:
* Launcher from OSMC;
* Graphical front-end to select ROMS.

## Installation Instructions
Run the following:
```
cd
git clone https://github.com/hissingshark/mupen64plus-vero4k.git
cd mupen64plus-vero4k
./m64p_builder.sh
```

Kodi will stop whilst the build goes on and return when it’s finished (<15mins).

## Usage instructions
*Before* you play:
```
cd
sudo systemctl stop mediacenter
mv .asoundrc.hidden .asoundrc
```

Launch the emulator:
```
cd
cd mupen64plus/emulator/
./mupen64plus --gfx <name-of-video-plugin> <path-to-rom>
```

Note - wishing to avoid the obvious error but that means you’ll need to insert you own choice of video plugin and the path to your own choice of game ROM, wherever you may be keeping it. e.g:
`./mupen64plus --gfx mupen64plus-video-rice ~/myroms/SpaceInvaders.n64`

*After* you play:
Stop the emulator with ctrl-c in the terminal, or from the hotkey you’ve assigned to your gamepad. Then-
```
cd
mv .asoundrc .asoundrc.hidden
sudo systemctl stop mediacenter
```

That’s about it!
I’m trusting you to add your controller config to
 `~/mupen64plus/emulator/InputAutoCfg.ini`
 
The main emulator config for your tweaking is
`~/.config/mupen64plus/mupen64plus.cfg`

The mupen64plus-video-n64 video plugin has a separate config at
`~/mupen64plus/emulator/gles2n64.conf`

For example I found MarioKart64, essentially the only reason I did this, to run best and fullscreen stretched as I like it using the mupen64plus-video-n64 plugin above. That was with the following items changed to
```
window width=1920
window height=1080
video stretch=1
```

That aside, configuration is largely beyond the scope of this HowTo.
Google and YouTube are your friends.  
https://mupen64plus.org/docs/

https://retropie.org.uk/docs/

I wish you joy!
