/// @description Insert description here
// You can write your code in this editor

touch_time = 0;

function activate() {
	if (touch_time == 0) touch_time = current_time;
	sprite_index = sFallingPlatform_active;
	image_alpha = 0.8;
}