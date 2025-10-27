// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_powerup(_powerup_type) {
	if (!ds_map_exists(obj_player.stats.powerups, _powerup_type)) {
		ds_map_add(obj_player.stats.powerups, _powerup_type, 1);
	}
	else {
		ds_map_replace(obj_player.stats.powerups, _powerup_type, ds_map_find_value(obj_player.stats.powerups, _powerup_type) + 1);
	}
}