## mupen64plus-vero4k
Automated building of the N64 emulator Mupen64Plus for the OSMC device Vero 4k.

Retropie on the RPi3 is brilliant.  
RetroOSMC on the RPi3 is brilliant++  
The Vero 4K is faster than the RPi3, but has no emulation support.  Oh, wait a minute...

### The purpose of this tool is to get Mupen64Plus onto your Vero 4K.
I know Kodi 18 (Leia) promises RetroPlayer, but that as far as I can see is:
* A long way off;
* Limited to Retroarch cores - which is what I use mostly, but some emulators such as Mupen64Plus perform better as a standalone;
* Running from within Kodi, diminishing some of the performance gains from the RPi3->Vero4K upgrade

### It is assumed:
* You can use SSH and have some familiarity working in a linux console;
* You are familiar with Mupen64Plus and the miriad of settings/plugins to get various ROMs to work;
* You have migrated from an RPI running RetrOSMC or Retropie and therefore have already got config files for your controllers.

### To run
`git clone` this repository and then execute `./m64p_builder.sh`
That's it.  
You'll have a new directory under Mupen64Plus called emulator containing the executable, plugins and configs.  Further configs are stored at ~/.config/mupen64plus/
