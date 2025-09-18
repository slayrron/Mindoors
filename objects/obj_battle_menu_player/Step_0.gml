if (active) {
	
	if (keyboard_check_pressed(ord("W")) and menu_level == 1) {
		show_debug_message(user.nom)
		show_debug_message(option[menu_level, option_pos].func)
		MenuSelectAction(user, option[menu_level, option_pos])
	}
}