/// @description Insert description here
// You can write your code in this editor
var _delta = delta_time / 1000000 * 60;
effect_timer -= _delta;
flash_timer -= _delta;
if (effect_timer <= 0) {
	instance_destroy();
}

var _slowdown_multiplier = 0.94;
speed_x *= _slowdown_multiplier;
speed_y *= _slowdown_multiplier;
x += speed_x * _delta;
y += speed_y * _delta;
image_alpha = effect_timer / effect_timer_max;
var _sizeup = 0.02;
image_xscale = 1 + _sizeup * (effect_timer_max - effect_timer);
image_yscale = 1 + _sizeup * (effect_timer_max - effect_timer);
