/// @description creation stuff
controlScheme = "mouse";
scrHeroId();

if (instance_exists(heroId)) {
    var xDiff = -1 * (x - heroId.x);
    var yDiff = y - heroId.y;
    var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
    spd = 14 * overallSpd;
    dx = spd * xDiff / hyp;
    dy = spd * yDiff / hyp;
    preciseX = x;
    preciseY = y;
}