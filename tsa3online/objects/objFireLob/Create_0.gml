///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
diffX = myHeroId.diffX;
diffY = myHeroId.diffY;
x = myHeroId.preciseX + diffX * myHeroId.image_xscale;
y = myHeroId.preciseY - diffY;
var hyp = sqrt(diffX * diffX + diffY * diffY);
dx = diffX / hyp * myHeroId.lobSpd * myHeroId.image_xscale;
dy = diffY / hyp * myHeroId.lobSpd;
grav = myHeroId.lobGrav;
preciseX = x;
preciseY = y;
hitbox = objFireLobHitbox
lastTime = current_time
iTime = current_time