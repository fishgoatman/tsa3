/// @desc move and shoot
x = myHeroId.preciseX + diffX * myHeroId.image_xscale;
y = myHeroId.preciseY - diffY;

if (myHeroId.aPhase == "w") {
	instance_destroy();
	var lob = instance_create_depth(x, y, thisNumber, objFireLobTP);
	var hyp = sqrt(diffX * diffX + diffY * diffY);
	lob.dx = diffX / hyp * myHeroId.lobSpd * myHeroId.image_xscale;
	lob.dy = diffY / hyp * myHeroId.lobSpd;
	lob.grav = myHeroId.lobGrav;
	lob.myHeroId = myHeroId;
}