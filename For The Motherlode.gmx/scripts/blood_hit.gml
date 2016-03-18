/// blood_hit(x, y, lifetime, p_emitter, p_type)

var x_r = argument0;
var y_r = argument1;
var min_part_amt = argument2;
var p_emitter = argument3;
var p_type = argument4;

var c_blood_red = make_colour_hsv(0, 255, 180);

part_system_depth(global.p_sys, -98);
part_type_shape(p_type, pt_shape_square);
part_type_blend(p_type, false);
part_type_alpha1(p_type, 1);
part_type_colour1(p_type, c_blood_red);
part_type_direction(p_type, 0, 360, 0, 0);
part_type_speed(p_type, 0, 3, 0, 0);
part_type_size(p_type, 0.05, 0.05, -0.002, 0); 
part_type_life(p_type, 1, 30);
part_type_orientation(p_type, 0, 360, 0, 0, 0);
part_type_scale(p_type, 1, 1);  
part_emitter_region(global.p_sys, p_emitter, x_r, x_r, y_r, y_r, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.p_sys, p_emitter, p_type, random_range(min_part_amt, min_part_amt + 10));

