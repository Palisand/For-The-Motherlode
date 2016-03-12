//blood_hit_screen(p_emitter, p_type);

var x_r = view_xview;
var y_r = view_yview;
var min_part_amt = 500;
var p_emitter = argument0;
var p_type = argument1;

var c_blood_red = make_colour_hsv(0, 255, 140);

part_system_depth(global.p_sys, -999);
part_type_shape(p_type, pt_shape_square);
part_type_blend(p_type, false);
part_type_alpha1(p_type, 1);
part_type_colour1(p_type, c_blood_red);
part_type_direction(p_type, 290, 320, 0, 0);
part_type_speed(p_type, 0, 20, 0, 0);
part_type_size(p_type, 2, 2, -0.08, 0); 
part_type_life(p_type, 1, 120);
part_type_orientation(p_type, 0, 360, 0, 0, 0);
part_type_scale(p_type, 1, 1);  
part_emitter_region(global.p_sys, p_emitter, x_r, x_r, y_r, y_r, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.p_sys, p_emitter, p_type, random_range(min_part_amt, min_part_amt + 10));

