/// @description Insert description here
// You can write your code in this editor
if(spawn){
	x = irandom(room_width - 32);
	y = irandom(room_height - 32);
	
	while(place_meeting(x,y,obj_wall)){
		x = irandom(room_width - 32);
		y = irandom(room_height - 32);
	}
	
	spawn = false;
}


if(mouse_check_button_pressed(mb_left)){
	if(isPressed == false){
		isPressed = true;
	}
}else{
	isPressed = false;
}

if(isPressed){
	isPressed = false;
	if(state == STOPPED)
		state = SETTING_FORCE;
	else if(state == SETTING_FORCE)
		state = FINAL;
}

if(state == SETTING_FORCE){
	if(stateAnim == INCREASING){
		if(velocity < maxVelocity)
			velocity += incrementSpeed;
		else
			stateAnim = DECREASING
	}else if(stateAnim == DECREASING){
		if(velocity > 0)
			velocity -= incrementSpeed;
		else
			stateAnim = INCREASING;
	}
}

if(state == FINAL){
	remainingMoves--;
	state = TARGET;
	
	// Get the angle between two points
	var angle = point_direction(x,y,mouse_x,mouse_y);
	
	velx = cos(degtorad(angle));
	vely = -sin(degtorad(angle));
}

if(state == TARGET){
	x += velx * velocity;
	y += vely * velocity;
	
	if( (x+ (velx * velocity) + 32 > room_width) || 
	(x + (velx * velocity) <= 0) ||
	!place_free(x+ (velx * velocity), y)){
		velx*= -1;
	}
	
	if((y+ (vely * velocity) + 32 > room_height) ||
	(y + (vely * velocity) <= 0) ||
	!place_free(x, y+ (vely * velocity))){
		vely*= -1;
	}
	

	
	velocity -= decrementSpeed;
	
	if(velocity <= 0){
		state = STOPPED;	
	}
}

if(place_meeting(x,y,obj_hole)){
	points++;
	spawn = true;
	velocity = 0;
}

if(remainingMoves == 0 && velocity == 0){
	room_restart();	
}