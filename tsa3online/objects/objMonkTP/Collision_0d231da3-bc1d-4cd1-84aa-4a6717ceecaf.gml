/// @description take damage
if (other.dot || ds_list_find_index(immuneTo, other.projId) == -1) {
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
	
	if (!other.dot) {
		ds_list_add(immuneTo, other.projId);
	}
	
	if (other.slowTime > 0) {
		ds_list_add(slowTimes, other.slowTime);
		ds_list_add(slowTos, other.slowTo);
	}
}