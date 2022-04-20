var sh = window_get_height();
var sw = window_get_width();

if (disabled) return;


// Health Bar
var size = 32;
var width = sprite_get_width(sHeart);
var scale = size / width;
var separation = 15;
var xoffset = 5;
var yoffset = 5;

for (var i = 0; i < max_health; i++) {
	if (i < hp) {
		draw_sprite_ext(sHeart, -1, i * size + i * separation + xoffset, sh - size - yoffset, scale, scale, 0, c_white, 1);
	} else {
		draw_sprite_ext(sHeart, -1, i * size + i * separation + xoffset, sh - size - yoffset, scale, scale, 0, c_white, 0.3);
	}
}

// Draw coin count

if (inventory_max.coins > 0) {
	draw_sprite_ext(sCoin, 0, sw - 32, sh - 30, 1, 1, 0, c_white, 1);
	
	draw_set_halign(fa_right);
	draw_text(sw - 64, sh - 42, string(inventory.coins) + " / " + string(inventory_max.coins));
	draw_set_halign(fa_left);
}

// Draw Win screen

if (winned) {
	draw_set_alpha(0.2);
	draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_text_transformed_colour(sw / 2, sh / 2, "VICTORY !", 2, 2, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
	draw_text_transformed_colour(sw / 2, sh / 2 + 50, "THANKS FOR PLAYING", 2, 2, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
	draw_set_halign(fa_left);
}
