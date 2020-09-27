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
		for (var i = 0; i < hits; i++) // if this instance has not yet been hit by the attack perform hit effect
		{
			var hitID = targetsNow[| i]
			if (ds_list_find_index(player.targets, hitID) == -1)
			{
				ds_list_add(player.targets, hitID)
				if (!hitID.clanging)
				{
					effect(hitID)
					hitID.vsp -= 5
					spawnBlood(hitID.x,hitID.y,50)
					cheer(5)
					grunt(3)
					gore()
					if (hitID.state < 5)
					{
						instance_create_depth(x,y,depth-1,oLimb)
						if (hitID.state = 4)
						{
							instance_create_depth(x,y,depth-1,oAxe)
						}
					}
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
	if (abs(player.hsp) > 1)
	{
		player.hsp -= 2*sign(player.image_xscale)
	}
	else
	{
		player.hsp = 0
	}
	vsp += grv
}

function clang(player, subject)
{
	audio_play_sound(WeaponClash,0,0)
	player.vsp -= 5
	subject.vsp -= 5
}
	
function axe(state, player)
{
	switch(state) {
		#region full
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
			if (image_index = 1)
			{
				audio_play_sound(Swing,0,0)
				clanging = true
				player.hsp += 5*(player.image_xscale)
				player.mask_index = sAttackHB_Axe
				hitDetect(player)
				player.mask_index = sprite_index
			}
			if (animationEnd())
			{
				player.attacking = false
			}
			break;
		#endregion
		
		#region armLost
		case states.armLost:	
			#region movement
			player.hsp = player.move * player.walksp * 2
			#region facing
			if sign(player.hsp) < 0
			{
				player.image_xscale = -abs(player.image_xscale)
			}
			else if sign(player.hsp) > 0
			{
				player.image_xscale = abs(player.image_xscale)
			}
			#endregion

			player.vsp += player.grv

			if (place_meeting(player.x, player.y+1, oGround) && player.kJump)
			{
				player.vsp = player.jumpsp
			}
			#endregion
			function effect(subject){ //declare what happens to hit targets
				subject.state++
			}
			if (player.sprite_index != sAttackArmLost)
			{
				vsp -= 1
				player.sprite_index = sAttackArmLost
				player.image_index = 0
				//ds_list_clear(player.targets)
			}
			if (image_index = 4)
			{
				audio_play_sound(Swing,0,0)
				clanging = true
				player.mask_index = sAttackHBArmLost
				hitDetect(player)
				player.mask_index = sprite_index
			}
			if (animationEnd())
			{
				player.attacking = false
			}
			break;
		#endregion
		
		#region legLost
		case states.legLost: 

			show_debug_message(string(charge))
			if (charging)
			{
				hsp = 0;
				#region facing
				if sign(move) < 0
				{
					image_xscale = -abs(image_xscale)
				}
				else if sign(move) > 0
				{
					image_xscale = abs(image_xscale)
				}
				#endregion
				if (charge < 10)
					charge+= 0.5
				if (player.sprite_index != sAttackLegLostWindup)
				{
					player.sprite_index = sAttackLegLostWindup
					player.image_index = 0
				}
				if (animationEnd())
				{
					image_speed = 0
				}
			}
			else
			{
				show_debug_message(string(charge) + "vsp" + string(vsp) + " attacking? "+string(attacking) + " ground: " + string(place_meeting(player.x, player.y+1, oGround)))
				image_speed = 1
				if (player.sprite_index != sAttackLegLost && place_meeting(player.x, player.y+1, oGround))
				{
					player.sprite_index = sAttackLegLost
					player.image_index = 0
					player.hsp = player.image_xscale * charge * 1.25
					player.vsp -= charge
					charge = 0
					audio_play_sound(Swing,0,0)
				}
				player.vsp += player.grv
				function effect(subject){ //declare what happens to hit targets
					subject.state++
				}
				if (image_index <= 7 && image_index >= 3)
				{
					clanging = true
					player.mask_index = sAttackHBLegLost
					hitDetect(player)
					player.mask_index = sprite_index
				}
				if (animationEnd() || (place_meeting(player.x, player.y+1, oGround) && player.vsp >= 0))
				{
					player.attacking = false
				}
			}
			break;	
		#endregion

		#region bothLegsLost
		case states.bothLegsLost:
			playerStop(player)
			
			function effect(subject){ //declare what happens to hit targets
				subject.state++
			}
			if (player.sprite_index != sAttackBothLegsLost)
			{
				player.sprite_index = sAttackBothLegsLost
				player.image_index = 0
				//ds_list_clear(player.targets)
			}
			if (image_index = 1)
			{
				audio_play_sound(Swing,0,0)
				clanging = true
				player.mask_index = sAttackHBBothLegsLost
				hitDetect(player)
				player.mask_index = sprite_index
			}
			if (animationEnd())
			{
				player.attacking = false
			}
			break;
			
			
		#endregion
	
		#region torso
		case states.torso:
			playerStop(player)
			#region facing
			if sign(player.move) < 0
			{
				player.image_xscale = -abs(player.image_xscale)
			}
			else if sign(player.move) > 0
			{
				player.image_xscale = abs(player.image_xscale)
			}
			#endregion

			
			if (kAttack)
			{
				player.sprite_index = sAttackTorso
				player.image_speed = 0
				audio_play_sound(Suck,0,0)
				
			}
			if (!charging)
			{	
				audio_play_sound(Spit,0,0)
				spit(x+(20*image_xscale),y - 5,image_xscale)
				player.attacking = false
				player.image_speed = 1
			}
			break;
		#endregion
	}
	if (kAttackDone)
	{
		charging = false
	}
}