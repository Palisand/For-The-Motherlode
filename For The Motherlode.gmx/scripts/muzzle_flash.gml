/// muzzle_flash(x, y, lifetime, spread_min, spread_max, direction, p_emitter, p_type);

var x_r = argument0;
var y_r = argument1;
var lifetime = argument2;
var spread_min = argument3;
var spread_max = argument4;
var dir = argument5;
var p_emitter = argument6;
var p_type = argument7;

var spread = random_range(spread_min, spread_max);

part_system_depth(global.p_sys, -2500);
part_type_shape(p_type, pt_shape_square);
part_type_blend(p_type, true);
part_type_alpha3(p_type, 1, 0.50, 0);
part_type_color3(p_type, c_blue, c_orange, c_red);
part_type_direction(p_type, dir - spread, dir + spread, 0, 0);
part_type_speed(p_type, 0, 8, 0, 0);
part_type_size(p_type, 0.1, 0.1, 0, 0); 
part_type_life(p_type, 1, lifetime);
part_type_orientation(p_type, 0, 360, 0, 0, 0);
part_type_scale(p_type, 1, 1);  
part_emitter_region(global.p_sys, p_emitter, x_r, x_r, y_r, y_r, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.p_sys, p_emitter, p_type, 300);

