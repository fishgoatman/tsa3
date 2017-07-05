/// @description summon chime carrier
var spawnMin;
var spawnMax;
var rand = random(distribution[distrChunks - 1]);

for (var i = 0; i < distrChunks; i++) {
    if (rand < distribution[i]) {
        spawnMin = i * chunkSize;
        spawnMax = (i + 1) * chunkSize;
        break;
    }
}

instance_create(random_range(spawnMin, spawnMax), room_height, objChimeCarrier);
alarm[0] = random_range(spawnDelayMin, spawnDelayMax);

