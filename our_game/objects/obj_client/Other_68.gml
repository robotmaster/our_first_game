var _type = async_load[? "type"];



var _packet = async_load[? "buffer"];



if (is_undefined(_packet) && is_undefined(_type)) {
	exit;
}

if (_type == network_type_disconnect) {
	show_debug_message("Disconnected");
	//reset_game();
	exit;
}





safely_seek_start(_packet);
var _packet_id = read_packet(_packet, buffer_u8);
if (!connected && _packet_id != networking.connection) {
	exit;
}


switch (_packet_id) {
	case networking.connection:
		connected = true;
		id_player = read_packet(_packet, buffer_u8);
		show_debug_message("Connected as player " + string(id_player));
	break;
	case networking.create_player:
		var _player_id = read_packet(_packet, buffer_u8);
		var _player_x = read_packet(_packet, buffer_s32);
		var _player_y = read_packet(_packet, buffer_s32);
		var _player_angle = read_packet(_packet, buffer_u16);
		if (_player_id == id_player) {
		}
		else {
			var _player = instance_create_layer(_player_x, _player_y, "other_players", obj_other_player);
			_player.actual_x = _player_x;
			_player.actual_y = _player_y;
			_player.x = _player_x;
			_player.y = _player_y;
			_player.player_angle = _player_angle;
			_player.id_player = _player_id;
			ds_list_add(player_ids, _player_id);
			ds_map_add(players_to_id, _player_id, _player);
		}
	break;
	case networking.delete_player:
		var _player_id = read_packet(_packet, buffer_u8);
		if (_player_id == id_player) {
			show_debug_message("Disconnected");
			reset_game();
			break;
		}
		destroy_player(_player_id);
	break;
	case networking.ticks:
		
		var _player_id = read_packet(_packet, buffer_u8);
		var _player_x = read_packet(_packet, buffer_s32);
		var _player_y = read_packet(_packet, buffer_s32);
		var _player_angle = read_packet(_packet, buffer_u16);
		var _will_shoot = read_packet(_packet, buffer_bool);
		var _player = ds_map_find_value(players_to_id, _player_id);
		if (_player_id == id_player) {
			_player = obj_player.id;
			ping_timer = 0;
		}
		if (is_undefined(_player) || !instance_exists(_player)) {
			break;
		}
		if (_player_id != id_player) {
			_player.x = _player_x;
			_player.y = _player_y;
			_player.actual_x = _player_x;
			_player.actual_y = _player_y;
			_player.player_angle = _player_angle;
		}
		if (_will_shoot) {
			if (_player_id == id_player) {
				shoot(_player_x, _player_y, obj_player.actual_x, obj_player.actual_y, _player_angle);
			}
			else {
				shoot(_player_x, _player_y, _player_x, _player_y, _player_angle);
			}
		}
	break;
	/*
	case networking.miss:
		var _player_id = read_packet(_packet, buffer_u8);
		gun_animation(_player_id);
	*/
	/*
	case networking.set_health:
		var _player_attack_id = read_packet(_packet, buffer_u8);
		var _player_id = read_packet(_packet, buffer_u8);
		var _health = read_packet(_packet, buffer_u16);
		var _player = ds_map_find_value(players_to_id, _player_id);
		if (_player_id == id_player) {
			obj_player.screen_shake_effect = 5;
			_player = obj_player.id;
		}
		if (is_undefined(_player) || !instance_exists(_player)) {
			break;
		}
		_player.player_health = _health;
		
		var _player_attack = ds_map_find_value(players_to_id, _player_attack_id);
		if (_player_attack_id == id_player) {
			_player_attack = obj_player.id;
		}
		gun_animation(_player_attack_id);
		var _shoot_direction = point_direction(_player_attack.x, _player_attack.y, _player.x, _player.y);
		//show_debug_message(_shoot_direction)
		var _amplifier = 5;
		var _shoot_x = lengthdir_x(_amplifier, _shoot_direction);
		var _shoot_y = lengthdir_y(_amplifier, _shoot_direction);
		for (var _i = 0; _i < 3; _i ++) {
			var _particle = instance_create_layer(_player.x, _player.y, "particles", obj_particle_blood);
			_particle.actual_x = _player.x;
			_particle.actual_y = _player.y;
			_particle.speed_x = _shoot_x + random_range(-4, 4);
			_particle.speed_y = _shoot_y + random_range(-10, -5);
			if (_player_id == id_player) {
				array_push(global.particles_skip_shader, _particle);
			}
			else {
				array_push(global.particles, _particle);
			}
		}
	break;
	case networking.kill:
		
		var _player_attack_id = read_packet(_packet, buffer_u8);
		var _player_die_id = read_packet(_packet, buffer_u8);
		if (_player_attack_id == id_player) {
			obj_player.kills ++;
		}
		gun_animation(_player_attack_id);
		
		
		if (_player_die_id == id_player) {
			show_debug_message("Died");
			died = true;
			died_text = died_text_possibilities[irandom(array_length(died_text_possibilities) - 1)];
			reset_game();
			break;
		}
		if (is_undefined(_player_die_id) || !instance_exists(_player_die_id)) {
			break;
		}
		var _player = ds_map_find_value(players_to_id, _player_die_id);
		for (var _i = 0; _i < 30; _i ++) {
			var _particle = instance_create_layer(_player.x, _player.y, "particles", obj_particle_blood);
			_particle.actual_x = _player.x;
			_particle.actual_y = _player.y;
			_particle.speed_x = random_range(-4, 4);
			_particle.speed_y = random_range(-10, -5);
			array_push(global.particles, _particle);
		}
		
		destroy_player(_player_die_id);
		
	break;
	*/
	default:
		show_debug_message("Invalid packet.");
	break;
}