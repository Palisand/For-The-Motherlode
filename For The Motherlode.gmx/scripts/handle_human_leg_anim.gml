/// handle_human_leg_anim(is_moving)

var moving = argument0;

var walk_wave_inc = 4;
var amplitude = sprite_get_number(s_feet) - 0.9;
var wave_val = amplitude * sin(degtorad(walk_wave_t));
s_feet_image_index = abs(wave_val);
// set image x-scale
if (wave_val < 0) {
    s_feet_image_yscale = -1;
}
else {
    s_feet_image_yscale = 1;
}
// animate
if (moving) {
    walk_wave_t += walk_wave_inc * speed; 
}
else {
    // smoothly return to first image index (walk_wave_t = 0 ~ wave_val = 0);
    if (abs(wave_val) > 0.1) {
        if (abs(wave_val) < abs(amplitude * sin(degtorad(walk_wave_t + 1)))) {
            walk_wave_t -= walk_wave_inc;
        }
        else if (abs(wave_val) >= abs(amplitude * sin(degtorad(walk_wave_t + 1)))) {
            walk_wave_t += walk_wave_inc;    
        }
    }
    else {
        walk_wave_t = 0;
    }
}
