/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 442323D9
/// @DnDArgument : "code" "/// @description act based on input$(13_10)//stun$(13_10)if (stunTime > 0) {$(13_10)	stunTime--;$(13_10)	onePressed = false;$(13_10)	twoPressed = false;$(13_10)	threePressed = false;$(13_10)	fourPressed = false;$(13_10)	ducking = false;$(13_10)	upPressed = false;$(13_10)	upHeld = false;$(13_10)	moveDx = 0;$(13_10)	moveDy = 0;$(13_10)} else {$(13_10)	if (boosted) {$(13_10)		if (abilityState == INIT_ABILITY) {$(13_10)			spd = boostedDx;$(13_10)		} else {$(13_10)			spd = boostedWalkingSpd;$(13_10)		}$(13_10)	} else if (abilityState == INIT_ABILITY) {$(13_10)		spd = flyDx;$(13_10)	} else {$(13_10)		spd = moveSpd;$(13_10)	}$(13_10)$(13_10)	//dx$(13_10)	if (attackState == NONE && state == MOVE) {$(13_10)	    if (direct == RIGHT && !place_meeting(preciseX + 1, preciseY, objBlock) || direct == LEFT$(13_10)	    && !place_meeting(preciseX - 1, preciseY, objBlock)) {$(13_10)	        moveDx = direct * spd;$(13_10)	    } else {$(13_10)	        moveDx = 0;$(13_10)	    }$(13_10)	} else {$(13_10)	    moveDx = 0;$(13_10)	}$(13_10)$(13_10)	if (moveDx != 0 && sign(moveDx) != sign(naturalDx)) {$(13_10)		if (abs(naturalDx) < abs(moveDx)) {$(13_10)			naturalDx = 0;$(13_10)		} else {$(13_10)			naturalDx += moveDx;$(13_10)		}$(13_10)	}$(13_10)$(13_10)	//dy$(13_10)	if (attackState == PRE_ATTACK) {$(13_10)		moveDy = 0;$(13_10)		naturalDy = 0;$(13_10)	} else if (abilityState == INIT_ABILITY) {$(13_10)		if (upHeld) {$(13_10)			if (boosted) {$(13_10)				moveDy = boostedDy;$(13_10)			} else {$(13_10)				moveDy = flyDy;$(13_10)			}$(13_10)		$(13_10)			upHeld = false;$(13_10)		} else if (ducking) {$(13_10)			if (boosted) {$(13_10)				moveDy = -boostedDy;$(13_10)			} else {$(13_10)				moveDy = -flyDy;$(13_10)			}$(13_10)		$(13_10)			ducking = false;$(13_10)		} else {$(13_10)			moveDy = 0;$(13_10)		}$(13_10)	} else {$(13_10)		if (upPressed) {$(13_10)			if (place_meeting(preciseX, preciseY + 1, objBlock)) {$(13_10)				jumpState = INIT_JUMP;$(13_10)			} else if (currAirJumps < maxAirJumps) {$(13_10)				jumpState = INIT_JUMP;$(13_10)				currAirJumps++;$(13_10)			}$(13_10)	$(13_10)			upPressed = false;$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (jumpState == INIT_JUMP) {$(13_10)		jumpState = NONE;$(13_10)		naturalDy = 0;$(13_10)		moveDy = jumpDy;$(13_10)		preciseY--;$(13_10)	}$(13_10)$(13_10)	if (upPressed) {$(13_10)		upPressed = false;$(13_10)	}$(13_10)$(13_10)	if (onePressed && fireballState == NONE) {$(13_10)		alarm[FIREBALL_PRE] = fireballPreTime;$(13_10)		fireballState = PRE_ATTACK;$(13_10)		onePressed = false;$(13_10)	}$(13_10)$(13_10)	if (twoPressed) {$(13_10)		twoPressed = false;$(13_10)		$(13_10)		if (fireShotReady) {$(13_10)		    alarm[PRE_ATTACK] = attackPreTime;$(13_10)			alarm[FIRE_SHOT_CD] = fireShotCDTime;$(13_10)		    attackState = PRE_ATTACK;$(13_10)			fireShotReady = false;$(13_10)		}$(13_10)	}$(13_10)$(13_10)	if (threePressed) {$(13_10)		if (flyReady) {$(13_10)			if (abilityState == INIT_ABILITY) {$(13_10)				abilityState = NONE;$(13_10)				spd = moveSpd;$(13_10)			} else {$(13_10)				spd = flyDx;$(13_10)				abilityState = INIT_ABILITY;$(13_10)			}$(13_10)		$(13_10)			flyReady = false;$(13_10)			alarm[FLY_CD] = flyCDTime;$(13_10)		}$(13_10)	$(13_10)		threePressed = false;$(13_10)	}$(13_10)$(13_10)	if (fourPressed) {$(13_10)		if (boostReady) {$(13_10)			boosted = true;$(13_10)			alarm[BOOST_DURATION] = boostDuration;$(13_10)			boostReady = false;$(13_10)			spd = boostedDx;$(13_10)		}$(13_10)$(13_10)		fourPressed = false;$(13_10)	}$(13_10)$(13_10)	/* */$(13_10)	///sprite and image$(13_10)	if (boosted) {$(13_10)		for (var i = 0; i < 10; i++) {$(13_10)			instance_create(preciseX - direct * random(10), preciseY - random_range(-12, 5), objFireScrap);$(13_10)		}$(13_10)	}$(13_10)$(13_10)	if (boostReady) {$(13_10)		var r = 4;$(13_10)$(13_10)		for (var i = 0; i < 1; i++) {$(13_10)			instance_create(preciseX + random_range(-r, r), preciseY - random_range(-r, r), objFireScrap);$(13_10)		}$(13_10)	}$(13_10)}$(13_10)$(13_10)if (abilityState == NONE && attackState != PRE_ATTACK) {$(13_10)	if (place_meeting(preciseX, preciseY + 1, objBlock)) {$(13_10)		moveDy = 0;$(13_10)		naturalDy = 0;$(13_10)		currAirJumps = 0;$(13_10)		jumpState = NONE;$(13_10)	} else if (place_meeting(preciseX, preciseY - 1, objBlock)) {$(13_10)		moveDy = 0;$(13_10)		naturalDy = 0;$(13_10)		preciseY++;$(13_10)	} else {$(13_10)		if (moveDy > ddy) {$(13_10)			moveDy -= ddy;$(13_10)		} else if (moveDy > 0) {$(13_10)			moveDy = 0;$(13_10)		} else {$(13_10)			naturalDy -= ddy;$(13_10)		}$(13_10)	}$(13_10)} else {$(13_10)	naturalDy = 0;$(13_10)}$(13_10)$(13_10)dx = moveDx + naturalDx;$(13_10)dy = moveDy + naturalDy;$(13_10)scrMove();$(13_10)$(13_10)///die$(13_10)if (hp <= 0) {$(13_10)    instance_destroy();$(13_10)}$(13_10)$(13_10)///other$(13_10)//ds_list_clear(immuneTo);"
/// @description act based on input
//stun
if (stunTime > 0) {
	stunTime--;
	onePressed = false;
	twoPressed = false;
	threePressed = false;
	fourPressed = false;
	ducking = false;
	upPressed = false;
	upHeld = false;
	moveDx = 0;
	moveDy = 0;
} else {
	if (boosted) {
		if (abilityState == INIT_ABILITY) {
			spd = boostedDx;
		} else {
			spd = boostedWalkingSpd;
		}
	} else if (abilityState == INIT_ABILITY) {
		spd = flyDx;
	} else {
		spd = moveSpd;
	}

	//dx
	if (attackState == NONE && state == MOVE) {
	    if (direct == RIGHT && !place_meeting(preciseX + 1, preciseY, objBlock) || direct == LEFT
	    && !place_meeting(preciseX - 1, preciseY, objBlock)) {
	        moveDx = direct * spd;
	    } else {
	        moveDx = 0;
	    }
	} else {
	    moveDx = 0;
	}

	if (moveDx != 0 && sign(moveDx) != sign(naturalDx)) {
		if (abs(naturalDx) < abs(moveDx)) {
			naturalDx = 0;
		} else {
			naturalDx += moveDx;
		}
	}

	//dy
	if (attackState == PRE_ATTACK) {
		moveDy = 0;
		naturalDy = 0;
	} else if (abilityState == INIT_ABILITY) {
		if (upHeld) {
			if (boosted) {
				moveDy = boostedDy;
			} else {
				moveDy = flyDy;
			}
		
			upHeld = false;
		} else if (ducking) {
			if (boosted) {
				moveDy = -boostedDy;
			} else {
				moveDy = -flyDy;
			}
		
			ducking = false;
		} else {
			moveDy = 0;
		}
	} else {
		if (upPressed) {
			if (place_meeting(preciseX, preciseY + 1, objBlock)) {
				jumpState = INIT_JUMP;
			} else if (currAirJumps < maxAirJumps) {
				jumpState = INIT_JUMP;
				currAirJumps++;
			}
	
			upPressed = false;
		}
	}
	
	if (jumpState == INIT_JUMP) {
		jumpState = NONE;
		naturalDy = 0;
		moveDy = jumpDy;
		preciseY--;
	}

	if (upPressed) {
		upPressed = false;
	}

	if (onePressed && fireballState == NONE) {
		alarm[FIREBALL_PRE] = fireballPreTime;
		fireballState = PRE_ATTACK;
		onePressed = false;
	}

	if (twoPressed) {
		twoPressed = false;
		
		if (fireShotReady) {
		    alarm[PRE_ATTACK] = attackPreTime;
			alarm[FIRE_SHOT_CD] = fireShotCDTime;
		    attackState = PRE_ATTACK;
			fireShotReady = false;
		}
	}

	if (threePressed) {
		if (flyReady) {
			if (abilityState == INIT_ABILITY) {
				abilityState = NONE;
				spd = moveSpd;
			} else {
				spd = flyDx;
				abilityState = INIT_ABILITY;
			}
		
			flyReady = false;
			alarm[FLY_CD] = flyCDTime;
		}
	
		threePressed = false;
	}

	if (fourPressed) {
		if (boostReady) {
			boosted = true;
			alarm[BOOST_DURATION] = boostDuration;
			boostReady = false;
			spd = boostedDx;
		}

		fourPressed = false;
	}

	/* */
	///sprite and image
	if (boosted) {
		for (var i = 0; i < 10; i++) {
			instance_create(preciseX - direct * random(10), preciseY - random_range(-12, 5), objFireScrap);
		}
	}

	if (boostReady) {
		var r = 4;

		for (var i = 0; i < 1; i++) {
			instance_create(preciseX + random_range(-r, r), preciseY - random_range(-r, r), objFireScrap);
		}
	}
}

