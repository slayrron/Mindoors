draw_set_font(global.font_main)
var _accept_key = keyboard_check_pressed(ord("Z"))
var _back_key = keyboard_check_pressed(ord("X"))

if (menu_level == 0)
{
	menu_option_pos += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	menu_option_pos = clamp(menu_option_pos, 0, menu_length-1)
}
else
{
	elm_number = array_length(elements[menu_level])
	elm_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	elm_pos = clamp(elm_pos, 0, elm_number-1)
}

draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_sprite_stretched(spr_battle_box, 0, x+12, y+4, 264, 24)

var x_offset = x + 24
for (i = 0; i < menu_length; i++)
{
	draw_set_color(c_white)
	if (i == menu_option_pos)
		draw_set_color(c_yellow)
	draw_text(x_offset, y+8, menu_options[i])
	
	// ajouter la largeur du texte + un petit espace
    x_offset += string_width(menu_options[i]) + 16
	
}

if (menu_level > 0) {
	draw_sprite_stretched(spr_battle_box, 0, x+12, y+30, 108, 144)
	for (i = 0; i < array_length(elements[menu_level]); i++)
	{
		draw_set_color(c_white)
		if (i == elm_pos)
			draw_set_color(c_yellow)
		draw_text(x+20, y+30+(16*i), elements[menu_level][i].nom)
	}
	draw_sprite_stretched(spr_battle_box, 0, x+126, y+30, 108, 144)
	draw_set_color(c_white)
	if (menu_level == 2)
	{
		draw_text(x+130, y+30, "PV: " + string(elements[menu_level][elm_pos].pv) + "/" + string(elements[menu_level][elm_pos].pvMax))
		draw_text(x+130, y+40, "END: " + string(elements[menu_level][elm_pos].END) + "/" + string(elements[menu_level][elm_pos].ENDMax))
		
		draw_text(x+130, y+70, "SANTE: " + string(elements[menu_level][elm_pos].sante))
		draw_text(x+130, y+80, "ATTAQUE: " + string(elements[menu_level][elm_pos].att))
		draw_text(x+130, y+90, "DEFENSE: " + string(elements[menu_level][elm_pos].def))
		draw_text(x+130, y+100, "VITESSE: " + string(elements[menu_level][elm_pos].vit))
		draw_text(x+130, y+110, "AGILITE: " + string(elements[menu_level][elm_pos].agi))
	}
}

// On change de menu d'action
if (_accept_key) 
{
	menu_level = menu_option_pos + 1
}

// Retour a la base
if (_back_key)
{
	menu_level = 0
}