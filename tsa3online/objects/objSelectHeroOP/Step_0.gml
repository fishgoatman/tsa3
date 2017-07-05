/// @description act based on input
//gravity
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
	if (upPressed) {
		jumpState = INIT_JUMP;
		upPressed = false;
	}
	
    if (jumpState == INIT_JUMP) {
        dy = jumpDy;
        jumpState = NONE;
    }
    
    //select
    if (attackState == INIT_ATTACK) {
        attackState = NONE;
        
        if (place_meeting(x, y, objMageSelection)) {
            hero = objMageTP;
        
            if (controlScheme == MOUSE) {
                thisPlayerHero = hero;
            } else {
                otherPlayerHero = hero;
            }
        } else if (place_meeting(x, y, objRogueSelection)) {
            hero = objRogue;
        
            if (controlScheme == MOUSE) {
                thisPlayerHero = hero;
            } else {
                otherPlayerHero = hero;
            }
        } else if (place_meeting(x, y, objMonkSelection)) {
            hero = objMonk;
            
            if (controlScheme == MOUSE) {
                thisPlayerHero = hero;
            } else {
                otherPlayerHero = hero;
            }
        } else if (place_meeting(x, y, objShamanSelection)) {
            if (controlScheme == KEYBOARD) {
                hero = objShaman;
                otherPlayerHero = hero;
            }
        }
    }
} else {
    if (controlScheme == MOUSE) {
        hero = mouseAiHero;
        thisPlayerHero = hero;
    } else {
        hero = keyboardAiHero;
        otherPlayerHero = hero;
    }
    
    lockedIn = true;
}

if (lockedIn) {
    dx = 0;
}

//lock-in
if (abilityState == INIT_ABILITY) {
    abilityState = NONE;

    if (hero != objSelectHeroOP) {
        lockedIn = !lockedIn;
    }
}

scrMove();

///sprite and image
var preJump;
var postJump;
var goingUp;
var none;
var goingDown;
var move;
var duck;
var lockIn;

if (hero == objSelectHeroOP) {
    preJump = sprSelectHero;
    postJump = sprSelectHero;
    goingUp = sprSelectHero;
    none = sprSelectHero;
    goingDown = sprSelectHero;
    move = sprSelectHero;
    duck = sprSelectHero;
    lockIn = sprSelectHero;
} else if (hero == objMageOP) {
    preJump = sprMagePreJump;
    postJump = sprMagePostJump;
    goingUp = sprMageGoingUp;
    none = sprMageNone;
    goingDown = sprMageGoingDown;
    move = sprMageMove;
    duck = sprMageNoneDuck;
    lockIn = sprMageLockedIn;
} else if (hero == objRogue) {
    preJump = sprRoguePreJump;
    postJump = sprRoguePostJump;
    goingUp = sprRogueGoingUp;
    none = sprRogueNone;
    goingDown = sprRogueGoingDown;
    move = sprRogueMove;
    duck = sprRogueNoneDuck;
    lockIn = sprRogueLockedIn;
} else if (hero == objMonk) {
    preJump = sprMonkPreJump;
    postJump = sprMonkPostJump;
    goingUp = sprMonkGoingUp;
    none = sprMonkNone;
    goingDown = sprMonkGoingDown;
    move = sprMonkMove;
    duck = sprMonkNoneDuck;
    lockIn = sprMonkLockedIn;
} else if (hero == objShaman) {
    preJump = sprShamanNone;
    postJump = sprShamanNone;
    goingUp = sprShamanNone;
    none = sprShamanNone;
    goingDown = sprShamanNone;
    move = sprShamanNone;
    duck = sprShamanNone;
    lockIn = sprShamanLockedIn;
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

