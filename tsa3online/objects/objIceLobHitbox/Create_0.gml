/// @description creation stuff
projId = depth
depth = 0
thisNumber = projId.thisNumber
myHeroId = heroId[thisNumber]
dmg = myHeroId.lobDmg
dDmg = 0
duration = 1
forever = false
slowTo = myHeroId.lobSlowTo
dSlowTo = 0
slowDuration = myHeroId.lobSlowDuration
slowForever = false
time = myHeroId.lobHitboxDuration
currTime = 0
instance_create_depth(x, y, id, objIceLobVisual)
hitSound = sndIceLobHit