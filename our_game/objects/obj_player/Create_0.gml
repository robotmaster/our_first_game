/// @description Insert description here
// You can write your code in this editor
global.tick_timer_max = 1; //how many 60th of a second each tick is
global.tick_timer = 0; //current timer, set to 0

enum powerup {
	pierce,
	attack_damage,
	bullet_speed, 
	ammo, 
	maxhealth,
	movementspeed, 
}
powerup_attack_damage_multiplier = 2;

stats = {
total_killed: 0,
my_killed: 0,
powerups: ds_map_create()
};

phy_fixed_rotation = true;

hurt_timer = 0; // for hurt sound effect
hurt_timer_max = 60;

actual_x = x;
actual_y = y;

revive_x = 0;
revive_y = 0;

ghost = false;

tick_start_x = actual_x;
tick_start_y = actual_y;
invincibility_frames = 0;

camera_x = 0;
camera_y = 0;

player_forward_speed = 13;
player_backward_speed = 6;
player_angle = image_angle;

max_health = 150;
player_health = max_health;

area_radius = 2000;

shoot_cooldown = 0;
shoot_cooldown_max = 3;
global.bullet_entities = [];

reload_cooldown_max = 120;
reload_cooldown = 0; 

player_bullet_capacity = 30; 
player_mag_capacity = player_bullet_capacity;

aoe_shot_timer = 0;
aoe_shot_timer_max = 20;

function draw_reload_text() {
	draw_text(camera_x + 10, camera_y + 980, "Reloading...");
}

function draw_ammo_textIcon() {
	for (var _i = 0; _i < max(player_mag_capacity, 0); _i++) {
		draw_sprite(BulletIcon, 0, camera_x + 32 * _i, camera_y + camera_get_view_height(view_camera[0]) - 75);
	}
}

function draw_powerups() {
	 var _p1 = ds_map_find_value(stats.powerups, powerup.pierce)
	 var _p2 = ds_map_find_value(stats.powerups, powerup.attack_damage)
	 
	 var listPs = [_p1, _p2]
	 var count = 0;
	 // 2 represent # powerups
	 for (var _i = 0; _i < 2; _i++) {
		if (listPs[_i] == undefined) {continue}
		switch (_i) {
			case 0: 
				draw_sprite(powerUp1, 0, camera_x + camera_get_view_width(view_camera[0]) - count * 40 - 100, camera_y );
				break;
			case 1: 
				draw_sprite(powerUp2, 0, camera_x + camera_get_view_width(view_camera[0]) - count * 40 - 100, camera_y );
				break;
		}
		if (listPs[_i] != 0){
			count++
		}
	 }
	 
}

function draw_health() {
	draw_rectangle_color(camera_x + 20, camera_y + camera_get_view_height(view_camera[0]) - 90, camera_x + 20 + (max_health * 5), camera_y + camera_get_view_height(view_camera[0]) - 120, c_red, c_red, c_red, c_red, false);
	draw_rectangle_color(camera_x + 20, camera_y + camera_get_view_height(view_camera[0]) - 90, camera_x + 20 + (player_health * 5), camera_y + camera_get_view_height(view_camera[0]) - 120, c_lime, c_lime, c_lime, c_lime, false);
}