///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
image_xscale = myHeroId.abilityImageXScale
startAngle = myHeroId.swingStartAngle * image_xscale
endAngle = myHeroId.swingEndAngle * image_xscale
time = myHeroId.swingDuration;
dAngle = (endAngle - startAngle) / time
image_angle = startAngle
hitbox = objHammerSwingHitbox;
createdAlready = false
visualDuration = myHeroId.swingVisualDuration
currTime = 0;