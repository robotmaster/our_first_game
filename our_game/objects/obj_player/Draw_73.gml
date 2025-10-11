if (invincibility_frames > 0 || ghost) {
	image_alpha = 0.8;
}
else {
	image_alpha = 1;
}
draw_self();
draw_circle_colour(0, 0, area_radius, c_red, c_red, true);
draw_ammo_textIcon();
draw_health();

draw_set_font(fnt_reloading);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (reload_cooldown > 0) {
	draw_reload_text();
}
draw_text(camera_x + 10, camera_y + 0, "Total kills: " + string(stats.total_killed));
draw_text(camera_x + 10, camera_y + 70, "My kills: " + string(stats.my_killed));