///@desc creation stuff
thisNumber = depth
depth = 0
myHeroId = heroId[thisNumber]
preciseX = x
preciseY = y
lastStoppedX = x
lastStoppedY = y
dx = myHeroId.image_xscale * myHeroId.ballSpd
ddx = 0
dy = 0
ddy = -myHeroId.ballGrav
triSpd = myHeroId.ballTriSpd
triNum = myHeroId.ballTriNum
triCreateDist = myHeroId.ballTriCreateDist
da = -dx * 180 / pi / (sprite_height / 2)
visualId = instance_create_depth(x, y, 0, objIceBallVisual)
lastTime = current_time
lastXStoppedTime = current_time
lastYStoppedTime = current_time