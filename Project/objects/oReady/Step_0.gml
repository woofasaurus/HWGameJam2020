/// @description Insert description here
// You can write your code in this editor
if !hasAssignKeys 
{
	for(var i = 0; i < instance_number(oKey); i++) 
	{ 
		var currentKey = instance_find(oKey,i)
		if (player == 1) != (currentKey.keyAssign > 4) continue
		if currentKey.keyAssign mod 5 == 0 currentKey.key = global.jumpInput[player]
		if currentKey.keyAssign mod 5 == 1 currentKey.key = global.leftInput[player]
		if currentKey.keyAssign mod 5 == 2 currentKey.key = global.downInput[player]
		if currentKey.keyAssign mod 5 == 3 currentKey.key = global.rightInput[player]
		if currentKey.keyAssign mod 5 == 4 currentKey.key = global.attackInput[player]
		currentKey.text = getKeyName(currentKey.key)
	}
	hasAssignKeys = true;
}

if position_meeting(mouse_x, mouse_y, id) 
{
	if mouse_check_button_pressed(mb_left) click = !click
}
