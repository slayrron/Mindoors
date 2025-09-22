function create_text(_text) 
{
	text[page_number] = _text
	page_number++
}

function create_option(_option, _link_id)
{ 
	options[options_number] = _option
	option_link_id[options_number] = _link_id
	options_number++
}

function create_textbox(_text_id, _depth=-9999, _x=0, _y=144)
{
	with (instance_create_depth(0, 0, _depth, obj_textbox))
	{
		scr_game_text(_text_id)
		x_offset = _x
		y_offset = _y
	}
}