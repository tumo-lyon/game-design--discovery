/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

last_shoot = 0;

function shoot() {
	last_shoot = current_time;
	
	
	
	
	
	var ballX = (sprite_width / 2) * sin(pi * 2 * (image_angle + 90) / 360);
	var ballY = (sprite_width / 2) * cos(pi * 2 * (image_angle + 90) / 360);
	
	show_debug_message("shoot");
	show_debug_message(ballX);
	show_debug_message(ballY);
	
	var ball = instance_create_layer(x + ballX, y + ballY, layer, oCannonBall);
	ball.image_angle = image_angle + 90;
	ball.damage = damage;
	ball.move_speed = move_speed;
}
