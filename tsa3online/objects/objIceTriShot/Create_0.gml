///@desc creation stuff
thisNumber = depth
depth = 0
myHeroId = heroId[thisNumber]
image_xscale = myHeroId.image_xscale
image_angle = -90 * image_xscale
dx = myHeroId.shotSpd * image_xscale
dy = 0
ddx = 0
ddy = 0
ix = x
iy = y
iTime = current_time
lastTime = current_time
preciseX = x
preciseY = y
hitbox = objIceTriShotHitbox