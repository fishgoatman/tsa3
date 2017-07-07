/// @description act based on server data
//abilities
if (oneActivate) {
	instance_create(x, y, objFireballOP);
	oneActivate = false;
}

if (twoActivate) {
	twoActivate = false;
}

if (threeActivate) {
	threeActivate = false;
}

if (fourActivate) {
	fourActivate = false;
}

//pos
x = otherX;
y = otherY;

//sprite and image
sprite_index = otherSpriteIndex;
image_index = otherImageIndex;