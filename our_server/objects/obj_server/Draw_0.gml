draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width / 2, room_height / 2, "Total players: " + string(ds_list_size(player_socket_list)));
if (text_timer > 0) {
	text_timer -= 1;
	draw_text(room_width / 2, room_height / 2 + 20, text);
}