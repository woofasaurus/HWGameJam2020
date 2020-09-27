/// @description Insert description here
// You can write your code in this editor
visible = false
if !persistent 
{
	visible = true
	for(var i = 0; i < instance_number(oReady); i++)
	{
		if !instance_find(oReady, i).click visible = false
	}
	if visible 
	{
		if position_meeting(mouse_x, mouse_y, id) and mouse_check_button_pressed(mb_left) 
		{
			persistent = true;
			room_goto(Room1)	
		}
	}
}
else
{
	if instance_number(oPlayer) == 2
	{
		var p1 = instance_find(oPlayer, 0) //replace this with Player 1 id
		assignInputs(0,p1)
		var p2 = instance_find(oPlayer, 1) //replace this with Player 2 id
		assignInputs(1,p2)
		instance_destroy()
	}
}
if position_meeting(mouse_x, mouse_y, id) 
{
	image_index = 1;
}
else
{
	image_index = 0;
}
