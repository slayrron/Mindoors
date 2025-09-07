var accept_key = keyboard_check_pressed(vk_space)

if place_meeting(x, y, obj_player) and accept_key and !instance_exists(obj_textbox)
{
	create_textbox(text_id)
}