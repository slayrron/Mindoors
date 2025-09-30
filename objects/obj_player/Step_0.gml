var left = keyboard_check(vk_left)
var down = keyboard_check(vk_down)
var right = keyboard_check(vk_right)
var up = keyboard_check(vk_up)

x_speed = (right - left) * move_speed 
y_speed = (down - up) * move_speed

// Vérifie qu'il n y'a pas de situation bloquante (ex dialogue)
if instance_exists(obj_pauser)
{ 
	x_speed = 0	
	y_speed = 0
}
else
{
	// Verifie qu'il n'y a pas de collisions avec les murs
	if place_meeting(x + x_speed, y, obj_mur) 
	{ 
		x_speed = 0 
	}
	if place_meeting(x, y + y_speed, obj_mur) 
	{
		y_speed = 0 
	}
}

// Change le sprite
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
		
// Bouge le joueur
x = x + x_speed
y = y + y_speed

if (keyboard_check_pressed(ord("X")) and !instance_exists(obj_ingame_menu) and global.time_remaining == 0) 
{
	instance_create_depth(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]), -99999, obj_ingame_menu)
}

// Profondeur
depth = -bbox_bottom