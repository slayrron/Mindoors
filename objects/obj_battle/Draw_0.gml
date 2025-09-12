draw_sprite(spr_fond_plaine, 0, x, y)

var _unit_with_current_turn = unit_turn_order[turn].id

draw_sprite_stretched(spr_battle_box, 0, x, y+156, 74, 60)
draw_sprite_stretched(spr_battle_box, 0, x+75, y+156, 213, 60)

//Positions
#macro COLUMN_ENEMY 15
#macro COLUMN_NAME 90
#macro COLUMN_HP 160
#macro COLUMN_END 220

//Dessine les titres
draw_set_font(fnM3x6)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_gray)
draw_text(x+COLUMN_ENEMY, y+156, "ENNEMI")
draw_text(x+COLUMN_NAME, y+156, "NOM")
draw_text(x+COLUMN_HP, y+156, "PV")
draw_text(x+COLUMN_END, y+156, "END")

//Dessine le nom des ennemis
draw_set_font(fnOpenSansPX)
draw_set_halign(fa_left)
draw_set_valign(fa_top);
draw_set_color(c_white)

var _drawLimit = 3
var _drawn = 0
for (var i = 0; (i < array_length(enemy_units)) && (_drawn < _drawLimit); i++) {

	var _char = enemy_units[i]
	if (_char.pv > 0) 
	{
		_drawn++
		draw_set_halign(fa_left)
		draw_set_color(c_white)
		if (_char.id == _unit_with_current_turn)
			draw_set_color(c_yellow)
		draw_text(x+COLUMN_ENEMY, y+166+(i*12), _char.nom)
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
	draw_text(x+COLUMN_NAME, y+166+(i*12),_char.nom)
	
	// PV
	draw_set_color(c_white)
	if (_char.pv < (_char.pvMax * 0.5))
		draw_set_color(c_orange)
	if (_char.pv <= 0)
		draw_set_color(c_red)
	draw_text(x+COLUMN_HP,y+166+(i*12),string(_char.pv) + "/" + string(_char.pvMax))
	
	draw_set_color(c_white)
	if (_char.END < (_char.ENDMax * 0.5))
		draw_set_color(c_orange)
	if (_char.pv <= 0)
		draw_set_color(c_red)
	draw_text(x+COLUMN_END,y+166+(i*12),string(_char.END) + "/" + string(_char.ENDMax))
}