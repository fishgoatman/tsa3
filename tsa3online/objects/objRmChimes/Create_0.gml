/// @description globalvars
globalvar chimeWindSpdConstMin;
chimeWindSpdConstMin = 20;
globalvar chimeWindSpdConstMax;
chimeWindSpdConstMax = 40;
globalvar mpChimes;
mpChimes[0] = -1;
globalvar kpChimes;
kpChimes[0] = -1;
globalvar mpCompletedChimes;
mpCompletedChimes = 0;
globalvar kpCompletedChimes;
kpCompletedChimes = 0;
globalvar maxChimes;
maxChimes = 4;
globalvar mouseChimesReady;
mouseChimesReady = false;
globalvar keyboardChimesReady;
keyboardChimesReady = false;

///creation stuff
//tile the background
var tileSize = 64;

for (var r = 0; r < room_height; r += tileSize) {
    for (var c = 0; c < room_width; c += tileSize) {
        instance_create(c, r, objGrassBK);
    }
}

//chime carriers
spawnDelayMin = 2 * room_speed;
spawnDelayMax = 3 * room_speed;
alarm[0] = random_range(spawnDelayMin, spawnDelayMax);
distrChunks = 11; //must be odd
chunkSize = room_width / distrChunks;

for (var i = 0; i < distrChunks / 2; i++) {
    if (i == 0) {
        distribution[i] = i;
    } else {
        distribution[i] = distribution[i - 1] + i;
    }
}

for (var i = floor(distrChunks / 2); i < distrChunks; i++) {
    distribution[i] = distribution[i - 1] + distrChunks - i - 1;
}

