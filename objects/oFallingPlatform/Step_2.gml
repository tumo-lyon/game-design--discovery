/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y - 1, oPlayer)) activate();

if (touch_time && (touch_time + (fall_delay * 1000)) < current_time) {
	y += fall_speed;
}