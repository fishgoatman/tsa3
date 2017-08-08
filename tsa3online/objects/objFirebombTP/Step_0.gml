/// @description move
dy -= ddy;

if (place_meeting(preciseX, preciseY + 1, objBlock) || place_meeting(preciseX, preciseY - 1, objBlock)) {
    dy *= -1;
    dy *= damp;
    bounces++;
}

if (place_meeting(preciseX + 1, preciseY, objBlock) || place_meeting(preciseX - 1, preciseY, objBlock)) {
    dx *= -1;
    dx *= damp;
    bounces++;
}

if (bounces > maxBounces) {
    instance_destroy();
    var hbId = instance_create(preciseX, preciseY, objFirebombExplosionTP);
	hbId.projId = id;
}

scrMove();