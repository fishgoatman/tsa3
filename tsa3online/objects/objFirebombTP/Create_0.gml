/// @description creation stuff
controlScheme = mageControlScheme;
scrHeroId();

if (instance_exists(heroId)) {
    preciseX = x;
    preciseY = y;
	dx = heroId.dx;
    dy = firebombSpd * overallSpd;
    ddy = firebombDDy;
    damp = 0.45;
    bounces = 0;
    explodeBounces = 0;
    idSet = true;
}