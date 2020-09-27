// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animationEnd(){ 
	var _sprite=sprite_index;
	var _image=image_index;
	var _type=sprite_get_speed_type(sprite_index);
	var _spd=sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
	    _spd = _spd/room_speed;
	return _image+_spd >= sprite_get_number(_sprite);
}