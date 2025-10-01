// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tick() {
	simulate_enemies()
	simulate_bullets();
	
	send_packet_to_all([
	[buffer_u8, networking.ticks],
	[buffer_string, json_stringify(player_infos)],
	[buffer_string, json_stringify(bullet_infos)],
	[buffer_string, json_stringify(enemy_infos)],
	]);
}