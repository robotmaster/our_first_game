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
		
		handle_server_info(_packet);
	break;
	default:
		show_debug_message("Invalid packet.");
	break;
}