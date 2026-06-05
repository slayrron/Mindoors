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
draw_set_font(global.font_main)
draw_sprite_stretched(spr_battle_box, 0, border, 16, 864-border*2, 64) //Box Menu principal

var x_offset = border*2
for (i = 0; i < menu_length; i++)
{
	draw_set_color(c_white)
	if (i == menu_option_pos)
		draw_set_color(c_yellow)
	draw_text(x_offset, 20, menu_options[i])
	
	// ajouter la largeur du texte + un petit espace
    x_offset += string_width(menu_options[i]) + border*2
	
}

if (menu_level > 0) 
{
	draw_sprite_stretched(spr_battle_box, 0, border, detail_box_y, detail_box_w, detail_box_h) //Box de gauche
	for (i = 0; i < array_length(elements[menu_level]); i++)
	{
		draw_set_color(c_white)
		if (i == elm_pos)
			draw_set_color(c_yellow)
		draw_text(border+20, detail_box_y+16+(32*i), elements[menu_level][i].nom)
	}
	draw_sprite_stretched(spr_battle_box, 0, border+detail_box_w+16, detail_box_y, detail_box_w, detail_box_h) //Box de droite
	draw_set_color(c_white)
	
	if (menu_level == 1) // Quêtes
	{
		draw_set_font(global.font_secondary)
		quete = global.party[0].quetes[elm_pos]
		draw_text_ext(border+detail_box_w+32, detail_box_y+16, quete.description, line_sep, detail_box_w-32)
		
		draw_text(border+detail_box_w+32, detail_box_y+100, "Objectifs:")
		i = max(quete.objectif - 2, 0)
		col_num = 0
		while (i < quete.objectif)
		{
			draw_set_color(c_gray)
			draw_text(border+detail_box_w+32, detail_box_y+120+(20*col_num), quete.etapes[i])
			i++
			col_num++
		}
		draw_set_color(c_white)
		draw_text(border+detail_box_w+32, detail_box_y+120+(20*col_num), quete.etapes[i])
	}
	if (menu_level == 2) // Stats
	{
		draw_text(border+detail_box_w+32, detail_box_y, "PV: " + string(elements[menu_level][elm_pos].pv) + "/" + string(elements[menu_level][elm_pos].pvMax))
		draw_text(border+detail_box_w+32, detail_box_y+32, "END: " + string(elements[menu_level][elm_pos].END) + "/" + string(elements[menu_level][elm_pos].ENDMax))
		
		draw_text(border+detail_box_w+32, detail_box_y+64, "SANTE: " + string(elements[menu_level][elm_pos].sante))
		draw_text(border+detail_box_w+32, detail_box_y+96, "ATTAQUE: " + string(elements[menu_level][elm_pos].att))
		draw_text(border+detail_box_w+32, detail_box_y+128, "DEFENSE: " + string(elements[menu_level][elm_pos].def))
		draw_text(border+detail_box_w+32, detail_box_y+166, "VITESSE: " + string(elements[menu_level][elm_pos].vit))
		draw_text(border+detail_box_w+32, detail_box_y+200, "AGILITE: " + string(elements[menu_level][elm_pos].agi))
	}
}

// On change de menu d'action
if (_accept_key and menu_level == 0) 
{
	menu_level = menu_option_pos + 1
}

// Retour a la base
if (_back_key)
{
	menu_level = 0
}