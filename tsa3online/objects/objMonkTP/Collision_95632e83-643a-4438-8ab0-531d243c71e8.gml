/// @desc offline take damage
if (mode == "offline" && other.controlScheme != controlScheme) {
	if ((other.dot && ds_list_find_index(immuneToThisTick, other.projId) == -1) || (!other.dot && ds_list_find_index(immuneTo, other.projId) == -1)) {
		var thp = hp - other.dmg;
		var tStunTime = other.stunTime;
		
		if (tStunTime > stunTime) {
			stunTime = tStunTime;
		}

		if (thp < 0) {
			scrMouseTakeDamage(hp);
		} else {
			scrMouseTakeDamage(other.dmg);
		}
		
		if (!other.dot) {
			ds_list_add(immuneTo, other.projId);
		} else {
			ds_list_add(immuneToThisTick, other.projId);
		}
		
		if (other.slowTime > 0) {
			var slowIndex = ds_list_find_index(slowIds, other.projId);
		
			if (slowIndex == -1) {
				ds_list_add(slowTimes, other.slowTime);
				ds_list_add(slowTos, other.slowTo);
				ds_list_add(slowIds, other.projId);
			} else {
				ds_list_replace(slowTimes, slowIndex, other.slowTime);
			}
		}
	}
}