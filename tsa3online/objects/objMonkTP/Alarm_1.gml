/// @desc pre attack
var xDiff = mouse_x - x;
var yDiff = y - mouse_y;
var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
preciseX += attackDisplace * xDiff / hyp;
naturalDx += attackNaturalDxIncrease * sign(xDiff);
preciseY -= attackDisplace * yDiff / hyp;
instance_create(preciseX + dx, preciseY - dy, objPunchHurtboxTP);
spd = moveSpd;
attackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;