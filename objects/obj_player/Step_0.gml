var left = keyboard_check(vk_left)
var down = keyboard_check(vk_down)
var right = keyboard_check(vk_right)
var up = keyboard_check(vk_up)

x_speed = (right - left) * move_speed 
y_speed = (down - up) * move_speed

// Check wall collisions
if place_meeting(x + x_speed, y, obj_wall) 
{ 
	x_speed = 0 
}
if place_meeting(x, y + y_speed, obj_wall) 
{
	y_speed = 0 
}

// Change sprite
mask_index = sprite[DOWN] 

if y_speed == 0 
{ 
	if x_speed > 0 
		face = RIGHT 
	if x_speed < 0 
		face = LEFT
}

if x_speed == 0 
{ 
	if y_speed > 0
		face = DOWN 
	if y_speed < 0
		face = UP
}

sprite_index = sprite[face]
		
// Move Player
x = x + x_speed
y = y + y_speed