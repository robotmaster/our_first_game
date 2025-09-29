/// @description Insert description here
// You can write your code in this editor

var _delta = delta_time / 1000000 * 60;
tick_timer += _delta;


player_angle = point_direction(actual_x, actual_y, mouse_x, mouse_y);


while (tick_timer > tick_timer_max) {
	tick_timer -= tick_timer_max;
	tick_start_x = actual_x;
	tick_start_y = actual_y;
	tick();
}


player_angle = point_direction(actual_x, actual_y, mouse_x, mouse_y);



image_angle = round(player_angle);
x = round(tick_start_x + (actual_x - tick_start_x) * tick_timer / tick_timer_max);
y = round(tick_start_y + (actual_y - tick_start_y) * tick_timer / tick_timer_max);