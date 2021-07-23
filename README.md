# EmuELEC-OGS-Godot
Pre-configured files to drop in your EmuELEC install to enable Godot games.

## Disclaimer
This is a very hacky solution, consider this a placeholder to experiment with until a better solution is available.

This will only work on the <a href="https://www.hardkernel.com/shop/odroid-go-super-clear-white/">Odroid Go Super</a> running <a href="https://github.com/EmuELEC/EmuELEC">EmuELEC</a>. 

If you'd like to devellop your own game, you can see how I set things up in the <a href="https://github.com/Pumpkinwaffle/OGS-Button-Tester">OGS-Button-Tester</a>.

If you're a Godot dev looking to make your games run on another device, check out the <a href="https://github.com/efornara/frt">FRT export templates</a>.

## Instructions (If you're new to this)
Simplest way to add files to your OGS is with an ftp client like <a href="https://filezilla-project.org/">Filezilla</a>.

* Download the precompiled FRT binaries <https://sourceforge.net/projects/frt/files/>
* Open Filezilla and connect to your OGS (host:`your console's ip` username:`root` password:`emuelec`)
* Create folder `/storage/.config/emuelec/configs/godot`
* add file `godotrun.sh` to it, right click it and 'set file permissions', enter value 777, press OK
* add file `frt_100_332_arm64.bin` to it, choose 'set file permissions', enter value 777, press OK

* Navigate to `/storage/.config/emulationstation`
* Replace file `es_systems.cfg` with the one I provided

* Navigate to `/storage/roms` add the `godot` folder to it


You're done! Reboot your OGS and you'll see a Godot menu, in you'll find <b>OGS Button Tester</b>. Run it to make sure everything works. If the game doesn't start, double check the file permissions. If you need assistance, come to the <a href="https://forum.odroid.com/viewtopic.php?f=193&t=39708&sid=45e9324b1ef05e4651f6a79924689f34">Hardkernel Forums</a>.

If you have more Godot games. You can add them like your other roms, in the `/roms/godot` folder. Games have to be made for the OGS or they won't work.

## Instructions (experienced user)
Installation is pretty straightforward. Add a new system to es_systems.cfg
```
<system>
	<name>Godot</name>
	<fullname>Godot Engine</fullname>
	<path>/storage/roms/godot/</path>
	<extension>.pck .zip</extension>
	<command>/storage/.config/emuelec/configs/godot/godotrun.sh %ROM%</command>
	<platform>godot</platform>
	<theme>godot</theme>
</system>
```
Get the FRT binaries and pass the .pck to it
```
#! /bin/sh

export SDL_GAMECONTROLLERCONFIG="190000004b4800000011000000010000,GO-Super Gamepad,a:b0,b:b1,x:b3,y:b2,leftshoulder:b6,rightshoulder:b7,dpdown:b9,dpleft:b10,dpright:b11,dpup:b8,leftx:a0,lefty:a1,rightx:a2,righty:a3,guide:b18,lefttrigger:b4,righttrigger:b5,start:b13,back:b12,leftstick:b14,paddle1:b15,paddle2:b16,paddle3:b17,platform:Linux,"
/storage/.config/emuelec/configs/godot/frt_100_332_arm64.bin --main-pack "$1"
```
For some reason Godot makes a horrid mess of the OGA's standard button map, this controllerconfig fixes it. Please stick to this controllerconfig so that all games made in Godot can be run through the same script.

