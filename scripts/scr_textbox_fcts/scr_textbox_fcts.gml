function set_defaults_for_text() {
	line_break_pos[0, page_number] = 999
	line_break_num[page_number] = 0
	line_break_offset[page_number] = 0
	
	speaker_sprite[page_number] = noone
}

/// @param text
/// @param [character]
function create_text(_text) 
{
	set_defaults_for_text()
	
	text[page_number] = _text
	
	//get character
	if (argument_count > 1) {
		switch(argument[1])
		{
			case "nasada-straight":
				speaker_sprite[page_number] = spr_nasada_straight
			break
			
			case "nasada-stress":
				speaker_sprite[page_number] = spr_nasada_stress
			break
				
			case "rayan-straight":
				speaker_sprite[page_number] = spr_rayan_straight
			break
				
			case "rayan-happy":
				speaker_sprite[page_number] = spr_rayan_happy
			break
			
			case "hubert-judge":
				speaker_sprite[page_number] = spr_hubert_judge
			break
		}
	}
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

function no_textbox()
{
	return !instance_exists(obj_textbox)
}