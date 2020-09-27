/// @description Insert description here
// You can write your code in this editor
count = (count + 0.1) mod 360
image_xscale=1+sin(count)/20
draw_set_color(c_black)
draw_text_transformed(x-lengthdir_x(string_width(text)/2, image_angle),y-lengthdir_y(string_width(text)/2,image_angle),text,image_xscale,image_xscale,image_angle)
draw_set_color(c_white)
draw_text_transformed(x-lengthdir_x(string_width(text)/2, image_angle)-2,y-lengthdir_y(string_width(text)/2,image_angle)+2,text,image_xscale,image_xscale,image_angle)
