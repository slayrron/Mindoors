if place_meeting(x, y, obj_player) == true 
{
	var new_transition = instance_create_depth(0,0,-9999, obj_transition)
	
	new_transition.target_x = t_x
	new_transition.target_y = t_y 
	new_transition.target_rm = t_rm 
}