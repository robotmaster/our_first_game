/// @description Insert description here
// You can write your code in this editor
tick_timer_max = 1;
tick_timer = 0;

actual_x = x;
actual_y = y;
tick_start_x = actual_x;
tick_start_y = actual_y;

player_speed = 9;
player_angle = image_angle;

function tick() {
	var _move_x_amount = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
	var _move_y_amount = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));
	if (_move_x_amount != 0 || _move_y_amount != 0) {
		var _dir = point_direction(0, 0, _move_x_amount, _move_y_amount);
	
		actual_x += lengthdir_x(player_speed, _dir);
		actual_y += lengthdir_y(player_speed, _dir);
	}
}