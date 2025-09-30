/// @description Insert description here
// You can write your code in this editor

var _delta = delta_time / 1000000 * 60;
if (!instance_exists(obj_client) || !obj_client.connected) {
	exit;
}
global.tick_timer += _delta;


while (global.tick_timer > global.tick_timer_max) {
	player_angle = point_direction(actual_x, actual_y, mouse_x, mouse_y);
	global.tick_timer -= global.tick_timer_max;
	tick();
}


player_angle = point_direction(actual_x, actual_y, mouse_x, mouse_y);



image_angle = player_angle;
x = round(tick_start_x + (actual_x - tick_start_x) * global.tick_timer / global.tick_timer_max);
y = round(tick_start_y + (actual_y - tick_start_y) * global.tick_timer / global.tick_timer_max);
//x = actual_x;
//y = actual_y;


var _tick_track_speed = 0.1;


var _track_speed = 1 - power(1 - _tick_track_speed, _delta);
camera_x = camera_x - (camera_x + camera_get_view_width(view_camera[0]) / 2 - x) * _track_speed;
camera_y = camera_y - (camera_y + camera_get_view_height(view_camera[0]) / 2 - y) * _track_speed;
camera_set_view_pos(view_camera[0], camera_x, camera_y);