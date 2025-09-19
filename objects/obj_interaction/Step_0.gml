var accept_key = keyboard_check_pressed(ord("Z"))

if place_meeting(x, y, obj_player) and accept_key and !instance_exists(obj_textbox)
{
	create_textbox(text_id)
}