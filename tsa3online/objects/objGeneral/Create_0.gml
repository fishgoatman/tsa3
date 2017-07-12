/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 120293BD
/// @DnDArgument : "code" "/// @description creation stuff$(13_10)///globalvars$(13_10)//constants$(13_10)globalvar NONE;$(13_10)NONE = 0;$(13_10)globalvar RIGHT;$(13_10)RIGHT = 1;$(13_10)globalvar LEFT;$(13_10)LEFT = -1;$(13_10)globalvar MOVE;$(13_10)MOVE = 1;$(13_10)globalvar INIT_ATTACK;$(13_10)INIT_ATTACK = -1;$(13_10)globalvar INIT_JUMP;$(13_10)INIT_JUMP = -2;$(13_10)globalvar JUMP;$(13_10)JUMP = -3;$(13_10)globalvar INIT_ABILITY;$(13_10)INIT_ABILITY = -4;$(13_10)globalvar PRE_ABILITY;$(13_10)PRE_ABILITY = -5;$(13_10)globalvar ACTIVATE_ABILITY;$(13_10)ACTIVATE_ABILITY = -6;$(13_10)globalvar INIT_THREE;$(13_10)INIT_THREE = 1;$(13_10)globalvar INIT_FOUR;$(13_10)INIT_FOUR = 1;$(13_10)globalvar PRE_ATTACK;$(13_10)PRE_ATTACK = 1;$(13_10)globalvar POST_ATTACK;$(13_10)POST_ATTACK = 2;$(13_10)globalvar PRE_JUMP;$(13_10)PRE_JUMP = 3;$(13_10)globalvar POST_JUMP;$(13_10)POST_JUMP = 4;$(13_10)globalvar PRE_ABILITY;$(13_10)PRE_ABILITY = 5;$(13_10)globalvar POST_ABILITY;$(13_10)POST_ABILITY = 6;$(13_10)globalvar DURING_ATTACK;$(13_10)DURING_ATTACK = 7;$(13_10)globalvar KEYBOARD;$(13_10)KEYBOARD = 1;$(13_10)globalvar MOUSE;$(13_10)MOUSE = 2;$(13_10)globalvar TIE;$(13_10)TIE = 3;$(13_10)globalvar IMMUNE;$(13_10)IMMUNE = 0;$(13_10)globalvar IMMUNE_TIME;$(13_10)IMMUNE_TIME = 5;$(13_10)globalvar FIRE;$(13_10)FIRE = 1;$(13_10)globalvar ICE;$(13_10)ICE = 2;$(13_10)globalvar AIR;$(13_10)AIR = 3;$(13_10)$(13_10)//player stuff$(13_10)globalvar thisPlayerHero;$(13_10)thisPlayerHero = objSelectHeroTP;$(13_10)globalvar otherPlayerHero;$(13_10)otherPlayerHero = objSelectHeroOP;$(13_10)globalvar tpId;$(13_10)globalvar opId;$(13_10)globalvar thisHpBar;$(13_10)globalvar otherHpBar;$(13_10)globalvar hpPerLine;$(13_10)hpPerLine = 14;$(13_10)globalvar hpBarWidth;$(13_10)hpBarWidth = 165;$(13_10)globalvar hpBarOffset;$(13_10)hpBarOffset = 20;$(13_10)globalvar onePressed;$(13_10)globalvar oneReleased;$(13_10)globalvar twoPressed;$(13_10)globalvar threePressed;$(13_10)globalvar fourPressed;$(13_10)globalvar oneActivate;$(13_10)oneActivate = false;$(13_10)globalvar twoActivate;$(13_10)twoActivate = false;$(13_10)globalvar threeActivate;$(13_10)threeActivate = false;$(13_10)globalvar fourActivate;$(13_10)fourActivate = false;$(13_10)globalvar otherOneActivate;$(13_10)otherOneActivate = false;$(13_10)globalvar otherTwoActivate;$(13_10)otherTwoActivate = false;$(13_10)globalvar otherThreeActivate;$(13_10)otherThreeActivate = false;$(13_10)globalvar otherFourActivate;$(13_10)otherFourActivate = false;$(13_10)globalvar otherX;$(13_10)otherX = 0;$(13_10)globalvar otherY;$(13_10)otherY = 0;$(13_10)globalvar otherMouseX;$(13_10)otherMouseX = 0;$(13_10)globalvar otherMouseY;$(13_10)otherMouseY = 0;$(13_10)globalvar otherSpriteIndex;$(13_10)otherSpriteIndex = sprNone;$(13_10)globalvar otherImageIndex;$(13_10)otherImageIndex = 0;$(13_10)globalvar otherLockedIn;$(13_10)otherLockedIn = false;$(13_10)globalvar otherHp;$(13_10)otherHp = 1;$(13_10)globalvar otherXScale;$(13_10)otherXScale = 1;$(13_10)globalvar otherDucking;$(13_10)$(13_10)//other$(13_10)globalvar gg;$(13_10)gg = NONE;$(13_10)globalvar overallSpd;$(13_10)overallSpd = 0.8;$(13_10)globalvar ai;$(13_10)ai = false;$(13_10)globalvar rooms;$(13_10)rooms[0] = rmChimes;$(13_10)rooms[1] = rm2;$(13_10)rooms[2] = rmArrowRain;$(13_10)globalvar firstTo;$(13_10)firstTo = 3;$(13_10)globalvar thisWins;$(13_10)thisWins = 0;$(13_10)globalvar otherWins;$(13_10)otherWins = 0;$(13_10)globalvar clientSocket;$(13_10)clientSocket = network_create_socket(network_socket_udp);$(13_10)globalvar PORT_NUM;$(13_10)PORT_NUM = 54795;$(13_10)globalvar IP_NUM;$(13_10)IP_NUM = "10.0.1.2";$(13_10)globalvar connectedToServer;$(13_10)connectedToServer = false;$(13_10)globalvar rmNumber;$(13_10)globalvar testingMode;$(13_10)testingMode = true;$(13_10)$(13_10)///regular vars$(13_10)victoryTime = 1.8 * room_speed;$(13_10)matchVictoryTime = 0.7 * room_speed; //in addition to the victoryTime$(13_10)signX = room_width / 2;$(13_10)signY = room_height / 4;$(13_10)NEXT_GAME = 0;$(13_10)RESET = 1;$(13_10)bufferToSend = buffer_create(256, buffer_fixed, 1);$(13_10)$(13_10)///make it look good$(13_10)texture_set_interpolation(false);$(13_10)application_surface_draw_enable(false);$(13_10)globalvar dWidth;$(13_10)dWidth = display_get_width();$(13_10)globalvar dHeight;$(13_10)dHeight = display_get_height();$(13_10)globalvar rmRawWidth;$(13_10)rmRawWidth = 528;$(13_10)globalvar rmRawHeight;$(13_10)rmRawHeight = 384;$(13_10)var i = 1;$(13_10)$(13_10)while (rmRawWidth * i <= dWidth && rmRawHeight * i <= dHeight) {$(13_10)    i++;$(13_10)}$(13_10)$(13_10)i--;$(13_10)globalvar rmWidth;$(13_10)rmWidth = rmRawWidth * i;$(13_10)globalvar rmHeight;$(13_10)rmHeight = rmRawHeight * i;$(13_10)surface_resize(application_surface, rmWidth, rmHeight);$(13_10)globalvar xOffset;$(13_10)xOffset = (dHeight * rmRawWidth / rmRawHeight - rmWidth) / 2;$(13_10)globalvar yOffset;$(13_10)yOffset = (dHeight - rmHeight) / 2;$(13_10)$(13_10)///creation stuff$(13_10)randomize();"
/// @description creation stuff
///globalvars
//constants
globalvar NONE;
NONE = 0;
globalvar RIGHT;
RIGHT = 1;
globalvar LEFT;
LEFT = -1;
globalvar MOVE;
MOVE = 1;
globalvar INIT_ATTACK;
INIT_ATTACK = -1;
globalvar INIT_JUMP;
INIT_JUMP = -2;
globalvar JUMP;
JUMP = -3;
globalvar INIT_ABILITY;
INIT_ABILITY = -4;
globalvar PRE_ABILITY;
PRE_ABILITY = -5;
globalvar ACTIVATE_ABILITY;
ACTIVATE_ABILITY = -6;
globalvar INIT_THREE;
INIT_THREE = 1;
globalvar INIT_FOUR;
INIT_FOUR = 1;
globalvar PRE_ATTACK;
PRE_ATTACK = 1;
globalvar POST_ATTACK;
POST_ATTACK = 2;
globalvar PRE_JUMP;
PRE_JUMP = 3;
globalvar POST_JUMP;
POST_JUMP = 4;
globalvar PRE_ABILITY;
PRE_ABILITY = 5;
globalvar POST_ABILITY;
POST_ABILITY = 6;
globalvar DURING_ATTACK;
DURING_ATTACK = 7;
globalvar KEYBOARD;
KEYBOARD = 1;
globalvar MOUSE;
MOUSE = 2;
globalvar TIE;
TIE = 3;
globalvar IMMUNE;
IMMUNE = 0;
globalvar IMMUNE_TIME;
IMMUNE_TIME = 5;
globalvar FIRE;
FIRE = 1;
globalvar ICE;
ICE = 2;
globalvar AIR;
AIR = 3;

