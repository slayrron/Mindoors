battle_state()

if (battle_over and keyboard_check_pressed(ord("Z"))) {
	// Réactiver tout
    instance_activate_all();
	instance_destroy(enemy_obj)
	with (obj_battle_unit_equipe) instance_destroy()
	with (obj_battle_menu_player) instance_destroy()
	with (obj_battle) instance_destroy()
}