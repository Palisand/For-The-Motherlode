///draw_sprite_shadow_ext(sprite, subimg, x, y, rot, direction, distance, scale, colour, alpha);
///Draws the shadow of a sprite (does not use object variables)

// ext args 
var sprite = argument0;
var subimg = argument1;
var s_x = argument2;
var s_y = argument3;
var rot = argument4;
// shadow args
var dir = argument5;
var len = argument6;
var sca = argument7;
var col = argument8;
var alp = argument9;
var xx = s_x + lengthdir_x(len, dir);
var yy = s_y + lengthdir_y(len, dir);
// draw shadow
d3d_set_fog(true, col, 0, 3);
draw_sprite_ext(sprite, subimg, xx, yy, sca, sca, rot, c_white, alp);
d3d_set_fog(0, 0, 0, 0);

