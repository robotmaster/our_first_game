/// @description Insert description here
// You can write your code in this editor

var _delta = delta_time / 1000000 * 60;
tick_timer += _delta;





while (tick_timer > tick_timer_max) {
	tick_timer -= tick_timer_max;
	tick_start_x = actual_x;
	tick_start_y = actual_y;
	tick();
}

x = round(tick_start_x + (actual_x - tick_start_x) * tick_timer / tick_timer_max);
y = round(tick_start_y + (actual_y - tick_start_y) * tick_timer / tick_timer_max);