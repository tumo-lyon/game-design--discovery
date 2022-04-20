var next_vel = (isAlive() && !winned && !disabled) ? GetControlVelocity() : {x: 0, y: 0};

// Turn around sprite
if (next_vel.x != 0) {
	if (next_vel.x < 0) {
		if (image_xscale > 0) image_xscale = -image_xscale;
	} else {
		if (image_xscale < 0) image_xscale = -image_xscale;
	}
}



next_vel.x *= walk_speed;

// Make a jump
if (next_vel.y == -1) {
	var jmp = jump();	
	next_vel.y = -jmp - (max(0, velocity.y) * (jmp > 0));
};

velocity.x = next_vel.x != 0 ? velocity.x + next_vel.x * walk_acceleration : 0;
velocity.x = velocity.x < 0 ? max(velocity.x, -walk_speed) : min(velocity.x, walk_speed);

// Check for wall
if (place_meeting(x + velocity.x, y, oPlatform)) {
	var obj = instance_place(x + velocity.x, y, oPlatform);
	velocity.x = max(0, distance_to_object(obj.id));	
}

// Apply gravity
velocity.y += next_vel.y;
velocity.y += player_gravity;

// Check for ground
if (place_meeting(x, y + velocity.y, oPlatform)) {
	var obj = instance_place(x, y + velocity.y, oPlatform);
	velocity.y = max(0, distance_to_object(obj.id));	
}

// Apply velocity
x += velocity.x;
y += velocity.y;

// Reset Jumps when on platform
if (place_meeting(x, y + 1, oPlatform)) jumps = max_jumps;

// Stick to moving platforms
if (place_meeting(x, y + 1, oMovingPlatform)) {
	var obj = instance_place(x, y + 1, oMovingPlatform);
	x += obj.getNextX();
	y += obj.getNextY();	
}


// Collect items
if (place_meeting(x, y, oCollectible)) {
	var obj = instance_place(x, y, oCollectible);
	collect(obj);
}

// Take damage
if (place_meeting(x, y, oDamageZone)) {
	var obj = instance_place(x, y, oDamageZone);
	takeDamage(obj);
}

// Win
if (place_meeting(x, y, oFlag)) win();

// Check to dispawn
checkDeath();

if (winned && win_time + 4000 < current_time) {
	if (room == Level_one || room == Level_two) room_goto_next();
}
