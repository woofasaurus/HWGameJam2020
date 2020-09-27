function spawnBlood(px,py,amount){
	repeat (amount)
	{
		instance_create_depth(px,py,depth-1,oBlood)
	}
}

function emitBlood(px,py,amount){
	var _dice = irandom(amount)
	if (_dice == 0)
		instance_create_depth(px,py,depth-1,oBloodDrip)
}

function spit(px,py,facing){
	repeat (3)
	{
		var _spit = instance_create_depth(px,py,depth-1,oSpit)
		
		if (facing > 0)
			_spit.direction = 30
		else 
			_spit.direction = 150
		_spit.hspeed = random_range(facing*6, facing*8)
	}
}