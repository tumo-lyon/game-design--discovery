hp = max_health;

winned = false;
win_time = 0;

inventory = {
	coins: 0
};

inventory_max = {
	coins: instance_number(oCoin)
};

velocity = {
	x: 0,
	y: 0
};

last_hit = 0;

jumps = max_jumps;

function jump(){
	if (jumps <= 0) return 0;
	if (velocity.y < (0.3 * jump_height) && !place_meeting(x, y + 1, oPlatform)) return 0;
	jumps--;
	if (place_meeting(x, y - jump_height, oPlatform)) {
		var obj = instance_place(x, y - jump_height, oPlatform);
		return (max(0, distance_to_object(obj.id)));
	}
	return (jump_height);
}

function collect(item) {
	item.onCollect(self);
	
	instance_destroy(item.id);
}

function takeDamage(entity) {
	if (!isAlive() || winned) return;
	if (last_hit + (invicibility_time * 1000) > current_time) return;
	last_hit = current_time;
	hp -= entity.damage;
	
	// Dead
	if (hp <= 0) die();
}

function win() {
	if (winned) return;
	winned = true;
	win_time = current_time;
}

death_time = 0;

function checkDeath() {
	if (death_time && death_time + 1500 < current_time) instance_destroy(id);
}

function die() {
	if (!death_time) death_time = current_time;
}

function isAlive() {
	return (hp > 0);
}

//                                                                                                     if (item.object_index == oCoin) inventory.coins++;