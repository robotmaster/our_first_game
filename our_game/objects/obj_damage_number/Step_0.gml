/// @description Insert description here
// You can write your code in this editor
var _delta = delta_time / 1000000 * 60;
effect_timer += _delta;
if (effect_timer >= effect_timer_max) {
	instance_destroy();
}
x += speed_x * _delta;
y += speed_y * _delta;