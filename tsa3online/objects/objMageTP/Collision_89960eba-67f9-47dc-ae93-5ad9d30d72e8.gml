/// @description take damage
if (ds_list_find_index(immuneTo, other.projId) == -1) {
	var thp = hp - other.dmg;
	var tStunTime = other.stunTime;
		
	if (tStunTime > stunTime) {
		stunTime = tStunTime;
	}

	if (thp < 0) {
		scrThisTakeDamage(hp);
	} else {
		scrThisTakeDamage(other.dmg);
	}
	
	ds_list_add(immuneTo, other.projId);
}

with (other) {
	instance_destroy();
}