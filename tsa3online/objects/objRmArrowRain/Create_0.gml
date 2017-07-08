/// @description creation stuff
//globalvars
globalvar arrowSpd;
arrowSpd = 30;
globalvar arrowTime;
arrowTime = 3 * room_speed;
globalvar warningTime;
warningTime = 1.5 * room_speed;

///vars
delay = 11 * room_speed;
direct = 0;
gap = 3;
wallWidth = 5;
floorHeight = 49 + wallWidth;
warningOffset = 40;
timeLeftForArrows = delay;
warningCreated = false;
bufferToSend = buffer_create(2, buffer_fixed, 1);

//tile the background
var tileSize = 64;

for (var r = 0; r < room_height; r += tileSize) {
    for (var c = 0; c < room_width; c += tileSize) {
        instance_create(c, r, objGrassBK);
    }
}