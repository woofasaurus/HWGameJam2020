/// @description Insert description here
// You can write your code in this editor
randomize()
text = 0;
words = ds_list_create()
ds_list_add(words,
	"Disarm your opponent!",
	"Break a leg!",
	"Costs an arm and a leg."
)
text = words[|irandom(ds_list_size(words)-1)]
image_angle = 345;
image_xscale = 0;
count = 0;