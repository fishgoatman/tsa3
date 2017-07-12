// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // objKeyboardPlayer
global.__objectDepths[1] = 0; // objMousePlayer
global.__objectDepths[2] = 0; // objAttackOP
global.__objectDepths[3] = 2; // objHpPod
global.__objectDepths[4] = 0; // objHpPodDeath
global.__objectDepths[5] = 0; // objAttackTP
global.__objectDepths[6] = 0; // objKnifeTP
global.__objectDepths[7] = 0; // objRogue
global.__objectDepths[8] = 0; // objStationaryKnife
global.__objectDepths[9] = -1; // objKnifeHurtboxTP
global.__objectDepths[10] = -1; // objKnifeHurtboxOP
global.__objectDepths[11] = 0; // objFireballTP
global.__objectDepths[12] = 0; // objKnifeOP
global.__objectDepths[13] = 0; // objMage
global.__objectDepths[14] = 0; // objFireballOP
global.__objectDepths[15] = 0; // objFireShotExplosionOP
global.__objectDepths[16] = 0; // objFireblastTP
global.__objectDepths[17] = 0; // objFireblastOP
global.__objectDepths[18] = 0; // objFireShotExplosionTP
global.__objectDepths[19] = 0; // objXiaolongOP
global.__objectDepths[20] = 0; // objKnightCore
global.__objectDepths[21] = 0; // objXiaolongTP
global.__objectDepths[22] = 0; // objSword
global.__objectDepths[23] = 0; // objKnight
global.__objectDepths[24] = 0; // objSwordOP
global.__objectDepths[25] = 0; // objShrineTP
global.__objectDepths[26] = 0; // objShrineOP
global.__objectDepths[27] = 0; // objIcicle
global.__objectDepths[28] = 0; // objSwordTP
global.__objectDepths[29] = 0; // objIcicleTP
global.__objectDepths[30] = 0; // objIcicleOP
global.__objectDepths[31] = 0; // objShieldBar
global.__objectDepths[32] = 0; // objMonkShadowTP
global.__objectDepths[33] = 0; // objMonkShadowOP
global.__objectDepths[34] = 0; // objMonkKickShadowTP
global.__objectDepths[35] = 0; // objMonkKickShadowOP
global.__objectDepths[36] = 0; // objAttackHurtboxTP
global.__objectDepths[37] = 0; // objAttackHurtboxOP
global.__objectDepths[38] = 0; // objAttackDuckHurtboxTP
global.__objectDepths[39] = -1; // objShieldTP
global.__objectDepths[40] = 0; // objAttackDuckHurtboxOP
global.__objectDepths[41] = -1; // objShieldOP
global.__objectDepths[42] = -1; // objShieldReflect
global.__objectDepths[43] = 2; // objMonkEnergyBarTP
global.__objectDepths[44] = 2; // objMonkEnergyBarOP
global.__objectDepths[45] = 0; // objMonk
global.__objectDepths[46] = 0; // objPlayer
global.__objectDepths[47] = -1; // objLightning
global.__objectDepths[48] = 0; // objShamanLogic
global.__objectDepths[49] = 0; // objTotem
global.__objectDepths[50] = 2; // objTotemCooldown
global.__objectDepths[51] = 2; // objLightningCooldown
global.__objectDepths[52] = -1; // objFireCooldown
global.__objectDepths[53] = 0; // objBlock
global.__objectDepths[54] = 0; // objSmallBlock
global.__objectDepths[55] = 0; // objSmallMedBlock
global.__objectDepths[56] = 0; // objMedBigBlock
global.__objectDepths[57] = 0; // objMedBlock
global.__objectDepths[58] = 0; // objBigBlock
global.__objectDepths[59] = 0; // objReallyBigBlock
global.__objectDepths[60] = 0; // objReallyReallyBlock
global.__objectDepths[61] = 2; // objWindCooldown
global.__objectDepths[62] = 0; // objBorder
global.__objectDepths[63] = 0; // objFloor
global.__objectDepths[64] = 0; // objSmallPlatform
global.__objectDepths[65] = 0; // objCollision
global.__objectDepths[66] = 0; // objMovingWallUD
global.__objectDepths[67] = 0; // objMediumGrassBlock
global.__objectDepths[68] = 0; // objBigGrassBlock
global.__objectDepths[69] = 3; // objGrassBK
global.__objectDepths[70] = 0; // objMediumGrassBlockWithChimes
global.__objectDepths[71] = 0; // objTallGrass
global.__objectDepths[72] = 0; // objMediumGrass
global.__objectDepths[73] = 0; // objWindTunnel
global.__objectDepths[74] = 0; // objSmallGrass
global.__objectDepths[75] = -1; // objChimeBoltTP
global.__objectDepths[76] = -1; // objChimeCarrier
global.__objectDepths[77] = -1; // objWind
global.__objectDepths[78] = -1; // objChimeCarrierShadow
global.__objectDepths[79] = 0; // objChime
global.__objectDepths[80] = -1; // objChimeBoltOP
global.__objectDepths[81] = 0; // objChimeMarkerTP
global.__objectDepths[82] = 0; // objChimeMarkerOP
global.__objectDepths[83] = -1; // objTie
global.__objectDepths[84] = 0; // objBigChime
global.__objectDepths[85] = 0; // objGeneral
global.__objectDepths[86] = -1; // objZero
global.__objectDepths[87] = 0; // objBlockAndPlayer
global.__objectDepths[88] = -1; // objOne
global.__objectDepths[89] = -1; // objMouseWin
global.__objectDepths[90] = -1; // objDash
global.__objectDepths[91] = -1; // objTwo
global.__objectDepths[92] = 0; // objPixel
global.__objectDepths[93] = -1; // objThree
global.__objectDepths[94] = 0; // objServer
global.__objectDepths[95] = 0; // objAttack
global.__objectDepths[96] = 0; // objMonkSelection
global.__objectDepths[97] = 0; // objRogueSelection
global.__objectDepths[98] = -1; // objKeyboardWin
global.__objectDepths[99] = 0; // objSelectHero
global.__objectDepths[100] = 0; // objShamanSelection
global.__objectDepths[101] = 0; // objMageSelection
global.__objectDepths[102] = 1; // objCharacterSelectRoom
global.__objectDepths[103] = 0; // objArrowRight
global.__objectDepths[104] = 0; // objArrowLeft
global.__objectDepths[105] = 0; // objArrowDown
global.__objectDepths[106] = -1; // objWarning
global.__objectDepths[107] = 0; // objRmArrowRain
global.__objectDepths[108] = 0; // objArrowUp
global.__objectDepths[109] = 0; // objRmChimes
global.__objectDepths[110] = 0; // objWindManager
global.__objectDepths[111] = 0; // objShaman
global.__objectDepths[112] = 0; // objFireSpiritExplosion
global.__objectDepths[113] = 0; // objFireSpirit


