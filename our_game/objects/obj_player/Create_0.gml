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

shoot_cooldown = 0;
shoot_cooldown_max = 6;

player_bullet_capacity = 30; 
player_mag_capacity = player_bullet_capacity;

global.bullet_entities = [];