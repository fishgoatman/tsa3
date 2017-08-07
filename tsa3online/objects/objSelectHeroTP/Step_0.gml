/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1C7A0639
/// @DnDArgument : "code" "/// @description act based on input$(13_10)dy -= ddy;$(13_10)    $(13_10)if (dy > 0 && place_meeting(preciseX, preciseY - 1, objBlock) || dy < 0 && place_meeting(preciseX$(13_10)    , preciseY + 1, objBlock)) {$(13_10)    dy = 0;$(13_10)}$(13_10)$(13_10)if (!ai) {$(13_10)    //dx$(13_10)    if (state == MOVE) {$(13_10)        if (direct == RIGHT && !place_meeting(preciseX + 1, preciseY, objBlock) || direct == LEFT$(13_10)        && !place_meeting(preciseX - 1, preciseY, objBlock)) {$(13_10)            dx = direct * spd;$(13_10)        } else {$(13_10)            dx = 0;$(13_10)        }$(13_10)    } else {$(13_10)        dx = 0;$(13_10)    }$(13_10)    $(13_10)    //dy$(13_10)	if (upHeld) {$(13_10)		jumpState = INIT_JUMP;$(13_10)		upHeld = false;$(13_10)	}$(13_10)	$(13_10)    if (jumpState == INIT_JUMP) {$(13_10)        dy = jumpDy;$(13_10)        jumpState = NONE;$(13_10)    }$(13_10)    $(13_10)    //select$(13_10)    if (onePressed) {$(13_10)		if (mode == "online") {$(13_10)	        if (place_meeting(x, y, objMageSelection)) {$(13_10)	            thisPlayerHero = objMageTP;$(13_10)				hp = mageHp;$(13_10)	        } else if (place_meeting(x, y, objRogueSelection)) {$(13_10)	            thisPlayerHero = objRogueTP;$(13_10)				hp = rogueHp;$(13_10)	        } else if (place_meeting(x, y, objMonkSelection)) {$(13_10)	            thisPlayerHero = objMonkTP;$(13_10)	        } else if (place_meeting(x, y, objShamanSelection)) {$(13_10)	            thisPlayerHero = objShamanTP;$(13_10)	        }$(13_10)		} else if (mode == "offline") {$(13_10)			if (place_meeting(x, y, objMageSelection)) {$(13_10)				if (controlScheme == "keyboard") {$(13_10)		            keyboardPlayerHero = objMageTP;$(13_10)					hp = mageHp;$(13_10)				}$(13_10)	        } else if (place_meeting(x, y, objRogueSelection)) {$(13_10)				if (controlScheme == "mouse") {$(13_10)					mousePlayerHero = objRogueTP;$(13_10)					hp = rogueHp;$(13_10)				}$(13_10)	        } else if (place_meeting(x, y, objMonkSelection)) {$(13_10)	            mousePlayerHero = objMonkTP;$(13_10)	        } else if (place_meeting(x, y, objShamanSelection)) {$(13_10)				if (controlScheme == "keyboard") {$(13_10)					keyboardPlayerHero = objShamanTP;$(13_10)					hp = shamanHp;$(13_10)				}$(13_10)	        }$(13_10)		}$(13_10)    }$(13_10)} else {$(13_10)    lockedIn = true;$(13_10)}$(13_10)$(13_10)if (lockedIn) {$(13_10)    dx = 0;$(13_10)}$(13_10)$(13_10)//lock-in$(13_10)if (twoPressed) {$(13_10)	if (mode == "online") {$(13_10)	    if (thisPlayerHero != objSelectHeroTP) {$(13_10)	        lockedIn = !lockedIn;$(13_10)	    }$(13_10)	} else if (mode == "offline") {$(13_10)		var hero;$(13_10)		$(13_10)		if (controlScheme == "mouse") {$(13_10)			hero = mousePlayerHero;$(13_10)		} else {$(13_10)			hero = keyboardPlayerHero;$(13_10)		}$(13_10)		$(13_10)		if (hero != objSelectHeroTP) {$(13_10)	        lockedIn = !lockedIn;$(13_10)	    }$(13_10)	}$(13_10)}$(13_10)$(13_10)scrMove();"
/// @description act based on input
dy -= ddy;
    
if (dy > 0 && place_meeting(preciseX, preciseY - 1, objBlock) || dy < 0 && place_meeting(preciseX
    , preciseY + 1, objBlock)) {
    dy = 0;
}

