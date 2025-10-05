// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function revive_player(_id) {
	for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
		if (player_infos[_player_index].this_id == _id) {
			player_infos[_player_index].ghost = false;
		}
	}
}