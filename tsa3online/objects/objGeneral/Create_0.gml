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
globalvar hpPodSize;
hpPodSize = 32;
globalvar onePressed;
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
rmNumber = 0;

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