/// shoot(gun, target)

var gun = argument0;
var proj_target = argument1;

if (id != o_player.id) {
    audio_play_sound_at(gun[GUN.sound_fire], x, y, 0, 100, 300, 1, false, 0);
}
else {
    audio_play_sound(gun[GUN.sound_fire], 0, false);
}
audio_sound_pitch(gun[GUN.sound_fire], random_range(0.9, 1.1));

repeat (gun[GUN.proj_amount]) {
    with (instance_create(
        draw_x + lengthdir_x(global.gun_carry_offset[gun[GUN.carry]] + gun[GUN.muzzle_offset], image_angle),
        draw_y + lengthdir_y(global.gun_carry_offset[gun[GUN.carry]] + gun[GUN.muzzle_offset], image_angle),
        gun[GUN.proj_type]
    )) {
        target = proj_target;
        source = other.id;
        speed = gun[GUN.proj_speed]; // TODO: acceleration for missiles
        if (gun[GUN.proj_amount] > 1) {
            speed += random_range(-5, 5);
        }
        direction = other.image_angle + random_range(-gun[GUN.spread]/2, gun[GUN.spread]/2);
        image_angle = direction;
        damage = gun[GUN.damage];
        // crit_chance = gun[GUN.crit_chance];
        force = gun[GUN.proj_force];
    }
}

// and if has_casing? or just use ammo_type
if (++shot_count >= gun[GUN.casing_eject_delay]) {
    shot_count = 0;
    repeat(gun[GUN.casing_amount]) {
        with (instance_create(
            draw_x + lengthdir_x(global.gun_carry_offset[gun[GUN.carry]], image_angle),
            draw_y + lengthdir_y(global.gun_carry_offset[gun[GUN.carry]], image_angle),
            o_casing
        )) {
            image_angle = other.image_angle;
            direction = other.image_angle - 90 + random_range(-45, 45);
            speed = random_range(3, 5);
            image_index = gun[GUN.ammo_type];
        }
    }
}

// muzzle flash types?
muzzle_flash(
    draw_x + lengthdir_x(global.gun_carry_offset[gun[GUN.carry]] + gun[GUN.muzzle_offset], image_angle),
    draw_y + lengthdir_y(global.gun_carry_offset[gun[GUN.carry]] + gun[GUN.muzzle_offset], image_angle),
    4, 0, 32, image_angle, muzzle_flash_p_emitter, muzzle_flash_p_type
);

if (kickback < gun[GUN.kickback]) {
    kickback = gun[GUN.kickback];
}

if (id == o_player.id) {
    shake_screen(gun[GUN.kickback], 10);
}
