if (global.cheer = true) 
{
	spd = 21
	global.cheer = false
	alarm[0] = 100
}
spd-= 0.1
if (spd <= 0)
{
	spd = 0
}
image_speed = spd