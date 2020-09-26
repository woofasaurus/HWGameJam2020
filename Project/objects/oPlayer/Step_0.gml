kLeft = keyboard_check(ord("A"))
kRight = keyboard_check(ord("D"))
kJump = keyboard_check(ord("W"))
kAttack = keyboard_check_pressed(vk_space)

var move = kRight - kLeft
function movement(move) {
	#region movement
	hsp = move * walksp
	#region facing
	if sign(hsp) < 0
	{
		image_xscale = -1
	}
	else if sign(hsp) > 0
	{
		image_xscale = 1
	}
	#endregion

	vsp += grv

	if (place_meeting(x, y+1, oGround) && kJump)
	{
		vsp = jumpsp
	}
	#endregion

	#region animation
			if (vsp < 0)
			{
				currentanimation = animation.fullJumping + state*10
				image_index = 0
				sprite_index = animarray[currentanimation]
			}
			else if (vsp > 0 && !place_meeting(x, y+vsp, oGround))
			{
				currentanimation = animation.fullFalling + state*10
				image_index = 0
				sprite_index = animarray[currentanimation]
			}
			else if (hsp != 0)
			{
				currentanimation = animation.fullWalking + state*10
				sprite_index = animarray[currentanimation]
			}
			else
			{
				currentanimation = animation.fullIdle + state*10
				sprite_index = animarray[currentanimation]
			}

			#endregion
}

if (kAttack || attacking)			//if attacking do the attack method with proper state input
{
	attacking = true
	attack(state, weapon, self)
}
else {					//otherwise move based on imput
	switch(state) {
		case states.full:
			movement(move)
			break;

		case states.armLost:
			movement(move)
			break;

		case states.legLost:
			#region movement
			hsp = 0
			vsp += grv
			#endregion
			break;

		case states.bothLegsLost:
			#region movement
			hsp = 0
			vsp += grv
			#endregion
			break;

		case states.torso:
			#region movement
			hsp = 0
			vsp += grv
			#endregion
			break;
	}
}

#region collision

if (place_meeting(x+hsp, y, oGround))
{
	while (!place_meeting(x+sign(hsp), y, oGround) && ((sign(hsp)/hsp) < 1))
	{
		x+= sign(hsp)
	}
	hsp = 0
}
x += hsp

if (place_meeting(x, y+vsp, oGround))
{
	while (!place_meeting(x, y+sign(vsp), oGround) && ((sign(vsp)/vsp) < 1))
	{
		y+= sign(vsp)
	}
	vsp = 0
}
y += vsp
#endregion
