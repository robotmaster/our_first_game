// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function simulate_enemies() {
	enemy_spawn_timer = timer(enemy_spawn_timer, 1);
	if (enemy_spawn_timer <= 0) {
		enemy_spawn_timer += enemy_spawn_timer_max;
		for (var _player_index = 0; _player_index < array_length(player_infos); _player_index++) {
			summon_enemy(player_infos[_player_index].x_pos, player_infos[_player_index].y_pos);
		}
	}
}