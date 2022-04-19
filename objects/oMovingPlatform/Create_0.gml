/// @description Insert description here
// You can write your code in this editor

time = current_time;

x_start = x;
x_end = x + move_x;

y_start = y;
y_end = y - move_y;

function getNextX() {
	var a = abs(current_time - time) / (move_time * 1000);
	return (invert_x ? (lerp(x_end, x_start, a) - x) : (lerp(x_start, x_end, a)) - x);
}

function getNextY() {
	var a = abs(current_time - time) / (move_time * 1000); 
	return (invert_y ? (lerp(y_start, y_end, a) - y) : (lerp(y_end, y_start, a)) - y);
}

function revert() {
	time = current_time;
	invert_x = !invert_x;
	invert_y = !invert_y;
}
