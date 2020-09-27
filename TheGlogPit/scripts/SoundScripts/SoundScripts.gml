function cheer(level){
	global.cheer = true
	repeat(level) {
		switch (irandom(level)) {
			case 0:
			audio_play_sound(Clapping,0,0)
			break;
			
			case 1:
			audio_play_sound(Cheer1,0,0)
			break;
			
			case 2:
			audio_play_sound(Cheer2,0,0)
			break;
			
			case 3:
			audio_play_sound(Wave,0,0)
			break;
			
			case 4:
			audio_play_sound(Hey,0,0)
			break;
		}
	}
}

function gore(){
	switch (irandom(2)) {
		case 0:
		audio_play_sound(Gore1,0,0)
		break;
			
		case 1:
		audio_play_sound(Gore2,0,0)
		break;
			
		case 2:
		audio_play_sound(SlimeSquish,0,0)
		break;
	}
}

function grunt(level){
	repeat(level) {
		switch (irandom(level)) {
			case 0:
			audio_play_sound(Grunt1,0,0)
			break;
			
			case 1:
			audio_play_sound(Grunt2,0,0)
			break;
		}
	}
}