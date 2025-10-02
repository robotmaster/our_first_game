draw_self();

draw_ammo_textIcon();
draw_health();
if (reload_cooldown > 0) {
	draw_reload_text();
}
draw_circle_colour(0, 0, area_radius, c_red, c_red, true);