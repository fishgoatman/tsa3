/// @description act based on server data
//abilities
if (oneActivate) {
	instance_create(preciseX, preciseY, objFireballOP);
	oneActivate = false;
}

//pos
x = otherX;
y = otherY;

//sprite and image
sprite_index = otherSpriteIndex;
image_index = otherImageIndex;