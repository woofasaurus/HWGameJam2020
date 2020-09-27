/// @description Insert description here
// You can write your code in this editor
if mode == 0
{
	if position_meeting(mouse_x, mouse_y, id) 
	{
		image_index = 1;
		if mouse_check_button_pressed(mb_left) 
		{
			mode = 1;
		}
	}
	else 
	{
		image_index = 0;
	}
}
else if mode == 1
{
	if keyboard_check_pressed(vk_anykey)
	{
		key = keyboard_lastkey 
		mode = 0;
		text = getKeyName(key)
		show_debug_message(key)
	}
}