global.__objectNames[0] = "objKeyboardPlayer";
global.__objectNames[1] = "objMousePlayer";
global.__objectNames[2] = "objAttackOP";
global.__objectNames[3] = "objHpPod";
global.__objectNames[4] = "objHpPodDeath";
global.__objectNames[5] = "objAttackTP";
global.__objectNames[6] = "objKnifeTP";
global.__objectNames[7] = "objRogue";
global.__objectNames[8] = "objStationaryKnife";
global.__objectNames[9] = "objKnifeHurtboxTP";
global.__objectNames[10] = "objKnifeHurtboxOP";
global.__objectNames[11] = "objFireballTP";
global.__objectNames[12] = "objKnifeOP";
global.__objectNames[13] = "objMage";
global.__objectNames[14] = "objFireballOP";
global.__objectNames[15] = "objFireShotExplosionOP";
global.__objectNames[16] = "objFireblastTP";
global.__objectNames[17] = "objFireblastOP";
global.__objectNames[18] = "objFireShotExplosionTP";
global.__objectNames[19] = "objXiaolongOP";
global.__objectNames[20] = "objKnightCore";
global.__objectNames[21] = "objXiaolongTP";
global.__objectNames[22] = "objSword";
global.__objectNames[23] = "objKnight";
global.__objectNames[24] = "objSwordOP";
global.__objectNames[25] = "objShrineTP";
global.__objectNames[26] = "objShrineOP";
global.__objectNames[27] = "objIcicle";
global.__objectNames[28] = "objSwordTP";
global.__objectNames[29] = "objIcicleTP";
global.__objectNames[30] = "objIcicleOP";
global.__objectNames[31] = "objShieldBar";
global.__objectNames[32] = "objMonkShadowTP";
global.__objectNames[33] = "objMonkShadowOP";
global.__objectNames[34] = "objMonkKickShadowTP";
global.__objectNames[35] = "objMonkKickShadowOP";
global.__objectNames[36] = "objAttackHurtboxTP";
global.__objectNames[37] = "objAttackHurtboxOP";
global.__objectNames[38] = "objAttackDuckHurtboxTP";
global.__objectNames[39] = "objShieldTP";
global.__objectNames[40] = "objAttackDuckHurtboxOP";
global.__objectNames[41] = "objShieldOP";
global.__objectNames[42] = "objShieldReflect";
global.__objectNames[43] = "objMonkEnergyBarTP";
global.__objectNames[44] = "objMonkEnergyBarOP";
global.__objectNames[45] = "objMonk";
global.__objectNames[46] = "objPlayer";
global.__objectNames[47] = "objLightning";
global.__objectNames[48] = "objShamanLogic";
global.__objectNames[49] = "objTotem";
global.__objectNames[50] = "objTotemCooldown";
global.__objectNames[51] = "objLightningCooldown";
global.__objectNames[52] = "objFireCooldown";
global.__objectNames[53] = "objBlock";
global.__objectNames[54] = "objSmallBlock";
global.__objectNames[55] = "objSmallMedBlock";
global.__objectNames[56] = "objMedBigBlock";
global.__objectNames[57] = "objMedBlock";
global.__objectNames[58] = "objBigBlock";
global.__objectNames[59] = "objReallyBigBlock";
global.__objectNames[60] = "objReallyReallyBlock";
global.__objectNames[61] = "objWindCooldown";
global.__objectNames[62] = "objBorder";
global.__objectNames[63] = "objFloor";
global.__objectNames[64] = "objSmallPlatform";
global.__objectNames[65] = "objCollision";
global.__objectNames[66] = "objMovingWallUD";
global.__objectNames[67] = "objMediumGrassBlock";
global.__objectNames[68] = "objBigGrassBlock";
global.__objectNames[69] = "objGrassBK";
global.__objectNames[70] = "objMediumGrassBlockWithChimes";
global.__objectNames[71] = "objTallGrass";
global.__objectNames[72] = "objMediumGrass";
global.__objectNames[73] = "objWindTunnel";
global.__objectNames[74] = "objSmallGrass";
global.__objectNames[75] = "objChimeBoltTP";
global.__objectNames[76] = "objChimeCarrier";
global.__objectNames[77] = "objWind";
global.__objectNames[78] = "objChimeCarrierShadow";
global.__objectNames[79] = "objChime";
global.__objectNames[80] = "objChimeBoltOP";
global.__objectNames[81] = "objChimeMarkerTP";
global.__objectNames[82] = "objChimeMarkerOP";
global.__objectNames[83] = "objTie";
global.__objectNames[84] = "objBigChime";
global.__objectNames[85] = "objGeneral";
global.__objectNames[86] = "objZero";
global.__objectNames[87] = "objBlockAndPlayer";
global.__objectNames[88] = "objOne";
global.__objectNames[89] = "objMouseWin";
global.__objectNames[90] = "objDash";
global.__objectNames[91] = "objTwo";
global.__objectNames[92] = "objPixel";
global.__objectNames[93] = "objThree";
global.__objectNames[94] = "objServer";
global.__objectNames[95] = "objAttack";
global.__objectNames[96] = "objMonkSelection";
global.__objectNames[97] = "objRogueSelection";
global.__objectNames[98] = "objKeyboardWin";
global.__objectNames[99] = "objSelectHero";
global.__objectNames[100] = "objShamanSelection";
global.__objectNames[101] = "objMageSelection";
global.__objectNames[102] = "objCharacterSelectRoom";
global.__objectNames[103] = "objArrowRight";
global.__objectNames[104] = "objArrowLeft";
global.__objectNames[105] = "objArrowDown";
global.__objectNames[106] = "objWarning";
global.__objectNames[107] = "objRmArrowRain";
global.__objectNames[108] = "objArrowUp";
global.__objectNames[109] = "objRmChimes";
global.__objectNames[110] = "objWindManager";
global.__objectNames[111] = "objShaman";
global.__objectNames[112] = "objFireSpiritExplosion";
global.__objectNames[113] = "objFireSpirit";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for