// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getKeyName(_key){
var out = "NO KEY";
switch(_key)
{
	case vk_tab: out = "TAB"; break;
	case vk_space: out = "SPACE"; break;
	case vk_up: out = "UP"; break;
	case vk_down: out = "DN"; break;
	case vk_left: out = "LT"; break;
	case vk_right: out = "RT"; break;
	case vk_control: out = "CONTROL"; break;
	default: out = chr(_key); break;
}
return out;
}