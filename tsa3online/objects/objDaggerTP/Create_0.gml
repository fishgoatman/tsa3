/// @desc creation stuff
controlScheme = rogueControlScheme;
scrHeroId();
angle = heroId.mouseAngle + heroId.daggerAngle;
dx = daggerSpd * dcos(angle);
dy = daggerSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
stickTime = 5 * room_speed;
//later make alarm start when it hits a block