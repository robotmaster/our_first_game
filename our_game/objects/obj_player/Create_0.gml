/// @description Insert description here
// You can write your code in this editor
global.tick_timer_max = 1;
global.tick_timer = 0;

actual_x = x;
actual_y = y;

tick_start_x = actual_x;
tick_start_y = actual_y;

camera_x = 0;
camera_y = 0;

player_speed = 9;
player_angle = image_angle;

player_health = 100;

area_radius = 2000;

shoot_cooldown = 0;
shoot_cooldown_max = 3;
global.bullet_entities = [];


reload_cooldown_max = 120;
reload_cooldown = 0; 

player_bullet_capacity = 30; 
player_mag_capacity = player_bullet_capacity;

function draw_reload_text() {
	draw_set_font(fnt_reloading);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(camera_x + 10, camera_y + 0, "Reloading...");
}

function draw_ammo_textIcon() {
	for (var _i = 0; _i < max(player_mag_capacity, 0); _i++) {
		draw_sprite(BulletIcon, 0, camera_x + 32 * _i, camera_y + camera_get_view_height(view_camera[0]) - 75);
	}
}

function draw_health() {
	draw_rectangle(camera_x + 20, camera_y + camera_get_view_height(view_camera[0]) - 90, camera_x + 20 + (player_health * 5), camera_y + camera_get_view_height(view_camera[0]) - 120, true);
}