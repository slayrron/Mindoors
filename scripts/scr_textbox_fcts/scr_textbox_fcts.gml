function set_defaults_for_text() {
	line_break_pos[0, page_number] = 999
	line_break_num[page_number] = 0
	line_break_offset[page_number] = 0
	
	speaker_sprite[page_number] = noone
}

/// @param text
/// @param [character]
function create_text(_text, _character="", _skip=false) 
{
	set_defaults_for_text()
	
	text[page_number] = _text
	skip[page_number] = _skip
	
	//get character
	if (_character != "") {
		switch(_character)
		{
			case "hubert-doubt": speaker_sprite[page_number] = spr_hubert_doubt break
			case "hubert-happy": speaker_sprite[page_number] = spr_hubert_happy break
			case "hubert-judge": speaker_sprite[page_number] = spr_hubert_judge break
			case "hubert-straight": speaker_sprite[page_number] = spr_hubert_straight break
			
			case "nasada-angry": speaker_sprite[page_number] = spr_nasada_angry break	
			case "nasada-happy": speaker_sprite[page_number] = spr_nasada_happy break
			case "nasada-straight": speaker_sprite[page_number] = spr_nasada_straight break
			case "nasada-stress": speaker_sprite[page_number] = spr_nasada_stress break
			
			case "rayan-angry": speaker_sprite[page_number] = spr_rayan_angry break
			case "rayan-happy": speaker_sprite[page_number] = spr_rayan_happy break
			case "rayan-straight": speaker_sprite[page_number] = spr_rayan_straight break
			case "rayan-stress": speaker_sprite[page_number] = spr_rayan_stress break
			
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