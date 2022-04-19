/// @description Insert description here
// You can write your code in this editor

var cur = (current_second % 6);

if (cur >= 3) {
	cur = 6 - cur;
}

// y = start_y + cur * 2; 

draw_self();