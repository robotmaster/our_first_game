/// @description Insert description here
// You can write your code in this editor
global.tick_timer_max = 1;
global.tick_timer = 0;

actual_x = x;
actual_y = y;
tick_start_x = actual_x;
tick_start_y = actual_y;

player_speed = 9;
player_angle = image_angle;
player_bullet_capacity = 30; 
global.bullet_entities = [];