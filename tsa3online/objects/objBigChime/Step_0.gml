/// @description action
if (mouseChimesReady) {
    ready = MOUSE;
    mouseChimesReady = false;
    
    with (objChimeCarrier) {
        instance_destroy();
    }
} else if (keyboardChimesReady) {
    ready = KEYBOARD;
    keyboardChimesReady = false;
    
    with (objChimeCarrier) {
        instance_destroy();
    }
}

if (chime) {
    counter++;
    
    if (counter % chimeDelay == 0) {
        var obj;
    
        if (ready == MOUSE) {
            obj = objChimeBoltTP;
        } else {
            obj = objChimeBoltOP;
        }
        
        instance_create(x - sprite_width / 2 + random(sprite_width), y + sprite_height - 8, obj);
    }
} else {
    counter = 0;
}

///sprite and image
image_angle = windSpdConst * windSpd;

if (ready != NONE) {
    image_speed = 1;
}

if (sprite_index == sprBigChime && image_index >= image_number - image_speed) {
    if (ready == MOUSE) {
        sprite_index = sprBigChimeMouse;
        alarm[CHIME] = chimeTime;
        chime = true;
    } else if (ready == KEYBOARD) {
        sprite_index = sprBigChimeKeyboard;
        alarm[CHIME] = chimeTime;
        chime = true;
    }
}

if (sprite_index != sprBigChime && image_index >= image_number - image_speed) {
    image_speed = 0;
}

if (image_speed == -1 && image_index <= 1) {
    image_speed = 0;
}

