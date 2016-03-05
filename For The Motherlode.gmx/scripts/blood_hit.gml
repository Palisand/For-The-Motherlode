/// blood_hit(x, y, lifetime, p_emitter, p_type)

/// muzzle_flash(x, y, lifetime, spread_min, spread_max, direction, emitter);

var x_r = argument0;
var y_r = argument1;
var lifetime = argument2;  // necessary?
var p_emitter = argument3;
var p_type = argument4;

var c_blood_red = make_colour_hsv(0, 255, 140);

part_system_depth(global.p_sys, -2500);
part_type_shape(p_type, pt_shape_square);
part_type_blend(p_type, false);
part_type_alpha1(p_type, 1);
part_type_colour1(p_type, c_blood_red);
part_type_direction(p_type, 0, 360, 0, 0);
part_type_speed(p_type, 0, 3, 0, 0);
part_type_size(p_type, 0.05, 0.05, -0.002, 0); 
part_type_life(p_type, 1, lifetime);
part_type_orientation(p_type, 0, 360, 0, 0, 0);
part_type_scale(p_type, 1, 1);  
part_emitter_region(global.p_sys, p_emitter, x_r, x_r, y_r, y_r, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.p_sys, p_emitter, p_type, random_range(30, 40));

