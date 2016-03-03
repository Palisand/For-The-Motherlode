///shake_screen(amount, duration);

var amount = argument0;
var duration = argument1;

with (o_camera) {
    shaking = true;
    shake_amount = amount;
    alarm[0] = duration;
}