if (!ai) {
    //dx
    if (state == MOVE) {
        if (direct == RIGHT && !place_meeting(preciseX + 1, preciseY, objBlock) || direct == LEFT
        && !place_meeting(preciseX - 1, preciseY, objBlock)) {
            dx = direct * spd;
        } else {
            dx = 0;
        }
    } else {
        dx = 0;
    }
    
    //dy
	if (upHeld) {
		jumpState = INIT_JUMP;
		upHeld = false;
	}
	
    if (jumpState == INIT_JUMP) {
        dy = jumpDy;
        jumpState = NONE;
    }
    
    //select
    if (onePressed) {
		if (mode == "online") {
	        if (place_meeting(x, y, objMageSelection)) {
	            thisPlayerHero = objMageTP;
				hp = mageHp;
	        } else if (place_meeting(x, y, objRogueSelection)) {
	            thisPlayerHero = objRogueTP;
				hp = rogueHp;
	        } else if (place_meeting(x, y, objMonkSelection)) {
	            thisPlayerHero = objMonkTP;
	        } else if (place_meeting(x, y, objShamanSelection)) {
	            thisPlayerHero = objShamanTP;
	        }
		} else if (mode == "offline") {
			if (place_meeting(x, y, objMageSelection)) {
				if (controlScheme == "keyboard") {
		            keyboardPlayerHero = objMageTP;
					hp = mageHp;
				}
	        } else if (place_meeting(x, y, objRogueSelection)) {
				if (controlScheme == "mouse") {
					mousePlayerHero = objRogueTP;
					hp = rogueHp;
				}
	        } else if (place_meeting(x, y, objMonkSelection)) {
	            mousePlayerHero = objMonkTP;
	        } else if (place_meeting(x, y, objShamanSelection)) {
				if (controlScheme == "keyboard") {
					keyboardPlayerHero = objShamanTP;
					hp = shamanHp;
				}
	        }
		}
    }
} else {
    lockedIn = true;
}

if (lockedIn) {
    dx = 0;
}

//lock-in
if (twoPressed) {
	if (mode == "online") {
	    if (thisPlayerHero != objSelectHeroTP) {
	        lockedIn = !lockedIn;
	    }
	} else if (mode == "offline") {
		var hero;
		
		if (controlScheme == "mouse") {
			hero = mousePlayerHero;
		} else {
			hero = keyboardPlayerHero;
		}
		
		if (hero != objSelectHeroTP) {
	        lockedIn = !lockedIn;
	    }
	}
}

