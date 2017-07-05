/// @description move to player
if (instance_exists(opId)) {
    x = opId.x;
    y = opId.y;
    image_xscale = opId.image_xscale;
    
    if (opId.shieldState == NONE) {
        instance_destroy(); //to avoid the infinite shield
    }
} else {
    instance_destroy();
}