//player stuff
globalvar thisPlayerHero;
thisPlayerHero = objSelectHeroTP;
globalvar otherPlayerHero;
otherPlayerHero = objSelectHeroOP;
globalvar tpId;
globalvar opId;
globalvar thisHpBar;
globalvar otherHpBar;
globalvar hpPerLine;
hpPerLine = 14;
globalvar hpBarWidth;
hpBarWidth = 165;
globalvar hpBarOffset;
hpBarOffset = 20;
globalvar onePressed;
globalvar oneReleased;
globalvar twoPressed;
globalvar threePressed;
globalvar fourPressed;
globalvar oneActivate;
oneActivate = false;
globalvar twoActivate;
twoActivate = false;
globalvar threeActivate;
threeActivate = false;
globalvar fourActivate;
fourActivate = false;
globalvar otherOneActivate;
otherOneActivate = false;
globalvar otherTwoActivate;
otherTwoActivate = false;
globalvar otherThreeActivate;
otherThreeActivate = false;
globalvar otherFourActivate;
otherFourActivate = false;
globalvar otherX;
otherX = 0;
globalvar otherY;
otherY = 0;
globalvar otherMouseX;
otherMouseX = 0;
globalvar otherMouseY;
otherMouseY = 0;
globalvar otherSpriteIndex;
otherSpriteIndex = sprNone;
globalvar otherImageIndex;
otherImageIndex = 0;
globalvar otherLockedIn;
otherLockedIn = false;
globalvar otherHp;
otherHp = 1;
globalvar otherXScale;
otherXScale = 1;
globalvar otherDucking;

