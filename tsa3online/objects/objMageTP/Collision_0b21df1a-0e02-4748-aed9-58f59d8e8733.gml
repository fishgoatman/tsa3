/// @desc offline take damage
if (mode == "offline" && other.controlScheme != controlScheme) {
	if (other.dot || ds_list_find_index(immuneTo, other.projId) == -1) {
		var thp = hp - other.dmg;
		var tStunTime = other.stunTime;
		
		if (tStunTime > stunTime) {
			stunTime = tStunTime;
		}

		if (thp < 0) {
			scrKeyboardTakeDamage(hp);
		} else {
			scrKeyboardTakeDamage(other.dmg);
		}
		
		if (!other.dot) {
			ds_list_add(immuneTo, other.projId);
		}
	}
}