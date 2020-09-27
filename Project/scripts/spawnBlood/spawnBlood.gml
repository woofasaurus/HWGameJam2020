function spawnBlood(amount){
	repeat (amount)
	{
		instance_create_depth(x,y,depth-1,oBlood)
	}
}