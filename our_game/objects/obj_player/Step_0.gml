/// @description Insert description here
// You can write your code in this editor
var _delta = delta_time / 1000000 * 60;
tick_timer += _delta;
while (tick_timer > tick_timer_max) {
	tick_timer -= tick_timer_max;
	tick();
}