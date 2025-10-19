/// @description Insert description here
// You can write your code in this editor
if (invincibility_frames > 0 || ghost) {
	image_alpha = 0.8;
}
else {
	image_alpha = 1;
}
draw_self();
draw_text(x, y - 30, "Player health: " + string(player_health));