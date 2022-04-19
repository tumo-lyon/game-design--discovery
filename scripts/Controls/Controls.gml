// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function IsPressingUp(){
	return (keyboard_check(vk_up) || keyboard_check(vk_space) || keyboard_check(ord("W")) );
}

function IsPressingDown(){
	return (keyboard_check(vk_down) || keyboard_check(vk_control) || keyboard_check(ord("S")));
}

function IsPressingLeft(){
	return (keyboard_check(vk_left) || keyboard_check(ord("A")));
}

function IsPressingRight(){
	return (keyboard_check(vk_right) || keyboard_check(ord("D")));
}

function GetControlVelocity(){
	return {
		x: IsPressingRight() - IsPressingLeft(),
		y: IsPressingDown() - IsPressingUp()
	};
}