draw_sprite(spr_fond_plaine, 0, x, y)

//Qwerty coded w=z
var _accept_key = keyboard_check_pressed(ord("W"))
var _back_key = keyboard_check_pressed(ord("X"))

var _unit_with_current_turn = unit_turn_order[turn].id

draw_sprite_stretched(spr_battle_box, 0, x, y+130, 74, 60)
draw_sprite_stretched(spr_battle_box, 0, x+75, y+130, 213, 60)

//---------Att/Garde, Act, Objets, Fuir----------

// store number of option in current menu
options_number = array_length(option[menu_level])

if (menu_level == 0)
{
	menu_option_pos += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	menu_option_pos = clamp(menu_option_pos, 0, 3)
}
else
{
	option_pos += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	option_pos += keyboard_check_pressed(vk_down)*2 - keyboard_check_pressed(vk_up)*2
	option_pos = clamp(option_pos, 0, options_number-1)
}

draw_set_font(fnM3x6)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

// Dessine le menu d'actions
for (var i = 0; i < 4; i++)
{
	draw_set_color(c_white)
	draw_sprite_stretched(spr_battle_box, 0, x+(74*i), y+191, 66, 24)
	if (i == menu_option_pos)
		draw_set_color(c_yellow)
	draw_text(x+10+(i*74),y+195, menu_options[i])
		
}

// Scrollpush = 0 quand pos < 4, scrollpush = 4 sinon
scroll_push = clamp(option_pos - (max_visible_options-1), 0, 1) * max_visible_options

// Affiche le contenu du menu d'action actuel
for (var i = 0; i < min(options_number, max_visible_options); i++)
{
	draw_set_color(c_white)
	if (menu_level > 0 and i+scroll_push == option_pos)
		draw_set_color(c_yellow)
	draw_text(x+90 + (90*(i%2)), y+136+(floor(i/2)*20), option[menu_level, i+scroll_push])
}

// Dessine une flèche lorsque le nombre d'objets est supérieur à 4
if (max_visible_options < options_number) 
{
	if (option_pos < options_number-max_visible_options) //vers le bas quand pos < 4
		draw_sprite(spr_down_arrow, 0, x+172, y+182)
	else 
		draw_sprite(spr_up_arrow, 0, x+172, y+135) //vers le haut sinon
}


// On change de menu d'action
if (_accept_key) 
{
	switch(menu_option_pos)
	{
		case 0:
		menu_level = 1
		break
		
		case 1:
		menu_level = 2
		break
		
		case 2:
		menu_level = 3
		break
		
		case 3:
		menu_level = 4
		break
	}
}

// Retour a la base
if (_back_key)
{
	menu_level = 0
	option_pos = 0
}

// Positions
#macro COLUMN_ENEMY 15
#macro COLUMN_NAME 90
#macro COLUMN_HP 160
#macro COLUMN_END 220

// Dessine les titres
draw_set_font(fnM3x6)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_gray)
draw_text(x+COLUMN_ENEMY, y+130, "ENNEMI")

// Dessine le nom des ennemis
draw_set_font(fnOpenSansPX)
draw_set_halign(fa_left)
draw_set_valign(fa_top);
draw_set_color(c_white)

var _drawLimit = 3
var _drawn = 0
for (var i = 0; (i < array_length(enemy_units)) && (_drawn < _drawLimit); i++)
{
	var _char = enemy_units[i]
	if (_char.pv > 0) 
	{
		_drawn++
		draw_set_halign(fa_left)
		draw_set_color(c_white)
		if (_char.id == _unit_with_current_turn)
			draw_set_color(c_yellow)
		draw_text(x+COLUMN_ENEMY, y+140+(i*12), _char.nom)
	}
}

//Dessine les infos de l'équipe
for (var i = 0; i < array_length(party_units); i++)
{
	// Noms
	draw_set_halign(fa_left)
	draw_set_color(c_white)
	var _char = party_units[i]
	if (_char.id == _unit_with_current_turn)
		draw_set_color(c_yellow)
	if (_char.pv <= 0)
		draw_set_color(c_red)
	draw_text(x+COLUMN_NAME, y+10+(i*12),_char.nom)
	
	// PV
	draw_set_color(c_white)
	if (_char.pv < (_char.pvMax * 0.5))
		draw_set_color(c_orange)
	if (_char.pv <= 0)
		draw_set_color(c_red)
	draw_text(x+COLUMN_HP,y+10+(i*12),string(_char.pv) + "/" + string(_char.pvMax))
	
	draw_set_color(c_white)
	if (_char.END < (_char.ENDMax * 0.5))
		draw_set_color(c_orange)
	if (_char.pv <= 0)
		draw_set_color(c_red)
	draw_text(x+COLUMN_END,y+10+(i*12),string(_char.END) + "/" + string(_char.ENDMax))
}