//other
globalvar gg;
gg = NONE;
globalvar overallSpd;
overallSpd = 0.8;
globalvar ai;
ai = false;
globalvar rooms;
rooms[0] = rmChimes;
rooms[1] = rm2;
rooms[2] = rmArrowRain;
globalvar firstTo;
firstTo = 3;
globalvar thisWins;
thisWins = 0;
globalvar otherWins;
otherWins = 0;
globalvar clientSocket;
clientSocket = network_create_socket(network_socket_udp);
globalvar PORT_NUM;
PORT_NUM = 54795;
globalvar IP_NUM;
IP_NUM = "10.0.1.2";
globalvar connectedToServer;
connectedToServer = false;
globalvar rmNumber;
globalvar testingMode;
testingMode = true;

///regular vars
victoryTime = 1.8 * room_speed;
matchVictoryTime = 0.7 * room_speed; //in addition to the victoryTime
signX = room_width / 2;
signY = room_height / 4;
NEXT_GAME = 0;
RESET = 1;
bufferToSend = buffer_create(256, buffer_fixed, 1);

///make it look good
texture_set_interpolation(false);
application_surface_draw_enable(false);
globalvar dWidth;
dWidth = display_get_width();
globalvar dHeight;
dHeight = display_get_height();
globalvar rmRawWidth;
rmRawWidth = 528;
globalvar rmRawHeight;
rmRawHeight = 384;
var i = 1;

