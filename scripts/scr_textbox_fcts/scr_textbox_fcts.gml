function set_defaults_for_text() {
	line_break_pos[0, page_number] = 999
	line_break_num[page_number] = 0
	line_break_offset[page_number] = 0
	
	speaker_name[page_number] = noone
	speaker_sprite[page_number] = noone
}

/// @param text
/// @param [character]
function create_text(_text, _pnj="", _emotion="", _skip=false) 
{
	set_defaults_for_text()
	
	text[page_number] = _text
	skip[page_number] = _skip
	
	// Nom du personnage
	if (_pnj != "")
		speaker_name[page_number] = _pnj.name
	
	// Emotions
	if (_emotion != "") 
	{	
		speaker_sprite[page_number] = _pnj.emotions[_emotion]
	}
	page_number++
}

function create_option(_option, _link_id, _function=[])
{ 
	options[options_number] = _option
	option_link_id[options_number] = _link_id
	functions[options_number] = _function
	options_number++
}

function create_textbox(_text_id, _depth=-9999, _x=0, _y=148)
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

function update_love(target, number)
{
	target.love += number
}