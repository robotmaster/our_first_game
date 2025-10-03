if (invincibility_frames > 0) {
	image_alpha = 0.8;
}
else {
	image_alpha = 1;
}
draw_self();

draw_ammo_textIcon();
draw_health();
if (reload_cooldown > 0) {
	draw_reload_text();
}
draw_circle_colour(0, 0, area_radius, c_red, c_red, true);