if (abilityState == NONE && attackState != PRE_ATTACK) {
	if (place_meeting(preciseX, preciseY + 1, objBlock)) {
		moveDy = 0;
		naturalDy = 0;
		currAirJumps = 0;
		jumpState = NONE;
	} else if (place_meeting(preciseX, preciseY - 1, objBlock)) {
		moveDy = 0;
		naturalDy = 0;
		preciseY++;
	} else {
		if (moveDy > ddy) {
			moveDy -= ddy;
		} else if (moveDy > 0) {
			moveDy = 0;
		} else {
			naturalDy -= ddy;
		}
	}
} else {
	naturalDy = 0;
}

dx = moveDx + naturalDx;
dy = moveDy + naturalDy;
scrMove();

///die
if (hp <= 0) {
    instance_destroy();
}

///other
//ds_list_clear(immuneTo);/**/

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3FBB73A9
/// @DnDArgument : "code" "/// @description sprite and image$(13_10)image_xscale = direct;$(13_10)$(13_10)	if (jumpState == PRE_JUMP) {$(13_10)	    sprite_index = sprMagePreJump;$(13_10)	} else if (jumpState == POST_JUMP) {$(13_10)	    sprite_index = sprMagePostJump;$(13_10)	} else if (attackState == PRE_ATTACK) {$(13_10)	    if (ducking) {$(13_10)	        sprite_index = sprMagePreAttackDuck;$(13_10)	    } else {$(13_10)	        sprite_index = sprMagePreOne;$(13_10)	    }$(13_10)	} else if (attackState == POST_ATTACK) {$(13_10)	    if (ducking) {$(13_10)	        sprite_index = sprMagePostAttackDuck;$(13_10)	    } else {$(13_10)	        sprite_index = sprMagePostOne;$(13_10)	    }$(13_10)	} else if (abilityState == INIT_ABILITY) {$(13_10)	    sprite_index = sprMageFly;$(13_10)	} else {$(13_10)	    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {$(13_10)	        if (dy > 0) {$(13_10)	            sprite_index = sprMageGoingUp;$(13_10)	        } else if (dy == 0) {$(13_10)	            sprite_index = sprMageNone;$(13_10)	        } else {$(13_10)	            sprite_index = sprMageGoingDown;$(13_10)	        }$(13_10)	    } else if (state == MOVE) {$(13_10)	        sprite_index = sprMageMove;$(13_10)	    } else {$(13_10)	        if (ducking) {$(13_10)	            sprite_index = sprMageNoneDuck;$(13_10)	        } else {$(13_10)	            sprite_index = sprMageNone;$(13_10)	        }$(13_10)	    }$(13_10)	}$(13_10)"
/// @description sprite and image
image_xscale = direct;

	if (jumpState == PRE_JUMP) {
	    sprite_index = sprMagePreJump;
	} else if (jumpState == POST_JUMP) {
	    sprite_index = sprMagePostJump;
	} else if (attackState == PRE_ATTACK) {
	    if (ducking) {
	        sprite_index = sprMagePreAttackDuck;
	    } else {
	        sprite_index = sprMagePreOne;
	    }
	} else if (attackState == POST_ATTACK) {
	    if (ducking) {
	        sprite_index = sprMagePostAttackDuck;
	    } else {
	        sprite_index = sprMagePostOne;
	    }
	} else if (abilityState == INIT_ABILITY) {
	    sprite_index = sprMageFly;
	} else {
	    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
	        if (dy > 0) {
	            sprite_index = sprMageGoingUp;
	        } else if (dy == 0) {
	            sprite_index = sprMageNone;
	        } else {
	            sprite_index = sprMageGoingDown;
	        }
	    } else if (state == MOVE) {
	        sprite_index = sprMageMove;
	    } else {
	        if (ducking) {
	            sprite_index = sprMageNoneDuck;
	        } else {
	            sprite_index = sprMageNone;
	        }
	    }
	}