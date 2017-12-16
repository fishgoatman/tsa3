///damage stuff
//collision
collisionList = scrInstancePlaceList(preciseX, preciseY, objHitbox);

for (var i = 0; i < ds_list_size(collisionList); i++) {
	var collidingId = ds_list_find_value(collisionList, i);
	
	if (collidingId != noone && collidingId.thisNumber != thisNumber && (thisNumber == 1 || collidingId.thisNumber == 1)) {
		if (variable_instance_exists(collidingId, "duration")) {
			var dmgMod = instance_create(0, 0, objDmgMod);
			dmgMod.dmg = collidingId.dmg;
			dmgMod.dDmg = collidingId.dDmg;
			dmgMod.duration = collidingId.duration;
			dmgMod.forever = collidingId.forever;
			ds_list_add(dmgModList, dmgMod);
		}
		
		if (variable_instance_exists(collidingId, "slowDuration")) {
			var slowMod = instance_create(0, 0, objSlowMod);
			slowMod.slowTo = collidingId.slowTo;
			slowMod.dSlowTo = collidingId.dSlowTo;
			slowMod.slowDuration = collidingId.slowDuration;
			slowMod.slowForever = collidingId.slowForever;
			ds_list_add(slowModList, slowMod);
		}
		
		with (collidingId) {
			instance_destroy();
		}
	}
}

//taking damage
var hpLost = 0;

for (var i = 0; i < ds_list_size(dmgModList); i++) {
	var dmgMod = ds_list_find_value(dmgModList, i);
	
	if (dmgMod.duration <= 0) {
		ds_list_delete(dmgModList, i);
		i--;
		
		with (dmgMod) {
			instance_destroy();
		}
	} else {
		hpLost += dmgMod.dmg;
	}
}

scrThisTakeDamage(hpLost);

//die
if (hp <= 0) {
	sprite_index = sprMine;
}