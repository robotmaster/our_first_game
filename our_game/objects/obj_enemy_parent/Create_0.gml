/// @description Insert description here
// You can write your code in this editor
flash_timer = 0;
flash_timer_max = 2;

max_health = 15; 
enemy_health = 15;
hpbar_length = 60; 
actual_x = 0;
actual_y = 0;
rotation_ = 0; 

function draw_hp_bar() {
	draw_rectangle(actual_x - hpbar_length/2, actual_y - 50, actual_x + hpbar_length/2, actual_y - 60, true);
	draw_rectangle(actual_x - hpbar_length/2, actual_y - 50, actual_x - hpbar_length/2 + hpbar_length/max_health*enemy_health, actual_y -60, false)
}