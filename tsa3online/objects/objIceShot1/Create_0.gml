///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
image_xscale = myHeroId.image_xscale;
dx = myHeroId.ballSpd * image_xscale
dy = 0
ddy = -myHeroId.ballGrav
preciseX = x;
preciseY = y;
hitbox = objCasterCooldown
currTime = 0