scrMove();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 60CADFBF
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)var preJump;$(13_10)var postJump;$(13_10)var goingUp;$(13_10)var none;$(13_10)var goingDown;$(13_10)var move;$(13_10)var duck;$(13_10)var lockIn;$(13_10)$(13_10)if (mode == "online") {$(13_10)	if (thisPlayerHero == objSelectHeroTP) {$(13_10)	    preJump = sprSelectHero;$(13_10)	    postJump = sprSelectHero;$(13_10)	    goingUp = sprSelectHero;$(13_10)	    none = sprSelectHero;$(13_10)	    goingDown = sprSelectHero;$(13_10)	    move = sprSelectHero;$(13_10)	    duck = sprSelectHero;$(13_10)	    lockIn = sprSelectHero;$(13_10)	} else if (thisPlayerHero == objMageTP) {$(13_10)	    preJump = sprMagePreJump;$(13_10)	    postJump = sprMagePostJump;$(13_10)	    goingUp = sprMageGoingUp;$(13_10)	    none = sprMageNone;$(13_10)	    goingDown = sprMageGoingDown;$(13_10)	    move = sprMageMove;$(13_10)	    duck = sprMageNoneDuck;$(13_10)	    lockIn = sprMageLockedIn;$(13_10)	} else if (thisPlayerHero == objRogueTP) {$(13_10)	    preJump = sprRoguePreJump;$(13_10)	    postJump = sprRoguePostJump;$(13_10)	    goingUp = sprRogueGoingUp;$(13_10)	    none = sprRogueNone;$(13_10)	    goingDown = sprRogueGoingDown;$(13_10)	    move = sprRogueMove;$(13_10)	    duck = sprRogueNoneDuck;$(13_10)	    lockIn = sprRogueLockedIn;$(13_10)	} else if (thisPlayerHero == objMonkTP) {$(13_10)	    preJump = sprMonkPreJump;$(13_10)	    postJump = sprMonkPostJump;$(13_10)	    goingUp = sprMonkGoingUp;$(13_10)	    none = sprMonkNone;$(13_10)	    goingDown = sprMonkGoingDown;$(13_10)	    move = sprMonkMove;$(13_10)	    duck = sprMonkNoneDuck;$(13_10)	    lockIn = sprMonkLockedIn;$(13_10)	} else if (thisPlayerHero == objShamanTP) {$(13_10)	    preJump = sprShamanPreJump;$(13_10)	    postJump = sprShamanPostJump;$(13_10)	    goingUp = sprShamanGoingUp;$(13_10)	    none = sprShamanNone;$(13_10)	    goingDown = sprShamanGoingDown;$(13_10)	    move = sprShamanMove;$(13_10)	    duck = sprShamanNone;$(13_10)	    lockIn = sprShamanLockedIn;$(13_10)	}$(13_10)} else if (mode == "offline") {$(13_10)	var hero;$(13_10)	$(13_10)	if (controlScheme == "mouse") {$(13_10)		hero = mousePlayerHero;$(13_10)	} else {$(13_10)		hero = keyboardPlayerHero;$(13_10)	}$(13_10)$(13_10)	if (hero == objSelectHeroTP) {$(13_10)	    preJump = sprSelectHero;$(13_10)	    postJump = sprSelectHero;$(13_10)	    goingUp = sprSelectHero;$(13_10)	    none = sprSelectHero;$(13_10)	    goingDown = sprSelectHero;$(13_10)	    move = sprSelectHero;$(13_10)	    duck = sprSelectHero;$(13_10)	    lockIn = sprSelectHero;$(13_10)	} else if (hero == objMageTP) {$(13_10)	    preJump = sprMagePreJump;$(13_10)	    postJump = sprMagePostJump;$(13_10)	    goingUp = sprMageGoingUp;$(13_10)	    none = sprMageNone;$(13_10)	    goingDown = sprMageGoingDown;$(13_10)	    move = sprMageMove;$(13_10)	    duck = sprMageNoneDuck;$(13_10)	    lockIn = sprMageLockedIn;$(13_10)	} else if (hero == objRogueTP) {$(13_10)	    preJump = sprRoguePreJump;$(13_10)	    postJump = sprRoguePostJump;$(13_10)	    goingUp = sprRogueGoingUp;$(13_10)	    none = sprRogueNone;$(13_10)	    goingDown = sprRogueGoingDown;$(13_10)	    move = sprRogueMove;$(13_10)	    duck = sprRogueNoneDuck;$(13_10)	    lockIn = sprRogueLockedIn;$(13_10)	} else if (hero == objMonkTP) {$(13_10)	    preJump = sprMonkPreJump;$(13_10)	    postJump = sprMonkPostJump;$(13_10)	    goingUp = sprMonkGoingUp;$(13_10)	    none = sprMonkNone;$(13_10)	    goingDown = sprMonkGoingDown;$(13_10)	    move = sprMonkMove;$(13_10)	    duck = sprMonkNoneDuck;$(13_10)	    lockIn = sprMonkLockedIn;$(13_10)	} else if (hero == objShamanTP) {$(13_10)	    preJump = sprShamanPreJump;$(13_10)	    postJump = sprShamanPostJump;$(13_10)	    goingUp = sprShamanGoingUp;$(13_10)	    none = sprShamanNone;$(13_10)	    goingDown = sprShamanGoingDown;$(13_10)	    move = sprShamanMove;$(13_10)	    duck = sprShamanNone;$(13_10)	    lockIn = sprShamanLockedIn;$(13_10)	}$(13_10)}$(13_10)$(13_10)image_xscale = direct;$(13_10)$(13_10)if (lockedIn) {$(13_10)    sprite_index = lockIn;$(13_10)} else if (jumpState == PRE_JUMP) {$(13_10)    sprite_index = preJump;$(13_10)} else if (jumpState == POST_JUMP) {$(13_10)    sprite_index = postJump;$(13_10)} else {$(13_10)    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {$(13_10)        if (dy > 0) {$(13_10)            sprite_index = goingUp;$(13_10)        } else if (dy == 0) {$(13_10)            sprite_index = none;$(13_10)        } else {$(13_10)            sprite_index = goingDown;$(13_10)        }$(13_10)    } else if (state == MOVE) {$(13_10)        sprite_index = move;$(13_10)    } else {$(13_10)        if (ducking) {$(13_10)            sprite_index = duck;$(13_10)        } else {$(13_10)            sprite_index = none;$(13_10)        }$(13_10)    }$(13_10)}"
///@desc sprite and image
var preJump;
var postJump;
var goingUp;
var none;
var goingDown;
var move;
var duck;
var lockIn;

