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
		obj_player.invincibility_frames = 120;
		id_player = read_packet(_packet, buffer_u8);
		show_debug_message("Connected as player " + string(id_player));
	break;
	case networking.create_player:
		var _player_id = read_packet(_packet, buffer_u8);
		if (_player_id == id_player) {
		}
		else {
			var _player = instance_create_layer(0, 0, "other_players", obj_other_player);
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
		
		var _player_info = json_parse(read_packet(_packet, buffer_string));
		for (var _player_index = 0; _player_index < array_length(_player_info); _player_index++) {
			var _player_id = _player_info[_player_index].this_id;
			var _player = ds_map_find_value(players_to_id, _player_id);
			if (_player_id == id_player) {
				_player = obj_player.id;
				ping_timer = 0;
				
			}
			if (is_undefined(_player) || !instance_exists(_player)) {
				break;
			}
			if (_player_id != id_player) {
				_player.actual_x = _player_info[_player_index].x_pos;
				_player.actual_y = _player_info[_player_index].y_pos;
				_player.player_angle = _player_info[_player_index].angle;
			}
		}
		var _bullet_info = json_parse(read_packet(_packet, buffer_string));
		handle_bullets(_bullet_info);
		var _enemy_info = json_parse(read_packet(_packet, buffer_string));
		handle_enemies(_enemy_info);
	break;
	default:
		show_debug_message("Invalid packet.");
	break;
}