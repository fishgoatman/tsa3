/// @desc creation stuff
frequency = 15;
step = 0;
width = 1;
minAngle = 16;
maxAngle = 35;
minLength = 8;
maxLength = 20;
controlScheme = objShamanTP.controlScheme;
scrHeroId();
endX = heroId.logicId.b.x;
endY = heroId.logicId.b.y;
baseAngle = darctan2(y - endY, endX - x);
dist = point_distance(x, y, endX, endY);