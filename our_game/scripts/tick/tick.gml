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
		
	var _packet_info = [
	[buffer_u8, networking.ticks],
	[buffer_u8, obj_client.id_player],
	[buffer_s32, actual_x],
	[buffer_s32, actual_y],
	[buffer_u16, player_angle],
	[buffer_bool, false],
	];
	
	reload_cooldown = timer(reload_cooldown, 1);
	if (player_mag_capacity <= 0 && reload_cooldown <= 0) { 
		player_mag_capacity = player_bullet_capacity;
	}
	
	shoot_cooldown = timer(shoot_cooldown, 1);
	if (mouse_check_button(mb_left) && shoot_cooldown <= 0) {
		shoot_cooldown = shoot_cooldown_max;
		player_mag_capacity--;
		if (player_mag_capacity <= 0) {
			if (reload_cooldown <= 0)
				reload_cooldown = reload_cooldown_max;
		}
		else {
			_packet_info[5][1] = true;

		}
		//shoot();
	}
	
	send_packet(obj_client.client_socket, _packet_info);
	
}