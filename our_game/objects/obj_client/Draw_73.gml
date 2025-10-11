//connecting text
if (!connected) {
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	var _width = camera_get_view_width(view_camera[0]);
	var _height = camera_get_view_height(view_camera[0]);
	draw_set_font(fnt_connecting);
	draw_set_color(c_white);
	draw_rectangle_color(_x, _y, _x + _width, _y + _height, c_black, c_black, c_black, c_black, false);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (show_stats != -1) {
		draw_text(_x + _width / 2, _y + _height / 2 - 60, "Total Kills: " + string(show_stats.total_killed));
		draw_text(_x + _width / 2, _y + _height / 2 + 60, "My Kills: " + string(show_stats.my_killed));
		draw_set_font(fnt_stats);
		draw_text(_x + _width / 2, _y + _height / 2 + 180, "Press a key");
	}
	else {
		draw_text(_x + _width / 2, _y + _height / 2, "Connecting...");
	}
	exit;
}
if (paused) {
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	var _width = camera_get_view_width(view_camera[0]);
	var _height = camera_get_view_height(view_camera[0]);
	draw_set_alpha(0.6);
	draw_rectangle_color(_x, _y, _x + _width, _y + _height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_font(fnt_connecting);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(_x + _width / 2, _y + _height / 2, "Paused");
}