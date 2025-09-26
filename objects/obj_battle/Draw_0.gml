draw_sprite(spr_fond_plaine, 0, x, y)

draw_sprite_stretched(spr_battle_box, 0, x, y+130, 74, 60)
draw_sprite_stretched(spr_battle_box, 0, x+75, y+130, 213, 60)

//---------Att/Garde, Act, Objets, Fuir----------

// Dessine le menu d'actions

if (!instance_exists(obj_battle_menu_player))
{
	draw_set_font(fnM3x6)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	for (var i = 0; i < 4; i++)
	{
		draw_set_color(c_white)
		draw_sprite_stretched(spr_battle_box, 0, x+(74*i), y+191, 66, 24)
		draw_text(x+10+(i*74),y+195, menu_options[i])
	}
}

if (battle_over)
	draw_text(x+90, y+136, "Vous remportez la victoire !")