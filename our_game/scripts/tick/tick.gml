// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tick() {
	//only use with obj_player
	tick_start_x = actual_x;
	tick_start_y = actual_y;
	var _move_x_amount = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
	var _move_y_amount = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));
	if (_move_x_amount != 0 || _move_y_amount != 0) {
		var _dir = point_direction(0, 0, _move_x_amount, _move_y_amount);
	
		actual_x += lengthdir_x(player_speed, _dir);
		actual_y += lengthdir_y(player_speed, _dir);
	}
	reload_cooldown = timer(reload_cooldown, 1);
	if (player_mag_capacity <= 0 && reload_cooldown <= 0) { 
		player_mag_capacity = player_bullet_capacity;
	}
	
	shoot_cooldown = timer(shoot_cooldown, 1);
	if (mouse_check_button(mb_left) && shoot_cooldown <= 0) {
		shoot_cooldown = shoot_cooldown_max;
		player_mag_capacity--;
		if (player_mag_capacity <= 0) {
			reload_cooldown = reload_cooldown_max;
		}
		else {
			array_push(bullet_spawn, {time: 6, rot: player_angle, x_pos: actual_x, y_pos: actual_y});
		}
		//shoot();
	}
	
	for (var _bullet = 0; _bullet < array_length(bullet_spawn); _bullet++) {
		var _actual_bullet = bullet_spawn[_bullet];
		_actual_bullet.time -= 1;
		if (_actual_bullet.time <= 0) {
			shoot(_actual_bullet.x_pos, _actual_bullet.y_pos, actual_x, actual_y, _actual_bullet.rot);
			array_delete(bullet_spawn, _bullet, 1);
			_bullet -= 1;
		}
	}
	
	
	for (var _bullet = 0; _bullet < array_length(global.bullet_entities); _bullet++) {
		with (global.bullet_entities[_bullet]) {
			event_perform(ev_other, ev_user0);
		}
	}
}