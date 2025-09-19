if (active) {
	
	if (keyboard_check_pressed(ord("Z")) and !selecting_target and menu_level == 1)
	{
		action = option[menu_level, option_pos]
		selecting_target = true
		possible_targets = array_filter(enemies, function(_unit, _index)
		{
			return (_unit.pv > 0)
		})
	}
	else if (keyboard_check_pressed(ord("Z")) and selecting_target == true)
	{
		target = possible_targets[target_pos]
		MenuSelectAction(user, action, target)
	}
}