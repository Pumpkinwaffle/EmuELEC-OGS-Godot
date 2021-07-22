#! /bin/sh

export SDL_GAMECONTROLLERCONFIG="190000004b4800000011000000010000,GO-Super Gamepad,a:b0,b:b1,x:b3,y:b2,leftshoulder:b6,rightshoulder:b7,dpdown:b9,dpleft:b10,dpright:b11,dpup:b8,leftx:a0,lefty:a1,rightx:a2,righty:a3,guide:b18,lefttrigger:b4,righttrigger:b5,start:b13,back:b12,leftstick:b14,paddle1:b15,paddle2:b16,paddle3:b17,platform:Linux,"
/storage/.config/emuelec/configs/godot/frt_100_332_arm64.bin --main-pack "$1"