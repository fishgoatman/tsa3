///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
image_xscale = myHeroId.icebergDirection;
timeBetween = myHeroId.icebergTimeBetween;
heightDiff = myHeroId.icebergHeightDiff;
widthDiff = abs(sprite_width);
time = myHeroId.icebergDuration;
currTime = 0;
instance_create_depth(x, y, thisNumber, objIcebergDmgHitbox);