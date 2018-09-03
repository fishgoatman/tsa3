///@desc creation stuff
thisNumber = depth
depth = 0
myHeroId = heroId[thisNumber]
preciseX = x
preciseY = y
dx = myHeroId.image_xscale * myHeroId.ballSpd
dy = 0
grav = myHeroId.ballGrav
triSpd = myHeroId.ballTriSpd
triNum = myHeroId.ballTriNum
triCreateDist = myHeroId.ballTriCreateDist
da = -dx * 180 / pi / (sprite_height / 2)
visualId = instance_create_depth(x, y, 0, objIceBallVisual)