// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroy_player(_player_id) {
	show_debug_message("Deleted player id: " + string(_player_id))
	
	
	var _id = ds_map_find_value(obj_client.players_to_id, _player_id);
	
	ds_map_delete(obj_client.players_to_id, _player_id);
	for (var _player = 0; _player < ds_list_size(obj_client.player_ids); _player++) {
		if (ds_list_find_value(obj_client.player_ids, _player) == _player_id) {
			ds_list_delete(obj_client.player_ids, _player);
			break;
		}
	}
	
	
	if (typeof(_id) == "undefined" || !instance_exists(_id)) {
		show_debug_message("Couldnt find player instance")
		return;
	}
	instance_destroy(_id);
	show_debug_message("Deleted player instance")
}