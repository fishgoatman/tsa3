/// @description creation stuff
var numGrass = irandom_range(40, 55);
var edge = 5;

for (var i = 0; i < numGrass; i++) {
    var rand = irandom(3);
    var obj;
    
    if (rand == 0) {
        obj = objSmallGrass;
    } else if (rand >= 1 && rand <= 2) {
        obj = objMediumGrass;
    } else {
        obj = objTallGrass;
    }
    
    var temp = instance_create(x - sprite_width / 2 + irandom(sprite_width - 2 * edge) + edge, y - sprite_height / 2, obj);
}

