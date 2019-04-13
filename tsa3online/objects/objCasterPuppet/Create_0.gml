///@desc creation stuff
///@desc stats
if (depth < 0) {
	ai = true
	depth += 2
} else {
	ai = false
}

thisNumber = depth;
depth = 0

ini_open("casterStats.ini")

show_debug_message(ini_read_real("trishot", "windUp", 0))

maxHp = 92
moveSpd = 120 / room_speed
jumpPower = 310 / room_speed
grav = 750 / (room_speed * room_speed)
airJumps = 0
currAirJumps = 0
bounciness = 0.25

//trishot
windUp[0] = 60
duration[0] = 80
windDown[0] = 50
slowWindUp[0] = 1
slowDuring[0] = 1
slowWindDown[0] = 1
cooldown[0] = 800

shotSpd = 1200
shotAmount = 3
shotDist = 10
shotXMax = 30
shotXMin = 10

//lob
windUp[1] = 100
duration[1] = 30
windDown[1] = 100
slowWindUp[1] = 0.3
slowDuring[1] = 0.7
slowWindDown[1] = 0.3
cooldown[1] = 3500

lobDmg = 13
lobSlowTo = 0.4
lobSlowDuration = 0.8 * room_speed
smallLobDmg = 3
smallLobSlowTo = 0.7
smallLobSlowDuration = 0.5 * room_speed

lobSpd = 850.595
lobAngle = 40.857
lobDdy = -948.893
lobHitboxDuration = 0.05 * room_speed
smallLobXSpd = 130
lobFactor = 0.4
smallLobNumber = 5

//teleport
windUp[2] = 80
duration[2] = 200
windDown[2] = 0
slowWindUp[2] = 0.3
slowDuring[2] = 2.5
slowWindDown[2] = 0
cooldown[2] = 3400

teleportDist = 160

//ball
windUp[3] = 250
duration[3] = 50
windDown[3] = 100
slowWindUp[3] = 0.3
slowDuring[3] = 0.7
slowWindDown[3] = 0.3
cooldown[3] = 6500

ballDmg = 18
ballSlowTo = 0.3
ballSlowDuration = 0.8 * room_speed

ballSpd = 300
ballGrav = 421.631
ballTriSpd = 220
ballTriNum = 18
ballTriCreateDist = 20

//puppet stuff
hp = maxHp;
clientGivenHp = hp;
aState = "n";
timeToActivate = 0;
lastTimeToActivate = 0;
firstTime = false;
abilityKey[0] = "1";
abilityKey[1] = "2";
abilityKey[2] = "3";
abilityKey[3] = "4";