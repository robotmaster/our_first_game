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
	draw_text(_x + _width / 2, _y + _height / 2, "Connecting...");
	exit;
}