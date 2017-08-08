/// @description creation stuff
controlScheme = shamanControlScheme;
scrHeroId();
if (mode == "offline") {
	enemyId = mpId;
} else {
	enemyId = opId;
}

if (instance_exists(enemyId)) {
    var xDiff = -1 * (x - enemyId.x);
    var yDiff = y - enemyId.y;
    var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
    spd = fireSpiritSpd * overallSpd;
    dx = spd * xDiff / hyp;
    dy = spd * yDiff / hyp;
    preciseX = x;
    preciseY = y;
}