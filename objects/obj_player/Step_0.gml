var left = keyboard_check(vk_left)
var down = keyboard_check(vk_down)
var right = keyboard_check(vk_right)
var up = keyboard_check(vk_up)

var accept_key = keyboard_check_pressed(ord("Z"))

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
	// Change le sprite
	mask_index = sprite[DOWN] 

	if (y_speed == 0)
	{ 
		if x_speed > 0 
			face = RIGHT 
		if x_speed < 0 
			face = LEFT
	}

	if (x_speed == 0)
	{ 
		if y_speed > 0
			face = DOWN 
		if y_speed < 0
			face = UP
	}
	sprite_index = sprite[face]
	
	// Verifie qu'il n'y a pas de collisions avec les murs
	if place_meeting(x + x_speed, y, obj_mur) or place_meeting(x + x_speed, y, obj_interaction) 
	{ 
		x_speed = 0 
	}
	if place_meeting(x, y + y_speed, obj_mur) or place_meeting(x, y + y_speed, obj_interaction)
	{
		y_speed = 0 
	}
}
		
// Bouge le joueur
x = x + x_speed
y = y + y_speed

// Interactions : uniquement possible quand le joueur regarde la zone d'interaction
var interact_dist = 6;
var rx1, ry1, rx2, ry2;

switch (face) {
    case 0: // droite
        rx1 = bbox_right + 1;
        ry1 = bbox_top;
        rx2 = bbox_right + interact_dist;
        ry2 = bbox_bottom;
        break;
    case 2: // gauche
        rx1 = bbox_left - interact_dist;
        ry1 = bbox_top;
        rx2 = bbox_left - 1;
        ry2 = bbox_bottom;
        break;
    case 1: // haut
        rx1 = bbox_left;
        ry1 = bbox_top - interact_dist;
        rx2 = bbox_right;
        ry2 = bbox_top - 1;
        break;
    case 3: // bas
        rx1 = bbox_left;
        ry1 = bbox_bottom + 1;
        rx2 = bbox_right;
        ry2 = bbox_bottom + interact_dist;
        break;
}

// vérifie collision avec obj_interaction (retourne id d'instance ou noone)
var inst = collision_rectangle(rx1, ry1, rx2, ry2, obj_interaction, true, false);

if (accept_key and inst != noone and !instance_exists(obj_textbox))
{
    create_textbox(inst.text_id);
}

if (keyboard_check_pressed(ord("X")) and !instance_exists(obj_ingame_menu) and global.time_remaining == 0) 
{
	instance_create_depth(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]), -99999, obj_ingame_menu)
}

if (keyboard_check_pressed(ord("P")) and !instance_exists(obj_cutscene_ecole_start))
{
	instance_create_depth(x,y, -99999, obj_cutscene_ecole_start)
}

// Profondeur
depth = -bbox_bottom