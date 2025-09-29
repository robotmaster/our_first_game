/// @description Insert description here
// You can write your code in this editor

var _delta = delta_time / 1000000 * 60;
global.tick_timer += _delta;


player_angle = point_direction(actual_x, actual_y, mouse_x, mouse_y);


while (global.tick_timer > global.tick_timer_max) {
	global.tick_timer -= global.tick_timer_max;
	tick();
}


player_angle = point_direction(actual_x, actual_y, mouse_x, mouse_y);



image_angle = player_angle;
//x = round(tick_start_x + (actual_x - tick_start_x) * global.tick_timer / global.tick_timer_max);
//y = round(tick_start_y + (actual_y - tick_start_y) * global.tick_timer / global.tick_timer_max);
x = actual_x;
y = actual_y;