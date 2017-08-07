///@desc creation stuff
controlScheme = mageControlScheme;
scrHeroId();

angle = heroId.fireShotAngle;
dx = fireShotSpd * dcos(angle);
dy = fireShotSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
alarm[0] = fireShotTime;