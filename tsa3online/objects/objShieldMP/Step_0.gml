/// @description move to player
if (instance_exists(tpId)) {
    x = tpId.x;
    y = tpId.y;
    image_xscale = tpId.image_xscale;
    
    if (tpId.shieldState == NONE) {
        instance_destroy(); //to avoid the infinite shield
    }
} else {
    instance_destroy();
}

