image_angle += rotationSpeed
emitBlood(x,y,1)

if (place_meeting(x,y,oGround))
{
	spawnBlood(x,y,20)
	instance_destroy()
}