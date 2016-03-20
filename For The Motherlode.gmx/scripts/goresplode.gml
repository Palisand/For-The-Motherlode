/// goresplode(num_giblet)

var num_giblet = argument0;

var max_gibs = sprite_get_number(s_giblets);
if (num_giblet > max_gibs) {
    num_giblet = max_gibs;
}

for (var i = 0; i < num_giblet; i++) {
    var dir = random(360);
    with (
        instance_create(
            x + lengthdir_x(sprite_get_width(mask_index), dir),
            y + lengthdir_y(sprite_get_height(mask_index), dir),
            o_giblet
        )
    ) {
        c_skin = other.c_skin;
        sprite_index = s_giblets;
        image_index = i;
        speed = other.proj_pushback + random_range(-3, 3);
        image_angle = random(360);
        direction = other.image_angle - 180 + random_range(-45, 45);
    }
}
/*
var moar_gib_count = sprite_get_number(s_giblets_moar);
for (var i = 0; i < moar_gib_count; i++) {
    with (
        instance_create(
            x + lengthdir_x(sprite_get_width(mask_index), dir),
            y + lengthdir_y(sprite_get_height(mask_index), dir),
            o_giblet
        )
    ) {
        sprite_index = s_giblets_moar;
        image_index = i;
        speed = other.proj_pushback + random_range(-3, 3);
        image_angle = random(360);
        direction = other.image_angle - 180 + random_range(-45, 45);
    }
}
