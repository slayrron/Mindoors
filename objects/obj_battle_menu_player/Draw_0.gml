var _accept_key = keyboard_check_pressed(ord("Z"))
var _back_key = keyboard_check_pressed(ord("X"))

// store number of option in current menu
options_number = array_length(option[menu_level])

// Détermine sur quel menu on se deplace
if (menu_level == 0)
{
	menu_option_pos += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	menu_option_pos += keyboard_check_pressed(vk_up)*4 -  keyboard_check_pressed(vk_down)*4
	menu_option_pos = clamp(menu_option_pos, 0, 4)
}
else if (!selecting_target)
{
	option_pos += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	option_pos += keyboard_check_pressed(vk_down)*2 - keyboard_check_pressed(vk_up)*2
	option_pos = clamp(option_pos, 0, options_number-1)
}
else {
	options_number = array_length(possible_targets)
	target_pos += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	target_pos += keyboard_check_pressed(vk_down)*2 - keyboard_check_pressed(vk_up)*2
	target_pos = clamp(target_pos, 0, options_number-1)
}

// Dessine le menu général d'actions (ATT,ACT,...)
draw_set_font(fnM3x6)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
for (var i = 0; i < 4; i++)
{
	draw_set_color(c_white)
	draw_sprite_stretched(spr_battle_box, 0, x+(74*i), y+191, 66, 24)
	if (i == menu_option_pos)
		draw_set_color(c_yellow)
	draw_text(x+10+(i*74),y+195, menu_options[i])	
}

// Bouton Statistiques
draw_sprite_stretched(spr_battle_box, 0, x, y+4, 32, 16)
draw_set_color(c_white)
if (menu_option_pos == 4)
	draw_set_color(c_yellow)
draw_text(x+6,y+4, "Stats")

if (menu_level == 5) {
	targeted_char = option[menu_level, option_pos]
	
	draw_set_color(c_white)
	draw_text(x+6, y+30, "PV: " + string(targeted_char.pv) + "/" + string(targeted_char.pvMax))
	draw_text(x+6, y+40, "END: " + string(targeted_char.END) + "/" + string(targeted_char.ENDMax))
		
	draw_text(x+6, y+60, "ATTAQUE: " + string(targeted_char.att))
	draw_text(x+6, y+70, "DEFENSE: " + string(targeted_char.def))
	draw_text(x+6, y+80, "VITESSE: " + string(targeted_char.vit))
	draw_text(x+6, y+90, "AGILITE: " + string(targeted_char.agi))
}

// Importe lorsqu'il y a plus de 4 options accessibles
// Scrollpush = 0 quand pos < 4, scrollpush = 4 sinon
scroll_push = clamp(option_pos - (max_visible_options-1), 0, 1) * max_visible_options

// Affiche le contenu du menu d'action actuel
if (!selecting_target) 
{
	for (var i = 0; i < min(options_number, max_visible_options); i++)
	{
		draw_set_color(c_white)
		if (menu_level > 0 and i+scroll_push == option_pos)
			draw_set_color(c_yellow)
		draw_text(x+90 + (90*(i%2)), y+136+(floor(i/2)*20), option[menu_level, i+scroll_push].nom)
	}
}
else 
{	
	for (var i = 0; i < min(options_number, max_visible_options); i++)
	{
		draw_set_color(c_white)
		if (i+scroll_push == target_pos)
			draw_set_color(c_yellow)
		draw_text(x+90 + (90*(i%2)), y+136+(floor(i/2)*20), possible_targets[i+scroll_push].nom)
	}	
}


// Dessine une flèche lorsque le nombre d'objets est supérieur à 4
if (max_visible_options < options_number) 
{
	if (option_pos < options_number-max_visible_options) //vers le bas quand pos < 4
		draw_sprite(spr_down_arrow, 0, x+172, y+182)
	else 
		draw_sprite(spr_up_arrow, 0, x+172, y+135) //vers le haut sinon
}

draw_set_halign(fa_left)
draw_set_color(c_white)
draw_text(x+25, y+130, party[party_member].nom)


// On change de menu d'action
if (_accept_key) 
{
	if (menu_level == 0 or menu_level == 4)
	{
		menu_level = menu_option_pos + 1
	}
}

// Retour a la base
if (_back_key)
{
	if (selecting_target) {
		selecting_target = false
		target_pos = 0
	}
	else 
	{
		menu_level = 0
		option_pos = 0
	}
	
}