// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack(state, weapon, player)
{
	switch (weapon) {
		case 0:
			axe(state, player)
		break;
	}
}

function hitDetect(player)	//
{
	var targetsNow = ds_list_create() //players hit by the attack in this frame
	var hits = instance_place_list(player.x,player.y,oPlayer,targetsNow,false)
	var pPos = ds_list_find_index(hits, player.id)
	if (pPos != -1)									//removes the acting player from the list of hits
		ds_list_delete(hits, pPos)
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++) // if this instance has not yet been hit by the attack perform hit effect
		{
			var hitID = targetsNow[| i]
			if (ds_list_find_index(player.targets, hitID) == -1)
			{
				ds_list_add(player.targets, hitID)
				effect(hitID)
			}
		}
	}
	ds_list_destroy(targetsNow)
}
	
function playerStop(player)
{
	//player.hsp = 0
	//vsp += grv
	#region movement
	hsp = player.move * walksp
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
}
	
function axe(state, player)
{
	switch(state) {
		case states.full:
		
			playerStop(player)
			function effect(subject){ //declare what happens to hit targets
				subject.state++
			}
			if (player.sprite_index != sAttack_Axe)
			{
				player.sprite_index = sAttack_Axe
				player.image_index = 0
				ds_list_clear(player.targets)
			}
			player.mask_index = sAttackHB
			hitDetect(player)
			player.mask_index = sprite_index
			break;
	 
		case states.armLost:	
			
			playerStop(player)
			function effect(subject){ //declare what happens to hit targets
				subject.state++
			}
			if (player.sprite_index != sAttack_Axe)
			{
				player.sprite_index = sAttackArmLost
				player.image_index = 0
				ds_list_clear(player.targets)
			}
			player.mask_index = sAttackHB
			hitDetect(player)
			player.mask_index = sprite_index
			break;
	
		case states.legLost: 
			
			playerStop(player)
			function effect(subject){
				subject.state++
			}
			if (player.sprite_index != sAttack_Axe)
			{
				player.sprite_index = sAttackArmLost //placeholder change to the leg lost
				player.image_index = 0
				ds_list_clear(player.targets)
			}
			player.mask_index = sAttackHB
			hitDetect(player)
			break;	

		case states.bothLegsLost:

			break;

		case states.torso:

			break;
			
	}
	
	if (animationEnd())
	{
		player.sprite_index = 0 + state*10
		player.attacking = false
	}
}