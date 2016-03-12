/// draw_footprints()

if (!drawn_footprint && round(s_feet_image_index) == sprite_get_number(s_feet) - 1) {
    surface_set_target(global.surf);
    draw_sprite_ext(s_footprint, 0, x + global.surf_offset, y + global.surf_offset, 1, s_feet_image_yscale, direction, c_white, 0.3);
    surface_reset_target();
    drawn_footprint = true;
    alarm[1] = 8; // walk_wave_inc * 2
    /*
    if (id == o_player.id) {
        audio_play_sound(snd_footstep, 0, false);
    }
    else {
        audio_play_sound_at(snd_footstep, x, y, 0, 100, 300, 1, false, 0);
    }
    audio_sound_pitch(snd_footstep, random_range(0.9, 1.1));*/
}
