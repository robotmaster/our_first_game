max_health = 5; 
enemy_health = 5;
hpbar_length = 60; 
actual_x = 0;
actual_y = 0;
rotation_ = 0; 

function draw_hp_bar() {
	draw_rectangle(actual_x - hpbar_length/2, actual_y - 50, actual_x + hpbar_length/2, actual_y - 60, true);
	draw_rectangle(actual_x - hpbar_length/2, actual_y - 50, actual_x - hpbar_length/2 + hpbar_length/max_health*enemy_health, actual_y -60, false)
}