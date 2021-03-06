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
	var pPos = ds_list_find_index(hits, player)
	if (pPos != -1)									//removes the acting player from the list of hits
		ds_list_delete(hits, pPos)
	if (hits > 0)
	{
		player.clanging = true
		for (var i = 0; i < hits; i++) // if this instance has not yet been hit by the attack perform hit effect
		{
			var hitID = targetsNow[| i]
			if (ds_list_find_index(player.targets, hitID) == -1)
			{
				ds_list_add(player.targets, hitID)
				if (!hitID.clanging)
				{
					effect(hitID)
					spawnBlood(100)
				}
				else
				{
					clang(player, hitID)
				}
				
				show_debug_message(string(id) + " state: " +  string(player.state))
			}
		}
	}
	ds_list_destroy(targetsNow)
}
	
function playerStop(player)
{
	player.hsp = 0
	vsp += grv
}

function clang(player, subject)
{
	player.vsp -= 5
	subject.vsp -= 5
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
				//ds_list_clear(player.targets)
			}
			player.mask_index = sAttackHB_Axe
			hitDetect(player)
			player.mask_index = sprite_index
			break;
	 
		case states.armLost:	
			playerStop(player)
			function effect(subject){ //declare what happens to hit targets
				subject.state++
			}
			if (player.sprite_index != sAttackArmLost)
			{
				player.sprite_index = sAttackArmLost
				player.image_index = 0
				//ds_list_clear(player.targets)
			}
			player.mask_index = sAttackHBArmLost
			hitDetect(player)
			player.mask_index = sprite_index
			break;
	
		case states.legLost: 
			if (player.sprite_index != sAttackLegLost && place_meeting(player.x, player.y+1, oGround))
			{
				player.hsp = player.image_xscale * walksp * 4
				player.vsp += player.jumpsp
			}
			player.vsp += player.grv
			function effect(subject){ //declare what happens to hit targets
				subject.state++
			}
			if (player.sprite_index != sAttackLegLost)
			{
				player.sprite_index = sAttackLegLost
				player.image_index = 0
				//ds_list_clear(player.targets)
			}
			player.mask_index = sAttackHBLegLost
			hitDetect(player)
			player.mask_index = sprite_index
			break;	

		case states.bothLegsLost:
			function effect(subject){ //declare what happens to hit targets
				subject.state++
			}
			if (player.sprite_index != sAttackBothLegsLost)
			{
				player.sprite_index = sAttackBothLegsLost
				player.image_index = 0
				//ds_list_clear(player.targets)
			}
			player.mask_index = sAttackHBBothLegsLost
			hitDetect(player)
			player.mask_index = sprite_index
			break;

		case states.torso:
			playerStop(player)
			break;
			
	}
	
	if (animationEnd())
	{
		//player.sprite_index = 0 + state*10  // causes end of attack animation -> fall bug
		player.attacking = false
	}
}