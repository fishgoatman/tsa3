/// @description creation stuff
controlScheme = mageControlScheme;
scrHeroId();

if (instance_exists(heroId)) {
    preciseX = x;
    preciseY = y;
	dx = x - heroId.x;
    dy = firebombSpd * overallSpd;
    ddy = firebombDDy + random_range(-firebombDDyVar, firebombDDyVar);
    damp = firebombDamp;
	maxBounces = firebombBounces;
    bounces = 0;
    idSet = true;
}