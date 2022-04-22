/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur


function getNextX() {
	return move_speed * sin(pi * 2 * image_angle / 360);
}

function getNextY() {
	return move_speed * cos(pi * 2 * image_angle / 360);
}

function moveForward() {
	x += getNextX();
	y += getNextY();
}

function checkObsticle() {
	if (!unstopable && place_meeting(x, y, oPlatform)) return instance_destroy(id);
}