while (rmRawWidth * i <= dWidth && rmRawHeight * i <= dHeight) {
    i++;
}

i--;
globalvar rmWidth;
rmWidth = rmRawWidth * i;
globalvar rmHeight;
rmHeight = rmRawHeight * i;
surface_resize(application_surface, rmWidth, rmHeight);
globalvar xOffset;
xOffset = (dHeight * rmRawWidth / rmRawHeight - rmWidth) / 2;
globalvar yOffset;
yOffset = (dHeight - rmHeight) / 2;

///creation stuff
randomize();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 11315275
/// @DnDArgument : "code" "/// @desc stats$(13_10)//mage$(13_10)globalvar mageHp;$(13_10)mageHp = 160;$(13_10)globalvar fireballDmg;$(13_10)fireballDmg = 6;$(13_10)globalvar fireShotSpd;$(13_10)fireShotSpd = 18;$(13_10)globalvar fireShotSpread;$(13_10)fireShotSpread = 55;$(13_10)globalvar fireShotAmount;$(13_10)fireShotAmount = 10;$(13_10)globalvar fireShotTime;$(13_10)fireShotTime = 12;$(13_10)$(13_10)//rogue$(13_10)globalvar rogueHp;$(13_10)rogueHp = 120;$(13_10)globalvar boltDmg;$(13_10)boltDmg = 2;$(13_10)globalvar daggerDmg;$(13_10)daggerDmg = 3.5;$(13_10)globalvar boltAmount;$(13_10)boltAmount = 12;$(13_10)globalvar boltSpread;$(13_10)boltSpread = 40;$(13_10)globalvar boltSpd;$(13_10)boltSpd = 30;$(13_10)globalvar startAngle;$(13_10)startAngle = 120;$(13_10)globalvar endAngle;$(13_10)endAngle = 8;$(13_10)globalvar dAngle;$(13_10)dAngle = -11;$(13_10)globalvar daggerAmount;$(13_10)daggerAmount = 15;$(13_10)globalvar daggerSpd;$(13_10)daggerSpd = 55;"
/// @desc stats
//mage
globalvar mageHp;
mageHp = 160;
globalvar fireballDmg;
fireballDmg = 6;
globalvar fireShotSpd;
fireShotSpd = 18;
globalvar fireShotSpread;
fireShotSpread = 55;
globalvar fireShotAmount;
fireShotAmount = 10;
globalvar fireShotTime;
fireShotTime = 12;

//rogue
globalvar rogueHp;
rogueHp = 120;
globalvar boltDmg;
boltDmg = 2;
globalvar daggerDmg;
daggerDmg = 3.5;
globalvar boltAmount;
boltAmount = 12;
globalvar boltSpread;
boltSpread = 40;
globalvar boltSpd;
boltSpd = 30;
globalvar startAngle;
startAngle = 120;
globalvar endAngle;
endAngle = 8;
globalvar dAngle;
dAngle = -11;
globalvar daggerAmount;
daggerAmount = 15;
globalvar daggerSpd;
daggerSpd = 55;