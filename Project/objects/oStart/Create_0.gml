/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
assignInputs = function(_num, _player)
{
	_player.rightInput = global.rightInput[_num]	
	_player.upInput = global.upInput[_num]	
	_player.leftInput = global.leftInput[_num]	
	_player.downInput = global.downInput[_num]	
	_player.attackInput = global.attackInput[_num]	
}