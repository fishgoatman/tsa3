/// @desc creation stuff
controlScheme = rogueControlScheme;
scrHeroId();
angle = 180 + heroId.boltAngle + heroId.dashAngle;
dx = boltSpd * dcos(angle);
dy = boltSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
stickTime = 5 * room_speed;
createdAlready = false;