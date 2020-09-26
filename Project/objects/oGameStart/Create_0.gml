var pla = instance_create_depth(x,y,depth-1,oPlayer)
pla.attackInput = ord("M")
pla.leftInput = vk_left
pla.rightInput = vk_right
pla.jumpInput = vk_up
instance_create_depth(x,y,depth-1,oPlayer)
