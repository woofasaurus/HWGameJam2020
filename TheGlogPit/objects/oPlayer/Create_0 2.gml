otherPlayer = "Player 1"
hsp = 0
vsp = 0
grv = 0.5
jumpsp = -5
walksp = 2
attacking = false
targets = ds_list_create()
weapon = 0;
clanging = false;

var scale = 1
image_xscale = scale
image_yscale = scale

leftInput = ord("A")
rightInput = ord("D")
jumpInput = ord("W")
attackInput = vk_space

enum states {
	full = 0,
	armLost = 1,
	legLost = 2,
	bothLegsLost = 3,
	torso = 4,
	dead = 5
}

state = 0

enum animation { //state*10 + individual
	fullIdle = 0,
	fullWalking = 1,
	fullJumping = 2,
	fullFalling = 3,
	fullAttacking = 4,
	armLostIdle = 10,
	armLostWalking = 11,
	armLostJumping = 12,
	armLostFalling = 13,
	armLostAttacking = 14,
	legLostIdle = 20,
	legLostWalking = 21,
	legLostJumping = 22,
	legLostFalling = 23,
	legLostAttacking = 24,
	bothLegsLostIdle = 30,
	bothLegsLostWalking = 31,
	bothLegsLostJumping = 32,
	bothLegsLostFalling = 33,
	bothLegsLostAttacking = 34,
	torsoIdle = 40,
	torsoWalking = 41,
	torsoJumping = 42,
	torsoFalling = 43,
	torsoAttacking = 44,
}
currentanimation = 0 + state*10

animarray[0] = sIdle_Axe
animarray[1] = sWalking_Axe
animarray[2] = sJump_Axe
animarray[3] = sFall_Axe
animarray[4] = sAttack_Axe

animarray[10] = sIdleArmLost
animarray[11] = sWalkingArmLost
animarray[12] = sJumpArmLost
animarray[13] = sFallArmLost
animarray[14] = sAttackArmLost

animarray[20] = sIdleLegLost
animarray[21] = sWalkingLegLost
animarray[22] = sJumpLegLost
animarray[23] = sFallLegLost
animarray[24] = sAttackLegLost

animarray[30] = sIdleBothLegsLost
animarray[31] = sWalkingBothLegsLost
animarray[32] = sJumpBothLegsLost
animarray[33] = sFallBothLegsLost
animarray[34] = sAttackBothLegsLost

animarray[40] = sIdleTorso
animarray[41] = sWalkingTorso
animarray[42] = sJumpTorso
animarray[43] = sFallTorso
animarray[44] = sAttackTorso