if (mode == "online") {
	if (thisPlayerHero == objSelectHeroTP) {
	    preJump = sprSelectHero;
	    postJump = sprSelectHero;
	    goingUp = sprSelectHero;
	    none = sprSelectHero;
	    goingDown = sprSelectHero;
	    move = sprSelectHero;
	    duck = sprSelectHero;
	    lockIn = sprSelectHero;
	} else if (thisPlayerHero == objMageTP) {
	    preJump = sprMagePreJump;
	    postJump = sprMagePostJump;
	    goingUp = sprMageGoingUp;
	    none = sprMageNone;
	    goingDown = sprMageGoingDown;
	    move = sprMageMove;
	    duck = sprMageNoneDuck;
	    lockIn = sprMageLockedIn;
	} else if (thisPlayerHero == objRogueTP) {
	    preJump = sprRoguePreJump;
	    postJump = sprRoguePostJump;
	    goingUp = sprRogueGoingUp;
	    none = sprRogueNone;
	    goingDown = sprRogueGoingDown;
	    move = sprRogueMove;
	    duck = sprRogueNoneDuck;
	    lockIn = sprRogueLockedIn;
	} else if (thisPlayerHero == objMonkTP) {
	    preJump = sprMonkPreJump;
	    postJump = sprMonkPostJump;
	    goingUp = sprMonkGoingUp;
	    none = sprMonkNone;
	    goingDown = sprMonkGoingDown;
	    move = sprMonkMove;
	    duck = sprMonkNoneDuck;
	    lockIn = sprMonkLockedIn;
	} else if (thisPlayerHero == objShamanTP) {
	    preJump = sprShamanPreJump;
	    postJump = sprShamanPostJump;
	    goingUp = sprShamanGoingUp;
	    none = sprShamanNone;
	    goingDown = sprShamanGoingDown;
	    move = sprShamanMove;
	    duck = sprShamanNone;
	    lockIn = sprShamanLockedIn;
	}
} else if (mode == "offline") {
	var hero;
	
	if (controlScheme == "mouse") {
		hero = mousePlayerHero;
	} else {
		hero = keyboardPlayerHero;
	}

	if (hero == objSelectHeroTP) {
	    preJump = sprSelectHero;
	    postJump = sprSelectHero;
	    goingUp = sprSelectHero;
	    none = sprSelectHero;
	    goingDown = sprSelectHero;
	    move = sprSelectHero;
	    duck = sprSelectHero;
	    lockIn = sprSelectHero;
	} else if (hero == objMageTP) {
	    preJump = sprMagePreJump;
	    postJump = sprMagePostJump;
	    goingUp = sprMageGoingUp;
	    none = sprMageNone;
	    goingDown = sprMageGoingDown;
	    move = sprMageMove;
	    duck = sprMageNoneDuck;
	    lockIn = sprMageLockedIn;
	} else if (hero == objRogueTP) {
	    preJump = sprRoguePreJump;
	    postJump = sprRoguePostJump;
	    goingUp = sprRogueGoingUp;
	    none = sprRogueNone;
	    goingDown = sprRogueGoingDown;
	    move = sprRogueMove;
	    duck = sprRogueNoneDuck;
	    lockIn = sprRogueLockedIn;
	} else if (hero == objMonkTP) {
	    preJump = sprMonkPreJump;
	    postJump = sprMonkPostJump;
	    goingUp = sprMonkGoingUp;
	    none = sprMonkNone;
	    goingDown = sprMonkGoingDown;
	    move = sprMonkMove;
	    duck = sprMonkNoneDuck;
	    lockIn = sprMonkLockedIn;
	} else if (hero == objShamanTP) {
	    preJump = sprShamanPreJump;
	    postJump = sprShamanPostJump;
	    goingUp = sprShamanGoingUp;
	    none = sprShamanNone;
	    goingDown = sprShamanGoingDown;
	    move = sprShamanMove;
	    duck = sprShamanNone;
	    lockIn = sprShamanLockedIn;
	}
}

image_xscale = direct;

if (lockedIn) {
    sprite_index = lockIn;
} else if (jumpState == PRE_JUMP) {
    sprite_index = preJump;
} else if (jumpState == POST_JUMP) {
    sprite_index = postJump;
} else {
    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
        if (dy > 0) {
            sprite_index = goingUp;
        } else if (dy == 0) {
            sprite_index = none;
        } else {
            sprite_index = goingDown;
        }
    } else if (state == MOVE) {
        sprite_index = move;
    } else {
        if (ducking) {
            sprite_index = duck;
        } else {
            sprite_index = none;
        }
    }
}