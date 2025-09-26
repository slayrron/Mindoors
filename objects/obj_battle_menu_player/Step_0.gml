option[1] = party[party_member].skills
option[2] = enemies[0].playerActions
option[3] = party[0].objets
option[5] = array_concat(party, enemies)

if (active) {
	// Selection d'une cible d'attaque
	if (keyboard_check_pressed(ord("Z")) and !selecting_target and menu_level == 1)
	{
		action = option[menu_level, option_pos]
		selecting_target = true
		possible_targets = array_filter(enemies, function(_unit, _index)
		{
			return (_unit.pv > 0)
		})
	}
	//Selection d'une cible pour une action
	else if (keyboard_check_pressed(ord("Z")) and !selecting_target and menu_level == 2)
	{
		action = option[menu_level, option_pos]
		selecting_target = true
		possible_targets = array_filter(enemies, function(_unit, _index)
		{
			return (_unit.pv > 0 and _unit.playerActions[0].nom == action.nom)
		})
	}
	// Selection d'un allié pour recevoir un objet
	else if (keyboard_check_pressed(ord("Z")) and !selecting_target and menu_level == 3 and array_length(option[3]) > 0)
	{		
		action = option[menu_level, option_pos]
		selecting_target = true
		possible_targets = array_filter(party, function(_unit, _index)
		{
			return (_unit.pv > 0)
		})
	}
	// Sauvegarde de l'action 
	else if (keyboard_check_pressed(ord("Z")) and selecting_target == true)
	{
		target = possible_targets[target_pos]
		MenuSelectAction(party[party_member], action, target)
	}
	// Retour au personnage précédent
	else if (keyboard_check_pressed(ord("X")) and party_member > 0 and menu_level == 0)
	{
		party_member--
		option_pos = 0
		menu_option_pos = 0
		
	}
}

if (changing_char) {
	if (waiting <= 0) {
		party_member++
		selecting_target = false
		menu_level = 0
		option_pos = 0
		menu_option_pos = 0
		active = true
		changing_char = false
	}
	else {
		waiting--
	}
}