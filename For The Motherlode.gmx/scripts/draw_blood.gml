/// draw_blood(x_source, y_source);

var x_source = argument0;
var y_source = argument1;

surface_set_target(global.surf);
repeat (random_range(3, 5)) {
    draw_sprite_ext(
        s_blood_decal, multi_chance(2, 10, 1, 20, 0),
        global.surf_offset + x_source + lengthdir_x(4, random(360)),
        global.surf_offset + y_source + lengthdir_y(4, random(360)),
        1, 1, random(360), c_white, 0.6
    );
}
surface_reset_target();
