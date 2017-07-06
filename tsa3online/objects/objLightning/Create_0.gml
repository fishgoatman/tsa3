/// @description creation stuff
alarm[0] = opId.logicId.lightningTime;
rand = irandom(1);
var sp = opId.logicId.startPlace;
var ep = opId.logicId.endPlace;
var a = opId.logicId.a;
var b = opId.logicId.b
image_angle = 360 - arctan2(b.y - a.y, b.x - a.x) * 180 / pi;

if (sp == "top") {
    if (ep == "top") {
        if (rand == 0) {
            sprite_index = sprLightningTT1;
        } else {
            sprite_index = sprLightningTT2;
        }
    } else if (ep == "mid") {
        if (rand == 0) {
            sprite_index = sprLightningTM1;
        } else {
            sprite_index = sprLightningTM2;
        }
    } else {
        if (rand == 0) {
            sprite_index = sprLightningTB1;
        } else {
            sprite_index = sprLightningTB2;
        }
    }
} else if (sp == "mid") {
    if (ep == "top") {
        if (rand == 0) {
            sprite_index = sprLightningMT1;
        } else {
            sprite_index = sprLightningMT2;
        }
    } else if (ep == "mid") {
        if (rand == 0) {
            sprite_index = sprLightningMM1;
        } else {
            sprite_index = sprLightningMM2;
        }
    } else {
        if (rand == 0) {
            sprite_index = sprLightningMB1;
        } else {
            sprite_index = sprLightningMB2;
        }
    }
} else {
    if (ep == "top") {
        if (rand == 0) {
            sprite_index = sprLightningBT1;
        } else {
            sprite_index = sprLightningBT2;
        }
    } else if (ep == "mid") {
        if (rand == 0) {
            sprite_index = sprLightningBM1;
        } else {
            sprite_index = sprLightningBM2;
        }
    } else {
        if (rand == 0) {
            sprite_index = sprLightningBB1;
        } else {
            sprite_index = sprLightningBB2;
        }
    }
}

