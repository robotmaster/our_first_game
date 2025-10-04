// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_player_movement() {
	var _move_x_amount = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
	var _move_y_amount = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));
	if (_move_x_amount != 0 || _move_y_amount != 0) {
		var _dir = point_direction(0, 0, _move_x_amount, _move_y_amount);
	
		actual_x += lengthdir_x(player_speed, _dir);
		actual_y += lengthdir_y(player_speed, _dir);
		var _dir_spawn_to_pos = point_direction(0, 0, actual_x, actual_y);
		if (point_distance(0, 0, actual_x, actual_y) > area_radius) {
			actual_x = lengthdir_x(area_radius, _dir_spawn_to_pos);
			actual_y = lengthdir_y(area_radius, _dir_spawn_to_pos);
		}
	}
}