if (keyboard_check_pressed(ord("X")) and menu_level == 0) {
	global.time_remaining = 15
	instance_destroy(self)
}