draw_set_halign(fa_center)
draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)
draw_set_alpha(1)
draw_set_color(c_white)
draw_sprite(sVictory,0,display_get_gui_width()/2, display_get_gui_height()/2)
//draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "EXCELLENT!");//winner + " WINS!\nFavor: " + global.favor + "\n\nPress esc to return to menu.")
draw_set_halign(fa_left)