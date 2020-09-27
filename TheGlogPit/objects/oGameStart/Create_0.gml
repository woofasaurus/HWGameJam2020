randomize()

var pla = instance_create_depth(x+300,y,depth-1,oPlayer)
pla.attackInput = ord("M")
pla.leftInput = vk_left
pla.rightInput = vk_right
pla.jumpInput = vk_up
pla.otherPlayer = "Player 2"
instance_create_depth(x,y,depth-1,oPlayer)

audio_group_load(Ambience)
audio_group_load(SFX)