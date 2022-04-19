
if (!isAlive()) {
	sprite_index = sPlayer_death;
} else if (last_hit && last_hit + (invicibility_time * 1000) > current_time) {
	sprite_index = sPlayer_hurt;
} else if (velocity.y < 0) {
	sprite_index = sPlayer_jump;
} else if (velocity.x != 0) {
	sprite_index = sPlayer_walk;
} else {
	sprite_index = sPlayer_idle;
}

draw_self();