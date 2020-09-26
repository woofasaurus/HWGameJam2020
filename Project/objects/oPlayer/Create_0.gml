hsp = 0
vsp = 0
grv = 1
jumpsp = -10
walksp = 2
hitImm = false
attacking = false
targets = ds_list_create()
weapon = 0;

leftInput = ord("A")
rightInput = ord("D")
jumpInput = ord("W")
attackInput = vk_space

enum states {
	full = 0,
	armLost = 1,
	legLost = 2,
	bothLegsLost = 3,
	torso = 4	
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
}
currentanimation = 0 + state*10

animarray[0] = sIdle_Axe
animarray[1] = sWalking_Axe
animarray[2] = sJump
animarray[3] = sFall
animarray[4] = sAttack_Axe
animarray[10] = sIdleArmLost
animarray[11] = sWalkingArmLost
animarray[12] = sJumpArmLost
animarray[13] = sFallArmLost
animarray[14] = sAttackArmLost

