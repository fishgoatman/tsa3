/// @desc pre attack
instance_create(preciseX, preciseY, objPunchHurtboxTP);
attackState = POST_ATTACK;

if (attackType == "punch") {
	alarm[POST_ATTACK] = punchPostTime;
}