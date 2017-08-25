/// @desc creation stuff
alarm[0] = 1;
image_angle = objMonkTP.mouseAngle;
sprites[0] = sprMonkBlink;
sprites[1] = sprMonkKickBlink;
sprites[2] = sprMonkMove;
sprites[3] = sprMonkDuringAttack2;
sprite_index = sprites[irandom(array_length_1d(sprites) - 1)];